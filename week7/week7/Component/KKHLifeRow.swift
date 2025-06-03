//
//  KKHLifeRow.swift
//  week7
//
//  Created by 조휘원 on 6/3/25.
//

import SwiftUI

struct KKHLifeRow: View {
    let items: [KKHLife]

    var body: some View {
        VStack(alignment: .leading, spacing: 9) {

            Text("김가현PD의 인생작 TOP 5")
                .font(.title3)
                .bold()
                .foregroundColor(.white)
                .padding(.leading, 12)
                .padding(.vertical, 9)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(items.indices, id: \.self) { index in
                        let item = items[index]
                        Image(uiImage: item.image)
                            .resizable()
                            .frame(width: 160, height: 90)
                            .cornerRadius(3)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.edgesIgnoringSafeArea(.all)
        KKHLifeRow(items: KKHLife.dummy())
    }
}
