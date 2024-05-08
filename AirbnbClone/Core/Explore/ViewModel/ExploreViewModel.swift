//
//  ExploreViewModel.swift
//  AirbnbClone
//
//  Created by Rachit on 08/05/24.
//

import Foundation

class ExploreViewModel: ObservableObject{
    @Published var listings: [Listing] = [Listing]()
    @Published  var searchLocation = ""
    private let service: ExploreService
    private var listingCopy = [Listing]()
    
    init(service: ExploreService){
        self.service = service
        Task {
           await fetchListings()
            
        }
    }
    
    func fetchListings() async {
        do{
            self.listings = try await service.fetchListings()
            self.listingCopy = listings
        }catch{
            print("DEBUG: Failed To Fetch Listings with error: \(error.localizedDescription)")
        }
    }
    
    func updateListingForLocation(){
        let filteredListings = listings.filter({
                $0.city.lowercased() == searchLocation.lowercased() ||
                $0.state.lowercased() == searchLocation.lowercased()
            })
        self.listings = searchLocation == "" ? listingCopy : filteredListings.isEmpty ? [] : filteredListings
    }
}
