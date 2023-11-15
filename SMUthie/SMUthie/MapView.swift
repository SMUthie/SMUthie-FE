//
//  MapView.swift
//  SMUthie
//
//  Created by 김유빈 on 2023/02/28.
//

import SwiftUI
import MapKit

enum DisplayedData{
    case restaurant
    case cafeteria
    case none
}

struct MapkitView: UIViewRepresentable {
    @Binding var coord: CLLocationCoordinate2D
    @Binding var isActive: Bool
    @Binding var isPinVisible: Bool
    @Binding var selectedRestaurant: [Restaurant]?
    @Binding var selectedCafeteria: [Cafe]?
    @Binding var isHiddenView: Bool
    @Binding var willDisplayData: DisplayedData
    @State private var currentDisplayData: DisplayedData = .none
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        if isPinVisible {
            if currentDisplayData != willDisplayData{
                uiView.removeAnnotations(uiView.annotations)
                switch willDisplayData {
                case .restaurant:
                    if let selectedRestaurant = selectedRestaurant {
                        selectedRestaurant.forEach { value in
                            let restaurantAnnotation = MKPointAnnotation()
                            restaurantAnnotation.coordinate = CLLocationCoordinate2D(latitude: value.latitude, longitude: value.longitude)
                            uiView.addAnnotation(restaurantAnnotation)
                        }
                    }
                    DispatchQueue.main.async {
                        currentDisplayData = willDisplayData
                    }
                    
                case .cafeteria:
                    if let selectedCafeteria = selectedCafeteria {
                        selectedCafeteria.forEach { value in
                            let cafeteriaAnnotation = MKPointAnnotation()
                            cafeteriaAnnotation.coordinate = CLLocationCoordinate2D(latitude: value.latitude, longitude: value.longitude)
                            uiView.addAnnotation(cafeteriaAnnotation)
                        }
                    }
                    DispatchQueue.main.async {
                        currentDisplayData = willDisplayData
                    }
                case .none:
                    break
                }
            }
            //            if let selectedRestaurant = selectedRestaurant {
            //                selectedRestaurant.forEach { value in
            //                    let restaurantAnnotation = MKPointAnnotation()
            //                    restaurantAnnotation.coordinate = CLLocationCoordinate2D(latitude: value.latitude, longitude: value.longitude)
            //                    uiView.addAnnotation(restaurantAnnotation)
            //                }
            //            }
        } else {
            uiView.removeAnnotations(uiView.annotations)
            DispatchQueue.main.async {
                currentDisplayData = .none
            }
            
        }
        
        let region = MKCoordinateRegion(center: coord, latitudinalMeters: 1000, longitudinalMeters: 1000)
        uiView.setRegion(region, animated: true)
        
        if isActive {
            uiView.showsUserLocation = true
        }
    }
    
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapkitView
        
        init(_ parent: MapkitView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
            print("selected")
            parent.isHiddenView = false
        }
        
        func mapView(_ mapView: MKMapView, didDeselect annotation: MKAnnotation) {
            print("deSelect")
            parent.isHiddenView = true
        }
    }
}

struct MapView: View {
    @State private var coord = CLLocationCoordinate2D(latitude: 37.601820567855, longitude: 126.9549752438)
    @State private var isActive = false
    @State private var isRestaurantButtonSelected = false
    @State private var isCafeButtonSelected = false
    @State private var isPinVisible = false
    @State private var selectedRestaurant: [Restaurant]?
    @State private var selectedCafe: [Cafe]?
    @State private var isHiddenView: Bool = true
    @State private var willDisplayData: DisplayedData = .none
    
    var body: some View {
        NavigationView {
            ZStack {
                MapkitView(coord: $coord, isActive: $isActive, isPinVisible: $isPinVisible, selectedRestaurant: $selectedRestaurant, selectedCafeteria: $selectedCafe, isHiddenView: $isHiddenView, willDisplayData: $willDisplayData)
                    .edgesIgnoringSafeArea(.vertical)
                
                VStack {
                    Spacer()
                    HStack {
                        Button(action: {
                            coord = CLLocationCoordinate2D(latitude: 37.601820567855, longitude: 126.9549752438)
                            isActive.toggle()
                            
                        }) {
                            Image("School")
                                .frame(width: 50, height: 50)
                                .padding()
                        }
                        Spacer()
                        Button(action: {
                            isRestaurantButtonSelected.toggle()
                            isCafeButtonSelected = false
                            isPinVisible = ValidatePinVisible()
                            if isPinVisible{
                                willDisplayData = .restaurant
                            } else {
                                willDisplayData = .none
                            }
                            
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
                            isRestaurantButtonSelected = false
                            isPinVisible = ValidatePinVisible()
                            if isPinVisible {
                                willDisplayData = .cafeteria
                            } else {
                                willDisplayData = .none
                            }
                            
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
                
                //                if let selectedRestaurant = selectedRestaurant {
                if !isHiddenView {
                    VStack {
                        Spacer()
                        InfoView(restaurant: selectedRestaurant, cafe: selectedCafe)
                            .background(
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 345, height: 100)
                                    .background(.white.opacity(0.75))
                                    .cornerRadius(20)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 2, y: 2)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .inset(by: 0.5)
                                            .stroke(Color(red: 1, green: 0.85, blue: 0.66), lineWidth: 1)
                                    )
                            )
                            .padding(.bottom, 150)
                            .onTapGesture {
                                
                            }
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("Logo")
                }
            }
        }
        .onAppear {
            self.isActive = true
            self.isPinVisible = false
            self.selectedRestaurant = getRestaurants()
            self.selectedCafe = getCafes()
        }
    }
    
    // 음식점 데이터를 가져오는 함수 정의
    func getRestaurants() -> [Restaurant] {
        // 실제 데이터 가져오는 로직을 여기에 추가
        return [
            Restaurant(name: "음식점 1", address: "주소 1", latitude: 37.602, longitude: 126.955),
            Restaurant(name: "음식점 2", address: "주소 2", latitude: 37.603, longitude: 126.956),        ]
    }
    
    func getCafes() -> [Cafe] {
        return [
            Cafe(name: "카페 1", address: "주소 1", latitude: 37.602, longitude: 126.955),
        ]
    }
    
    func ValidatePinVisible() -> Bool{
        if !(isCafeButtonSelected || isRestaurantButtonSelected) {
            return false
        }
        else { return true }
    }
}

struct InfoView: View {
    let restaurant: [Restaurant]?
    let cafe: [Cafe]?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text((restaurant?.first?.name)!)
                    .font(.headline)
                
            }
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 295, height: 40)
                    .background(Color(red: 0.89, green: 0.47, blue: 0.16).opacity(0.7))
                    .cornerRadius(15)
                HStack {
                    /*
                     Image("Phone")
                     .frame(width: 23.4375, height: 23.4375)
                     */
                    Text("02-123-4567")
                        .font(
                            Font.custom("NanumSquareRoundOTF", size: 16)
                                .weight(.heavy)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
            }
        }
        .padding()
    }
}

struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let latitude: Double
    let longitude: Double
}

struct Cafe: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let latitude: Double
    let longitude: Double
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

//
//struct MapkitView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
