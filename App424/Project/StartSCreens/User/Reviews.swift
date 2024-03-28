//
//  Reviews.swift
//  App424
//
//  Created by IGOR on 25/03/2024.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("ubg2")
                    .resizable()
                    .ignoresSafeArea()
                
            }
            
            VStack {
                
                HStack {
                    
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color("prim").opacity(0.5))
                        .frame(width: 70, height: 5)
                    
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color("prim"))
                        .frame(width: 70, height: 5)
                    
                }
                .padding()
                
                Text("Rate our app in the AppStore")
                    .foregroundColor(Color("prim"))
                    .font(.system(size: 26, weight: .bold))
                    .frame(width: 330)
                    .multilineTextAlignment(.center)
                
                Text("Help make the app even better")
                    .foregroundColor(Color("prim"))
                    .font(.system(size: 16, weight: .bold))
                    .padding(1)
                
                Image("Reviews")
                    .resizable()
                    .ignoresSafeArea()
                
            }
            
            VStack {
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Not()
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
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews()
}
