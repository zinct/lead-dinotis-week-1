//
//  Transaction.swift
//  Lead Dinotis Week 1
//
//  Created by Indra Mahesa on 13/05/23.
//

import Foundation

enum TransactionType {
    case income, outcome
}

struct Transaction: Identifiable {
    let id = UUID()
    let name: String
    let date: String
    let amount: Int
    let type: TransactionType
}

extension Transaction {
    static func getAll() -> [Transaction] {
        return [
            Transaction(name: "Tambah Coin", date: "25 Juli 2021", amount: 150000, type: .income),
            Transaction(name: "Merry Riana Live Semua apakabar ya", date: "25 Juli 2021", amount: 500000, type: .outcome),
            Transaction(name: "Cashback 50%", date: "25 Juli 2021", amount: 150000, type: .income),
            Transaction(name: "Merry Riana Live Semua apakabar ya", date: "25 Juli 2021", amount: 500000, type: .outcome),
            Transaction(name: "Refund", date: "25 Juli 2021", amount: 150000, type: .income),
        ]
    }
}
