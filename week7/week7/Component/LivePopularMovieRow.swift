//
//  LivePopularMovieRow.swift
//  week7
//
//  Created by 조휘원 on 6/3/25.
//

import SwiftUI

struct LivePopularMovieRow: View {
    let items: [LivePopularMovie]

    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            HStack {
                Text("실시간 인기 영화")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading, 12)
                    .padding(.vertical, 9)
                Spacer()
                Text("더보기")
                    .font(.caption)
                    .bold()
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
            }.padding(.vertical)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(items.indices, id: \.self) { index in
                        let item = items[index]
                        Image(uiImage: item.image)
                            .resizable()
                            .frame(width: 98, height: 146)
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
        LivePopularMovieRow(items: LivePopularMovie.dummy())
    }
}
