export function togo(a) {
	location.href = `${a}`;
}

let manual = document.getElementById("goto_man");
let download = document.getElementById("goto_download");
let general = document.getElementById("site_general");

if (manual != null) {
	manual.onclick = () => togo("./manual.html");
}

if (download != null) {
	download.onclick = () => togo("./download.html");
}

if (general != null) {
	general.onclick = () => togo("./index.html");
}
