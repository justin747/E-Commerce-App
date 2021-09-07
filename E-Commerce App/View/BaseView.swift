//
//  BaseView.swift
//  BaseView
//
//  Created by Justin747 on 9/3/21.
//

import SwiftUI

struct BaseView: View {
    @StateObject var baseData = BaseViewModel()
    
    
    init(){
        
        UITabBar.appearance().isHidden = true
    }
    
    
    var body: some View {
        
        TabView(selection: $baseData.currentTab){
            
            Text("Home")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.04))
                .tag(Tab.Home)
            
            Text("Heart")
                .tag(Tab.Heart)
            
            Text("Clipboard")
                .tag(Tab.ClipBoard)
            
            Text("Person")
                .tag(Tab.Person)
            
        }
        .overlay(
            //MARK: - Custom Tab Bar
            HStack(spacing: 0){
                TabButton(Tab: .Home)
                TabButton(Tab: .Heart)
                
                Button {
                } label: {
                    Image("cart")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 26, height: 26)
                        .foregroundColor(.white)
                        .offset(x: -1)
                        .padding(18)
                        .background(Color("DarkBlue"))
                        .clipShape(Circle())
                    
                        .shadow(color: Color.black.opacity(0.04), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.black.opacity(0.04), radius: 5, x: -5, y: -5)
                    
                }
                .offset(y: -32)
                
                TabButton(Tab: .ClipBoard)
                TabButton(Tab: .Person)
            } .background(
                Color.white
                    .clipShape(CustomCurveShape())
                    .shadow(color: Color.black.opacity(0.04), radius: 5, x: -5, y: -5)
                    .ignoresSafeArea(.container, edges: .bottom)
            )
            ,alignment: .bottom
            
        )
    }
    
    @ViewBuilder func TabButton(Tab: Tab) -> some View{
        
        Button {
            withAnimation{
                baseData.currentTab = Tab
            }
        } label: {
            Image(Tab.rawValue)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(baseData.currentTab == Tab ? Color("DarkBlue") : Color.gray.opacity(0.5))
                .frame(maxWidth: .infinity)
        }
        
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
