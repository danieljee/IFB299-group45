function handleReview(){
    var ratings = document.getElementsByName('rating');
    for (var i=0; i<ratings.length; i++){
        if (ratings[i].checked){
            var rating = ratings[i].value;
        }
    }
    
    var pk = document.getElementById('pk').value;
    var comment = document.getElementById('comments').value;
    var params = `rating=${rating}&comment=${comment}`;
    var XHR = new XMLHttpRequest();
    XHR.open('POST', `http://localhost:8000/place/${pk}/review`, true);
    XHR.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    XHR.onreadystatechange = function(){
        var button = document.getElementById('reviewButton');
        if (XHR.readyState == 4 && XHR.status == 200) {
            button.classList.remove('btn-primary');
            button.classList.add('btn-success');
            button.innerHTML = 'Submitted!';
        } else {
            button.classList.remove('btn-primary');
            button.classList.remove('btn-success');
            button.classList.add('btn-danger');
            button.innerHTML = 'Go away.';
        }
    };
    XHR.send(params);
}