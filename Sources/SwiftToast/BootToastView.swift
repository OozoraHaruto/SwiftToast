//
//  BootToastView.swift
//  SwiftToast
//
//  Created by はると on 10/12/22.
//

import SwiftUI

@available(iOS 15.0, macOS 11.0, watchOS 8.0, *)
struct BootToastView<Content: View>: View {
  let color: Color
  @ViewBuilder var content: Content
  
  var body: some View {
    content
      .background(color)
  }
}
