//
//  partIIView.swift
//  Lab1
//
//  Created by Nina Kamble   on 1/27/23.
//

import SwiftUI

struct partIIView: View {
    var body: some View {
        //Text("Part II")
        showagain()
    }
}
struct showagain : View
{
    @State var height = 0.0
    @State var weight = 0.0
    @State var result: String = ""
    @State var bmi : Double = 0.0
    
    var body:some View{
        VStack{
            Text("BMI Calculator").foregroundColor(.blue)
                .font(.title)
            
            //Spacer()
            HStack{
                Spacer()
                Text("Height:")
                Slider(value: $height, in: 1...100, step: 1,
                       onEditingChanged: {_ in
                    self.printSliderValue()
                }).padding()
                    .accentColor(Color.blue)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25.0)
                            .stroke(lineWidth: 3.0)
                            .foregroundColor(Color.clear)
                    )
            }
            Text("\(height)")
            
            HStack{
                Spacer()
                Text("Weight:")
                Slider(value: $weight, in: 1...100, step: 1,
                       onEditingChanged: {_ in
                    self.printSliderValue()
                }).padding()
                    .accentColor(Color.blue)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25.0)
                            .stroke(lineWidth: 3.0)
                            .foregroundColor(Color.clear)
                    )
            }
            Text("\(weight)")
            
            HStack{
                Text(result)
               // Spacer()
            }
            VStack{
                //Spacer()
                if bmi < 18.0 && bmi > 1{
                    Text("You are underweight").foregroundColor(.blue)
                }
                else if bmi >= 18 && bmi < 25 {
                    Text("You are normal").foregroundColor(.green)
                }
                else if bmi >= 25 && bmi <= 30 {
                    Text("You are pre-obese").foregroundColor(.purple)
                    }
                else if bmi > 30{
                    Text("You are Obese").foregroundColor(.red)
                }
            }
//Spacer()
            
            Button("Calculate BMI"){
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
               // if let height = Double(self.height), let weight = Double(self.weight) {
                    self.bmi = Double((weight/(height*height)) * 703)
                    self.result = "BMI: \(self.bmi)"
                    
                }
            }
        }
    
    
        func printSliderValue()
        {
            print ("Height: \(height)")
            print ("Weight: \(weight)")
        }
}
struct partIIView_Previews: PreviewProvider {
    static var previews: some View {
        partIIView()
    }
}
