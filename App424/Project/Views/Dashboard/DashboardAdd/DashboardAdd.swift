//
//  DashboardAdd.swift
//  App424
//
//  Created by Вячеслав on 3/28/24.
//

import SwiftUI

struct DashboardAdd: View {
    
    @StateObject var viewModel: DashboardViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(.white)
                    .frame(width: 40, height: 4)
                
                ZStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .regular))
                                .padding(6)
                                .background(Circle().fill(.white.opacity(0.1)))
                        })
                        
                        Spacer()

                    }
                    
                    Text("Add rpoject")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                    
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        VStack(spacing: 12) {
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Category")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.projCategory.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.projCategory)
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
                                
                                Text("Name")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.projName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.projName)
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
                                
                                Text("Deadline")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.projDeadline.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.projDeadline)
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
                                
                                Text("Date")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.projDate.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.projDate)
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
                                
                                Text("Price")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.projPrice.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.projPrice)
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
                                
                                Text("Description")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.projDescription.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.projDescription)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                            .padding(6)
                            .frame(maxWidth: .infinity)
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 25).fill(.white.opacity(0.1)))
                        .background(RoundedRectangle(cornerRadius: 25).stroke(.white.opacity(0.2)))
                    }
                }
                
                Spacer()

                HStack {
                    
                    Button(action: {
                        
                        viewModel.addProject()
                        viewModel.fetchProjects()
                        
                        router.wrappedValue.dismiss()
                        
                        viewModel.projCategory = ""
                        viewModel.projName = ""
                        viewModel.projDeadline = ""
                        viewModel.projDate = ""
                        viewModel.projPrice = ""
                        viewModel.projDescription = ""
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim2")))
                        
                    })
                }
                .opacity(viewModel.projCategory.isEmpty || viewModel.projName.isEmpty || viewModel.projDeadline.isEmpty || viewModel.projDate.isEmpty || viewModel.projPrice.isEmpty || viewModel.projDescription.isEmpty ? 0.5 : 1)
                .disabled(viewModel.projCategory.isEmpty || viewModel.projName.isEmpty || viewModel.projDeadline.isEmpty || viewModel.projDate.isEmpty || viewModel.projPrice.isEmpty || viewModel.projDescription.isEmpty ? true : false)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(LinearGradient(colors: [Color("prim2"), Color.black, Color.black, Color.black, Color.black,], startPoint: .topLeading, endPoint: .bottomTrailing).cornerRadius(0).ignoresSafeArea())
        }
    }
}

#Preview {
    DashboardAdd(viewModel: DashboardViewModel())
}
