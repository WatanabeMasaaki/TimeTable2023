//
//  SubjectView.swift
//  Timetable2023
//
//  Created by 渡邉雅晃 on 2023/04/30.
//

import SwiftUI

struct SubjectView: View {
    var data: SubjectData
    
    private func executeLink(pass: URL){
        let application = UIApplication.shared
        do {
            try application.open(pass)
        } catch {
            print("this subject doesn't have a LMS link.")
        }
        
    }
    
    var body: some View {
        
            
        Button(action: {
            executeLink(pass: data.lmsUrl)
        }, label: {
            VStack{
                Text("\(data.subject)")
                    .font(.largeTitle)
                    .foregroundColor(Color("TextColor"))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hue: 1.0, saturation: 0, brightness: 1.0,opacity: 0.5))
            .cornerRadius(25)
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .padding(.bottom, 10)
        })
        
        
    }
}

struct SubjectView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectView(data:SubjectData(id: 1, subject: "英語C", lmsUrl: URL(string: "https://lms.gifu-nct.ac.jp/course/view.php?id=5746")!, syllabusUrl: URL(string: "https://syllabus.kosen-k.go.jp/Pages/PublicSyllabus?school_id=21&department_id=03&subject_id=0022&year=2020&lang=ja")!))
    }
}
