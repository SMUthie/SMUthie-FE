//
//  DateManager.swift
//  SMUthie
//
//  Created by Phil on 11/14/23.
//

import Foundation

extension String {
    func convertDateFormat(from inputFormat: String, to outputFormat: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = inputFormat
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = outputFormat
        
        if let date = inputFormatter.date(from: self) {
            return outputFormatter.string(from: date)
        } else {
            return self // 원본 문자열을 반환하거나 적절한 오류 처리
        }
    }
}
extension Date {
    func getDatesForWeek() -> [String] {
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return (0...6).compactMap { offset in
            guard let date = calendar.date(byAdding: .day, value: offset, to: self) else { return nil }
            return dateFormatter.string(from: date)
        }
    }
}

