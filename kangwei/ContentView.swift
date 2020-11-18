//
//  ContentView.swift
//  kangwei
//
//  Created by Customer on 2019/11/30.
//  Copyright © 2019 kangwei. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var eventsData = EventsData()
    @State private var showEdit = false
    var body: some View {
        VStack{
            
            CircleChart(eventsData: self.eventsData).frame(width:350,height: 350)
            Text("甜甜圈圖").frame(width:1000,height: 20).background(Color.white)
            NavigationView{
                List{
                    ForEach(eventsData.events){ (index) in
                        NavigationLink(destination: EventEditor(eventsData: self.eventsData, editEvent: index)){EventRow(event : index)}
                    }.onDelete{(indexSet) in
                        self.eventsData.events.remove(atOffsets: indexSet)
                        
                    }.onMove { (indexSet, index) in
                        self.eventsData.events.move(fromOffsets: indexSet,
                                        toOffset: index)
                    }
                }.navigationBarTitle("我的支出")
                    .navigationBarItems(leading: EditButton(),trailing: Button(action:{self.showEdit = true},label:{Image(systemName:"plus.circle.fill")}))
                    .sheet(isPresented: $showEdit){NavigationView{EventEditor(eventsData: self.eventsData)}
                }
            }
            
        }.background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
