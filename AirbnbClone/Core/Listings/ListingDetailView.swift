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
    var body: some View {
        ScrollView{
            ListingImageCarouselView()
                .frame(height: 320)
            
            VStack(alignment: .leading,spacing: 8){
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading){
                    HStack(spacing: 2){
                        Image(systemName: "star.fill")
                        
                        Text("4.86")
                        Text(" - ")
                        Text("28 Reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }.foregroundStyle(.black)
                    
                    Text("Miami, Florida")
                }.font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity,alignment: .leading)
            
            Divider()
            
            // Host Info View
            
            HStack{
                VStack(alignment:.leading, spacing: 4){
                    Text("Entire Villa Hosted By John Smith")
                        .font(.headline)
                        .frame(width: 250,alignment: .leading)
                    
                    HStack(spacing:2){
                        Text("4 guests -")
                        Text("4 bedrooms -")
                        Text("4 beds -")
                        Text("3 baths ")
                    }
                    .font(.caption)
                }.frame(width: 300,alignment: .leading)
                
                Spacer()
                
                Image("male-profile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64,height: 64)
                    .clipShape(Circle())
                
                
            }.padding()
            
            Divider()
            
            // Listing Features
            
            VStack(spacing: 16){
                ForEach(0 ..< 2){ feature in
                    HStack(spacing:12){
                        Image(systemName: "medal")
                        
                        VStack(alignment: .leading){
                            Text("Superhost")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Superhosts are experienced, highly rated hosts who are committed to provide grate stars for the guests")
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
                        ForEach( 1 ..< 5){bedroom in
                            VStack(alignment: .leading,spacing: 8){
                                Image(systemName: "bed.double")
                                
                                Text("Bedroom \(bedroom)")
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
                
                ForEach(0 ..< 5){ feature in
                    HStack{
                        Image(systemName: "wifi")
                            .frame(width: 32)
                        
                        Text("Wifi")
                            .font(.footnote)
                        
                        Spacer()
                    }
                }
            }.padding()
            
            Divider()
            
            VStack(alignment:.leading,spacing: 16){
                Text("Where You'll be")
                    .font(.headline)
                
                Map()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
            }.padding()
            
            
        }
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom){
            VStack{
                Divider()
                    .padding(.bottom)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("$500")
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
    ListingDetailView()
}
