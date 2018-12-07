function getWeather(long, lag, updateee){
  function callBack(err, data) {
    if (err !== null) {
      alert('Something went wrong: ' + err);
    } else {
      updateee(data)
    }
  };
  getJSON('https://api.apixu.com/v1/current.json?key=ce81c07a43d7463f8cb32326180712&q='+long+','+lag,callBack)
}

var getJSON = function(url, callback) {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', url, true);
    xhr.responseType = 'json';
    xhr.onload = function() {
      var status = xhr.status;
      if (status === 200) {
        callback(null, xhr.response);
      } else {
        callback(status, xhr.response);
      }
    };
    xhr.send();
};
