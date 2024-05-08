//
//  ProfieView.swift
//  AirbnbClone
//
//  Created by Rachit on 08/05/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            // Profile Login View
            VStack(alignment: .leading, spacing: 32){
                VStack(alignment: .leading,spacing: 8) {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    Text("Log in to start planning your next trip")
                }
                
                Button{
                    
                }label: {
                    Text("Log In")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360,height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                HStack {
                    Text("Don't have an account?")
                    Text("Sign up")
                        .fontWeight(.semibold)
                        .underline()
                }.font(.caption)
                
                
            }
            
            VStack(alignment: .leading, spacing: 24){
                ProfileOptionRowView(imageName: "gear", title: "Settings")
                ProfileOptionRowView(imageName: "gear", title: "Accessibility")
                ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit the help center")
            }.padding(.vertical)
        }.padding()
    }
}

#Preview {
    ProfileView()
}
