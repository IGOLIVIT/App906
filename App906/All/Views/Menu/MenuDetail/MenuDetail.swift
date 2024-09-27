//
//  MenuDetail.swift
//  App906
//
//  Created by IGOR on 25/09/2024.
//

import SwiftUI

struct MenuDetail: View {

    @StateObject var viewModel: MenuViewModel
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image(viewModel.selectedMenu?.menPhoto ?? "")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 280)
                    .ignoresSafeArea()
                
                Spacer()
            }
            
            VStack(spacing: 0) {
                
                VStack {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text(viewModel.selectedMenu?.menName ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                                .padding(.vertical, 6)
                            
                            Text(viewModel.selectedMenu?.menDescr ?? "")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("Ingredients")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .semibold))
                            
                            Text(viewModel.selectedMenu?.menIng ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 11, weight: .regular))
                                .padding(4)
                                .padding(.horizontal, 3)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim2")))
                            
                            Text("Allergens")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .semibold))
                            
                            Text(viewModel.selectedMenu?.menAllergens ?? "")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            HStack {
                                
                                ForEach(viewModel.sizes, id: \.self) { index in

                                        Text(index)
                                            .foregroundColor(viewModel.selectedMenu?.menSize ?? "" == index ? Color("prim") : .black)
                                            .font(.system(size: viewModel.selectedMenu?.menSize ?? "" == index ? 16 : 14, weight: viewModel.selectedMenu?.menSize ?? "" == index ? .semibold : .regular))
                                            .frame(maxWidth: .infinity)
                                }
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.5), radius: 3))
                            .padding(3)
                            .padding(.vertical, 5)
                            
                            HStack {
                                
                                Text("Size options")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                
                                    Spacer()
                                
                                Text(viewModel.selectedMenu?.menSizeOp ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            
                            HStack {
                                
                                Text("Price")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                
                                    Spacer()
                                
                                Text(viewModel.selectedMenu?.menPrice ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .semibold))
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    
                }
                .padding(.top, 200)
            }
        }
    }
}

#Preview {
    MenuDetail(viewModel: MenuViewModel())
}
