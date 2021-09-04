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
                TabButton(Tab: .ClipBoard)
                TabButton(Tab: .Person)
            } ,alignment: .bottom
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
