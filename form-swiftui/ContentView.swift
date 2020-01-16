//
//  ContentView.swift
//  form-swiftui
//
//  Created by Jeroen Zonneveld on 13/01/2020.
//  Copyright © 2020 Jeroen Zonneveld. All rights reserved.
//

import SwiftUI

struct PersonalDetailsFormView: View {

    // personal
    @State private var name: String = ""
    @State private var age: String = ""

    // address
    @State private var street: String = ""
    @State private var place: String = ""
    @State private var postcode: String = ""

    @State private var birthday = Date()

    @State private var acceptedTerms: Bool = true
    @State private var selectedGenderIndex: Int = 0

    private var genderOptions = ["🙍‍♂️ Male", "🙍‍♀️ Female", "🤖 Other"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal")) {
                    TextField("Your name", text: $name)
                    TextField("Your age", text: $age).keyboardType(.numberPad)

                    Picker("Gender", selection: $selectedGenderIndex) {
                        ForEach(0..<genderOptions.count) {
                            Text(self.genderOptions[$0])
                        }
                    }.pickerStyle( SegmentedPickerStyle())
                }

                Section(header: Text("Birthday")) {
                    DatePicker(selection: $birthday, in: ...Date(), displayedComponents: .date) {
                        Text("Birthday")
                    }
                }

                Section(header: Text("Address")) {
                    TextField("Street", text: $street)
                    TextField("Place", text: $place)
                    TextField("Postcode", text: $postcode)
                }

                Section(header: Text("Terms")) {
                    Toggle("I agree to the terms & conditions", isOn: $acceptedTerms)
                }
            }.navigationBarTitle("Personal information")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalDetailsFormView()
    }
}
