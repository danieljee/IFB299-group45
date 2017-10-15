function deleteUser(){
  // fetch('/account/delete', {method:'delete'})
  // .then((res) => {
  //   console.log(res);
  // })
  // .catch((err)=>{
  //
  // })
  var XHR = new XMLHttpRequest();
  XHR.open('DELETE', 'http://localhost:8000/account/delete', true);
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
