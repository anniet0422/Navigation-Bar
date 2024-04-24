//
//  ContentView.swift
//  Navigation Bar
//
//  Created by Annie Tran on 4/24/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        HStack {
                            Image(systemName: tab.rawValue)
                            Text("\(tab.rawValue.capitalized)")
                                .bold()
                                .animation(nil, value: selectedTab)
                        }
                        .tag(tab)
                    }
                }
            }
            
            VStack {
                Spacer()
                Custom_Navigation_Bar(selectedTab: $selectedTab)
            }
        }
    }
}

#Preview {
    ContentView()
}
