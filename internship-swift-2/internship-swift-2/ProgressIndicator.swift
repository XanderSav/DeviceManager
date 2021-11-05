//
//  ProgressIndicator.swift
//  internship-swift-2
//
//  Created by Александр Савченко on 28.10.2021.
//

import SwiftUI

struct ProgressIndicator: View {
    var body: some View {
        ZStack {
            
            Color.white
                .ignoresSafeArea(.all)
                .opacity(0.7)
            ProgressView()
        }
    }
}

struct ProgressIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ProgressIndicator()
    }
}
