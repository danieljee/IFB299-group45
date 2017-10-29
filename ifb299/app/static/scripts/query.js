function query(){
  const order = this.target.id;
  const q = document.getElementById('query').value.slice(0,-1);
  fetch(`/search/${order}/?q=${q}`)
  .then((res) => {
    var contentType = res.headers.get("content-type");
    if(contentType && contentType.includes("application/json")) {
      return res.json(); //takes response stream and parses into json. Response stream can be a buffer (unreadable)
    }
    throw new TypeError("Invalid response from server");
  })
  .then((json) => {
    console.log(json);
    const parentDiv = document.getElementsByClassName('searchResultColumn1')[0];
    parentDiv.innerHTML = '';
    for(var i=0; i<json.result.length; i++){
      let place = json.result[i];
      let iconSrc = '/static/'+place.category.toLowerCase() + '.png';
      parentDiv.innerHTML += `
        <a class="resultItem" href="/place/${place.id}/" style="height:auto;">
			<div class='row' style="margin-top: auto; margin-bottom: auto;">
				<div class='col-2'>
					<img class='icon'style="height=45px;" src=${iconSrc}/>
				</div>
				
				<div class='col-10'>
					<div class='row'>
						<div class='col-7'>
							${place.name}
						</div>
						<div class='col-5'>
							<div><i>${place.city}</i></div>
							<div>${place.address}</div>
						</div>
					</div>
				</div>
			</div>
        </a>
      `
    }
  })
  .catch((err) => {
    //handle error
  })
}
