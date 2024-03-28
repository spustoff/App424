//
//  DashboardView.swift
//  App424
//
//  Created by IGOR on 25/03/2024.
//

import SwiftUI

struct DashboardView: View {
    
    @StateObject var viewModel = DashboardViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Dashboard")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .padding(8)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim2")))
                    })
                }
                
                Text("This is your report, change if you want")
                    .foregroundColor(.gray)
                    .font(.system(size: 12, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 6)
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        
                  Image(systemName: "dollarsign.arrow.circlepath")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.system(size: 15, weight: .regular))
                            .padding(6)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.2)))
                        
                        Text("Earnings Overview")
                            .foregroundColor(.white.opacity(0.9))
                            .font(.system(size: 12, weight: .regular))
                        
                        Spacer()
                        
                        Text("$\(viewModel.projects.map(\.projPrice).reduce(0,+))")
                            .foregroundColor(.white)
                            .font(.system(size: 23, weight: .medium))
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 200)
                    .background(LinearGradient(colors: [Color("prim2"), Color.black, Color.black], startPoint: .topLeading, endPoint: .bottomTrailing).cornerRadius(25))
                    .background(RoundedRectangle(cornerRadius: 25.0).stroke(.white.opacity(0.2), lineWidth: 2 ))
                    
                    VStack {
                        
                        VStack(alignment: .leading) {

                        HStack {
                            
                            Image(systemName: "clock")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.system(size: 15, weight: .regular))
                                .padding(6)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.2)))
                            
                            Text("Work hours")
                                .foregroundColor(.white.opacity(0.9))
                                .font(.system(size: 12, weight: .regular))
                            
                            Spacer()
                        }
                            
                            Spacer()
                            
                            Text("\(viewModel.projects.map(\.projPrice).reduce(0,+)/10)")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .medium))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 95)
                        .background(LinearGradient(colors: [Color("prim2"), Color.black, Color.black, Color.black], startPoint: .topLeading, endPoint: .bottomTrailing).cornerRadius(25))
                        .background(RoundedRectangle(cornerRadius: 25.0).stroke(.white.opacity(0.2), lineWidth: 2 ))
                        
                        VStack(alignment: .leading) {

                        HStack {
                            
                            Image(systemName: "list.clipboard")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.system(size: 15, weight: .regular))
                                .padding(6)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.2)))
                            
                            Text("Total projects")
                                .foregroundColor(.white.opacity(0.9))
                                .font(.system(size: 12, weight: .regular))
                            
                            Spacer()
                        }
                            
                            Spacer()
                            
                            Text("\(viewModel.projects.count)")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .medium))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 95)
                        .background(LinearGradient(colors: [Color("prim2"), Color.black, Color.black, Color.black], startPoint: .topLeading, endPoint: .bottomTrailing).cornerRadius(25))
                        .background(RoundedRectangle(cornerRadius: 25.0).stroke(.white.opacity(0.2), lineWidth: 2 ))

                    }
                }
                
                HStack {
                    
                    ForEach(viewModel.types, id: \.self) { index in
                    
                        Button(action: {
                            
                            viewModel.currentType = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 30)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim2").opacity(viewModel.currentType == index ? 1 : 0)))
                        })
                    }
                }
                .frame(height: 30)
                .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.07)))
                .padding(.vertical)
                
                if viewModel.getFavoritedProj().isEmpty {
                    
                    VStack(spacing: 10) {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                        
                        Text("You don’t have any added projects yet")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.getFavoritedProj(), id: \.self) { index in
                                
                            
                                VStack(alignment: .leading) {
                                    
                                    HStack {
                                        
                                  Image(systemName: "list.clipboard")
                                            .foregroundColor(.white.opacity(0.7))
                                            .font(.system(size: 15, weight: .regular))
                                            .padding(6)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.2)))
                                        
                                        VStack(alignment: .leading) {

                                            Text(index.projCategory ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 13, weight: .regular))
                                            
                                            Text(index.projDate ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 13, weight: .regular))
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding(.bottom)
                                    
                                    Text(index.projName ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .semibold))
                                    
                                    Text(index.projDescription ?? "")
                                        .foregroundColor(.white.opacity(0.6))
                                        .font(.system(size: 14))
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading) {

                                            Text("$\(index.projPrice)")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .medium))
                                            
                                            Text("Client fix budget")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 13, weight: .regular))

                                        }
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            
                                            viewModel.favoritesManager(index)
                                            
                                        }, label: {
                                            
                                            if viewModel.isFavorited(index) {
                                                
                                                Text("Completed")
                                                    .foregroundColor(Color.green)
                                                    .font(.system(size: 14, weight: .regular))
                                                    .frame(width: 150, height: 40)
                                                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.green))
                                                
                                            } else {
                                                
                                                Text("Complete job")
                                                    .foregroundColor(Color("prim"))
                                                    .font(.system(size: 14, weight: .regular))
                                                    .frame(width: 150, height: 40)
                                                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))
                                            }
                                        })
                                        
                                    }
                                    .padding(.top)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(LinearGradient(colors: [Color("prim2"), Color.black, Color.black, Color.black], startPoint: .topTrailing, endPoint: .bottomLeading).cornerRadius(25))
                                .background(RoundedRectangle(cornerRadius: 25.0).stroke(.white.opacity(0.4)))
                                .padding(1)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            DashboardAdd(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchProjects()
        }
    }
}

#Preview {
    DashboardView()
}
