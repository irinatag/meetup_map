$(document).ready(function() {

  var map = L.map('map').setView([37.7272, -122.3226], 12);
  console.log(map);

  var baseLayer = L.tileLayer('http://{s}.tiles.mapbox.com/v4/irinatag.29e71c77/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoiaXJpbmF0YWciLCJhIjoiVktramt0OCJ9.ZQ9EtKOUUae2fVSGehSnBQ', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
    maxZoom: 18
  });

  baseLayer.addTo(map);

  var RedIcon = L.Icon.Default.extend({
           options: {
                 iconUrl: 'assets/marker-icon-red.png'
           }
        });
  var redIcon = new RedIcon();

  // get data from controller via gon
  var meetup_hash = gon.meetup_events
  var meetup_json = JSON.parse(meetup_hash)

  for (var i=0; i < meetup_json["results"].length; i++) {
    var lat = meetup_json["results"][i]["venue"]["lat"];
    var lon = meetup_json["results"][i]["venue"]["lon"];
    var name = meetup_json["results"][i]["name"];
    var mil = meetup_json["results"][i]["time"];
    var date = new Date(mil).toDateString();
    var address = meetup_json["results"][i]["venue"]["address_1"];
    var popup = '<b>' + name + '</b><br>' + date + '<br>' + address;
    var marker = L.marker([lat, lon], {icon: redIcon}).addTo(map);
    marker.bindPopup(popup);
  }
});
