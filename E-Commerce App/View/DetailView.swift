//
//  DetailView.swift
//  DetailView
//
//  Created by Justin747 on 9/8/21.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var baseData: BaseViewModel
    var animation: Namespace.ID
    var body: some View {
        
        //MARK: - Safe Check
        
        if let product = baseData.currentProduct, baseData.showDetail {
            
            VStack(spacing: 0) {
                
                //MARK: - Top Bar
                
                HStack {
                    
                    Button {
                        withAnimation {
                            baseData.showDetail = false
                        }
                        
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "suit.heart.fill")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.red, in: Circle())
                        
                    }
                }
                .foregroundColor(.black)
                .overlay(Image("logo"))
                .padding(.horizontal)
                .padding(.bottom)
                
                //MARK: - Shoe Image
                
                Image(product.productImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: product.productImage, in: animation)
                    .frame(width: 250, height: 250)
                    .rotationEffect(.init(degrees: -20))
                    .background(
                    
                        ZStack {
                            Circle()
                                .fill(product.productBG)
                                .padding()
                            
                            Circle()
                                .fill(Color.white.opacity(0.5))
                                .padding(60)
                        }
                        
                    )
                
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color.white)
            .transition(.opacity)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
