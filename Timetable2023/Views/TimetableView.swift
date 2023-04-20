//
//  TimetableView.swift
//  Timetable2023
//
//  Created by 渡邉雅晃 on 2023/04/19.
//

import SwiftUI

struct TimetableView: View {
    
    @State var displayDay: String = "Mon"
    
    var body: some View {
        
        if let timetableData:[TableData] = Bundle.main.getData("timetable.json"){
            if let subjectData:[SubjectData] = Bundle.main.getData("subject.json"){
                VStack{
                    
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            Spacer(minLength: 25)
                            ForEach(0 ..< timetableData.count) { i in
                                DayPanelView(tableData:timetableData[i], displayDay:$displayDay)
                            }
                            Spacer(minLength: 10)
                        }
                        .padding(.bottom, 15)
                        .padding(.top, 10)
                    }
                    
                    
                    Spacer()
                    
                    SubjectListView(displayDay: $displayDay, tableData: timetableData, subjectData: subjectData)
                }
                .ignoresSafeArea(edges: .bottom)
            }
        }
        
    }
}

struct TimetableView_Previews: PreviewProvider {
    static var previews: some View {
        TimetableView()
    }
}
