//
//  ProfileView.swift
//  FakeStore
//
//  Created by feri setyo on 20/09/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView(.vertical){VStack(alignment:.leading,spacing: 16){
            VStack(alignment: .center){
                Image(systemName: "person.crop.circle").resizable().scaledToFit().frame(width: 100)
                Text("Feri Setyo Efendi")
            }.frame(maxWidth:.infinity)
            SectionView(title: "Profile Data")
            SectionView(title: "Riwayat Transaksi")
            SectionView(title: "Logout")
        }.padding().frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .topLeading)}.navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
