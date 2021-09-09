//
//  BaseViewModel.swift
//  BaseViewModel
//
//  Created by Justin747 on 9/3/21.
//

import SwiftUI

class BaseViewModel: ObservableObject {
    
    //MARK: - Tab Bar
    
    @Published var currentTab: Tab = .Home
    
    @Published var homeTab = "Sneakers"
    
}

//MARK: - Tab Enum

enum Tab: String {
case Home = "home"
case Heart = "heart"
case ClipBoard = "clipboard"
case Person = "person"
    
}

