//
//  AsyncImage.swift
//  SMUthie
//
//  Created by Phil on 11/14/23.
//

import SwiftUI

struct AsyncImage: View {
    let urlString: String
    @State private var image: UIImage? = nil

    var body: some View {
        Image(uiImage: image ?? UIImage())
            .resizable()
            .onAppear {
                loadImage(from: urlString)
            }
    }

    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let loadedImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = loadedImage
                }
            }
        }.resume()
    }
}
