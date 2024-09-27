//
//  LoadingView.swift
//  App906
//
//  Created by IGOR on 24/09/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Llogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                
                Spacer()
                
                ProgressView()
            }
            .padding(.vertical, 150)
        }
    }
}

#Preview {
    LoadingView()
}
