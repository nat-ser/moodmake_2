var key = "ec477fffca072b8b60ca576a9e53e5e3:15:75047715";

var MOVIES=$(".movie_name a");




$(function(){
  getInfoMovies(getMoviesonPage);
});

//make custom Url for retreiving each separate movie
function makeUrl(name){
  return "http://api.nytimes.com/svc/movies/v2/reviews/searchjsonp?query="+name+"&dvd/&api-key="+ key;
}


//get all movie objects on page into an array
function getMoviesonPage(MOVIES){
  var names = [];
 MOVIES.forEach(function(movie){
    names.push(movie.text);
  });
  return names;
}



//make ajax request for every movie
function getInfoMovies(getMoviesonPage){
  var movies= getMoviesonPage(movies);
  movies.forEach(function(movie){
    var url = makeUrl(movie);
  return  makeAjaxRequest(url, successCallback);
  });
}



//make ajax request to nytimes api
function makeAjaxRequest(url, successCallback){
  $.ajax({
    url: url,
    dataType: "jsonp",
    success: successCallback
  });
}

  //on success callback for above
function successCallback(parsedJSON) {
  var data = parsedJSON;
  var results = data.results[0];
  var title = results.display_title;
  var summary = results.summary_short;
  var link = results.link.url;
  console.log(title);
  console.log(link);
  console.log(summary);
  debugger;

}
