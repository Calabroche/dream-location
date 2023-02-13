import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"


export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/pdunleav/cjofefl7u3j3e2sp0ylex3cyb" // <-- use your own!
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))

    window.aaa = this
  }

  closePopup(marker) {
    const popup = marker.getPopup()
    if (popup.isOpen()) {
      marker.togglePopup()
    }
  }

  openPopup(marker) {
    console.log("open");
    console.log(marker);
    const popup = marker.getPopup()
    if (!popup.isOpen()) {
      marker.togglePopup()
    }
  }

  popup(event) {
    this.markers.forEach(marker => this.closePopup(marker))
    const marker = this.markers.find((marker) => marker.id == event.detail)
    this.openPopup(marker)
  }

  #addMarkersToMap() {
    this.markers = []
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)
      const m = new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
      m.id = marker.id
      this.markers.push(m)
    })
  }


  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 50, duration: 0 })
  }

}
