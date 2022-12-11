//
//  ToastView.swift
//  SwiftToast
//
//  Created by はると on 10/12/22.
//

import SwiftUI

let TOAST_CORNER_RADIUS: CGFloat = 6
let TOAST_SHADOW_OPACITY: CGFloat = 0.25
let TOAST_SHADOW_RADIUS: CGFloat = 4
let TOAST_SHADOW_X: CGFloat = 0
let TOAST_SHADOW_Y: CGFloat = 1
let TOAST_HORIZONTAL_PADDING: CGFloat = 16

@available(iOS 14.0, macOS 11.0, *)
struct ToastView: View {
  var type: ToastType
  var theme: ToastTheme
  var title: String
  var message: String = ""
  var showIcon: Bool = false
  var showCancel: Bool = false
  var onCancelTapped: (() -> Void) = {}
  
  var body: some View {
    Group {
      if type == .fancy {
        FancyToastView(theme: theme) {
          ToastInnerView(theme: theme,
                         title: title,
                         message: message,
                         showIcon: showIcon,
                         showCancel: showCancel,
                         onCancelTapped: onCancelTapped)
        }
      } else if type == .boot {
        BootToastView(theme: theme) {
          ToastInnerView(theme: theme,
                         title: title,
                         message: message,
                         showIcon: showIcon,
                         showCancel: showCancel,
                         textColor: theme.themeColor,
                         onCancelTapped: onCancelTapped)
        }
      }
    }
    .frame(minWidth: 0, maxWidth: .infinity)
    .cornerRadius(TOAST_CORNER_RADIUS)
    .shadow(color: Color.black.opacity(TOAST_SHADOW_OPACITY),
            radius: TOAST_SHADOW_RADIUS,
            x: TOAST_SHADOW_X,
            y: TOAST_SHADOW_Y)
    .padding(.horizontal, TOAST_HORIZONTAL_PADDING)
  }
}

@available(iOS 14.0, macOS 11.0, *)
struct ToastInnerView: View {
  var theme: ToastTheme
  var title: String
  var message: String
  var showIcon: Bool
  var showCancel: Bool
  var textColor: Color?
  var onCancelTapped: (() -> Void)
  
  var body: some View {
    HStack(alignment: .center) {
      if showIcon {
        Image(systemName: theme.iconFileName)
          .foregroundColor(theme.themeColor)
      }
      
      VStack(alignment: .leading) {
        Text(title)
          .font(.headline)
          .foregroundColor(textColor != nil ? textColor: .label)
        
        if message != "" {
          Text(message)
            .font(.caption)
            .foregroundColor(textColor != nil ? textColor: .secondaryColor)
        }
      }
      
      Spacer(minLength: 10)
      
      if showCancel {
        Button {
          onCancelTapped()
        } label: {
          Image(systemName: "xmark")
            .foregroundColor(textColor != nil ? textColor: .secondaryColor)
        }
      }
    }
    .padding()
  }
}

@available(iOS 14.0, macOS 11.0, *)
struct ToastView_Previews: PreviewProvider {
  static var previews: some View {
    ScrollView {
      VStack(spacing: 20) {
        VStack(spacing: 20) {
          ToastView(type:.boot, theme: .info, title: "情報", message: "航成大好き")
          ToastView(type:.boot, theme: .success, title: "成功")
          ToastView(type:.boot, theme: .warning, title: "注意", message: "航成大好き")
          ToastView(type:.boot, theme: .error, title: "エラー", message: "航成大好き", showCancel: true)
          ToastView(type:.boot, theme: .primary, title: "情報", message: "航成大好き")
          ToastView(type:.boot, theme: .secondary, title: "情報", message: "航成大好き")
        }
        Spacer(minLength: 20)
        VStack(spacing: 20) {
          ToastView(type:.fancy, theme: .info, title: "情報", message: "航成大好き")
          ToastView(type:.fancy, theme: .success, title: "成功")
          ToastView(type:.fancy, theme: .warning, title: "注意", message: "航成大好き")
          ToastView(type:.fancy, theme: .error, title: "エラー", message: "航成大好き", showCancel: true)
          ToastView(type:.fancy, theme: .primary, title: "情報", message: "航成大好き")
          ToastView(type:.fancy, theme: .secondary, title: "情報", message: "航成大好き")
        }
        Spacer(minLength: 20)
        VStack(spacing: 20) {
          ToastView(type:.fancy, theme: .info, title: "情報", message: "航成大好き", showIcon: true)
          ToastView(type:.fancy, theme: .success, title: "成功", showIcon: true)
          ToastView(type:.fancy, theme: .warning, title: "注意", message: "航成大好き", showIcon: true)
          ToastView(type:.fancy, theme: .error, title: "エラー", message: "航成大好き", showIcon: true, showCancel: true)
          ToastView(type:.fancy, theme: .primary, title: "情報", message: "航成大好き", showIcon: true)
          ToastView(type:.fancy, theme: .secondary, title: "情報", message: "航成大好き", showIcon: true)
        }
      }
    }
  }
}

