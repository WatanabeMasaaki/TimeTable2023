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
    
    private func executeLink(pass: URL){
        let application = UIApplication.shared
        do {
            try application.open(pass)
        } catch {
            print("this subject doesn't have a LMS link.")
        }
        
    }
    
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
                        
                        ForEach(tableData[i].sub, id: \.self){ subID in
                            ForEach(0 ..< subjectData.count){ j in
                                if(subjectData[j].id == subID){
                                    Button(action: {
                                        executeLink(pass: subjectData[j].lmsUrl)
                                    }, label: {
                                        Text(subjectData[j].subject)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .font(.largeTitle)
                                            .foregroundColor(.blue)
                                            .padding()
                                    })
                                }
                            }
                        }
//                        if let subID = tableData[i].sub[0] {
//
//                        }
                        
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
