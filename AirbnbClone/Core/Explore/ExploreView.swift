//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Rachit on 06/05/24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                SearchAndFilterBar()
                LazyVStack(spacing : 32){
                    ForEach(0 ... 10, id: \.self){ listing in
                        NavigationLink(value: listing) {
                            ListingItemView()
                        }
                    }
                }
            }.navigationDestination(for: Int.self) { listing in
               ListingDetailView()
                    .navigationBarBackButtonHidden(true)
            }
            
        }
    }
}

#Preview {
    ExploreView()
}
