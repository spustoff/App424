//
//  Not.swift
//  App424
//
//  Created by IGOR on 25/03/2024.
//

import SwiftUI
import OneSignalFramework

struct Not: View {
    
    @AppStorage("status") var status: Bool = false
    
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
                        .fill(Color("prim"))
                        .frame(width: 70, height: 5)
                    
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color("prim").opacity(0.5))
                        .frame(width: 70, height: 5)
                }
                .padding()
                .opacity(0)
                
                Text("Don’t miss anything")
                    .foregroundColor(Color("prim"))
                    .font(.system(size: 26, weight: .bold))
                
                Text("Don’t miss the most userful information")
                    .foregroundColor(Color("prim"))
                    .font(.system(size: 16, weight: .bold))
                    .padding(1)
                
                Image("Not")
                    .resizable()
                    .ignoresSafeArea()
                
            }
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    OneSignal.Notifications.requestPermission({ accepted in
                      print("User accepted notifications: \(accepted)")
                        status = true
                    }, fallbackToSettings: true)
                    
                }, label: {
                    
                    Text("Enable Notifications")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
            }
            .padding()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.system(size: 15, weight: .medium))
                            .padding(4)
                            .background(Circle().fill(.white.opacity(0.2)))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    Not()
}
