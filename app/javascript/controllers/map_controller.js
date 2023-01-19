import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"


export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
  }

  closePopup(marker) {
    const p = marker.getPopup()
    if (p.isOpen())
      marker.togglePopup()
  }

  openPopup(marker) {
    const p = marker.getPopup()
    if (!p.isOpen())
      marker.togglePopup()
  }

  popup(event) {
    const marker = this.markers.find((m) => m.id === event.detail)
    this.markers.forEach(m => this.closePopup(m))
    this.openPopup(marker)
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

    console.log(this.markers)
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
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

}
