//
//  cardView.swift
//  spinGame
//
//  Created by Ghazi Tozri on 3/5/20.
//  Copyright © 2020 wimobi. All rights reserved.
//

import SwiftUI

struct cardView: View {
    
    @Binding var symbol:String
    @Binding var background:Color
    var body: some View {
        
        Image(symbol)
        .resizable()
        .aspectRatio(1, contentMode: .fit)
        .background(background.opacity(0.75))
        .cornerRadius(20)
    }
}

struct cardView_Previews: PreviewProvider {
    static var previews: some View {
        cardView(symbol: Binding.constant("cherry"), background: Binding.constant(Color.white) )
    }
}
