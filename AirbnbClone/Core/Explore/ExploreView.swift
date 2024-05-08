//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Rachit on 06/05/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView: Bool = false
    var body: some View {
        NavigationStack{
            
            if(showDestinationSearchView){
                DestinationSearchView(show: $showDestinationSearchView)
            }else{
                ScrollView{
                    SearchAndFilterBar()
                        .onTapGesture {
                            withAnimation(.snappy){
                                showDestinationSearchView.toggle()
                            }
                        }
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
}

#Preview {
    ExploreView()
}
