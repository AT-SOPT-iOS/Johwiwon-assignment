//
//  AdvertisementRow.swift
//  week7
//
//  Created by 조휘원 on 6/3/25.
//

import SwiftUI

struct AdvertisementRow: View {
    let items: [Advertisement]

    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 7) {
                ForEach(items.indices, id: \.self) { index in
                    let item = items[index]
                    ZStack {
                        Color.gray
                        Image(uiImage: item.image)
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .frame(width: 90, height: 45)
                    .cornerRadius(4)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ZStack {
        Color.black.edgesIgnoringSafeArea(.all)
        AdvertisementRow(items: Advertisement.dummy())
    }
}
