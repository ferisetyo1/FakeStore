//
//  ProductView.swift
//  FakeStore
//
//  Created by feri setyo on 12/09/22.
//

import SwiftUI

struct ProductView: View {
    var product:ProductResponse
    var body: some View {
        VStack(alignment: .leading, spacing: 4){
            HStack{
                Spacer()
                AsyncImage(url: URL(string: product.image)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                } placeholder: {
                    Color.white.frame(height:200)
                }
                Spacer()
            }
            Text(product.title)
                .lineLimit(1)
                .font(.headline)
            Text("$ "+product.price.description)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
        .compositingGroup()
        .shadow(color:Color.brown,radius: 1)
    }
}

struct ProductView_Previews: PreviewProvider {
    static let productTest=ProductResponse(id: 1, title: "Sepatu", price: 132.3, productResponseDescription: "descprition", category: "Kategori", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: Rating(rate: 3.0, count: 560))
    static var previews: some View {
        ProductView(product:  productTest)
    }
}
