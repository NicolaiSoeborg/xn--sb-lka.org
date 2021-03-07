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
