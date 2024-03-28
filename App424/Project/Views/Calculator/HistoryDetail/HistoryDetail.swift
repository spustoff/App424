//
//  HistoryDetail.swift
//  App424
//
//  Created by IGOR on 27/03/2024.
//

import SwiftUI

struct HistoryDetail: View {
    
    @StateObject var viewModel: CalculatorViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    ZStack {
                        
                        Text("History")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("Back")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .medium))
                                
                            }
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding()
                .padding(.top)
                
                VStack {
                    
                    HStack {
                        
                        Text("Result:")
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .semibold))
                        
                        Spacer()
                        
                        Text("calculation \(viewModel.selectedCalc?.calcNumber)")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                    }
                    .padding(.top)
                    
                    HStack {
                        
                        VStack(alignment: .leading) {
                            
                            Image(systemName: "timer")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 15, weight: .regular))
                                .padding(6)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.2)))
                            
                            Text("Total Hours")
                                .foregroundColor(.white.opacity(0.9))
                                .font(.system(size: 12, weight: .regular))
                            
                            Spacer()
                            
                            Text("\(viewModel.selectedCalc?.calcTHours ?? "")")
                                .foregroundColor(.white)
                                .font(.system(size: 23, weight: .medium))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 250)
                        .background(RoundedRectangle(cornerRadius: 25.0).stroke(.white.opacity(0.2), lineWidth: 2 ))
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color("bg2")))
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            
                            Image(systemName: "dollarsign")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 15, weight: .regular))
                                .padding(6)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.2)))
                            
                            Text("Total price")
                                .foregroundColor(.white.opacity(0.9))
                                .font(.system(size: 12, weight: .regular))
                            
                            Spacer()
                            
                            Text("$\(viewModel.selectedCalc?.calcTPrice ?? "")")
                                .foregroundColor(.white)
                                .font(.system(size: 23, weight: .medium))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 250)
                        .background(RoundedRectangle(cornerRadius: 25.0).stroke(.white.opacity(0.2), lineWidth: 2 ))
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color("bg2")))
                    }
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 25.0).stroke(.white.opacity(0.15)))
                .background(LinearGradient(colors: [Color("prim").opacity(0.4), Color("prim2").opacity(0.4), Color("bg2"), Color("bg2"), Color("bg2"), Color("bg2"), Color("bg2"), Color("bg2"), Color("bg2"), Color("prim2").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing).cornerRadius(25))
                .padding()

            }
        }
    }
}

#Preview {
    HistoryDetail(viewModel: CalculatorViewModel())
}
