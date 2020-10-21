//
//  ContentView.swift
//  Map
//
//  Created by Nitin Bhatt on 10/21/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var isEnable = false
    
    @State var coordinate: [Coordinates] = [
      Coordinates(title: "Da Nang", coordinate: .init(latitude: 16.047079, longitude: 108.206230)),
        Coordinates(title: "Ha Noi", coordinate: .init(latitude: 21.027763, longitude: 105.834160))
    ]

    var body: some View {
        if isEnable == false{
            MapView()
        }else{
            MapViewWithCoordinates(coordiantes: $coordinate)
        }
  
        Button(action: {
            isEnable = true
        }) {
            Text("Coordinates")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
