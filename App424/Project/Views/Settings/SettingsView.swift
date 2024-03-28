//
//  SettingsView.swift
//  App424
//
//  Created by IGOR on 25/03/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @State var isDelete: Bool = false
    @AppStorage("number") var number: Int = 0
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Settings")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                }
                
                VStack {

                    VStack(spacing: 12) {
                        
                        HStack {
                            
                            Button(action: {
                                
                                SKStoreReviewController.requestReview()
                                
                            }, label: {
                                
                                Text("Rate app")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                            })
                            
                            Spacer()
                        }
                        .padding(6)
                        .frame(maxWidth: .infinity)
                        
                        Rectangle()
                            .fill(.white.opacity(0.1))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)

                        HStack {
                            
                            Button(action: {
                                
                                guard let url = URL(string: DataManager().usagePolicy) else { return }
                                
                                UIApplication.shared.open(url)
                                
                            }, label: {
                                
                                Text("Usage Policy")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                            })
                            
                            Spacer()
                        }
                        .padding(6)
                        .frame(maxWidth: .infinity)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 25).fill(Color("bg2").opacity(0.5)))
                    .background(RoundedRectangle(cornerRadius: 25).stroke(.white.opacity(0.2)))
                    
                    Spacer()

                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                isDelete = true
                            }
                            
                        }, label: {
                            
                            Text("Reset progress")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim2")))
                            
                        })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 25.0).stroke(.white.opacity(0.15)))
                .background(LinearGradient(colors: [Color("prim").opacity(0.4), Color("prim2").opacity(0.4), Color("bg2"), Color("bg2"), Color("bg2"), Color("bg2"), Color("bg2"), Color("bg2"), Color("bg2"), Color("prim2").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing).cornerRadius(25))
                
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                           isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                              isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Reset progress")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to reset progress?")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Rectangle()
                        .fill(.gray.opacity(0.4))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.vertical)
                                            
                        Button(action: {
            
                            number = 0
                            
                            CoreDataStack.shared.deleteAllData()
                            
                            withAnimation(.spring()) {
                                
                                isDelete = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Reset")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    SettingsView()
}
