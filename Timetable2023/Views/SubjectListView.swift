//
//  SubjectListVie.swift
//  Timetable2023
//
//  Created by 渡邉雅晃 on 2023/04/20.
//

import SwiftUI

struct SubjectListView: View {
    
    @Binding var displayDay: String
    var tableData: [TableData]
    var subjectData: [SubjectData]
    
    var body: some View {
        ZStack{
            Color("\(displayDay)TileBack")
            ForEach(0 ..< tableData.count){ i in
                if(tableData[i].day == displayDay){
                    VStack{
                        HStack{
                            Text("\(tableData[i].dayJPl)")
                            Text("\(tableData[i].dayl)")
                            Spacer()
                        }
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(15)
                        
                        Spacer()
                    }
                }
            }
        }
    }
}

//struct SubjectListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubjectListView()
//    }
//}
