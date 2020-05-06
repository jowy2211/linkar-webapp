'use strict'

function selectTrailer(val) {
	let url = new URL(base_url+'Index_/Detail');
	const params = { id: val };
	url.search = new URLSearchParams(params).toString();
	fetch(url).then(
		response => response.json()
	).then(
		data => { handleDetail(data.res) }
    ).catch(
    	error => { console.log(error) }
    );
}

const handleDetail = (val) => {
	const url = 'https://www.youtube.com/embed/'+val.url;
	const selectedTrailer = '<div class="flex featured-movie-card">\
			<div class="featured-poster-container">\
				<div class="featured-poster"\
					style="background: url('+val.thumbnails+');">\
				</div>\
			</div>\
			<div class="description-container">\
				<p class="featured-title">'+val.title+'</p>\
				<p class="dim">\
					'+val.description+'\
				</p>\
				<button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect featured-play-button" id="playBtn">\
					<i class="material-icons">play_arrow</i>Play\
				</button>\
			</div>\
		</div>';
	document.getElementById('selectedTrailer').innerHTML = selectedTrailer;
	const selectedBackgroundTrailer = '<img class="featured-image" src="'+val.thumbnails+'" />'
	document.getElementById('selectedBackgroundTrailer').innerHTML = selectedBackgroundTrailer;
	const media = '<iframe width="420" height="500" src="'+url+'"></iframe>';
	document.getElementById('mediaPlayer').innerHTML = media;
}

document.onclick = function(e) {
	const bg = document.getElementById('bgMedia');
	if (e.target.id == 'bgMedia') {
		bg.style.display = "none";
	}
	if (e.target.id == 'playBtn') {
		bg.style.display = "block";
	}
}