//
//  DateFormatterHelper.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/20/22.
//

import Foundation


struct DateFomatterHelper {
    
    func getDate(timeString: String) -> String {
        let inDateFormatter = ISO8601DateFormatter()
        let date = inDateFormatter.date(from: timeString)!
        let df = DateFormatter()
        df.dateFormat = "MMM d, h:mm a"
        df.locale = Locale(identifier: "en_US_POSIX")
        return df.string(from: date)
    }
}

