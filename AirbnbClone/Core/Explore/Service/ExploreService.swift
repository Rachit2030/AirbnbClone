//
//  ExploreService.swift
//  AirbnbClone
//
//  Created by Rachit on 08/05/24.
//

import Foundation

class ExploreService{
    func fetchListings() async throws -> [Listing]{
        return DeveloperPreview.shared.listings
    }
}
