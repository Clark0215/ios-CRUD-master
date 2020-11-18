//
//  EventEditor.swift
//  kangwei
//
//  Created by Customer on 2019/11/30.
//  Copyright © 2019 kangwei. All rights reserved.
//

import SwiftUI

struct EventEditor: View {
    var types = ["吃飯","衣服","住","交通","娛樂","寵物","雜費"]
    @Environment(\.presentationMode) var preMode
    @State private var selectIndex = 0
    @State private var spends = 30
    @State private var spend: CGFloat = 0
    @State private var text = ""
    var eventsData : EventsData
    var editEvent : Event?
    var body: some View {
            Form{
                Picker(selection: $selectIndex, label: Text("choose type")){
                    Text(self.types[0]).tag(0)
                    Text(self.types[1]).tag(1)
                    Text(self.types[2]).tag(2)
                    Text(self.types[3]).tag(3)
                    Text(self.types[4]).tag(4)
                    Text(self.types[5]).tag(5)
                    Text(self.types[6]).tag(6)
                }
                
                Stepper("Spend Money: $NT \(spends)", onIncrement: {
                                self.spends += 10
                            }, onDecrement: {
                                self.spends -= 10
                            })
                
                TextField("備註", text: $text)
            }.navigationBarTitle(editEvent == nil ?"新增事件":"修改事件")
                .navigationBarItems(trailing: Button("save"){
                    let event = Event(type: self.types[self.selectIndex], time:self.spends, notice: self.text)
                    if let editEvent = self.editEvent{
                        let index = self.eventsData.events.firstIndex{
                            return $0.id == editEvent.id
                            }!
                        self.eventsData.events[index] = event
                    }
                    else{
                        self.eventsData.events.insert(event,at:0)
                    }
                    self.preMode.wrappedValue.dismiss()})
                .onAppear{
                    if let editEvent = self.editEvent{
                        self.selectIndex = self.types.firstIndex(of: editEvent.type) ?? 0
                        self.spends = editEvent.time
                        self.text = editEvent.notice
                    }
            }
                    
    }
}

struct EventEditor_Previews: PreviewProvider {
    static var previews: some View {
        EventEditor(eventsData: EventsData())
    }
}
