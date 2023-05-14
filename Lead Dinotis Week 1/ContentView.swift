//
//  ContentView.swift
//  Lead Dinotis Week 1
//
//  Created by Indra Mahesa on 11/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedIndex = "0"
    @Namespace private var namespace
    var transactions = Transaction.getAll()
    
    @State private var lol = false
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.backgroundPurple)
                .ignoresSafeArea()

            VStack {
                VStack(spacing: 25) {
                    HStack {
                        Image.icBackTopBar
                            .frame(width: 37, height: 36)
                            .background(.white)
                            .clipShape(Circle())
                            .shadow(color: .shadowBlack.opacity(0.06), radius: 4)

                        Spacer()
                        Text("Riwayat Coin")
                            .font(.robotoBold(size: 18))
                        Spacer()
                        Image.icHelpTopBar
                    }
                        .padding(.horizontal, 15)

                    HStack(spacing: 0) {
                        TabBarComponent(label: "Semua", currentId: $selectedIndex, id: "0", namespace: namespace)
                        TabBarComponent(label: "Coin Masuk", currentId: $selectedIndex, id: "1", namespace: namespace)
                        TabBarComponent(label: "Coin Keluar", currentId: $selectedIndex, id: "2", namespace: namespace)
                    }
                }
                    .background(Color.white)

                TabView(selection: $selectedIndex) {
                    VStack {
                        ScrollView {
                            ForEach(transactions) { transaction in
                                TransactionItemComponent(transaction: transaction)
                            }
                        }
                    }
                    .tag("0")
                    
                    VStack {
                        ScrollView {
                            ForEach(transactions.filter({$0.type == .income})) { transaction in
                                TransactionItemComponent(transaction: transaction)
                            }
                        }
                    }
                    .tag("1")
                    
                    VStack {
                        ScrollView {
                            ForEach(transactions.filter({$0.type == .outcome})) { transaction in
                                TransactionItemComponent(transaction: transaction)
                            }
                        }
                    }
                    .tag("2")
                    
                }
                    .tabViewStyle(.page(indexDisplayMode: .always))
                    .padding(.horizontal, 20)

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
