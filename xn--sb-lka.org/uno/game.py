from random import shuffle, choice

NUM_CARDS_START = 3
class Card:
    def __init__(self, number, color) -> None:
        self.number = number
        self.color = color
    def __str__(self) -> str:
        return f"[{self.number} {self.color}]"

COLORS = ["red", "green", "blue", "yellow"]
CARDS = []
for color in COLORS:
    for card_num in range(1, 9):
        CARDS.append(Card(card_num, color))
    for _ in range(4):
        CARDS.append(Card(-1, color))

CARDS += [
    # Card(-2, "plus 2"), Card(-2, "plus 2"), Card(-2, "plus 2"), Card(-2, "plus 2"),
    Card(0, "new color"), Card(0, "new color"), Card(0, "new color"), Card(0, "new color"),
]
shuffle(CARDS)

gamestate = {
    'deck': CARDS.copy(),
}
gamestate['top'] = gamestate['deck'].pop()


def can_play_card(card: Card, gamestate):
    if card.number == gamestate['top'].number:
        return True
    if card.color == gamestate['top'].color:
        return True
    if card.number == 0 and card.color == "new color":
        return True  # always true
    if card.number == -1 and card.color == gamestate['top'].color:
        return True
    return False

def remove_card_from_hand(card: Card, hand: list[Card]) -> list[Card]:
    new_hand = []
    has_removed_card = False
    for card_on_hand in hand:
        if not has_removed_card and card_on_hand == card:
            has_removed_card = True
        else:
            new_hand.append(card_on_hand)
    assert has_removed_card
    return new_hand

def str_hand(hand):
    return ', '.join(str(c) for c in hand)

def still_playing(players):
    playing_cnt = 0
    for p in players:
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
        if card.number == 0:
            if self.name == "You":
                while card.color not in COLORS:
                    card.color = input("Color? ")
            else:
                # If bot is playing change color as last card:
                if len(self.hand) == 0:
                    card.color = choice(COLORS)
                else:
                    card.color = choice([c.color for c in self.hand])
            return card
        return card

    def play(self, gamestate):
        max_draw_cards = 3
        for _ in range(max_draw_cards):
            if self.name == "You":
                print(f"\n\nYour turn!")
                print(f"Top card: {gamestate['top']}")
                print(f"Your hand: {str_hand(self.hand)}")
                while True:
                    action = input('Action: p(lay card), d(raw): ')
                    if action == 'd':
                        break  # hope this break while ?
                    elif action == 'p':
                        while True:
                            try:
                                which_card = input("Which card (0-index, or back)? ")
                                if which_card == "back":
                                    break
                                which_card = int(which_card)
                                which_card = self.hand[which_card]

                                if not can_play_card(which_card, gamestate):
                                    raise Exception(f"You can't play {which_card}")

                                self.hand = remove_card_from_hand(which_card, self.hand)
                                which_card = self.eval_card(which_card)
                                gamestate['top'] = which_card
                                return
                            except Exception as ex:
                                print(f"You did bad: {ex}.")
                    else:
                        print(f"Unknown action: {action}")
                # print("Is there a code path to here?")  # apparently
            else:
                # Bot choose random good card
                for card in self.hand:
                    if can_play_card(card, gamestate):
                        self.hand = remove_card_from_hand(card, self.hand)
                        card = self.eval_card(card)
                        print(f"{self.name}: Playing {card} on top of {gamestate['top']}")
                        gamestate['top'] = card
                        return
            # We could not play any card, draw one:
            drawing_card = gamestate['deck'].pop()
            print(f"{self.name}: Drawing card")  # if cheat: {drawing_card}
            self.hand += [drawing_card]
        print(f"{self.name}: Giving up, next turn\n")


players = [
    Player(name="Alice", hand=[gamestate['deck'].pop() for _ in range(NUM_CARDS_START)]),
    Player(name="Bob", hand=[gamestate['deck'].pop() for _ in range(NUM_CARDS_START)]),
    Player(name="You", hand=[gamestate['deck'].pop() for _ in range(NUM_CARDS_START)]),
]
shuffle(players)


# TODO: multiple done same round, hmm
direction = 1
player_idx = 0

while still_playing(players):
    # Player turns:
    player_idx = (player_idx + direction) % len(players)
    players[player_idx].play(gamestate)
    if len(players[player_idx].hand) == 0:
        print(f"Congrats to {players[player_idx]}")
    if gamestate['top'].number == -1:
        direction *= -1

    #for player in players:
    #    player.play(gamestate)
    #    if len(player.hand) == 0:
    #        print(f"Congrats to {player}")
        
    players = [p for p in players if len(p.hand) > 0]
