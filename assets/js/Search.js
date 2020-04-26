'use strict'
const Keyword = document.getElementById('searchValue');
Keyword.addEventListener('keyup', function(event) {
	if (event.keyCode === 13) {
		getData(Keyword);
	}
});

const getData = (data) => {
	let url = new URL(base_url+'Index_/Search');
	const params = { k: data.value };
	url.search = new URLSearchParams(params).toString();
	fetch(url).then(
		response => response.json()
	).then(
		data => { setData(data.res.items) }
    ).catch(
    	error => { console.log(error) }
    );
};

const setData = (list) => {
	const trailers = list.map(val => {
		return '<div class="poster-container">\
					<div class="movie-poster" style="background: url('+val.snippet.thumbnails.high.url+');"></div>\
				</div>';
	});
	document.getElementById('listTrailers').innerHTML = trailers;
	const selectedTrailer = '<div class="flex featured-movie-card">\
			<div class="featured-poster-container">\
				<div class="featured-poster"\
					style="background: url('+list[0].snippet.thumbnails.high.url+');">\
				</div>\
			</div>\
			<div class="description-container">\
				<p class="featured-title">'+list[0].snippet.title+'</p>\
				<p class="dim">\
					'+list[0].snippet.description+'\
				</p>\
				<button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect featured-play-button">\
					<i class="material-icons">play_arrow</i>Play\
				</button>\
			</div>\
		</div>';
	document.getElementById('selectedTrailer').innerHTML = selectedTrailer;
	const selectedBackgroundTrailer = '<div class="featured-image" style="background: url('+list[0].snippet.thumbnails.high.url+');" ></div>'
	document.getElementById('selectedBackgroundTrailer').innerHTML = selectedBackgroundTrailer;
};