//
//  AddCityView.swift
//  Lab6CoreData
//
//  Created by Nina Kamble on 3/31/23.
//
import SwiftUI
import CoreData

struct AddCityView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext
    @State private var cityName = ""
    @State private var cityDescription = ""
    @State private var cityImage: UIImage?
    @State private var showingImagePicker = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("City Name", text: $cityName)
                TextField("City Description", text: $cityDescription)
                Section {
                    if let cityImage = cityImage {
                        Image(uiImage: cityImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200)
                    }
                    Button("Choose Photo") {
                        showingImagePicker = true
                    }
                }
                Section {
                    Button("Save") {
                        let newCity = City(context: viewContext)
                        newCity.name = cityName
                        newCity.desc = cityDescription
                        newCity.image = cityImage?.jpegData(compressionQuality: 1.0)
                        
                        do {
                            try viewContext.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            let nsError = error as NSError
                            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                        }
                    }
                }
            }
            .navigationBarTitle("Add City")
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $cityImage)
            }
        }
    }
    
    private func loadImage() {
        guard let cityImage = cityImage else { return }
        let resizedImage = cityImage.resized(toWidth: 800)
        self.cityImage = resizedImage
    }
}

extension UIImage {
    func resized(toWidth width: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
/*
class City: NSManagedObject, Identifiable {
    @NSManaged public var name: String?
    @NSManaged public var desc: String?
    @NSManaged public var image: Data?
}
*/
