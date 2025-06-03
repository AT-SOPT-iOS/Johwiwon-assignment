//
//  TvingView.swift
//  week7
//
//  Created by 조휘원 on 6/3/25.
//

import SwiftUI

struct TvingView: View {

    let categories = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
    @State private var selectedCategory = "홈"

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                HStack {
                    Image(.image94)
                        .resizable()
                        .frame(width: 191, height: 74)
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Image(.image113)
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .padding(.trailing, 11)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(categories, id: \.self) { category in
                            VStack(spacing: 7) {
                                Text(category)
                                    .padding(.horizontal, 28)
                                    .foregroundColor(.white)

                                Rectangle()
                                    .fill(
                                        selectedCategory == category
                                            ? Color.white : Color.clear
                                    )
                                    .frame(width: 15, height: 3)
                            }

                            .onTapGesture {
                                selectedCategory = category
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                Image(.movie3)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                TodayTvingRow(items: TodayTving.dummy())
                LivePopularLiveRow(items: LivePopularLive.dummy())
                LivePopularMovieRow(items: LivePopularMovie.dummy())
                BaseBallRow(items: BaseBall.dummy())
                AdvertisementRow(items: Advertisement.dummy())
                KKHLifeRow(items: KKHLife.dummy())
                
            }
        }
        .background(Color.black)
        .foregroundColor(.white)
    }
}

#Preview {
    TvingView()
}
