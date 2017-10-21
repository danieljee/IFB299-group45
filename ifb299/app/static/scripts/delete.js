function delete_user(){
  var XHR = new XMLHttpRequest();
  var pk = document.getElementById('pk');
  XHR.open('DELETE', `http://localhost:8000/account/${pk}`, true);
  XHR.onreadystatechange = function(){
    if (XHR.readyState == 4 && XHR.status == 200) {
      console.log(XHR.response);
      window.location.replace('http://localhost:8000/');
    } else if (XHR.readyState == 4 && XHR.status == 403){
      return;
    }
  };
  XHR.send();
}
