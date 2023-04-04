//
//  partIView.swift
//  Lab1
//
//  Created by Nina Kamble on 1/27/23.
//

import SwiftUI

struct partIView: View {
    var body: some View {
        //Text("Part I")
        show()
    }
}
struct show : View
{
    @State var height: String = ""
    @State var weight: String = ""
    @State var result: String = ""
    @State var bmi : Double = 0.0
    let resultTextField = UITextField()
    
    //let text = "BMI Calculator"
    
    var body:some View{
        VStack{
            Text("BMI Calculator").foregroundColor(.blue)
                .font(.title)
            
            Spacer()
            HStack
            {
                Spacer()
                Text("Height: ")
                Spacer()
                TextField("height in inches", text: $height)
            }
            Spacer()
            HStack{
                Spacer()
                Text("Weight: ")
                Spacer()
                TextField("weight in pounds", text: $weight)
                
            }
            Spacer()
            HStack{
                Text(result)
            }
                
            VStack{
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
            
            
            Button("Calculate BMI") {
                
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                if let height = Double(self.height), let weight = Double(self.weight) {
                    self.bmi = Double((weight/(height*height)) * 703)
                    self.result = "BMI: \(self.bmi)"
                    
                }
            }
        }
    }
}


struct partIView_Previews: PreviewProvider {
    static var previews: some View {
        partIView()
    }
}

