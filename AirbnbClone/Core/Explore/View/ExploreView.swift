//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Rachit on 06/05/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView: Bool = false
    @StateObject var viewmodel = ExploreViewModel(service: ExploreService())
    var body: some View {
        NavigationStack{
            
            if(showDestinationSearchView){
                DestinationSearchView(show: $showDestinationSearchView,viewmodel: viewmodel)
            }else{
                ScrollView{
                    SearchAndFilterBar(searchLocation: $viewmodel.searchLocation)
                        .onTapGesture {
                            withAnimation(.snappy){
                                showDestinationSearchView.toggle()
                            }
                        }
                    LazyVStack(spacing : 32){
                        ForEach(viewmodel.listings){ listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                            }
                        }
                    }
                }.navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing)
                        .navigationBarBackButtonHidden(true)
                }
            }
            
        }
           
        }
    }


#Preview {
    ExploreView()
}
