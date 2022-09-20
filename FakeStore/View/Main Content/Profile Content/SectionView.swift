//
//  SectionView.swift
//  FakeStore
//
//  Created by feri setyo on 20/09/22.
//

import SwiftUI

struct SectionView: View {
    var title:String
    var body: some View {
        HStack{
            Text(title)
            Spacer()
            Image(systemName: "chevron.right")
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static let title="Logout"
    static var previews: some View {
        SectionView(title: title)
    }
}
