//
//  imageTest.swift
//  Tools
//
//  Created by Lady Ranni on 29/10/2023.
//

import SwiftUI

struct AcCheckList: View {
    var body: some View {
        Image("BG")
            .resizable()
            .frame(width: UIScreen.main.bounds.width, height:
                    UIScreen.main.bounds.height)
            .edgesIgnoringSafeArea(.all)
    }
}

struct AcCheckList_Previews: PreviewProvider {
    static var previews: some View {
        AcCheckList()
    }
}
