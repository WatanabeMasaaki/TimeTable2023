//
//  DayPanelView.swift
//  Timetable2023
//
//  Created by 渡邉雅晃 on 2023/04/20.
//

import SwiftUI

struct DayPanelView: View {
    
    var tableData: TableData
    @Binding var displayDay: String
    
    var body: some View {
            
        Button(action: {
            withAnimation{
                displayDay = tableData.day
            }
            
        }, label: {
            Text("\(tableData.dayJP)")
                .font(.system(size: 100, weight: .bold, design: .rounded))
                .foregroundColor(Color("\(tableData.day)TileFont"))
                .frame(width: 160, height: 160)
                .background(Color("\(tableData.day)TileBack"))
                .cornerRadius(25)
                .shadow(color: Color("\(tableData.day)TileBack"), radius: 5)
                .padding(.trailing, 15)
        })
        
            
            
        
    }
}

//struct DayPanelView_Previews: PreviewProvider {
//    static var previews: some View {
//        DayPanelView(tableData: TableData(day: "Mon", dayJP: "月", sub: [1,2,3,4]))
//    }
//}
