//
//  R1.swift
//  App424
//
//  Created by IGOR on 25/03/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("R1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                HStack {
                    
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color("prim"))
                        .frame(width: 70, height: 5)
                    
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color("prim").opacity(0.5))
                        .frame(width: 70, height: 5)
                }
                .padding(8)
                
                Text("Explore your")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                
                Text("portfolio")
                    .foregroundColor(Color("prim"))
                    .font(.system(size: 26, weight: .bold))
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    R2()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
            }
            .padding()
        }
    }
}

#Preview {
    R1()
}
