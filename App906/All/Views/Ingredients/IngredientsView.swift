//
//  IngredientsView.swift
//  App906
//
//  Created by IGOR on 24/09/2024.
//

import SwiftUI

struct IngredientsView: View {

    @StateObject var viewModel = IngredientsViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 6) {
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 18, weight: .regular))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text("Ingredients")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                
                HStack {
                    
                    ForEach(viewModel.types, id: \.self) { index in
                    
                        Button(action: {
                            
                            viewModel.curType = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(viewModel.curType == index ? Color("prim") : .black)
                                .font(.system(size: viewModel.curType == index ? 16 : 14, weight: viewModel.curType == index ? .semibold : .regular))
                                .frame(maxWidth: .infinity)
                        })
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.5), radius: 3))
                .padding(.bottom)
                
                if viewModel.ingredients.isEmpty {
                    
                    VStack(spacing: 18) {
                        
                        Text("The drinks category is empty")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                        
                        Text("Add a new card to this category.")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                            .frame(width: 180)
                            .multilineTextAlignment(.center)
                        
                        Image("coffe")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                    }
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                    
                        LazyVStack {
                            
                            ForEach(viewModel.ingredients.filter{($0.inType ?? "") == viewModel.curType}, id: \.self) { index in
                            
                                VStack(spacing: 13) {
                                    
                                    HStack {
                                        
                                        Text(index.inName ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .semibold))
                                        
                                        Spacer()
                                        
                                        Menu(content: {
                                            
                                            Button(action: {
                                                
                                                viewModel.selectedIngredient = index
                                                
                                                withAnimation(.spring()) {
                                                    
                                                    viewModel.isDelete = true
                                                }
                                                
                                            }, label: {
                                                
                                                Text("Delete")
                                                
                                                Image(systemName: "trash")
                                                
                                            })
                                            
                                        }, label: {
                                            
                                            Image(systemName: "ellipsis")
                                                .foregroundColor(.white)
                                                .font(.system(size: 13, weight: .regular))
                                                .padding(9)
                                                .background(Circle().fill(Color("prim2")))
                                        })
                                    }
                                    
                                    HStack {
                                        
                                        Text("Weight")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .regular))
                                        
                                            Spacer()
                                        
                                        Text(index.inWeight ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .semibold))
                                    }
                                    
                                    HStack {
                                        
                                        Text("Brand")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .regular))
                                        
                                            Spacer()
                                        
                                        Text(index.inBrand ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .semibold))
                                    }
                                    
                                    HStack {
                                        
                                        Text("Price per pack")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .regular))
                                        
                                            Spacer()
                                        
                                        Text(index.inPrice ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .semibold))
                                    }
                              
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))
                            }
                        }
                        
                    }
                }
                
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchIngredients()
        }
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
            
                        CoreDataStack.shared.deleteIngredient(withInName: viewModel.selectedIngredient?.inName ?? "", completion: {
                            
                            viewModel.fetchIngredients()
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
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAdd ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Create ingredient")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical)
                    
                    HStack {
                        
                        ForEach(viewModel.types, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.curTypeForAdd = index
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(viewModel.curTypeForAdd == index ? Color("prim") : .black)
                                    .font(.system(size: viewModel.curTypeForAdd == index ? 16 : 14, weight: viewModel.curTypeForAdd == index ? .semibold : .regular))
                                    .frame(maxWidth: .infinity)
                            })
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.5), radius: 3))
                    
                    HStack {
                        
                        Text("Name")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Coffe beans")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.inName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.inName)
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
                        
                        Text("Weight")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))

                        ZStack(alignment: .leading, content: {
                            
                            Text("5 kg")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.inWeight.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.inWeight)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
         
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))
                    .padding(1)
                    
                    HStack {
                        
                        Text("Brand")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))

                        ZStack(alignment: .leading, content: {
                            
                            Text("Arabica")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.inBrand.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.inBrand)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
         
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))
                    .padding(1)
                    
                    HStack {
                        
                        Text("Price per pack")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))

                        ZStack(alignment: .leading, content: {
                            
                            Text("$ 5")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.inPrice.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.inPrice)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
         
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))
                    .padding(1)

                        Button(action: {
                            
                            viewModel.inType = viewModel.curTypeForAdd
                            
                            viewModel.addIngredient()
                            
                            viewModel.inName = ""
                            viewModel.inWeight = ""
                            viewModel.inBrand = ""
                            viewModel.inPrice = ""
                            
                            viewModel.fetchIngredients()
                            
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
                        .opacity(viewModel.inName.isEmpty || viewModel.inWeight.isEmpty || viewModel.inBrand.isEmpty || viewModel.inPrice.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.inName.isEmpty || viewModel.inWeight.isEmpty || viewModel.inBrand.isEmpty || viewModel.inPrice.isEmpty ? true : false)
                    .padding(.vertical)
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isAdd ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    IngredientsView()
}
