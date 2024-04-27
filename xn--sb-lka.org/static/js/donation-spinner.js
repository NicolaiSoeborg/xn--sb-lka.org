console.log("%c Søborg", "font-weight: bold; font-size: 50px;color: red; text-shadow: 3px 3px 0 rgb(217,31,38) , 6px 6px 0 rgb(226,91,14) , 9px 9px 0 rgb(245,221,8) , 12px 12px 0 rgb(5,148,68) , 15px 15px 0 rgb(2,135,206) , 18px 18px 0 rgb(4,77,145) , 21px 21px 0 rgb(42,21,113)");

const splitter = document.getElementById("splitter"),
      donation = document.createElement("p");

const goodCorps = [
  // Sad, but I had to let you go: {title: 'Mozilla', url: 'https://donate.mozilla.org/'},
  {title: 'Signal', url: 'https://signal.org/donate/'},
  {title: 'Bellingcat', url: 'https://www.bellingcat.com/donate'},
  {title: 'Let\'s Encrypt', url: 'https://letsencrypt.org/donate/'},
  {title: 'The Tor Project', url: 'https://donate.torproject.org/'},
  {title: 'Python Software Foundation', url: 'https://www.python.org/psf/donations/'},
  {title: 'Nim (lang)', url: 'https://nim-lang.org/donate.html'},
];

donation.setAttribute("id", "donation");
splitter.parentElement.appendChild(donation);

function switchGoodCorp() {
    const rand = goodCorps[Math.floor(Math.random() * goodCorps.length)];
    document.getElementById("donation").innerHTML = `Consider giving a donation to: <a href="${rand.url}" class="text-decoration-none">${rand.title}</a>. Thanks!`;
}

switchGoodCorp();
setInterval(switchGoodCorp, 5000);
