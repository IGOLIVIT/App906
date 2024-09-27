//
//  MenuView.swift
//  App906
//
//  Created by IGOR on 24/09/2024.
//

import SwiftUI

struct MenuView: View {
    
    @StateObject var viewModel = MenuViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 6) {
                
                Button(action: {}, label: {
                    
                    Text("Add category")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 15, weight: .regular))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .opacity(0)
                
                Text("Menu")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                
                HStack {
                    
                    ForEach(viewModel.categories, id: \.self) { index in
                    
                        Button(action: {
                            
                            viewModel.currCategory = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(viewModel.currCategory == index ? Color("prim") : .black)
                                .font(.system(size: viewModel.currCategory == index ? 16 : 14, weight: viewModel.currCategory == index ? .semibold : .regular))
                                .frame(maxWidth: .infinity)
                        })
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.5), radius: 3))
                .padding(.bottom)
                
                if viewModel.currCategory == "Drinks" {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.categotiesDrinks, id: \.self) { index in
                                
                                HStack {
                                    
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 20, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        viewModel.typeForAdd = index
                                        
                                        viewModel.isAdd = true
                                        
                                    }, label: {
                                        
                                        Image(systemName: "plus")
                                            .foregroundColor(Color("prim2"))
                                            .font(.system(size: 18, weight: .regular))
                                    })
                                }
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    
                                    LazyHStack {
                                        
                                        ForEach(viewModel.menues.filter{($0.menType ?? "") == index}, id: \.self) { indexer in
                                        
                                            VStack(alignment: .leading, spacing: 6) {
                                                
                                                Image(indexer.menPhoto ?? "")
                                                    .resizable()
                                                    .frame(width: 220, height: 200)
                                                
                                                VStack(alignment: .leading, spacing: 6) {

                                                    Text(indexer.menName ?? "")
                                                        .foregroundColor(.black)
                                                        .font(.system(size: 16, weight: .medium))
                                                    
                                                    HStack {
                                                        
                                                        Text("From $\(indexer.menCPrice ?? "")")
                                                            .foregroundColor(.black)
                                                            .font(.system(size: 14, weight: .regular))
                                                        
                                                        Spacer()
                                                        
                                                        Menu(content: {
                                                            
                                                            Button(action: {
                                                                
                                                                viewModel.selectedMenu = indexer
                                                                
                                                                withAnimation(.spring()) {
                                                                    
                                                                    viewModel.isDelete = true
                                                                }
                                                                
                                                            }, label: {
                                                                
                                                                Text("Delete")
                                                                
                                                                Image(systemName: "trash")
                                                                
                                                            })
                                                            
                                                        }, label: {
                                                            
                                                            Image(systemName: "ellipsis")
                                                                .foregroundColor(Color("prim2"))
                                                                .font(.system(size: 11, weight: .regular))
                                                                .padding(12)
                                                                .background(Circle().fill(.gray.opacity(0.3)))
                                                            
                                                        })

                                                        Button(action: {
                                                            
                                                            viewModel.selectedMenu = indexer
                                                            
                                                            withAnimation(.spring()) {
                                                                
                                                                viewModel.isDetail = true
                                                            }
                                                            
                                                        }, label: {
                                                            
                                                            Image(systemName: "arrow.up.right")
                                                                .foregroundColor(.white)
                                                                .font(.system(size: 11, weight: .regular))
                                                                .padding(9)
                                                                .background(Circle().fill(Color("prim2")))
                                                        })
                                                    }
                                                }
                                                .padding(10)
                                            }
                                            .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 5))
                                            .padding(5)
                                        }
                                    }
                                }
                                .frame(height: 300)
                            }
                            
                        }
                    }
                    
                } else if viewModel.currCategory == "Food" {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.categotiesFood, id: \.self) { index in
                                
                                HStack {
                                    
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 20, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        viewModel.typeForAdd = index
                                        
                                        viewModel.isAdd = true
                                        
                                    }, label: {
                                        
                                        Image(systemName: "plus")
                                            .foregroundColor(Color("prim2"))
                                            .font(.system(size: 18, weight: .regular))
                                    })
                                }
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    
                                    LazyHStack {
                                        
                                        ForEach(viewModel.menues.filter{($0.menType ?? "") == index}, id: \.self) { indexer in
                                        
                                            VStack(alignment: .leading, spacing: 6) {
                                                
                                                Image(indexer.menPhoto ?? "")
                                                    .resizable()
                                                    .frame(width: 220, height: 200)
                                                
                                                VStack(alignment: .leading, spacing: 6) {

                                                    Text(indexer.menName ?? "")
                                                        .foregroundColor(.black)
                                                        .font(.system(size: 16, weight: .medium))
                                                    
                                                    HStack {
                                                        
                                                        Text("From $\(indexer.menCPrice ?? "")")
                                                            .foregroundColor(.black)
                                                            .font(.system(size: 14, weight: .regular))
                                                        
                                                        Spacer()
                                                        
                                                        Menu(content: {
                                                            
                                                            Button(action: {
                                                                
                                                                viewModel.selectedMenu = indexer
                                                                
                                                                withAnimation(.spring()) {
                                                                    
                                                                    viewModel.isDelete = true
                                                                }
                                                                
                                                            }, label: {
                                                                
                                                                Text("Delete")
                                                                
                                                                Image(systemName: "trash")
                                                                
                                                            })
                                                            
                                                        }, label: {
                                                            
                                                            Image(systemName: "ellipsis")
                                                                .foregroundColor(Color("prim2"))
                                                                .font(.system(size: 11, weight: .regular))
                                                                .padding(12)
                                                                .background(Circle().fill(.gray.opacity(0.3)))
                                                            
                                                        })

                                                        Button(action: {
                                                            
                                                            viewModel.selectedMenu = indexer
                                                            
                                                            withAnimation(.spring()) {
                                                                
                                                                viewModel.isDetail = true
                                                            }
                                                            
                                                        }, label: {
                                                            
                                                            Image(systemName: "arrow.up.right")
                                                                .foregroundColor(.white)
                                                                .font(.system(size: 11, weight: .regular))
                                                                .padding(9)
                                                                .background(Circle().fill(Color("prim2")))
                                                        })
                                                    }
                                                }
                                                .padding(10)
                                            }
                                            .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 5))
                                            .padding(5)
                                        }
                                    }
                                }
                                .frame(height: 300)
                                
                            }
                        }
                    }
                    
                } else if viewModel.currCategory == "Authors" {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.categotiesAuthors, id: \.self) { index in
                                
                                HStack {
                                    
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 20, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        viewModel.typeForAdd = index
                                        
                                        viewModel.isAdd = true
                                        
                                    }, label: {
                                        
                                        Image(systemName: "plus")
                                            .foregroundColor(Color("prim2"))
                                            .font(.system(size: 18, weight: .regular))
                                    })
                                }
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    
                                    LazyHStack {
                                        
                                        ForEach(viewModel.menues.filter{($0.menType ?? "") == index}, id: \.self) { indexer in
                                        
                                            VStack(alignment: .leading, spacing: 6) {
                                                
                                                Image(indexer.menPhoto ?? "")
                                                    .resizable()
                                                    .frame(width: 220, height: 200)
                                                
                                                VStack(alignment: .leading, spacing: 6) {

                                                    Text(indexer.menName ?? "")
                                                        .foregroundColor(.black)
                                                        .font(.system(size: 16, weight: .medium))
                                                    
                                                    HStack {
                                                        
                                                        Text("From $\(indexer.menCPrice ?? "")")
                                                            .foregroundColor(.black)
                                                            .font(.system(size: 14, weight: .regular))
                                                        
                                                        Spacer()
                                                        
                                                        Menu(content: {
                                                            
                                                            Button(action: {
                                                                
                                                                viewModel.selectedMenu = indexer
                                                                
                                                                withAnimation(.spring()) {
                                                                    
                                                                    viewModel.isDelete = true
                                                                }
                                                                
                                                            }, label: {
                                                                
                                                                Text("Delete")
                                                                
                                                                Image(systemName: "trash")
                                                                
                                                            })
                                                            
                                                        }, label: {
                                                            
                                                            Image(systemName: "ellipsis")
                                                                .foregroundColor(Color("prim2"))
                                                                .font(.system(size: 11, weight: .regular))
                                                                .padding(12)
                                                                .background(Circle().fill(.gray.opacity(0.3)))
                                                            
                                                        })

                                                        Button(action: {
                                                            
                                                            viewModel.selectedMenu = indexer
                                                            
                                                            withAnimation(.spring()) {
                                                                
                                                                viewModel.isDetail = true
                                                            }
                                                            
                                                        }, label: {
                                                            
                                                            Image(systemName: "arrow.up.right")
                                                                .foregroundColor(.white)
                                                                .font(.system(size: 11, weight: .regular))
                                                                .padding(9)
                                                                .background(Circle().fill(Color("prim2")))
                                                        })
                                                    }
                                                }
                                                .padding(10)
                                            }
                                            .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 5))
                                            .padding(5)
                                        }
                                    }
                                }
                                .frame(height: 300)
                            }
                        }
                    }
                }
                
            }
            .padding()
            .onAppear {
                
                viewModel.fetchMenues()
            }
            .sheet(isPresented: $viewModel.isAdd, content: {
                
                AddMenu(viewModel: viewModel)
            })
            .sheet(isPresented: $viewModel.isDetail, content: {
                
                MenuDetail(viewModel: viewModel)
            })
            .overlay(
                
                ZStack {
                    
                    Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                        .ignoresSafeArea()
                        .onTapGesture {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                        }
                    
                    VStack {
                        
                        HStack {
                            
                            Spacer()
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDelete = false
                                }
                                
                            }, label: {
                                
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                            })
                        }
                        
                        Text("Delete")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold))
                            .padding()
                        
                        Text("Are you sure you want to delete?")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                
                            CoreDataStack.shared.deleteMenu(withMenName: viewModel.selectedMenu?.menName ?? "", completion: {
                                
                                viewModel.fetchMenues()
                            })
              
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false

                            }
                                    
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        .padding(.top, 25)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Close")
                                .foregroundColor(.blue)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                    .padding()
                    .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
                }
            )
        }
    }
}

#Preview {
    MenuView()
}
