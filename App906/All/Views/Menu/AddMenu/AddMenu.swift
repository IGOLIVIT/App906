//
//  AddMenu.swift
//  App906
//
//  Created by IGOR on 25/09/2024.
//

import SwiftUI

struct AddMenu: View {
    
    @StateObject var viewModel: MenuViewModel
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image(viewModel.currentPicForAdd)
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 280)
                    .ignoresSafeArea()
                
                Spacer()
            }
            
            VStack(spacing: 0) {
                
                VStack {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack(spacing: 7) {
                            
                            Menu(content: {
                                
                                ForEach(viewModel.pictures, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.currentPicForAdd = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                        
                                        Text(index)
                                    })
                                }
                                
                            }, label: {
                                
                                Text("Choose a photo")
                            })

                            HStack {
                                
                                Text("Name")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Enter")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.menName.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.menName)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                
                                Spacer()
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))
                            .padding(1)
                            
                            HStack {
                                
                                Text("Allergens")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Not available for this item")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.menAllergens.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.menAllergens)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))
                            .padding(1)
                            
                            HStack {
                                
                                Text("Ingredients")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Enter")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.menIng.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.menIng)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))
                            .padding(1)
                            
                            HStack {
                                
                                ForEach(viewModel.sizes, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.curSizeForAdd = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                            .foregroundColor(viewModel.curSizeForAdd == index ? Color("prim") : .black)
                                            .font(.system(size: viewModel.curSizeForAdd == index ? 16 : 14, weight: viewModel.curSizeForAdd == index ? .semibold : .regular))
                                            .frame(maxWidth: .infinity)
                                    })
                                }
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.5), radius: 3))
                            .padding(3)
                            .padding(.vertical, 5)
                            
                            HStack {
                                
                                Text("Size options")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("16 fl oz")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.menSizeOp.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.menSizeOp)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))
                            .padding(1)
                            
                            HStack {
                                
                                Text("Price")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Enter")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.menPrice.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.menPrice)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))
                            .padding(1)
                            
                            HStack {
                                
                                Text("Card price")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("From 8$")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.menCPrice.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.menCPrice)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))
                            .padding(1)
                            
                            HStack {
                                
                                Text("Description")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Enter")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.menDescr.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.menDescr)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black.opacity(0.5)))
                            .padding(1)
                            
                            Button(action: {
                                
                                viewModel.menSize = viewModel.curSizeForAdd
                                viewModel.menType = viewModel.typeForAdd
                                viewModel.menPhoto = viewModel.currentPicForAdd
                                
                                viewModel.addMenu()
                                
                                viewModel.menName = ""
                                viewModel.menAllergens = ""
                                viewModel.menSizeOp = ""
                                viewModel.menPrice = ""
                                viewModel.menIng = ""
                                viewModel.menCPrice = ""
                                viewModel.menDescr = ""
                                
                                viewModel.fetchMenues()
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAdd = false
                                }
                                
                            }, label: {
                                
                                Text("Add")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                                    .frame(height: 50)
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim2")))
                                
                            })
                            .padding(.vertical)
                            .opacity(viewModel.currentPicForAdd.isEmpty || viewModel.menName.isEmpty || viewModel.menPrice.isEmpty || viewModel.curSizeForAdd.isEmpty ? 0.5 : 1)
                            .disabled(viewModel.currentPicForAdd.isEmpty || viewModel.menName.isEmpty || viewModel.menPrice.isEmpty || viewModel.curSizeForAdd.isEmpty ? true : false)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    
                }
                .padding(.top, 200)
            }
        }
    }
}

#Preview {
    AddMenu(viewModel: MenuViewModel())
}
