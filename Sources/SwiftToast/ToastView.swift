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

@available(iOS 15.0, macOS 11.0, watchOS 8.0, *)
struct ToastView: View {
  var type: ToastType
  var bgColor: Color?
  var foregroundColor: Color?
  var systemIcon: String
  var theme: ToastTheme
  var title: AttributedString
  var message: AttributedString = ""
  var showIcon: Bool = false
  var showCancel: Bool = false
  var onCancelTapped: (() -> Void) = {}
  
  var body: some View {
    Group {
      if type == .fancy {
        FancyToastView(theme: theme) {
          ToastInnerView(theme: theme,
                         systemIcon: theme.iconFileName,
                         title: title,
                         message: message,
                         showIcon: showIcon,
                         showCancel: showCancel,
                         onCancelTapped: onCancelTapped)
        }
      } else if type == .boot {
        BootToastView(color: bgColor != nil && theme == .custom ? bgColor! : theme.bootBGThemeColor) {
          ToastInnerView(theme: theme,
                         foregroundColor: foregroundColor,
                         systemIcon: systemIcon,
                         title: title,
                         message: message,
                         showIcon: showIcon,
                         showCancel: showCancel,
                         textColor: foregroundColor != nil && theme == .custom ? foregroundColor! : theme.themeColor,
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

@available(iOS 15.0, macOS 11.0, watchOS 8.0, *)
struct ToastInnerView: View {
  var theme: ToastTheme
  var foregroundColor: Color?
  var systemIcon: String = ""
  var title: AttributedString
  var message: AttributedString
  var showIcon: Bool
  var showCancel: Bool
  var textColor: Color?
  var onCancelTapped: (() -> Void)

  var iconColor: Color {
    if let foregroundColor = foregroundColor,
       theme == .custom {
      return foregroundColor
    } else {
      return theme.themeColor
    }
  }

  var body: some View {
    HStack(alignment: .center) {
      if showIcon {
        Image(systemName: systemIcon)
          .foregroundColor(iconColor)
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

@available(iOS 15.0, macOS 11.0, watchOS 8.0, *)
struct ToastView_Previews: PreviewProvider {
  static var previews: some View {
    ScrollView {
      VStack(spacing: 20) {
        VStack(spacing: 20) {
          ToastView(type:.boot,
                    bgColor: Color("colSky1").opacity(0.8),
                    foregroundColor: .white,
                    systemIcon: ToastTheme.info.iconFileName,
                    theme: .info,
                    title: "情報",
                    message: "航成大好き")
          ToastView(type:.boot,
                    bgColor: Color("colSky1").opacity(0.8),
                    foregroundColor: .white,
                    systemIcon: "heart.fill",
                    theme: .info,
                    title: "情報",
                    message: "航成大好き")
          ToastView(type:.boot,
                    bgColor: Color("colSky1").opacity(0.8),
                    foregroundColor: .white,
                    systemIcon: ToastTheme.info.iconFileName,
                    theme: .info,
                    title: "情報",
                    message: "航成大好き",
                    showIcon: true)
          ToastView(type:.boot,
                    bgColor: Color("colSky1").opacity(0.8),
                    foregroundColor: .white,
                    systemIcon: "heart.fill",
                    theme: .info,
                    title: "情報",
                    message: "航成大好き",
                    showIcon: true)
        }
        Spacer(minLength: 20)
        VStack(spacing: 20) {
          ToastView(type:.boot,
                    systemIcon: ToastTheme.info.iconFileName,
                    theme: .info,
                    title: "情報",
                    message: "航成大好き")
          ToastView(type:.boot,
                    systemIcon: ToastTheme.success.iconFileName,
                    theme: .success,
                    title: "成功")
          ToastView(type:.boot,
                    systemIcon: ToastTheme.warning.iconFileName,
                    theme: .warning,
                    title: "注意",
                    message: "航成大好き")
          ToastView(type:.boot,
                    systemIcon: ToastTheme.error.iconFileName,
                    theme: .error,
                    title: "エラー",
                    message: "航成大好き",
                    showCancel: true)
          ToastView(type:.boot,
                    systemIcon: ToastTheme.primary.iconFileName,
                    theme: .primary,
                    title: "情報",
                    message: "航成大好き")
          ToastView(type:.boot,
                    systemIcon: ToastTheme.secondary.iconFileName,
                    theme: .secondary,
                    title: "情報",
                    message: "航成大好き")
        }
        Spacer(minLength: 20)
        VStack(spacing: 20) {
          ToastView(type:.fancy,
                    systemIcon: ToastTheme.info.iconFileName,
                    theme: .info,
                    title: "情報",
                    message: "航成大好き")
          ToastView(type:.fancy,
                    systemIcon: ToastTheme.success.iconFileName,
                    theme: .success,
                    title: "成功")
          ToastView(type:.fancy,
                    systemIcon: ToastTheme.warning.iconFileName,
                    theme: .warning,
                    title: "注意",
                    message: "航成大好き")
          ToastView(type:.fancy,
                    systemIcon: ToastTheme.error.iconFileName,
                    theme: .error,
                    title: "エラー",
                    message: "航成大好き",
                    showCancel: true)
          ToastView(type:.fancy,
                    systemIcon: ToastTheme.primary.iconFileName,
                    theme: .primary,
                    title: "情報",
                    message: "航成大好き")
          ToastView(type:.fancy,
                    systemIcon: ToastTheme.secondary.iconFileName,
                    theme: .secondary,
                    title: "情報",
                    message: "航成大好き")
        }
        Spacer(minLength: 20)
        VStack(spacing: 20) {
          ToastView(type:.fancy,
                    systemIcon: ToastTheme.info.iconFileName,
                    theme: .info,
                    title: "情報",
                    message: "航成大好き",
                    showIcon: true)
          ToastView(type:.fancy,
                    systemIcon: ToastTheme.success.iconFileName,
                    theme: .success,
                    title: "成功",
                    showIcon: true)
          ToastView(type:.fancy,
                    systemIcon: ToastTheme.warning.iconFileName,
                    theme: .warning,
                    title: "注意",
                    message: "航成大好き",
                    showIcon: true)
          ToastView(type:.fancy,
                    systemIcon: ToastTheme.error.iconFileName,
                    theme: .error,
                    title: "エラー",
                    message: "航成大好き",
                    showIcon: true,
                    showCancel: true)
          ToastView(type:.fancy,
                    systemIcon: ToastTheme.primary.iconFileName,
                    theme: .primary,
                    title: "情報",
                    message: "航成大好き",
                    showIcon: true)
          ToastView(type:.fancy,
                    systemIcon: ToastTheme.secondary.iconFileName,
                    theme: .secondary,
                    title: "情報",
                    message: "航成大好き",
                    showIcon: true)
        }
      }
    }
  }
}

