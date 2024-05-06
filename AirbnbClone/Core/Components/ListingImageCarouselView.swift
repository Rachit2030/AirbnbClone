//
//  ListingImageCarouselView.swift
//  AirbnbClone
//
//  Created by Rachit on 06/05/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4",
    ]
    var body: some View {
        TabView{
            ForEach(images ,id: \.self){image in
                Image(image)
                    .resizable()
            }
        }
            .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView()
}
