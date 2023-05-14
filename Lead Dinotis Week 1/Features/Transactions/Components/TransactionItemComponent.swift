//
//  TransactionItemView.swift
//  Lead Dinotis Week 1
//
//  Created by Indra Mahesa on 13/05/23.
//

import SwiftUI

struct TransactionItemComponent: View {
    @State private var isSheetOpened = false
    let transaction: Transaction
    
    var body: some View {
        Button(action: {
            isSheetOpened = true
        }) {
            VStack(alignment: .leading) {
                HStack {
                    (transaction.type == .income ? Image.imgArrowUpCoin : Image.imgArrowDownCoin)
                        .padding(.trailing, 10)
                        
                    VStack(alignment: .leading) {
                        Text(transaction.name)
                            .multilineTextAlignment(.leading)
                            .font(.robotoMedium(size: 14))
                            .foregroundColor(.primaryBlack)
                            .lineLimit(1)
                        
                        Text(transaction.date)
                            .font(.robotoLight(size: 12))
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Text("\(transaction.type == .income ? "+" : "-") \(String(transaction.amount.formatted()))")
                        .font(.robotoMedium(size: 14))
                        .foregroundColor(transaction.type == .income ? .green : .red)
                        .padding(.leading, 30)
                }
                .padding(.vertical, 10)
                
                Divider()
            }
        }
        .if(transaction.type == .income) {
            $0.sheet(isPresented: $isSheetOpened) {
                VStack {
                    (transaction.type == .income ? Image.imgArrowUpCoin : Image.imgArrowDownCoin)
                        .padding(.bottom, 10)
                    Text(transaction.name)
                        .padding(.bottom, 15)
                    Text("\(transaction.type == .income ? "+" : "-") \(String(transaction.amount.formatted()))")
                        .font(.robotoMedium(size: 14))
                        .foregroundColor(transaction.type == .income ? .green : .red)
                }
                .presentationDetents([.medium, .large])
            }
        }
        .if(transaction.type == .outcome) {
            $0.fullScreenCover(isPresented: $isSheetOpened) {
                VStack {
                    (transaction.type == .income ? Image.imgArrowUpCoin : Image.imgArrowDownCoin)
                        .padding(.bottom, 10)
                    Text(transaction.name)
                        .padding(.bottom, 15)
                    Text("\(transaction.type == .income ? "+" : "-") \(String(transaction.amount.formatted()))")
                        .font(.robotoMedium(size: 14))
                        .foregroundColor(transaction.type == .income ? .green : .red)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .presentationDetents([.large, .large])
                .onTapGesture {
                    isSheetOpened = false
                }
            }
        }
    }
}

struct TransactionItemView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionItemComponent(transaction: Transaction(name: "Tes", date: "2 Juli 2022", amount: 10000, type: .income))
    }
}
