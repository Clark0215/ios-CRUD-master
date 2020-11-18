//
//  EventRow.swift
//  kangwei
//
//  Created by Customer on 2019/11/30.
//  Copyright © 2019 kangwei. All rights reserved.
//

import SwiftUI

struct EventRow: View {
    var event: Event
    var colors = [Color.blue,Color.red,Color.yellow,Color.green,Color.orange,Color.purple,Color.gray]
    var types = ["吃飯","衣服","住","交通","娛樂","寵物","雜費"]
    var body: some View {
        HStack{
            Text(event.type)
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
            Spacer()
            Text("total spend : $NT \(event.time)")
                .fontWeight(.bold)
        }.background(colors[types.firstIndex(of: event.type) ?? 0])
    }
}

struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        EventRow(event : Event(type: "吃飯", time: 80, notice: "gg"))
    }
}
