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
        } else {
          alert("Invalid address");
        }
      } else {
        alert("Map unavailable status: ", status);
      }
    });
  }
}
