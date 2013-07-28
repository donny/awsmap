class Dashing.Awsmap extends Dashing.Widget

  ready: ->
    @mapElement = jQuery('#world-map')
    @mapElement.vectorMap({
      map: 'world_mill_en',
      backgroundColor: '#eb9c3c',
      zoomButtons: false,
      zoomOnScroll: false,
      markersSelectable: true,
      markerStyle: {
        initial: {fill: '#00FF00', stroke: '#383f47'},
        selected: {fill: '#FF0000', stroke: '#383f47'} },
      markers: [
        {latLng: [36.4885, -119.7014], name: 'Northern California'},
        {latLng: [37.6666, -78.6146], name: 'Northern Virginia'},
        {latLng: [45.5236, -122.6750], name: 'Oregon'},
        {latLng: [-23.5000, -46.6167], name: 'Sao Paulo'},
        {latLng: [53.0000, -7.0000], name: 'Ireland'},
        {latLng: [1.3667, 103.7500], name: 'Singapore'},
        {latLng: [-33.8683, 151.2086], name: 'Sydney'},
        {latLng: [35.6833, 139.7667], name: 'Tokyo'} ]});

  onData: (data) ->
    if @mapElement and data.down_sites
      map = @mapElement.vectorMap('get', 'mapObject')
      down_sites = "[#{data.down_sites}]"
      down_sites = JSON.parse(down_sites)
      map.setSelectedMarkers(down_sites)
