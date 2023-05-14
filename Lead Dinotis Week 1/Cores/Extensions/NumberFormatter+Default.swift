//
//  NumberFormatter+Default.swift
//  Lead Dinotis Week 1
//
//  Created by Indra Mahesa on 13/05/23.
//

import Foundation

extension NumberFormatter {
    static let currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}

