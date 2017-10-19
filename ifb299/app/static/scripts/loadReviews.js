function loadReviews(){
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
    });
}

loadReviews();