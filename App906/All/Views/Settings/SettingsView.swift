//
//  SettingsView.swift
//  App906
//
//  Created by IGOR on 24/09/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @StateObject var viewModel = SettingsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDiscounts = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image("discounts")
                                
                                Text("Promotions and discounts")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.5), radius: 3))
                        })
                        .padding(3)
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image("star")
                                
                                Text("Rate our app")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.5), radius: 3))
                        })
                        .padding(3)
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/837be3b5-1063-4da7-b0ff-b62ab0c397b8") else { return }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image("usage")
                                
                                Text("Usage Policy")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.5), radius: 3))
                        })
                        .padding(3)
                    }
                }
                
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchDiscounts()
        }
        .sheet(isPresented: $viewModel.isDiscounts, content: {
            
            DiscountsView(viewModel: viewModel)
        })
    }
}

#Preview {
    SettingsView()
}
