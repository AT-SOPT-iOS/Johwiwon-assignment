//
//  LivePopularLiveRow.swift
//  week7
//
//  Created by 조휘원 on 6/3/25.
//

import SwiftUI

struct LivePopularLiveRow: View {
    let items: [LivePopularLive]

    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            Text("실시간 인기 LIVE")
                .font(.title3)
                .bold()
                .foregroundColor(.white)
                .padding(.leading, 12)
                .padding(.vertical, 9)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(items.indices, id: \.self) { index in
                        let item = items[index]

                        VStack(alignment: .leading, spacing: 8) {
                            Image(uiImage: item.image)
                                .resizable()
                                .frame(width: 160, height: 80)
                                .cornerRadius(3)

                            HStack(alignment: .top, spacing: 8) {
                                Text("\(item.number)")
                                    .font(
                                        .system(size: 19, weight: .bold)
                                            .italic()
                                    )
                                    .foregroundColor(.white)

                                VStack(alignment: .leading, spacing: 4) {
                                    Text(item.title)
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    Text(item.episode)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    Text(item.viewRate)
                                        .font(.caption2)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
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
        LivePopularLiveRow(items: LivePopularLive.dummy())
    }
}
