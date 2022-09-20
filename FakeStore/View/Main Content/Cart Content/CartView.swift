//
//  CartView.swift
//  FakeStore
//
//  Created by feri setyo on 14/09/22.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel = CartViewModel()
    var body: some View {
        VStack{
            VStack(alignment:.leading){
                if(viewModel.carts.count>0){
                    HStack(alignment: .top){
                        VStack{
                            ForEach(viewModel.carts[0].products,id:\.productID){data in
                                CartItemView(item: data)
                                Color.gray.frame(height:1)
                            }
                        }
                    }
                }else{
                    Text("empty")
                }
            }.frame(maxHeight:.infinity)
            HStack{
                VStack(alignment:.leading){
                    Text("Total").multilineTextAlignment(.leading).font(.caption2)
                    Text("$107.4")
                        .multilineTextAlignment(.leading)
                }
                Spacer()
                Button {
                    
                } label: {
                    Text("Bayar").foregroundColor(Color.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 32)
                            .fill(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/))
                }
                .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                
            }.padding()
                .compositingGroup().background(Color.white)
                .shadow(radius: 1)
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
