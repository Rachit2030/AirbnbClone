//
//  MainTabView.swift
//  AirbnbClone
//
//  Created by Rachit on 08/05/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ExploreView()
                .tabItem {
                    Label(
                        title: { Text("Explore") },
                        icon: { Image(systemName: "magnifyingglass") }
                    )
                }
            
            WishlistsView()
                .tabItem {
                    Label(
                        title: { Text("Wishlists") },
                        icon: { Image(systemName: "heart") }
                    )
                }
            
            
            ProfileView()
                .tabItem {
                    Label(
                        title: { Text("Profile") },
                        icon: { Image(systemName: "person") }
                    )
                }
        }.tint(.pink)
    }
}

#Preview {
    MainTabView()
}
