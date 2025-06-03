//
//  TodayTvingRow.swift
//  week7
//
//  Created by 조휘원 on 6/3/25.
//
import SwiftUI

struct TodayTvingRow: View {
    let items: [TodayTving]

    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            Text("오늘의 티빙 Top 20")
                .font(.title3)
                .bold()
                .foregroundColor(.white)
                .padding(.leading, 12)
                .padding(.vertical, 9)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(items.indices, id: \.self) { index in
                        let item = items[index]
                        HStack(alignment: .bottom, spacing: 4) {
                            Text("\(item.number)")
                                .font(
                                    .system(
                                        size: 50,
                                        weight: .bold,
                                        design: .default
                                    ).italic()
                                )
                                .foregroundColor(.white)
                                .alignmentGuide(.bottom) { d in d[.bottom] }

                            Image(uiImage: item.image)
                                .resizable()
                                .frame(width: 98, height: 146)
                                .cornerRadius(3)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    TodayTvingRow(items: TodayTving.dummy())
}
