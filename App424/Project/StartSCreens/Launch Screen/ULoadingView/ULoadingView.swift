//
//  ULoadingView.swift
//  App424
//
//  Created by IGOR on 25/03/2024.
//

import SwiftUI

struct ULoadingView: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("ubg")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                ZStack {
                
                Image("logo2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                                    
                    ProgressView()
                }
            }
            .padding()
        }
    }
}

#Preview {
    ULoadingView()
}
