//
//  CartItemView.swift
//  FakeStore
//
//  Created by feri setyo on 19/09/22.
//

import SwiftUI

struct CartItemView: View {
    var item:Product;
    @State var counter=0;
    var body: some View {
        VStack(alignment: .leading){
            Text("Product No. "+self.item.productID.description)
            Stepper("Quantity : "+counter.description) {
                counter=counter+1
            } onDecrement: {
                if(counter>0){counter=counter-1}
            }
        }.onAppear{
            counter=self.item.quantity
        }
    }
}

struct CartItemView_Previews: PreviewProvider {
    static let item = Product(productID: 1, quantity: 123);
    static var previews: some View {
        CartItemView(item: self.item)
    }
}
