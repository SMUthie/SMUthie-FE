//
//  MapView.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/02/28.
//

import SwiftUI
import NMapsMap

struct MapView: View {
    @State var coord: (Double, Double) = (126.9549752438, 37.601820567855)
    @State var isActive = false
    @State var isRestaurantButtonSelected = false
    @State var isCafeButtonSelected = false
    @State var isPinVisible = false
    
    var body: some View {
        NavigationView {
            ZStack {
                UIMapView(coord: coord, isActive: isActive, isPinVisible: isPinVisible)
                    .edgesIgnoringSafeArea(.vertical)
                Spacer().zIndex(1)
                VStack {
                    Spacer()
                    HStack {
                        Button(action: {
                            coord = (126.9549752438, 37.601820567855)
                            isActive.toggle()
                            isPinVisible = false
                        }) {
                            Image("School")
                                .frame(width: 50, height: 50)
                                .padding()
                        }
                        Spacer()
                        Button(action: {
                            isRestaurantButtonSelected.toggle()
                            isPinVisible.toggle()
                        }) {
                            VStack {
                                Text("음식점")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                            }
                            .padding()
                            .frame(width: 80, height: 30)
                            .background(isRestaurantButtonSelected ? Color(hex: "E37729") : Color(hex: "E37729").opacity(0.5))
                            .cornerRadius(30)
                        }
                        Button(action: {
                            isCafeButtonSelected.toggle()
                            isPinVisible.toggle()
                        }) {
                            VStack {
                                Text("카페")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                            }
                            .padding()
                            .frame(width: 80, height: 30)
                            .background(isCafeButtonSelected ? Color(hex: "E37729") : Color(hex: "E37729").opacity(0.5))
                            .cornerRadius(30)
                        }
                    }
                    .padding()
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    LogoView()
                }
            }
        }
        .onAppear {
            self.coord = (126.9549752438, 37.601820567855)
            self.isActive = true
            self.isPinVisible = false
        }
    }
}

struct UIMapView: UIViewRepresentable {
    var coord: (Double, Double)
    var isActive: Bool
    var isPinVisible: Bool
    
    func makeUIView(context: Context) -> NMFNaverMapView {
        let view = NMFNaverMapView()
        view.showZoomControls = false
        view.mapView.positionMode = .direction
        view.mapView.zoomLevel = 16
        
        return view
    }
    
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
        if isActive {
            let coord = NMGLatLng(lat: coord.1, lng: coord.0)
            let cameraUpdate = NMFCameraUpdate(scrollTo: coord)
            cameraUpdate.animation = .fly
            cameraUpdate.animationDuration = 1
            uiView.mapView.moveCamera(cameraUpdate)
        }
        
        if isPinVisible {
            addPinMarker(to: uiView.mapView, at: coord)
        } else {
            removePinMarker(from: uiView.mapView)
        }
    }
    
    func addPinMarker(to mapView: NMFMapView, at coord: (Double, Double)) {
        let marker = NMFMarker(position: NMGLatLng(lat: 37.601, lng: 126.9559))
        let marker2 = NMFMarker(position: NMGLatLng(lat: 37.601, lng: 126.9566))
        //marker.iconImage = NMF_MARKER_IMAGE_BLUE
        marker.iconImage = NMFOverlayImage(name: "pin")
        marker2.iconImage = NMFOverlayImage(name: "pin")
        marker.width = 40 // 핀 이미지 너비 조절
        marker2.width = 40
        marker.height = 40 // 핀 이미지 높이 조절
        marker2.height = 40
        marker.mapView = mapView
        marker2.mapView = mapView
    }
    
    func removePinMarker(from mapView: NMFMapView) {
        
    }
}

struct LogoView: View {
    var body: some View {
        Image("Logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 116, height: 35.5)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = Double((rgbValue & 0xff0000) >> 16) / 255.0
        let g = Double((rgbValue & 0xff00) >> 8) / 255.0
        let b = Double(rgbValue & 0xff) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}
