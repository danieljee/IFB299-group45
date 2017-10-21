function addPlace(){
  if (this.innerHTML === 'Saved'){
    return;
  }
  var pk = document.getElementById('pk').value;
  var XHR = new XMLHttpRequest();
  XHR.open('POST', `http://localhost:8000/account/places/${pk}`, true);
  XHR.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
  XHR.onreadystatechange = function(){
    if (XHR.readyState == 4 && XHR.status == 200) {
      var button = document.getElementById('addButton');
      button.classList.remove('btn-info');
      button.classList.add('btn-success');
      button.innerHTML = 'Saved';
      button.setAttribute('onclick', "removePlace()");
    } else if (XHR.readyState == 4 && XHR.status == 403){
      return;
    }
  };
  XHR.send();
}

function removePlace(){
  var pk = document.getElementById('pk').value;
  var XHR = new XMLHttpRequest();
  XHR.open('DELETE', `http://localhost:8000/account/places/${pk}`, true);
  XHR.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
  XHR.onreadystatechange = function(){
    if (XHR.readyState == 4 && XHR.status == 200) {
      var button = document.getElementById('addButton');
      button.classList.remove('btn-success');
      button.classList.add('btn-info');
      button.innerHTML = 'Save Place';
      button.setAttribute('onclick', "addPlace()");
    } else if (XHR.readyState == 4 && XHR.status == 403){
      return;
    }
  };
  XHR.send();
}
