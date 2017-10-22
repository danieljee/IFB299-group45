function loadReviews(){
    console.log('loadreviews');
    var place_id = document.getElementById('pk').value;
    fetch(`/place/${place_id}/reviews`)
    .then((res) => {
        return res.json();
    })
    .then((jsonres) => {
        console.log(jsonres);
        var reviewsDiv = document.getElementById('reviews');
        reviewsDiv.innerHTML = '';
        for(var i=0; i<jsonres.result.length; i++){
            reviewsDiv.innerHTML += `
                <li class="list-group-item"> 
                    <div> 
                        <p><b>${jsonres.result[i].name}</b> <br /> 
                        <b>Comments: </b> ${jsonres.result[i].comment} <br /> 
                        <b>Rating:</b> ${jsonres.result[i].rating}/5 
                        </p> 
                    </div> 
                </li> 
            `;
        }
    })
    .catch((err) => {
        //handle error
        console.log('Error err: ', err);
    });
}

loadReviews();

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
    XHR.open('POST', `http://localhost:8000/place/${pk}/reviews`, true);
    XHR.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    XHR.onreadystatechange = function(){
        var button = document.getElementById('reviewButton');
        if (XHR.readyState == 4 && XHR.status == 200) {
            button.classList.remove('btn-primary');
            button.classList.remove('btn-danger');
            button.classList.add('btn-success');
            button.innerHTML = 'Submitted';

            loadReviews();
        } else {
            button.classList.remove('btn-primary');
            button.classList.remove('btn-success');
            button.classList.add('btn-danger');
            button.innerHTML = 'Already Submitted';
        }
    };
    XHR.send(params);
}

