function edit(){
    let edit_button = document.getElementById('edit_button');
    var store = {
        username: document.getElementById('username_static').value,
        first_name: document.getElementById('first_name_static').value,
        last_name: document.getElementById('last_name_static').value,
        phone_number: document.getElementById('phone_number_static').value,
        email: document.getElementById('email_static').value,
        address: document.getElementById('address_static').value,
        postcode: document.getElementById('postcode_static').value,
        role: document.getElementById('role_static').value,
    }
    edit_button.innerHTML = 'cancel';
    edit_button.classList.remove('btn-info');
    edit_button.classList.add('btn-danger');
    edit_button.onclick = ()=>{cancel(store)}

    document.getElementById('thisIsDiv').innerHTML = `
		<div class="editProfileForm">

			<div class="row">
				<p class="editLabel">First Name:</p>					
				<input class="editProfileTextBox" id="first_name" type="text" name="first_name" value=${store.first_name}>
			</div>

			<div class="row">
				<p class="editLabel">Last Name:</p>					
				<input class="editProfileTextBox" id="last_name" type="text" name="first_name" value=${store.last_name}>
			</div>

			<div class="row">
				<p class="editLabel">Email:</p>					
				<input class="editProfileTextBox" id="email" type="text" name="first_name" value=${store.email}>
			</div>
			
			<div class="row">
				<p class="editLabel">Phone Number:</p>					
				<input class="editProfileTextBox" id="phone_number" type="text" name="first_name" value=${store.phone_number}>
			</div>
			
			<div class="row">
				<p class="editLabel">Address:</p>					
				<input class="editProfileTextBox" id="address" type="text" name="first_name" value=${store.address}>
			</div>
			
			<div class="row">
				<p class="editLabel">Postcode:</p>					
				<input class="editProfileTextBox" id="postcode" type="text" name="first_name" value=${store.postcode}>
			</div>
		</div>
		<fieldset class="form-group row">
			<legend class="col-form-legend col-sm-2" style="font-weight: bold;">Account Type:</legend>
			<div style = "margin-left: 140px">
				<div class="col-sm-10">
					<div class="form-check">
						<label class="form-check-label" for="role">
						<input class="form-check-input" type="radio" name="role" id="role" value="STUDENT">
						Student
						</label>
					</div>
					<div class="form-check">
						<label class="form-check-label" for="role">
						<input class="form-check-input" type="radio" name="role" id="role" value="BUSINESSMAN">
						Business
						</label>
					</div>
					<div class="form-check">
						<label class="form-check-label" for="role">
						<input class="form-check-input" type="radio" name="role" id="role" value="TOURIST">
						Tourist
						</label>
					</div>
				</div>
			</div>
		</fieldset>
		<center>
			<!--it is possible to have one function called with args == http method-->
			<button class="btn btn-primary" style="width: 300px;" onclick="edit_user()">Update</button>
			</br>
			<hr>

			Don't want an account with us anymore? Click the delete button to remove your account.<br></br>
				<button class="btn btn-danger" style="width: 300px;" onclick="delete_user()">Delete</button>
			<div style="margin-left: 10px">
			</div>
		</center>
    `;

    let roles = document.getElementsByName('role');
    for(var i=0; i<roles.length; i++){
        if (roles[i].value === store.role){
            roles[i].checked = true;
        }
    }
}

function cancel(store){
    let edit_button = document.getElementById('edit_button');
    edit_button.innerHTML = 'Edit';
    edit_button.classList.remove('btn-danger');
    edit_button.classList.add('btn-info');
    edit_button.onclick = ()=>{edit()}
    document.getElementById('thisIsDiv').innerHTML = `
        <ul class="list-group">
		<li class="list-group-item"><b>Username: &nbsp; </b>${store.username}</li>
		<li class="list-group-item"><b>First Name: &nbsp; </b>${ store.first_name }</li>
		<li class="list-group-item"><b>Last Name: &nbsp; </b>${ store.last_name }</li>
		<li class="list-group-item"><b>Email: &nbsp; </b>${ store.email }</li>
			<li class="list-group-item"><b>Phone Number: &nbsp; </b>${ store.phone_number }</li>
			<li class="list-group-item"><b>Address: &nbsp; </b>${ store.address }</li>
			<li class="list-group-item"><b>Post Code: &nbsp; </b>${ store.postcode }</li>
			<li class="list-group-item"><b>Account Type: &nbsp; </b>${ store.role }</li>
	</ul>
    `;
}

function edit_user(){
  var XHR = new XMLHttpRequest();

  var roles = document.getElementsByName('role')
  for(var i=0; i<roles.length; i++){
      if (roles[i].checked){
          var role = roles[i];
      }
  }

  var params = {
      first_name: document.getElementById('first_name').value,
      last_name: document.getElementById('last_name').value,
      email: document.getElementById('email').value,
      phone_number: document.getElementById('phone_number').value,
      address: document.getElementById('address').value,
      postcode: document.getElementById('postcode').value,
      role: role.value,
  }

  var pk = document.getElementById('pk').value;
  XHR.open('PUT', `http://localhost:8000/account/${pk}/`, true);
  XHR.setRequestHeader("Content-type", "application/json");
  XHR.onreadystatechange = function(){
    if (XHR.readyState == 4 && XHR.status == 200) {
      cancel(JSON.parse(XHR.response));
    } else if (XHR.readyState == 4 && XHR.status == 403){
		//Show error message
      return;
    }
  };
  console.log(JSON.stringify(params));
  XHR.send(JSON.stringify(params));
}
