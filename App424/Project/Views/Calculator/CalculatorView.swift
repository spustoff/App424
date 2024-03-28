//
//  CalculatorView.swift
//  App424
//
//  Created by IGOR on 25/03/2024.
//

import SwiftUI

struct CalculatorView: View {
    
    @StateObject var viewModel = CalculatorViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Calculator")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                }
                
                Text("Calculate your own price")
                    .foregroundColor(.gray)
                    .font(.system(size: 12, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                
                if viewModel.isCalculate == false {
                    
                    VStack {
                        
                        VStack(spacing: 12) {
                            
                            Menu(content: {
                                
                                ForEach(viewModel.types, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.currentType = index
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            Text(index)
                                            
                                        }
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currentType.isEmpty {
                                    
                                    HStack {
                                        
                                        Text("Complexity Level")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.up.chevron.down")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .regular))
                                    }
                                    
                                } else {
                                    
                                    HStack {
                                        
                                        Text(viewModel.currentType)
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Spacer()
                                    }
                                }
                            })
                            
                            Rectangle()
                                .fill(.white.opacity(0.1))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Number of elements")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.NumIfElem.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.NumIfElem)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                            .padding(6)
                            .frame(maxWidth: .infinity)
                            
                            Rectangle()
                                .fill(.white.opacity(0.1))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Avg. Design Time p/elem.")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.AvgDesTime.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.AvgDesTime)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                            .padding(6)
                            .frame(maxWidth: .infinity)
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 25).fill(.white.opacity(0.1)))
                        .background(RoundedRectangle(cornerRadius: 25).stroke(.white.opacity(0.2)))
                        .padding(.bottom)
                        
                        VStack(spacing: 12) {
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Hourly Rate")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.HoutlyRate.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.HoutlyRate)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                            .padding(6)
                            .frame(maxWidth: .infinity)
                            
                            Rectangle()
                                .fill(.white.opacity(0.1))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Additional Expenses")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.AddExpen.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.AddExpen)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                            .padding(6)
                            .frame(maxWidth: .infinity)
                            
                            Rectangle()
                                .fill(.white.opacity(0.1))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Profit Margin (%)")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.Profit.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.Profit)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                            .padding(6)
                            .frame(maxWidth: .infinity)
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 25).fill(.white.opacity(0.1)))
                        .background(RoundedRectangle(cornerRadius: 25).stroke(.white.opacity(0.2)))
                        
                        Spacer()
                        
                        HStack {
                            
                            NavigationLink(destination: {
                                
                                HistoryView(viewModel: viewModel)
                                    .navigationBarBackButtonHidden()
                                
                            }, label: {
                                
                                Image(systemName: "clock.arrow.circlepath")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(width: 50, height: 50)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim2")))
                                
                            })
                            
                            Button(action: {
                                
                                viewModel.isCalculate.toggle()
                                
                            }, label: {
                                
                                Text("Caculate")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim2")))
                                
                            })
                            .opacity(viewModel.currentType.isEmpty || viewModel.NumIfElem.isEmpty || viewModel.AvgDesTime.isEmpty || viewModel.HoutlyRate.isEmpty || viewModel.AddExpen.isEmpty || viewModel.Profit.isEmpty ? 0.5 : 1)
                            .disabled(viewModel.currentType.isEmpty || viewModel.NumIfElem.isEmpty || viewModel.AvgDesTime.isEmpty || viewModel.HoutlyRate.isEmpty || viewModel.AddExpen.isEmpty || viewModel.Profit.isEmpty ? true : false)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 25.0).stroke(.white.opacity(0.15)))
                    .background(LinearGradient(colors: [Color("prim").opacity(0.4), Color("prim2").opacity(0.4), Color.black, Color.black, Color.black, Color.black , Color.black, Color.black, Color.black, Color("prim2").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing).cornerRadius(25))
                    
                } else if viewModel.isCalculate == true {
                    
                    VStack {
                        
                        HStack {
                            
                            Text("Result:")
                                .foregroundColor(.white)
                                .font(.system(size: 28, weight: .semibold))
                            
                            Spacer()
                            
                            Text("calculation \(viewModel.number)")
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
                                
                                Text("\(viewModel.rth)")
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
                                
                                Text("$\(viewModel.rtp)")
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
                        
                        HStack {
                            
                            Button(action: {
                                
                                viewModel.currentType = ""
                                viewModel.NumIfElem = ""
                                viewModel.AvgDesTime = ""
                                viewModel.HoutlyRate = ""
                                viewModel.AddExpen = ""
                                viewModel.Profit = ""
                                
                                viewModel.isCalculate.toggle()
                                
                            }, label: {
                                
                                Image(systemName: "arrow.left")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(width: 50, height: 50)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim2")))
                                
                            })
                            
                            Button(action: {
                                
                                viewModel.calcTHours = viewModel.rth
                                viewModel.calcTPrice = viewModel.rtp
                                viewModel.number += 1
                                viewModel.calcNumber = Int(viewModel.number)
                                
                                viewModel.addCalc()
                                
                                viewModel.currentType = ""
                                viewModel.NumIfElem = ""
                                viewModel.AvgDesTime = ""
                                viewModel.HoutlyRate = ""
                                viewModel.AddExpen = ""
                                viewModel.Profit = ""
                                
                                viewModel.fetchCalc()
                                viewModel.isCalculate.toggle()
                                
                            }, label: {
                                
                                Text("Save")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim2")))
                                
                            })
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 25.0).stroke(.white.opacity(0.15)))
                    .background(LinearGradient(colors: [Color("prim").opacity(0.4), Color("prim2").opacity(0.4), Color("bg2"), Color("bg2"), Color("bg2"), Color("bg2"), Color("bg2"), Color("bg2"), Color("bg2"), Color("prim2").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing).cornerRadius(25))
                }
            }
            .padding()
        }
    }
}

#Preview {
    CalculatorView()
}
