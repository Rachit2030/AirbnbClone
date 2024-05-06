//
//  ListingView.swift
//  AirbnbClone
//
//  Created by Rachit on 06/05/24.
//

import SwiftUI

struct ListingItemView: View {
    
    var body: some View {
        VStack(spacing: 12){
            //Images
//            Rectangle()
           ListingImageCarouselView()
                .frame(height:320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
               
            //Listing Details
            
            HStack(alignment: .top){
                // Details
                VStack(alignment:.leading){
                    Text("Miami, Florida")
                       
                        .fontWeight(.semibold)
                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing:4){
                        Text("537")
                            .fontWeight(.semibold)
                        
                        Text("night")
                    }
                }
                
                Spacer()
                
                //Rating
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                    
                    Text("4.86")
                }
            }.font(.footnote) .foregroundStyle(.black)
                .padding(.horizontal,10)
        }.padding()
            
    }
}

#Preview {
    ListingItemView()
}
