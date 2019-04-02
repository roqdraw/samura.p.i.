// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//= require jquery3
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
    console.log("jQuery READY")
})

var rellax = new Rellax('.rellax');

AOS.init();
console.log('AOS is running.')

// var scroll = new SmoothScroll('[data-easing="easeInOutQuart"]', {easing: 'easeInOutQuart'});

var moviesDiv = document.querySelector('#movie-list')
    zlFetch('https://api.themoviedb.org/3/search/movie?api_key=2e4bf3ae7a9007a8ff8ac9fbfdeb67d5&language=en-US&query=samurai&page=1&include_adult=true')
    .then(res => listMovies(moviesDiv, res.body.results))
    
function listMovies (listDiv, movies) {
    var movieList = document.querySelector('#movie-list')
    movies.forEach(movie => {
        if (movie.poster_path !== null) {
            var div = document.createElement('div')
            div.classList.add('carousel-height')
            var img = document.createElement('img')
            img.classList.add('poster-height')
            img.setAttribute("src", `https://image.tmdb.org/t/p/original/${movie.poster_path}`)
            div.append(img)
            movieList.append(div)
        }
    })
    $('#movie-list').flickity({
        cellAlign: 'left',
        contain: true,
        freeScroll: true,
        wrapAround: true    
    });
}