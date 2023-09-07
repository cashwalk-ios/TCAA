//
//  TopTabBarView.swift
//  TCAA
//
//  Created by Rocky on 2023/09/06.
//

import SwiftUI

struct TopTabBarView: View {
    
    @Binding var selectedGender: Gender
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(spacing: 0) {
                Spacer()
                Text(Gender.male.title)
                Spacer()
                Color(Gender.male == selectedGender ? .black : .white).frame(height: 1)
            }
            .frame(maxWidth: .infinity / 2)
            .onTapGesture {
                selectedGender = .male
            }
            
            VStack(spacing: 0) {
                Spacer()
                Text(Gender.female.title)
                Spacer()
                Color(Gender.female == selectedGender ? .black : .white).frame(height: 1)
            }
            .frame(maxWidth: .infinity / 2)
            .onTapGesture {
                selectedGender = .female
            }
        }
        .frame(height: 55)
    }
}


struct TopTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopTabBarView(selectedGender: .constant(.male))
    }
}
