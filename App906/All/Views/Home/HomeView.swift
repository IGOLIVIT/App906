//
//  HomeView.swift
//  App906
//
//  Created by IGOR on 24/09/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Text("Coffee shop stats")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        HStack {
                            
                            Text("Revenue per day")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(width: 80)
                            
                            Spacer()
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isRPD = true
                                    
                                }
                                
                            }, label: {
                                
                                Image(systemName: "square.and.pencil")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 16, weight: .regular))
                            })
                        }
                        
                        Text("$ \(viewModel.RPD)")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 24, weight: .semibold))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.2)))
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        HStack {
                            
                            Text("Total revenue")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(width: 80)
                            
                            Spacer()
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isTR = true
                                    
                                }
                                
                            }, label: {
                                
                                Image(systemName: "square.and.pencil")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 16, weight: .regular))
                            })
                        }
                        
                        Text("$ \(viewModel.TR)")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 24, weight: .semibold))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.2)))
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    HStack {
                        
                        Text("Total sold per day")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isTSPD = true
                                
                            }
                            
                        }, label: {
                            
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(.blue)
                                .font(.system(size: 16, weight: .regular))
                        })
                    }

                    HStack {
                        
                        Text("Beverages")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                        
                        Text("\(viewModel.beverages)")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                    }
                    
                    HStack {
                        
                        Text("Desserts")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                        
                        Text("\(viewModel.Desserts)")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                    }
                    
                    HStack {
                        
                        Text("Hors d'oeuvres")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                        
                        Text("\(viewModel.HorsD)")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.2)))
                
                HStack {
                    
                    Text("Expenses")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.blue)
                            .font(.system(size: 18, weight: .medium))
                    })
                }
                .padding(.vertical, 9)
                
                if viewModel.expenses.isEmpty {
                    
                    VStack(spacing: 18) {
                        
                        Text("The list is empty")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                        
                        Text("Add categories to your list to keep track of your expenses")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                            .frame(width: 180)
                            .multilineTextAlignment(.center)
                        
                        Image("coffe")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.expenses, id: \.self) { index in
                                
                                VStack(spacing: 9) {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            
                                            Text(index.exName ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 15, weight: .regular))
                                            
                                            Text(index.exWeight ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 13, weight: .regular))
                                        }
                                        
                                        Spacer()
                                        
                                        Text(index.exCost ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                    }
                                    
                                    Rectangle()
                                        .fill(.gray.opacity(0.4))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 1)
                                }
                            }
                        }
                    }
                    
                    HStack {
                        
                        Text("Total")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                        
                        Spacer()
                        
                        Text("$\(viewModel.total)")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                    }
                    .padding()
                    .padding(.vertical, 6)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                }
                
            }
            .padding()
        }
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
                    
                    Text("Create the expenses")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical)
                    
                    HStack {
                        
                        Text("Name")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Coffe beans")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.exName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.exName)
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
                                .opacity(viewModel.exWeight.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.exWeight)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
         
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))
                    .padding(1)
                    
                    HStack {
                        
                        Text("Cost")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))

                        ZStack(alignment: .leading, content: {
                            
                            Text("$ 30")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.exCost.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.exCost)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
         
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))
                    .padding(1)
                    
                    HStack {
                        
                        Text("Total")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))

                        ZStack(alignment: .leading, content: {
                            
                            Text("$ 200")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.exTotal.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.exTotal)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
         
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))
                    .padding(1)

                        Button(action: {
                            
                            viewModel.total += Int(viewModel.exTotal) ?? 0
                            
                            viewModel.addExpense()
                            
                            viewModel.exName = ""
                            viewModel.exCost = ""
                            viewModel.exTotal = ""
                            viewModel.exWeight = ""
                            
                            viewModel.fetchExpenses()
                            
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
                        .opacity(viewModel.exName.isEmpty || viewModel.exTotal.isEmpty || viewModel.exCost.isEmpty || viewModel.exWeight.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.exName.isEmpty || viewModel.exTotal.isEmpty || viewModel.exCost.isEmpty || viewModel.exWeight.isEmpty ? true : false)
                    .padding(.vertical)
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isAdd ? 0 : UIScreen.main.bounds.height)
            }
        )
        .onAppear {
            
            viewModel.fetchExpenses()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isRPD ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isRPD = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isRPD = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Revenue per day")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.vertical)
                    
                    Text("Update your details in the card")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))

                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addRPD.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addRPD)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                    .padding(1)
                    
                    HStack {
                        
                        Button(action: {
                                                        
                            withAnimation(.spring()) {
                                
                                viewModel.isRPD = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.blue)
                                .font(.system(size: 16, weight: .regular))
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                            
                        })
                        
                        Button(action: {
                            
                            viewModel.RPD = viewModel.addRPD
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isRPD = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.blue)
                                .font(.system(size: 16, weight: .semibold))
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                            
                        })
                        
                    }
                    .padding(.vertical)
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .offset(y: viewModel.isRPD ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isTR ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isTR = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isTR = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Total revenue")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.vertical)
                    
                    Text("Update your details in the card")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))

                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addTR.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addTR)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                    .padding(1)
                    
                    HStack {
                        
                        Button(action: {
                                                        
                            withAnimation(.spring()) {
                                
                                viewModel.isTR = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.blue)
                                .font(.system(size: 16, weight: .regular))
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                            
                        })
                        
                        Button(action: {
                            
                            viewModel.TR = viewModel.addTR
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isTR = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.blue)
                                .font(.system(size: 16, weight: .semibold))
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                            
                        })
                        
                    }
                    .padding(.vertical)
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .offset(y: viewModel.isTR ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isTSPD ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isTSPD = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isTSPD = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Edit the total sold per day")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical)
                    
                    HStack {
                        
                        Text("Beverages")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("0")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addBev.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.addBev)
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
                        
                        Text("Desserts")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))

                        ZStack(alignment: .leading, content: {
                            
                            Text("0")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addDess.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.addDess)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
         
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))
                    .padding(1)
                    
                    HStack {
                        
                        Text("Hors d'oeuvers")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))

                        ZStack(alignment: .leading, content: {
                            
                            Text("0")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addHors.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.addHors)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
         
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))
                    .padding(1)

                        Button(action: {
                                                        
                            viewModel.beverages = viewModel.addBev
                            viewModel.Desserts = viewModel.addDess
                            viewModel.HorsD = viewModel.addHors

                            withAnimation(.spring()) {
                                
                                viewModel.isTSPD = false
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
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isTSPD ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    HomeView()
}
