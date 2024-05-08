//
//  DestinationSearchView.swift
//  AirbnbClone
//
//  Created by Rachit on 08/05/24.
//

import SwiftUI

enum DestinationSearchOptions{
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var selectedOption: DestinationSearchOptions = DestinationSearchOptions.location
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    @State private var numGuests = 0
    @ObservedObject var viewmodel: ExploreViewModel
    var body: some View {
        VStack{
            
            HStack {
                Button{
                    withAnimation(.snappy) {
                        show.toggle()
                    }
                }label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
            }
                Spacer()
                
                if(!viewmodel.searchLocation.isEmpty){
                    Button{
                        viewmodel.searchLocation = ""
                        viewmodel.updateListingForLocation()
                        
                    }label: {
                        Text("Clear")
                            .foregroundStyle(.black)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                }
            }.padding()
            VStack(alignment: .leading){
                if(selectedOption == .location){
                    Text("Where To?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destinations", text: $viewmodel.searchLocation)
                            .onSubmit {
                                viewmodel.updateListingForLocation()
                            }
                            .font(.subheadline)
                    }.frame(height: 44)
                        .padding(.horizontal)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1)
                                .foregroundStyle(Color(.systemGray4))
                        }
                }else{
                    CollapsedPickerView(title: "Where", description: "Add Destination")
                        .onTapGesture {
                            withAnimation(.snappy){
                                selectedOption = .location
                            }
                        }
                }
            }.padding()
                .frame(height: selectedOption == .location ? 120 : 64)
                .modifier(CollapsibleDestinationViewModifier())
            
            
            
            //Date Selection
            
            
            VStack(alignment:.leading){
                if(selectedOption == .dates){
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack{
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        
                        Divider()
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                        
                    }.foregroundStyle(.gray)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }else{
                    CollapsedPickerView(title: "When", description: "Add Dates")
                        .onTapGesture {
                            withAnimation(.snappy){
                                selectedOption = .dates
                            }
                        }
                    
                }
            }.padding()
                .frame(height: selectedOption == .dates ? 180 : 64)
                .modifier(CollapsibleDestinationViewModifier())
            
            
            
            //num guests
            
            VStack{
                if(selectedOption == .guests){
                    Text("Who's Coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper{
                        Text("\(numGuests) Adults")
                    }onIncrement: {
                        numGuests+=1
                    }onDecrement: {
                        guard numGuests > 0 else{return}
                        numGuests-=1
                    }
                    
                }else{
                    CollapsedPickerView(title: "Who", description: "Add Guests")
                        .onTapGesture {
                            withAnimation(.snappy){
                                selectedOption = .guests
                            }
                        }
                    
                }
            }.padding()
                .frame(height: selectedOption == .guests ? 120 : 64)
                .modifier(CollapsibleDestinationViewModifier())
            
            
            Spacer()
            
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(true),viewmodel: ExploreViewModel(service: ExploreService()))
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }.contentShape(Rectangle())
            .frame(height: 120)
            
        //        .padding()
        //        .clipShape(RoundedRectangle(cornerRadius: 12))
        //        .padding()
        //        .shadow(radius: 10)
    }
}

struct CollapsibleDestinationViewModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}
