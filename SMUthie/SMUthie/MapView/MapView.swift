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
    @Binding var selectedRestaurant: [MapResult]?
    @Binding var selectedCafeteria: [MapResult]?
    @Binding var selectedItem: MapResult?
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
                            let restaurantAnnotation = CustomAnnotation(coordinate: CLLocationCoordinate2D(latitude:  Double(value.latitude)!, longitude: Double(value.longitude)!), mapResult: value)
                            uiView.addAnnotation(restaurantAnnotation)
                        }
                    }
                    
                    DispatchQueue.main.async {
                        currentDisplayData = willDisplayData
                    }
                    
                case .cafeteria:
                    if let selectedCafeteria = selectedCafeteria {
                        selectedCafeteria.forEach { value in
                            let cafeteriaAnnotation = CustomAnnotation(coordinate: CLLocationCoordinate2D(latitude: Double(value.latitude)!, longitude: Double(value.longitude)!), mapResult: value)
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
            guard let customAnnotation = annotation as? CustomAnnotation else { return }
            parent.isHiddenView = false
            parent.selectedItem = customAnnotation.mapResult
        }
        
        func mapView(_ mapView: MKMapView, didDeselect annotation: MKAnnotation) {
            print("deSelect")
            parent.isHiddenView = true
            parent.selectedItem = nil
        }
    }
}

struct MapView: View {
    @State private var coord = CLLocationCoordinate2D(latitude: 37.601820567855, longitude: 126.9549752438)
    @State private var isActive = false
    @State private var isRestaurantButtonSelected = false
    @State private var isCafeButtonSelected = false
    @State private var isPinVisible = false
    @State private var selectedRestaurant: [MapResult]?
    @State private var selectedCafe: [MapResult]?
    @State private var isHiddenView: Bool = true
    @State private var willDisplayData: DisplayedData = .none
    @State private var selectedItem: MapResult?
    
    let RestaurantviewModel = MapRestaurantViewModel()
    let CafeviewModel = MapCafeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                MapkitView(coord: $coord, isActive: $isActive, isPinVisible: $isPinVisible, selectedRestaurant: $selectedRestaurant, selectedCafeteria: $selectedCafe, selectedItem: $selectedItem, isHiddenView: $isHiddenView, willDisplayData: $willDisplayData)
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
                                    .font(
                                        Font.custom("NanumSquareRoundOTFB", size: 14)
                                    )
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
                                    .font(
                                        Font.custom("NanumSquareRoundOTFB", size: 14)
                                    )
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
                        InfoView(selectedItem: selectedItem)
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
                            .padding(.bottom, 100)
                            .onTapGesture {
                                
                            }
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 116, height: 35.5)
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
    
    @StateObject private var mapRestaurantViewModel = MapRestaurantViewModel()
    @StateObject private var mapCafeViewModel = MapCafeViewModel()
    
    func getRestaurants() -> [MapResult] {
        return mapRestaurantViewModel.mapRestaurant
    }
    
    func getCafes() -> [MapResult] {
        return mapCafeViewModel.mapCafe
    }
    
    func ValidatePinVisible() -> Bool{
        if !(isCafeButtonSelected || isRestaurantButtonSelected) {
            return false
        }
        else { return true }
    }
}

struct InfoView: View {
    let selectedItem: MapResult?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(selectedItem?.name ?? "정보 불러오기에 실패하였습니다.")
                    .font(
                        Font.custom("NanumSquareRoundEB", size: 20)
                    )
                    .foregroundColor(Color(red: 0.89, green: 0.47, blue: 0.16))
                
                Text(selectedItem?.time ?? "정보가 없습니다.")
                    .font(
                        Font.custom("NanumSquareRoundOTFB", size: 16)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.89, green: 0.47, blue: 0.16))
            }
            
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 295, height: 40)
                    .background(Color(red: 0.89, green: 0.47, blue: 0.16).opacity(0.7))
                    .cornerRadius(15)
                
                // 전화 연결 -> 시뮬레이터에서는 오류 발생하는 게 맞음
                Link(destination: URL(string: "tel:\(selectedItem?.telephone ?? "")")!) {
                    Image(systemName: "phone")
                        .foregroundColor(Color.white)
                    Text(selectedItem?.telephone ?? "정보가 없습니다.")
                        .font(Font.custom("NanumSquareRoundEB", size: 16))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
                
                /*
                 Text(selectedItem?.telephone ?? "정보가 없습니다.")
                 .font(
                 Font.custom("NanumSquareRoundEB", size: 16)
                 )
                 .multilineTextAlignment(.center)
                 .foregroundColor(.white)
                 */
            }
        }
        .padding()
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

//
//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
