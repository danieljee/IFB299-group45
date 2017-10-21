var geocoder;
var address;
function initMap() {
  geocoder = new google.maps.Geocoder();
  address = `${place.name} ${place.address} ${place.cityName} ${place.postcode}`;

  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat:27.4698, lng:150.977618},
    zoom: 15,
    mapTypeControl: true,
    mapTypeControlOptions: {
      style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
    },
    navigationControl: true,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  if (geocoder){
    geocoder.geocode({
      'address':address
    }, function(results, status){
      if (status == google.maps.GeocoderStatus.OK){
        if (status != google.maps.GeocoderStatus.ZERO_RESULTS){
          map.setCenter(results[0].geometry.location);
          
          var infowindow = new google.maps.InfoWindow({
            content: '<b>' + address + '</b>',
            size: new google.maps.Size(150, 50)
          });

          var marker = new google.maps.Marker({
            position: results[0].geometry.location,
            map: map,
            title: address,
            animation: google.maps.Animation.DROP,
          });
          google.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map, marker);
          });

          let lng = results[0].geometry.location.lng();
          let lat = results[0].geometry.location.lat();

          fetch(`http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lng}&APPID=709073822b9f373f5fba056d694642a6 `)
          .then((res) => {
            return res.json();
          })
          .then((resjson) => {
            console.log(resjson);
            let weatherDiv = document.getElementById('weatherDiv');
            if (resjson.weather[0].main === "Rain"){
              weatherDiv.innerHTML = `<h4 style="color:#fff; margin:0px; margin-top:10px;">Weather</h4>
                                      <h5 style="color:#fff; margin:0px">Rainy</h5>
                                      <div class="weatherIcon">
                                        <div class="cloud"></div>
                                        <div class="rain"></div>
                                      </div>`;
            } else if (resjson.weather[0].main === "Drizzle"){
              weatherDiv.innerHTML = `<h4 style="color:#fff; margin:0px; margin-top:10px;">Weather</h4>
                                      <h5 style="color:#fff; margin:0px">Drizzle</h5>
                                      <div class="weatherIcon">
                                        <div class="cloud"></div>
                                        <div class="sun"><div class="rays"></div></div>
                                        <div class="rain"></div>
                                      </div>`;
            }else if (resjson.weather[0].main === "Clear"){
              weatherDiv.innerHTML = `<h4 style="color:#fff; margin:0px; margin-top:10px;">Weather</h4>
                                      <h5 style="color:#fff; margin:0px">Clear</h5>
                                      <div class="weatherIcon">
                                        <div class="sun"><div class="rays"></div></div>
                                      </div>`;
            } else if (resjson.weather[0].main === "Clouds"){
              weatherDiv.innerHTML = `<h4 style="color:#fff; margin:0px; margin-top:10px;">Weather</h4>
                                       <h5 style="color:#fff; margin:0px">Cloudy</h5>
                                      <div class="weatherIcon">
                                        <div class="cloud"></div>
                                        <div class="cloud"></div>
                                      </div>`;
            } else if (resjson.weather[0].main === "Thunderstorm"){
              weatherDiv.innerHTML = `<h4 style="color:#fff; margin:0px; margin-top:10px;">Weather</h4>
                                       <h5 style="color:#fff; margin:0px">Thunderstorm</h5>
                                      <div class="weatherIcon">
                                        <div class="cloud"></div>
                                        <div class="lightning"><div class="bolt"></div><div class="bolt"></div></div>
                                      </div>`;
            }

          })
          .catch((err) => {
            console.log(err);
          })

        } else {
          alert("Invalid address");
        }
      } else {
        alert("Map unavailable status: ", status);
      }
    });
  }
}
