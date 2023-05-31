from typing import Iterable, Optional
from collections import defaultdict
from random import shuffle, choice
from copy import deepcopy
from time import sleep

ANSI = '\x1b['
ANSI_RESET = f'{ANSI}0m'
COLOR_TO_ANSI = {
    'red': f'{ANSI}1;31m',
    'green': f'{ANSI}1;32m',
    'yellow': f'{ANSI}1;33m',
    'blue': f'{ANSI}1;34m',
}
COLORS = list(COLOR_TO_ANSI.keys())
ul = lambda txt: f'{ANSI}0;4m{txt}{ANSI_RESET}'

class Card:
    def __init__(self, number, color) -> None:
        self.number = number
        self.color = color

    def __str__(self) -> str:
        ansi = COLOR_TO_ANSI.get(self.color, '')
        return f"[{ansi}{self.color} {self.number}{ANSI_RESET}]".center(10)

    @property
    def can_be_start_card(self):
        # also, +2 and +4, etc
        return self.color != '🎨' 

CARDS = []
for color in COLORS:
    for card_num in range(1, 9):
        CARDS.append(Card(card_num, color))
    for _ in range(2):
        CARDS.append(Card('🔄', color))
CARDS += [Card("new color", '🎨') for _ in range(6)]


class GameState:
    def __init__(self, deck: list[Card]) -> None:
        self.deck: list[Card] = deck
        self.rounds: list[list[Card]] = []

        self.players: list['Player'] = []
        self.active_player_idx = 0
        self.winners: list['Player'] = []
        self.gamelog: list[str] = []

    @property
    def current_player(self) -> 'Player':
        return self.players[self.active_player_idx]

    @property
    def game_direction(self) -> int:
        direction = 1  # start direction
        for card in self.played_cards:
            if card.number == '🔄':
                direction *= -1
        return direction

    @property
    def played_cards(self) -> Iterable[Card]:
        for round in self.rounds:
            yield from round

    @property
    def latest_round(self) -> list[Card]:
        if len(self.rounds) > 0:
            return self.rounds[-1]
        raise Exception("`.latest_round` on uninitialized GameState")

    @property
    def top_card(self) -> Card:
        return self.latest_round[-1]


def can_play_card(card: Card, top: Card):
    """ Is play allowed? """
    if card.number == top.number:
        return True
    if card.color == top.color:
        return True
    if card.color == '🎨':
        return True  # always allowed to play change color
    return False


def can_stack_card(card: Card, top: Card):
    if card.number == top.number:
        return True
    return False


def still_playing(gamestate: GameState) -> bool:
    playing_cnt = 0
    for p in gamestate.players:
        if len(p.hand) > 0:
            playing_cnt += 1
    return playing_cnt > 1


class Player:
    def __init__(self, name, hand: list[Card]) -> None:
        self.name = name
        self.hand = hand

    def __str__(self) -> str:
        return self.name

    def eval_card(self, card: Card) -> Card:
        if card.color == '🎨':
            while card.color not in COLORS:
                card.color = input("Color? ")
        return card

    def play_card(self, card: Card, gamestate: GameState):
        new_hand = []

        has_removed_card = False
        for card_on_hand in self.hand:
            if not has_removed_card and card_on_hand == card:
                has_removed_card = True
            else:
                new_hand.append(card_on_hand)
        assert has_removed_card
        self.hand = new_hand

        card = self.eval_card(card)
        gamestate.gamelog.append(f"{self.name}: Playing {card}")
        gamestate.rounds[-1].append(card)

    def draw_card(self, gamestate: GameState):
        new_card = gamestate.deck.pop()
        is_human = (self.name == 'You')
        gamestate.gamelog.append(f"{self.name}: Drawing card {new_card if is_human else ''}")
        if not is_human:
            sleep(0.5)
        self.hand += [new_card]
        draw_ui(gamestate)

    def _play_cards_ui(self, gamestate: GameState) -> bool:
        cards_to_play = []
        tmp_top_card = gamestate.top_card

        while True:
            try:
                card = input(f"Which card (0-index, {ul('s')}top or {ul('b')}ack)? ").lower()
                if card == "b":
                    return False
                elif card == 's' and len(cards_to_play) == 0:
                    raise Exception(f"You can't stop without choosing some cards. Use {ul('b')}ack instead.")
                elif card == 's':
                    break

                card = int(card)
                card = self.hand[card]

                if len(cards_to_play) > 0 and not can_stack_card(card, tmp_top_card):
                    raise Exception(f"You can't stack {card} on top of {tmp_top_card}")

                if not can_play_card(card, tmp_top_card):
                    raise Exception(f"You can't play {card} on top of {tmp_top_card}")

                tmp_top_card = card
                cards_to_play.append(card)

            except Exception as ex:
                print(f"You did bad: {ex}.")

        gamestate.rounds.append([])
        for card in cards_to_play:
            self.play_card(card, gamestate)
        return True

    def play(self, gamestate: GameState):
        max_draw_cards = 3
        for _ in range(max_draw_cards):
            while True:
                action = input(f"\nAction: {ul('p')}lay card, {ul('d')}raw:, say {ul('U')}NO ").lower()
                if action == 'd':
                    break  # hope this break while ?
                elif action == 'u':
                    print("UNO !")
                elif action == 'p':
                    success = self._play_cards_ui(gamestate)
                    if success:
                        return
                    # no success? redo menu action
                else:
                    print(f"Unknown action: {action}")

            # We could not play any card, draw one:
            self.draw_card(gamestate)
        gamestate.gamelog.append(f"{self.name}: Giving up, next turn\n")


class BotPlayer(Player):
    def eval_card(self, card: Card) -> Card:
        if card.color == '🎨':
            # "[] or COLORS" if bot is playing <change color> as last card:
            card.color = choice([c.color for c in self.hand] or COLORS)
        return card

    def play_card(self, card: Card, gamestate: GameState):
        gamestate.rounds.append([])
        Player.play_card(self, card, gamestate)
        sleep(1)

    def play(self, gamestate: GameState):
        max_draw_cards = 3
        for _ in range(max_draw_cards):

            # Sort by similar cards
            best_play: dict[str, list[Card]] = defaultdict(list)
            for card in self.hand:
                best_play[card.number].append(card)

            def try_cast(card_num):
                try:
                    return int(card_num)
                except:
                    return 9999
            bot_hand_buckets = [c for card_num, c in sorted(best_play.items(), key=lambda kv: try_cast(kv[0]))]

            # Find first card we can play (sorted by most same card number)
            tmp_top_card = gamestate.top_card
            for card_bucket in bot_hand_buckets:
                if can_play_card(card_bucket[0], tmp_top_card):
                    gamestate.rounds.append([])
                    for i, card in enumerate(card_bucket):
                        if i == 0:
                            self.play_card(card, gamestate)
                        else:
                            if can_stack_card(card, tmp_top_card):
                                self.play_card(card, gamestate)
                        tmp_top_card = card
                    return

            # We could not play any card, draw one:
            self.draw_card(gamestate)
        gamestate.gamelog.append(f"{self.name}: Giving up, next turn\n")


def init_game(gamestate: GameState):
    shuffle(gamestate.deck)
    while True:
        drawed_card = gamestate.deck.pop()
        if drawed_card.can_be_start_card:
            gamestate.rounds = [[drawed_card]]
            break
        gamestate.gamelog.append(f"Discarded {drawed_card} as start card")

    NUM_CARDS_PER_PLAYER = 3
    gamestate.players = [
        BotPlayer(name="Alice", hand=[gamestate.deck.pop() for _ in range(NUM_CARDS_PER_PLAYER)]),
        BotPlayer(name="Bob", hand=[gamestate.deck.pop() for _ in range(NUM_CARDS_PER_PLAYER)]),
        #BotPlayer(name="Charlie", hand=[gamestate.deck.pop() for _ in range(NUM_CARDS_PER_PLAYER)]),
        Player(name="You", hand=[gamestate.deck.pop() for _ in range(NUM_CARDS_PER_PLAYER)]),
    ]
    shuffle(gamestate.players)


def draw_ui(gamestate: GameState):
    print(f'{ANSI}2J{ANSI}H')  # clear and move to (0, 0)

    print('Players: ', end='')
    for player in gamestate.players:
        player_status = ''
        cards_left = f' (🃏{len(player.hand)})'
        if player in gamestate.winners:
            player_place = gamestate.winners.index(player)
            cards_left = player_status = {0: '🥇', 1: '🥈', 2: '🥉'}.get(player_place, '✔️')
        print(f'{player_status}{player}{cards_left}'.center(20, ' '), end='')
    print('')
    direction = '➡️' if gamestate.game_direction == 1 else '⬅️'
    print(' '*len('Players: ') + ' '*(20//2) + ' '*20*gamestate.active_player_idx + direction)

    print(f"\nTop card: {gamestate.top_card}.")

    # no human if only bots playing
    human = [p for p in gamestate.players if p.name == "You"]
    if human and human[0].hand:
        print("Hand: ")
        MOVE_DOWN = f'{ANSI}1B'  # cursor 1 line down
        MOVE_BACK_UP = f'{ANSI}10D{ANSI}1A'  # cursor 6 col back and 1 line up
        for i, c in enumerate(human[0].hand):
            print(f"{MOVE_DOWN}{str(i).center(10)}{MOVE_BACK_UP}{c}", end='  ')
        print('')

    print('\n' + '_'*70)
    for line in gamestate.gamelog[-10:]:
        print(line)


def round_transition(old_gamestate: GameState) -> GameState:
    new_gamestate = deepcopy(old_gamestate)

    if len(old_gamestate.current_player.hand) == 0:
        # this is okay, because calc_next_player_turn will skip us after this round, so only appended once
        new_gamestate.winners.append(old_gamestate.current_player)

    # calc next player turn:
    new_gamestate.active_player_idx = (old_gamestate.active_player_idx + old_gamestate.game_direction) % len(old_gamestate.players)
    while len(new_gamestate.current_player.hand) == 0:
        new_gamestate.active_player_idx = (old_gamestate.active_player_idx + old_gamestate.game_direction) % len(old_gamestate.players)

    return new_gamestate


def game_loop():
    gamestate = GameState(CARDS.copy())
    init_game(gamestate)

    while still_playing(gamestate):
        draw_ui(gamestate)

        gamestate.current_player.play(gamestate)

        gamestate = round_transition(gamestate)
    
    draw_ui(gamestate)


if __name__ == '__main__':
    game_loop()
