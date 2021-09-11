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
    
    @State var size = "US 6"
    @State var shoeColor: Color = .red
    
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
                    .frame(height: getScreenBounds().height / 3)
                
                //MARK: - Product Details
                
                VStack(alignment: .leading, spacing: 18) {
                    
                    HStack {
                        Text(product.productTitle)
                            .font(.title.bold())
                        
                        Spacer(minLength: 10)
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        
                        Text("(\(product.productRating))")
                            .foregroundColor(.gray)
                    }
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Leo vel fringilla est ullamcorper eget nulla facilisi. Molestie ac feugiat sed lectus vestibulum mattis ullamcorper velit. Neque aliquam vestibulum morbi blandit cursus.")
                        .font(.callout)
                        .lineSpacing(10)
                    
                    //MARK: - Size
                    
                    HStack(spacing: 0) {
                        Text("Size: ")
                            .font(.caption.bold())
                            .foregroundColor(.gray)
                            .padding(.trailing)
                    }
                    
                    ForEach(["US 6", "US 7", "US 8", "US 9"], id: \.self) { size in
                        
                        Button {
                            self.size = size
                        } label: {
                            Text(size)
                                .font(.callout)
                                .foregroundColor(.gray)
                                .padding(.vertical, 8)
                                .padding(.horizontal)
                                .background(
                                
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.gray)
                                        .opacity(self.size == size ? 0.3 : 0)
                                    
                                    
                                )
                        }
                    }
                }
                .padding(.top)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background(Color("DarkBlue").opacity(0.05)
                                .cornerRadius(20)
                                .ignoresSafeArea(.container, edges: .bottom)
                )
            }
            .padding(.top)
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

//MARK: - Extend View for Screen Bounds

extension View {
    func getScreenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
}
