//
//  FeedbackViewModel.swift
//  SMUthie
//
//  Created by Phil on 2023/03/03.
//
import Combine
import Foundation

class FeedbackViewModel: ObservableObject {
    @Published var showAlert = false
    
    func sendFeedback(title: String, content: String, completion: @escaping (Bool) -> Void) {
        let feedback = Feedback(title: title, content: content)
        let encoder = JSONEncoder()
        
        guard let jsonData = try? encoder.encode(feedback) else {
            completion(false)
            return
        }
        
        guard let url = URL(string: "https://example.com/feedback") else {
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(false)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(false)
                return
            }
            
            completion(true)
        }.resume()
    }
}

// alamofire 사용시
//func sendFeedback(title: String, content: String, completion: @escaping (Bool) -> Void) {
//    let feedback = Feedback(title: title, content: content)
//    AF.request("https://example.com/feedback", method: .post, parameters: feedback, encoder: JSONParameterEncoder.default).validate().response { response in
//        switch response.result {
//        case .success:
//            completion(true)
//        case .failure:
//            completion(false)
//        }
//    }
//}

