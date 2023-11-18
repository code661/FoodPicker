//
//  ContentView.swift
//  FoodPicker
//
//  Created by tan61 on 3/18/23.
//

import SwiftUI

struct ContentView: View {
  var food = [
    "🍔 - 汉堡包",
    "🍟 - 薯条",
    "🍕 - 披萨",
    "🍣 - 寿司",
    "🍱 - 便当",
    "🍩 - 甜甜圈",
    "🍪 - 饼干",
    "🍫 - 巧克力",
    "🍦 - 冰淇淋",
    "🍉 - 西瓜"
  ]
  @State var selectedFoot: String?
  var body: some View {
    VStack(spacing: 20) {
      Image("Frame")
        .resizable()
        .aspectRatio(contentMode: .fit)
      Text("今天吃什么").font(.largeTitle).bold()

      footInfoView
      VStack(spacing: 20) {
        Button(action: {
          selectedFoot = food.shuffled().first(where: { $0 != selectedFoot })
        }) {
          Image(systemName: "heart.fill")
          Text(selectedFoot != nil ? "换一个" : "告诉我!")
        }.buttonStyle(.borderedProminent).controlSize(.large)

        Button("重置") {
          selectedFoot = nil
        }.buttonStyle(.bordered).controlSize(.large)
      }

    }.frame(maxHeight: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/).padding(20).background(Color(.secondarySystemBackground)).animation(.default, value: selectedFoot)
  }

  @ViewBuilder var footInfoView: some View {
    if selectedFoot != nil {
      Text(selectedFoot ?? "还没设定").font(.title).bold().foregroundColor(.mint)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
