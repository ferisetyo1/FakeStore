//
//  ContentView.swift
//  FakeStore
//
//  Created by feri setyo on 12/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView(){
            TabView{
                ExploreView()
                    .tabItem() {
                        Image(systemName: "bag.fill")
                    }
                
                Text("Nearby Screen")
                    .tabItem {
                        Image(systemName: "person.circle")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
