$(document).ready(function() {

  var map = L.map('map').setView([37.7272, -122.3226], 12);
  console.log(map);

  var baseLayer = L.tileLayer('http://{s}.tiles.mapbox.com/v4/irinatag.29e71c77/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoiaXJpbmF0YWciLCJhIjoiVktramt0OCJ9.ZQ9EtKOUUae2fVSGehSnBQ', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
    maxZoom: 18
  });

  baseLayer.addTo(map);

  // get data from controller via gon
  var meetup_events = gon.meetup_events

  console.log(meetup_events)
  console.log(meetup_events["results"])
  // console.log(meetup_events["results"][1]["name"]);
  // console.log(meetup_events["results"][1]["venue"]["address_1"]);
  //
  // for (var i=0; i < meetup_events["results"].length; i++) {
  //   var lat = meetup_events["results"][i]["venue"]["lat"];
  //   var lon = meetup_events["results"][i]["venue"]["lon"];
  //   var name = meetup_events["results"][i]["name"];
  //   var address = meetup_events["results"][i]["venue"]["address_1"];
  //   var popup = '<b>' + name + '</b><br>' + address;
  //   var marker = L.marker([lat, lon]).addTo(map);
  //   marker.bindPopup(popup);
  // }

});
