//
//  MapView.swift
//  T-Party
//
//  Created by Emily Mallaber on 10/20/22.
//

import SwiftUI
import MapKit


struct MapView: View {
    @ObservedObject var usersLocation : LocationManager
    var latitude: Double
    var longitude: Double
    @State var region: MKCoordinateRegion
    @State var currStops = mockStops
    @State var showT = true
    @State var showBus = true
    @State var filterOn = false
    @State var showFilterOptions = false
    @State var currAnnotation = AnnotationList(annotations: mockStops)
    
    init(manager: LocationManager) {
        self.usersLocation = manager
        let lat = manager.location?.latitude ?? 0
        self.latitude = lat
        let long = manager.location?.longitude ?? 0
        self.longitude = long
        let reg = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: lat , longitude: long),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
        self._region = State<MKCoordinateRegion>(initialValue: reg)
        
    }
    var body: some View {
                ZStack(alignment:.topTrailing){
                    Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: currAnnotation.visibleAnnotations) { item in
                        MapAnnotation(coordinate: item.coords) {
                            if(item.stopData.route.type == RouteType.bus) {
                                Circle()
                                    .strokeBorder(.black, lineWidth: 1)
                                    .background(Circle().fill(Color("BusYellow")))
                                    .onTapGesture {
                                        print("Tapped on \(item.stopName)")
                                    }
                            }
                            else{
                                Circle()
                                    .strokeBorder(.black, lineWidth: 1)
                                    .background(Circle().fill(Color("GLGreen")))
                                    .onTapGesture {
                                        print("Tapped on \(item.stopName)")
                                    }
                            }
                        }
                    }
                    MapPopUpView(trainChecked: $showT, busChecked: $showBus, showFilterOptions: $showFilterOptions, currAnnotation: $currAnnotation)
                        Button() {
                            showFilterOptions.toggle()
                            currAnnotation.resetAnnotations(showT: showT, showBus: showBus)
                        } label: {
                            if(showT && showBus) {
                                Image(systemName: "line.3.horizontal.decrease.circle")
                                    .font(.system(size: 35))
                            }
                            else {
                                Image(systemName: "line.3.horizontal.decrease.circle.fill")
                                    .font(.system(size: 35))
                            }
                        }
                    }
                    .padding()
        }
    }
    
