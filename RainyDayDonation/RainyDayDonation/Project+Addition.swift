//
//  Project+Addition.swift
//  RainyDayDonation
//
//  Created by Simone on 1/16/17.
//  Copyright © 2017 Simone. All rights reserved.
//

import Foundation

extension Project {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        timestamp = NSDate()
    }
    
    var localizedDescription: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: timestamp! as Date)
    }
}
