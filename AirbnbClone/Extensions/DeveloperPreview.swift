//
//  DeveloperPreview.swift
//  AirbnbClone
//
//  Created by Rachit on 08/05/24.
//

import Foundation

class DeveloperPreview{
    static let shared = DeveloperPreview()
    var listings: [Listing] = [
        Listing(id: NSUUID().uuidString,
                ownerId: NSUUID().uuidString,
                ownerName: "John Smith",
                ownerImageUrl: "male-profile",
                numberofBedrooms: 4,
                numberofBathrooms: 3,
                numberofGuests: 3,
                numberofBeds: 3,
                pricePerNight: 567,
                latitude: 125.7850,
                longitute: -80.1936,
                imageURLs: ["listing-2","listing-1","listing-4","listing-6"],
                address: "124 Main St",
                city: "Miami",
                state: "Florida",
                title: "Miami Villa",
                rating: 4.86,
                features: [.selfCheckIn,.superHost],
                amenities: [.wifi,.alarmSystem,.balcony,.laundry,.tv],
                type: .villa)
        ,
        Listing(id: NSUUID().uuidString,
                ownerId: NSUUID().uuidString,
                ownerName: "Steve Smith",
                ownerImageUrl: "male-profile",
                numberofBedrooms: 4,
                numberofBathrooms: 3,
                numberofGuests: 3,
                numberofBeds: 3,
                pricePerNight: 237,
                latitude: 25.7650,
                longitute: -80.1936,
                imageURLs: ["listing-5","listing-4","listing-8","listing-6"],
                address: "124 Main St",
                city: "LA",
                state: "Florida",
                title: "Beautiful Miami Apartment in Downtown",
                rating: 4.86,
                features: [.selfCheckIn,.superHost],
                amenities: [.wifi,.alarmSystem,.balcony,.laundry,.tv],
                type: .apartment)
        ,
        Listing(id: NSUUID().uuidString,
                ownerId: NSUUID().uuidString,
                ownerName: "Rock Smith",
                ownerImageUrl: "male-profile",
                numberofBedrooms: 4,
                numberofBathrooms: 3,
                numberofGuests: 3,
                numberofBeds: 3,
                pricePerNight: 652,
                latitude: 25.7850,
                longitute: -80.1936,
                imageURLs: ["listing-3","listing-8","listing-4","listing-1"],
                address: "124 Main St",
                city: "Ottawa",
                state: "Canada",
                title: "Miami TownHouse",
                rating: 4.86,
                features: [.selfCheckIn,.superHost],
                amenities: [.wifi,.alarmSystem,.balcony,.laundry,.pool,.office],
                type: .townHouse),
        Listing(id: NSUUID().uuidString,
                ownerId: NSUUID().uuidString,
                ownerName: "John Smith",
                ownerImageUrl: "male-profile",
                numberofBedrooms: 4,
                numberofBathrooms: 3,
                numberofGuests: 3,
                numberofBeds: 3,
                pricePerNight: 567,
                latitude: 25.7850,
                longitute: -80.1936,
                imageURLs: ["listing-1","listing-5","listing-4","listing-6"],
                address: "124 Main St",
                city: "Montreal",
                state: "Canada",
                title: "Miami Villa",
                rating: 4.86,
                features: [.selfCheckIn,.superHost],
                amenities: [.wifi,.alarmSystem,.balcony,.laundry,.tv],
                type: .villa)
        ,
        Listing(id: NSUUID().uuidString,
                ownerId: NSUUID().uuidString,
                ownerName: "Steve Smith",
                ownerImageUrl: "male-profile",
                numberofBedrooms: 4,
                numberofBathrooms: 3,
                numberofGuests: 3,
                numberofBeds: 3,
                pricePerNight: 237,
                latitude: 25.7650,
                longitute: -80.1936,
                imageURLs: ["listing-6","listing-2","listing-8","listing-6"],
                address: "124 Main St",
                city: "Miami",
                state: "Florida",
                title: "Beautiful Miami Apartment in Downtown",
                rating: 4.86,
                features: [.selfCheckIn,.superHost],
                amenities: [.wifi,.alarmSystem,.balcony,.laundry,.tv],
                type: .apartment)
        ,
        Listing(id: NSUUID().uuidString,
                ownerId: NSUUID().uuidString,
                ownerName: "Rock Smith",
                ownerImageUrl: "male-profile",
                numberofBedrooms: 4,
                numberofBathrooms: 3,
                numberofGuests: 3,
                numberofBeds: 3,
                pricePerNight: 652,
                latitude: 25.7850,
                longitute: -80.1936,
                imageURLs: ["listing-5","listing-8","listing-4","listing-1"],
                address: "124 Main St",
                city: "Miami",
                state: "Florida",
                title: "Miami TownHouse",
                rating: 4.86,
                features: [.selfCheckIn,.superHost],
                amenities: [.wifi,.alarmSystem,.balcony,.laundry,.pool,.office],
                type: .townHouse)
    ]
}
