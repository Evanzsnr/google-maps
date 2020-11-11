import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { Platform, ModalController } from '@ionic/angular';
import { Geolocation } from '@ionic-native/geolocation/ngx';
import { NativeGeocoder, NativeGeocoderResult, NativeGeocoderOptions } from '@ionic-native/native-geocoder/ngx';
import { GoogleMaps, GoogleMap, GoogleMapsEvent, LatLng, MarkerOptions, Marker, Encoding, ILatLng } from "@ionic-native/google-maps";

declare var google;

@Component({
  selector: 'app-home',
  templateUrl: './home.page.html',
  styleUrls: ['./home.page.scss'],
})
export class HomePage implements OnInit {

  public map: GoogleMap;
  public origin: any = {};
  public destination: any = {};
  public lat: any;
  public lng: any;
  public address;
  
  constructor(
    public platform: Platform,
    public modalCtrl: ModalController,
    private geolocation: Geolocation
  ){}

  ngOnInit() {
    this.platform.ready().then(() => {
      this.getCurrentPosition();        
    });
  }
  
  public getCurrentPosition(){
    this.geolocation.getCurrentPosition()
    .then((resp) => {
      // Set current position.
      this.lat = resp.coords.latitude;
      this.lng = resp.coords.longitude;

      // Get the address.
      this.getAddress(resp.coords.latitude, resp.coords.longitude);

      // Set the coordinates.
      const coordinates: LatLng = new LatLng(this.lat, this.lng);

      /* The create() function will take the ID of your map element */
      const map = GoogleMaps.create('map');
      map.one( GoogleMapsEvent.MAP_READY ).then((data: any) => {
        map.setCameraTarget(coordinates);
        map.setCameraZoom(this.zoom);
        map.animateCamera({
          target: coordinates,
          zoom: 17,
          tilt: 60,
          bearing: 140,
          duration: 3000
        });

        // Add a marker
        map.addMarker({
          position: coordinates,
          title: this.address,
          icon: {
            url: 'https://i.ibb.co/QFhH4Yd/ezgif-com-gif-maker-3.png',
            size: {
              width: 30,
              height: 40
            }
          },
          animation: 'DROP'
        }).then(marker => {
          // Show the infoWindow
          marker.showInfoWindow();
        });

      });
    })
    .catch((error) => {
      console.error(error);
    });
  }
  
  public getAddress(lat, lng){
    let options: NativeGeocoderOptions = {
      useLocale: true,
      maxResults: 5
    };

    this.nativeGeocoder.reverseGeocode(lat, lng, options)
    .then((result: NativeGeocoderResult[]) => {
      this.address = `${result[0].thoroughfare} ${result[0].subThoroughfare}`;
    })
    .catch((error: any) => console.log(error));
  }
  
  public startNavigating(origin, destination){

    let directionsService = new google.maps.DirectionsService;

    directionsService.route({
        origin: origin,
        destination: destination,
        travelMode: google.maps.TravelMode['DRIVING']
    }, (res, status) => {

      if(status == google.maps.DirectionsStatus.OK){

          // decode overview_polyline from direction services.
          let decodedPoints: ILatLng[] = Encoding.decodePath(res.routes[0].overview_polyline);

          let map = GoogleMaps.create("map", {
            camera: {
              target: decodedPoints
            }
          });

          map.one( GoogleMapsEvent.MAP_READY ).then((data: any) => {
            map.setCameraTarget(decodedPoints);
            map.setCameraZoom(this.zoom);
            map.animateCamera({
              target: decodedPoints,
              zoom: 17,
              tilt: 60,
              bearing: 140,
              duration: 3000
            });

            map.addPolylineSync({
                points: decodedPoints,
                color: 'rgba(3, 183, 83, 1)',
                width: 6, 
                geodesic: true,
                clickable: false,
                zIndex: 3
            });
            
          });
          
      } else {
          console.warn(status);
      }

    });

  }
  
  async openSelectionPage(){
    const modal = await this.modalCtrl.create({
      component: SelectLocationPage
    });
    modal.onDidDismiss()
    .then((res) => {
      if(res !== null){
        if(res.data.origin && res.data.destination){
          
          this.origin = res.data.origin;
          this.destination = res.data.destination;

          // Start navigating
          this.startNavigating(this.origin, this.destination);
        }
      }
    })
    .catch();
    return await modal.present();
  }
  
}
