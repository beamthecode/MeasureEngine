//
//  MeasureEngineApp.swift
//  MeasureEngine
//
//  Created by Brent Beamer on 11/12/23.
//

import SwiftUI

@main
struct MeasureEngineApp: App {
    
    init() {
        let appear = UINavigationBarAppearance()
        
        let atters: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Acme-Regular", size: 40)!
        ]
        
        appear.largeTitleTextAttributes = atters
        appear.titleTextAttributes = atters
        UINavigationBar.appearance().standardAppearance = appear
        UINavigationBar.appearance().compactAppearance = appear
        UINavigationBar.appearance().scrollEdgeAppearance = appear
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
