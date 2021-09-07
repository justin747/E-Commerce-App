//
//  CustomCurveShape.swift
//  CustomCurveShape
//
//  Created by Justin747 on 9/5/21.
//

import SwiftUI

struct CustomCurveShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}

struct CustomCurveShape_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
