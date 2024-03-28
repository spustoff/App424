//
//  LoadingView.swift
//  App424
//
//  Created by IGOR on 25/03/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("rbg")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                ZStack {
                
                Image("logo_big")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 355, height: 355)
                                    
                    ProgressView()
                }
            }
            .padding()
        }
    }
}

#Preview {
    LoadingView()
}
