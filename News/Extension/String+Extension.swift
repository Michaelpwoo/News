//
//  String+Extension.swift
//  News
//
//  Created by Michael Woo on 10/4/23.
//

import Foundation

extension String {
    func toDateTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")

        guard let date = dateFormatter.date(from: self) else {
            return self
        }

        dateFormatter.dateFormat = "EEE, MMM d, yyyy - h:mm a"
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: date)
    }

}
