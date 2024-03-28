//
//  HistoryView.swift
//  App424
//
//  Created by IGOR on 27/03/2024.
//

import SwiftUI

struct HistoryView: View {
    
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
                
                VStack {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.calculations, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedCalc = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 10) {
                                            
                                            Text("Calculation")
                                                .foregroundColor(.white)
                                                .font(.system(size: 17, weight: .regular))
                                            
                                            Text((index.calcDate ?? Date()).convertDate(format: "MMM d HH:mm"))
                                                .foregroundColor(.gray)
                                                .font(.system(size: 12, weight: .regular))
                                        }
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .medium))
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 15).stroke(.white.opacity(0.3)))
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2").opacity(0.5)))
                                    .padding()
                                })
                            }
                        }
                    }
                }
                .background(LinearGradient(colors: [Color("prim2"), Color.black, Color.black, Color.black, Color.black, Color("prim2")], startPoint: .topLeading, endPoint: .bottomTrailing))
                .ignoresSafeArea()
            }
        }
        .onAppear {
            
            viewModel.fetchCalc()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            HistoryDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    HistoryView(viewModel: CalculatorViewModel())
}
