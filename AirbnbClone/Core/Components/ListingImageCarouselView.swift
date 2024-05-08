//
//  ListingImageCarouselView.swift
//  AirbnbClone
//
//  Created by Rachit on 06/05/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    let listing: Listing
    var body: some View {
        TabView{
            ForEach(listing.imageURLs ,id: \.self){image in
                Image(image)
                    .resizable()
            }
        }
            .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
}
