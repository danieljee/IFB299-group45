function delete_user(){
  var XHR = new XMLHttpRequest();
  var pk = document.getElementById('pk').value;
  XHR.open('DELETE', `http://localhost:8000/account/${pk}`, true);
  XHR.onreadystatechange = function(){
    if (XHR.readyState == 4 && XHR.status == 200) {
      document.getElementById('accountinfoDiv').innerHTML = `
        <h3>Account Deleted!</h3>
        <h5>You'll be redirected in 3 seconds</h5>
      `;

      setTimeout(()=>{
        window.location.replace('http://localhost:8000/');
      }, 3000);  
    } else if (XHR.readyState == 4 && XHR.status == 403){
      return;
    }
  };
  XHR.send();
}
