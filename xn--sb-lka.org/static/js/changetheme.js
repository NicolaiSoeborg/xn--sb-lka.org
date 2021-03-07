function changeTheme(forceTheme = undefined) {
    const body = document.getElementsByTagName('body')[0];

    if (forceTheme !== 'light' && body.style.backgroundColor !== 'black') {
        body.style["background-color"] = "black";
        body.style["filter"] = "invert(100%)";
        for (let img of document.getElementsByTagName("img"))
            img.style["filter"] = "invert(100%)";  // invert the invert
        document.getElementById("changeThemeBtn").textContent = "light mode";
    } else {
        body.style["background-color"] = "white";
        body.style["filter"] = "";
        for (let img of document.getElementsByTagName("img"))
            img.style["filter"] = "";
        document.getElementById("changeThemeBtn").textContent = "night mode";
    }
}

document.getElementById("changeThemeBtn").onclick = changeTheme;

// is it night (local time)?
(function (){
    const hours = new Date().getHours();
    if (hours < 7 || hours > 21) changeTheme('night');
})()

// Never print in all black:
window.addEventListener("beforeprint", function(event) { changeTheme('light') });
