//
//  ListingDetailView.swift
//  AirbnbClone
//
//  Created by Rachit on 06/05/24.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var cameraPosition: MapCameraPosition
    
    init(listing: Listing){
        self.listing = listing
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: listing.latitude, longitude: listing.longitute),span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        self._cameraPosition = State(initialValue: .region(region))
    }
    let listing: Listing
    var body: some View {
        ScrollView{
            ListingImageCarouselView(listing: listing)
                .frame(height: 320)
            
            VStack(alignment: .leading,spacing: 8){
                Text(listing.title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading){
                    HStack(spacing: 2){
                        Image(systemName: "star.fill")
                        
                        Text("\(listing.rating,specifier: "%.2f")")
                        Text(" - ")
                        Text("28 Reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }.foregroundStyle(.black)
                    
                    Text("\(listing.city), \(listing.state)")
                }.font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity,alignment: .leading)
            
            Divider()
            
            // Host Info View
            
            HStack{
                VStack(alignment:.leading, spacing: 4){
                    Text("Entire \(listing.type) Hosted By \(listing.ownerName)")
                        .font(.headline)
                        .frame(width: 250,alignment: .leading)
                    
                    HStack(spacing:2){
                        Text("\(listing.numberofGuests) guests -")
                        Text("\(listing.numberofBedrooms) bedrooms -")
                        Text("\(listing.numberofBeds) beds -")
                        Text("\(listing.numberofBathrooms) baths ")
                    }
                    .font(.caption)
                }.frame(width: 300,alignment: .leading)
                
                Spacer()
                
                Image(listing.ownerImageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64,height: 64)
                    .clipShape(Circle())
                
                
            }.padding()
            
            Divider()
            
            // Listing Features
            
            VStack(spacing: 16){
                ForEach(listing.features){ feature in
                    HStack(spacing:12){
                        Image(systemName: feature.imageName)
                        
                        VStack(alignment: .leading){
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text(feature.subtitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                }
            }.padding()
            
            Divider()
            //Bedroom View
            VStack(alignment: .leading,spacing: 16){
                Text("Where You'll Sleep")
                    .font(.headline)
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing: 16){
                        ForEach(0...listing.numberofBeds,id: \.self){bedroom in
                            VStack(alignment: .leading,spacing: 8){
                                Image(systemName: "bed.double")
                                
                                Text("Bedroom \(bedroom+1)")
                                    .font(.footnote)
                            }.frame(width: 132,height: 100)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: 0.5)
                                        .foregroundStyle(.gray)
                                }
                        }
                     
                    }
                }.scrollTargetBehavior(.paging)
            }
            .padding()
            
            Divider()
            //Listing Amenities
            VStack(alignment: .leading,spacing: 16){
                Text("What This Place Offers")
                    .font(.headline)
                
                ForEach(listing.amenities){ feature in
                    HStack{
                        Image(systemName: feature.imageName)
                            .frame(width: 32)
                        
                        Text(feature.title)
                            .font(.footnote)
                        
                        Spacer()
                    }
                }
            }.padding()
            
            Divider()
            
            VStack(alignment:.leading,spacing: 16){
                Text("Where You'll be")
                    .font(.headline)
                
                Map(position: $cameraPosition)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
            }.padding()
            
            
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom){
            VStack{
                Divider()
                    .padding(.bottom)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("$ \(listing.pricePerNight)")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text("Total Before Taxes")
                            .font(.footnote)
                        
                        Text("Oct 15 - 20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    
                    Spacer()
                    
                    Button{
                        
                    }label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140,height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }.padding(.horizontal,32)
            }.background(.white)
        }
        .overlay(alignment: .topLeading){
            Button{
                dismiss()
            }label: {
                Image(systemName: "chevron.backward")
                    .controlSize(.large)
                    .foregroundStyle(.black)
                    .frame(width: 32,height:32)
                    .background(.white)
                    .clipShape(Circle())
                    .padding(.horizontal)
                    .shadow(radius: 16)
            }
        }
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[0])
}
