//
//  R1.swift
//  App906
//
//  Created by IGOR on 24/09/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color("prim")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R1")
                    .resizable()
                
                Spacer()
                
                VStack {
                    
                    Text("Profit monitoring")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                        .padding(.vertical, 10)
                    
                    Text("Our app allows you to track your revenue and find opportunities to increase your profits")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        R2()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim")))
                    })
                    .padding(.bottom, 30)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 280)
                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    R1()
}
