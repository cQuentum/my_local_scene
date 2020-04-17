import mapboxgl from 'mapbox-gl';

// const fitMapToMarkers = (map, markers) => {
//   const bounds = new mapboxgl.LngLatBounds();
//   markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
//   map.fitBounds(bounds, { padding: 200, maxZoom: 15, duration: 0 });
// };

const addZoomOnClusters = (map, locationInfoCards) => {
  locationInfoCards.forEach(infoCard => {
    infoCard.addEventListener('click', event => {
      highlightInfoCard(infoCard.dataset.location, locationInfoCards);
      const coordinates = JSON.parse(infoCard.dataset.coordinates);
      map.easeTo({
        center: coordinates,
        zoom: 9
      });
    });
  });
};

const highlightInfoCard = (location, locationInfoCards) => {
  const currentInfoCard   = document.getElementById(location + '-info-card')
  locationInfoCards.forEach(infoCard => infoCard.style.removeProperty("background-color"));
  currentInfoCard.style.backgroundColor = 'dimgray';
};

const initMapbox = () => {
  const mapElement        = document.getElementById('map');
  const locationInfoCards = document.querySelectorAll('.js-location-info-card');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/dark-v10',
      zoom: 3,
      center: [-1.55, 47.27],
      offset: -100
    });

    addZoomOnClusters(map, locationInfoCards);

    const markers = JSON.parse(mapElement.dataset.markers);

    map.on('load', () => {
      map.addSource('users', {
        type: 'geojson',
        data: { features: markers },
        cluster: true,
        clusterMaxZoom: 8, // Max zoom to cluster points on
        clusterRadius: 100
      })

      map.addLayer({
        id: 'clusters',
        type: 'circle',
        source: 'users',
        filter: ['has', 'point_count'],
        paint: {
          // Use step expressions (https://docs.mapbox.com/mapbox-gl-js/style-spec/#expressions-step)
          // with three steps to implement three types of circles:
          //   * Blue, 20px circles when point count is less than 100
          //   * Yellow, 30px circles when point count is between 100 and 750
          //   * Pink, 40px circles when point count is greater than or equal to 750
          'circle-color': [
            'step',
            ['get', 'point_count'],
            '#51bbd6', // couleur
            100, // jusqu'à ce nombre de point
            '#f1f075',
            750,
            '#f28cb1'
          ],
          'circle-radius': [
            'step',
            ['get', 'point_count'],
            20,  // px
            40,  // jusqu'à ce nombre de point
            30,  // px
            100, // jusqu'à ce nombre de point
            40   // px pour au delà
          ]
        }
      });

      map.addLayer({
        id: 'unclustered-point',
        type: 'circle',
        source: 'users',
        filter: ['!', ['has', 'point_count']],
        paint: {
          'circle-color': '#11b4da',
          'circle-radius': 15,
          'circle-stroke-width': 1,
          'circle-stroke-color': '#fff'
        }
      });

      map.addLayer({
        id: 'unclustered-point-count',
        type: 'symbol',
        source: 'users',
        filter: ['!', ['has', 'point_count']],
        layout: {
          'text-field': '{userCount}',
          'text-font': ['DIN Offc Pro Medium', 'Arial Unicode MS Bold'],
          'text-size': 12
        }
      });

      map.addLayer({
        id: 'cluster-count',
        type: 'symbol',
        source: 'users',
        filter: ['has', 'point_count'],
        layout: {
          'text-field': '{point_count_abbreviated}',
          'text-font': ['DIN Offc Pro Medium', 'Arial Unicode MS Bold'],
          'text-size': 12
        }
      });

      map.on('click', 'clusters', function(e) {
        const features = map.queryRenderedFeatures(e.point, {
          layers: ['clusters']
        });
        const clusterId = features[0].properties.cluster_id;
        map.getSource('users').getClusterExpansionZoom(
          clusterId,
          function(err, zoom) {
          if (err) return;

          map.easeTo({
            center: features[0].geometry.coordinates,
            zoom: zoom
          });
        });
      });

      map.on('click', 'unclustered-point', function(e) {
        const coordinates = e.features[0].geometry.coordinates.slice();
        const userCount   = e.features[0].properties.userCount;
        const location    = e.features[0].properties.location;

        highlightInfoCard(location, locationInfoCards);

        const text = `Hey tu veux aller jouer à <b><strong>${location}</strong></b>, là où il y a <strong>${userCount}</strong> intéressés ?`
        new mapboxgl.Popup()
          .setLngLat(coordinates)
          .setHTML(` <p>${text}</p><a href="my_concerts/new">C'est parti !</a>`)
          .addTo(map);
      });
    });
  }
};

export { initMapbox };
