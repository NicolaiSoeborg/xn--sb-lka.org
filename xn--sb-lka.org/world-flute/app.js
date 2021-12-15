// https://github.com/jhildenbiddle/canvas-size#test-results
const MAX_SIZE = 11180;

const ctx = document.getElementById("c").getContext('2d');
const drawPixel = (x, y, r, g, b) => {
	console.log(`Drawing rgb(${r}, ${g}, ${b}) at ${x} ${y}`);
	ctx.fillStyle = `rgb(${r}, ${g}, ${b})`;
	ctx.fillRect(x % MAX_SIZE, y % MAX_SIZE, 32, 32);
}

fetch("https://ipv4.xn--sb-lka.org")
	.then(r => r.text())
	.then(ip => {
		const v4 = ip.split(".").map(n => parseInt(n));
		let x = (v4[0]*256 + v4[1]) % MAX_SIZE;
		let y = (v4[2]*256 + v4[3]) % MAX_SIZE;
		// TODO: fetch already set color
		document.getElementById("intro").innerHTML = `Hello ${v4.join(".")} ready to draw a pixel at <a href="#" id="helplocate" style="cursor: crosshair">(${x}, ${y})</a>? Select a color: <form action="save" method="POST"><input name="color" type="color"/> <input type="submit" value="Set pixel"></form>`;
		
		// TODO: doesn't work:
		//document.getElementById("helplocate").onmouseover = () => {
		//	console.log(`Drawing help at (${x}, ${y})`);
		//	ctx.ellipse(x % MAX_SIZE, y % MAX_SIZE, 500, 500, 0, 0, 0);
		//};
})

fetch("data.json")
	.then(r => r.json())
	.then(rows => [...rows].map(row => drawPixel(...row)));
