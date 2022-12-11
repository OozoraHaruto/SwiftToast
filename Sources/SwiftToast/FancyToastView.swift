//
//  FancyToastView.swift
//  SwiftToast
//
//  Created by はると on 10/12/22.
//

import SwiftUI

@available(iOS 14.0, macOS 11.0, *)
struct FancyToastView<Content: View>: View {
  let theme: ToastTheme
  @ViewBuilder var content: Content
  
  var body: some View {
    content
      .background(Color.systemBackground)
      .overlay(
        Rectangle()
          .fill(theme.themeColor)
          .frame(width: 6)
          .clipped()
        , alignment: .leading
      )
  }
}
