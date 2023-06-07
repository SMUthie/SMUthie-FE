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
    
    var body: some View {
        NavigationView {
            ZStack {
                UIMapView(coord: coord, isActive: isActive)
                    .edgesIgnoringSafeArea(.vertical)
                Spacer().zIndex(1)
                VStack {
                    Spacer()
                    HStack {
                        Button(action: {
                            coord = (126.9549752438, 37.601820567855)
                            isActive.toggle()
                        }) {
                            Image("School")
                                .frame(width: 50, height: 50)
                                .padding()
                        }
                        Spacer()
                        Button(action: {
                            isRestaurantButtonSelected.toggle()
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
        }
    }
}

struct UIMapView: UIViewRepresentable {
    var coord: (Double, Double)
    var isActive: Bool
    
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
