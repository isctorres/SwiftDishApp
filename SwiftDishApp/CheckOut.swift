//
//  CheckOut.swift
//  SwiftDishApp
//
//  Created by Isc. Torres on 3/7/20.
//  Copyright © 2020 isctorres. All rights reserved.
//

import SwiftUI

struct CheckOut: View {
    @EnvironmentObject var order: Order
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    @State private var tipAmount = 1
    @State private var showingAlert = false
  
    let tipAmounts = [10,15,20,25,0];
    let paymentTypes = ["Cash","Credit Card","SwiftDish Points"]
    
    var totalPrice: Double{
        let total = Double(order.total)
        let tipValue = total / 100 * Double (self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    var body: some View {
        Form{
            Section{
                Picker("How do you want to pay?", selection: $paymentType){
                    ForEach( 0 ..< paymentTypes.count){
                        Text(self.paymentTypes[$0])
                    }
                }
                Toggle( isOn: $addLoyaltyDetails){
                    Text("Add SwiftSish Loyalty Card")
                }
                if addLoyaltyDetails {
                    TextField("Enter you SwiftDish ID", text: $loyaltyNumber)
                }
            }
            Section(header: Text("Add tip?")){
                Picker("Percentage", selection: $tipAmount){
                    ForEach( 0 ..< tipAmounts.count ){
                        Text("\(self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Total: $ \(totalPrice, specifier: "%.2f")").font(.largeTitle)){
                Button("Confirm Order"){
                    self.showingAlert.toggle()
                }
            }
        }.navigationBarTitle(Text("Payment"),displayMode: .inline)
        .alert(isPresented: $showingAlert){
            Alert(
                title: Text("Order Confirmed"),
                message: Text("Your Total was $\(totalPrice,specifier: "%.2f") - Thank You!"),
                dismissButton: .default(Text("Ok"))
            )
        }
    }
}

struct CheckOut_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckOut().environmentObject(order)
    }
}
