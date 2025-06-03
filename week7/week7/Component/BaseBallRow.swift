//
//  BaseBallRow.swift
//  week7
//
//  Created by 조휘원 on 6/3/25.
//

import SwiftUI

struct BaseBallRow: View {
    let items: [BaseBall]

    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(items.indices, id: \.self) { index in
                    let item = items[index]

                    ZStack {
                        (index % 2 == 0 ? Color.white : Color.black)
                        Image(uiImage: item.image)
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .frame(width: 80, height: 50)
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical, 28)
    }
}

#Preview {
    ZStack {
        Color.black.edgesIgnoringSafeArea(.all)
        BaseBallRow(items: BaseBall.dummy())
    }
}
