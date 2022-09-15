//
//  ExploreView.swift
//  FakeStore
//
//  Created by feri setyo on 12/09/22.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment:.leading,spacing: 0){
                HStack(alignment:.top){
                    Text("Discover")
                        .font(.title)
                        .padding(.bottom,16)
                    Spacer()
                    NavigationLink(destination: CartView()){
                        Image(systemName: "cart.fill")
                            .foregroundColor(Color.black)
                    }
                }
                
                if !viewModel.loadingCategories{ Text("Our Products").padding(.vertical)
                    .font(.headline)
                    ScrollView(.horizontal){
                        LazyHStack{
                            ForEach(["all"]+viewModel.categories,id:\.self){data in
                                Button(action: {
                                    viewModel.selectCategory(category:data)
                                }){
                                    Text(data.capitalized).padding().background(RoundedRectangle(cornerRadius: 16).fill( viewModel.selectedCategory == data ? Color.accentColor : Color.gray.opacity(0.4)))
                                        .foregroundColor(Color.white)
                                }
                            }
                        }.padding(.bottom,16)
                    }
                }
                
                if !viewModel.loadingProducts{
                    LazyVGrid(columns: [GridItem(),GridItem()],spacing: 8) {
                        ForEach(viewModel.products, id:\.id){ data in
                            ProductView(product: data)
                        }
                    }
                }
                
                if viewModel.loadingCategories || viewModel.loadingProducts{
                    Text("Loading...").frame(alignment: .center)
                }
            }
            .padding()
            .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .topLeading)
        }
        .navigationBarHidden(true)
        .alert("Error",isPresented: $viewModel.showAlert,actions: {},message: {Text(viewModel.errorText)}) 
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
