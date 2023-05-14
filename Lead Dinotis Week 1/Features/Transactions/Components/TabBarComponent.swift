//
//  TapBarComponent.swift
//  Lead Dinotis Week 1
//
//  Created by Indra Mahesa on 13/05/23.
//

import SwiftUI

struct TabBarComponent: View {
    let label: String
    @Binding var currentId: String
    let id: String
    let namespace: Namespace.ID
    
    var body: some View {
        Button (action: {
            withAnimation(.easeInOut) {
                currentId = id
            }
        }) {
            VStack {
                Text(label)
                    .foregroundColor(.primaryBlack)
                    .font(.robotoMedium(size: 14))
                    
                ZStack {
                    Rectangle()
                        .fill(Color.secondaryPurple)
                        .frame(height: 1)
                    
                    if currentId == id {
                        Rectangle()
                            .fill(Color.primaryPurple)
                            .frame(height: 1)
                            .matchedGeometryEffect(id: "navigation", in: namespace)
                    }
                }
                
            }
        }
            .frame(maxWidth: .infinity)
    }
}

struct TapBarComponent_Previews: PreviewProvider {
    struct TestView: View {
        @State private var currentIndex = "0"
        @Namespace private var animation
        
        var body: some View {
            HStack {
                TabBarComponent(label: "Semua", currentId: $currentIndex, id: "0", namespace: animation)
                TabBarComponent(label: "Coin", currentId: $currentIndex, id: "1", namespace: animation)
            }
        }
    }
    
    static var previews: some View {
        TestView()
    }
}
