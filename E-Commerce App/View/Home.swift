//
//  Home.swift
//  Home
//
//  Created by Justin747 on 9/7/21.
//

import SwiftUI

struct Home: View {
    
    @Namespace var animation
    @EnvironmentObject var baseData: BaseViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            
            VStack(spacing: 15) {
                
                HStack {
                    
                    Button {
                        
                    } label: {
                        Image("menu")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                        
                    }
                }
                .foregroundColor(.black)
                .overlay(Image("logo"))
                
                HStack {
                    
                    Text("Our Products")
                        .font(.title.bold())
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        HStack(spacing: 3){
                            
                            Text("Sort By")
                                .font(.caption.bold())
                            
                            Image(systemName: "chevron.down")
                                .font(.caption.bold())
                        }
                        .foregroundColor(.gray)
                    }
                }
                .padding(.top, 25)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 18) {
            
                        //MARK: - Segment Button
                        
                        SegmentButton(image: "p1", title: "Sneakers")
                        
                        SegmentButton(image: "watch", title: "Watch")

                        SegmentButton(image: "backpack", title: "Backpack")

                    }
                }
            }
            .padding()
        }
    }
    @ViewBuilder func SegmentButton(image: String, title: String) -> some View {
        Button {
            withAnimation {baseData.homeTab = title}
        } label: {
            HStack(spacing: 8) {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 27, height: 27)
                Text(title)
                    .font(.system(size: 12.5))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(
                
                //MARK: - Transition Slider
                ZStack {
                    if baseData.homeTab == title {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .shadow(color: Color.black.opacity(0.04), radius: 5, x: 5, y: 5)
                    }
                }
            )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
