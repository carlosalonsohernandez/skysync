//
//  SwiftUIView.swift
//  SkySync
//
//  Created by Carlos Hernandez on 4/13/25.
//

import SwiftUI

struct SwiftUIView: View {
    let apiKey = Bundle.main.object(forInfoDictionaryKey: "GoogleAPIKey") as? String ?? ""
    let baseUrl = Bundle.main.object(forInfoDictionaryKey: "GoogleBaseURL") as? String ?? ""
    
    var body: some View {
        Text("API Key Verification View")
        Text("apiKey: \(apiKey)\n\nbaseUrl: \(baseUrl)")
    }
}

#Preview {
    SwiftUIView()
}
