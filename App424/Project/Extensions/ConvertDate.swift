//
//  ConvertDate.swift
//  App424
//
//  Created by IGOR on 27/03/2024.
//

import SwiftUI

extension Date {

    func convertDate(format: String) -> String {
        
        let date = self
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}
