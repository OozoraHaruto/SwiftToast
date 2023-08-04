//
//  Toast.swift
//  SwiftToast
//
//  Created by はると on 10/12/22.
//

import SwiftUI

/// Data here is used to create the toast Views
@available(iOS 15.0, macOS 11.0, watchOS 8.0, *)
public struct Toast: Equatable {
  /// The type of toast UI to show
  public var type: ToastType = .boot
  
  /// The color of the toast
  public var theme: ToastTheme = .info

  /// The custom background color of the toast
  public var bgColor: Color?

  /// The custom foreground color of the toast
  public var foregroundColor: Color?

  /// The icon of the toast
  public var systemIcon: String = ""

  /// The title message of the toast (Uses .headline)
  public var title: AttributedString

  /// The message of the toast (Uses .caption)
  public var message: AttributedString = ""

  /// To show the icon or not. (See `ToastTheme` for more info`
  public var showIcon: Bool = false
  
  /// To show the cancel/close icon
  public var showCancel: Bool = false
  
  /// The position of where the toast will appear
  public var position: ToastPosition = .top
  
  /// The duration of the toast to be shown
  public var duration: Double = 3

  /// Swipe toast to dismiss (iOS Only !!!)
  public var swipeToDismiss: Bool = true

  public var showMask: Bool = false

  public var maskColor: Color = .systemBackground

  public var maskOpacity: CGFloat = 0.7

  public var tapMaskToDismiss: Bool = false

  /// Create a toast
  /// - Parameters:
  ///   - type: The type of toast UI to show
  ///   - theme:The color of the toast
  ///   - systemIcon: The icon for the toast
  ///   - title: The title message of the toast (Uses .headline)
  ///   - message: The message of the toast (Uses .caption)
  ///   - showIcon: To show the icon or not.
  ///   - showCancel: To show the cancel/close icon
  ///   - position: The position of where the toast will appear
  ///   - duration: The duration of the toast to be shown
  ///   - swipeToDismiss: Swipe toast to dismiss (iOS Only !!!)
  ///   - showMask: To show mask
  ///   - showColor: Set the color of the mask
  ///   - maskOpacity: Set the opcaity of the mask
  ///   - tapMaskToDismiss: Tap the mask to dismiss toast
  public init(type: ToastType = .boot,
              theme: ToastTheme = .info,
              systemIcon: String = "",
              title: String,
              message: String = "",
              showIcon: Bool = false,
              showCancel: Bool = false,
              position: ToastPosition = .top,
              duration: Double = 3,
              swipeToDismiss: Bool = true,
              showMask: Bool = false,
              maskColor: Color = Color.clear,
              maskOpacity: CGFloat = 0.7,
              tapMaskToDismiss: Bool = false) {
    self.type = type
    self.theme = theme
    self.systemIcon = theme == .custom && systemIcon == "" ? systemIcon : theme.iconFileName
    self.title = AttributedString(title)
    self.message = AttributedString(message)
    self.showIcon = showIcon
    self.showCancel = showCancel
    self.position = position
    self.duration = duration
    self.swipeToDismiss = swipeToDismiss
    self.showMask = showMask
    self.maskColor = maskColor
    self.maskOpacity = maskOpacity
    self.tapMaskToDismiss = tapMaskToDismiss
  }

  /// Create a toast with custom colors (only support boot)
  /// - Parameters:
  ///   - bgColor: The background color of the toast
  ///   - foregroundColor: The foreground color of the toast
  ///   - systemIcon: The icon for the toast
  ///   - title: The title message of the toast (Uses .headline)
  ///   - message: The message of the toast (Uses .caption)
  ///   - showIcon: To show the icon or not.
  ///   - showCancel: To show the cancel/close icon
  ///   - position: The position of where the toast will appear
  ///   - duration: The duration of the toast to be shown
  ///   - swipeToDismiss: Swipe toast to dismiss (iOS Only !!!)
  ///   - showMask: To show mask
  ///   - showColor: Set the color of the mask
  ///   - maskOpacity: Set the opcaity of the mask
  ///   - tapMaskToDismiss: Tap the mask to dismiss toast
  public init(bgColor: Color,
              foregroundColor: Color,
              systemIcon: String = "",
              title: String,
              message: String = "",
              showIcon: Bool = false,
              showCancel: Bool = false,
              position: ToastPosition = .top,
              duration: Double = 3,
              swipeToDismiss: Bool = true,
              showMask: Bool = false,
              maskColor: Color = Color.clear,
              maskOpacity: CGFloat = 0.7,
              tapMaskToDismiss: Bool = false) {
    self.type = .boot
    self.theme = .custom
    self.bgColor = bgColor
    self.foregroundColor = foregroundColor
    self.systemIcon = systemIcon
    self.title = AttributedString(title)
    self.message = AttributedString(message)
    self.showIcon = showIcon
    self.showCancel = showCancel
    self.position = position
    self.duration = duration
    self.swipeToDismiss = swipeToDismiss
    self.showMask = showMask
    self.maskColor = maskColor
    self.maskOpacity = maskOpacity
    self.tapMaskToDismiss = tapMaskToDismiss
  }

  /// Create a toast
  /// - Parameters:
  ///   - type: The type of toast UI to show
  ///   - theme:The color of the toast
  ///   - systemIcon: The icon for the toast
  ///   - title: The title message of the toast (Uses .headline)
  ///   - message: The message of the toast (Uses .caption)
  ///   - showIcon: To show the icon or not.
  ///   - showCancel: To show the cancel/close icon
  ///   - position: The position of where the toast will appear
  ///   - duration: The duration of the toast to be shown
  ///   - swipeToDismiss: Swipe toast to dismiss (iOS Only !!!)
  ///   - showMask: To show mask
  ///   - showColor: Set the color of the mask
  ///   - maskOpacity: Set the opcaity of the mask
  ///   - tapMaskToDismiss: Tap the mask to dismiss toast
  public init(type: ToastType = .boot,
              theme: ToastTheme = .info,
              systemIcon: String = "",
              title: AttributedString,
              message: AttributedString = "",
              showIcon: Bool = false,
              showCancel: Bool = false,
              position: ToastPosition = .top,
              duration: Double = 3,
              swipeToDismiss: Bool = true,
              showMask: Bool = false,
              maskColor: Color = Color.clear,
              maskOpacity: CGFloat = 0.7,
              tapMaskToDismiss: Bool = false) {
    self.type = type
    self.theme = theme
    self.systemIcon = theme == .custom && systemIcon == "" ? systemIcon : theme.iconFileName
    self.title = title
    self.message = message
    self.showIcon = showIcon
    self.showCancel = showCancel
    self.position = position
    self.duration = duration
    self.swipeToDismiss = swipeToDismiss
    self.showMask = showMask
    self.maskColor = maskColor
    self.maskOpacity = maskOpacity
    self.tapMaskToDismiss = tapMaskToDismiss
  }

  /// Create a toast with custom colors (only support boot)
  /// - Parameters:
  ///   - bgColor: The background color of the toast
  ///   - foregroundColor: The foreground color of the toast
  ///   - systemIcon: The icon for the toast
  ///   - title: The title message of the toast (Uses .headline)
  ///   - message: The message of the toast (Uses .caption)
  ///   - showIcon: To show the icon or not.
  ///   - showCancel: To show the cancel/close icon
  ///   - position: The position of where the toast will appear
  ///   - duration: The duration of the toast to be shown
  ///   - swipeToDismiss: Swipe toast to dismiss (iOS Only !!!)
  ///   - showMask: To show mask
  ///   - showColor: Set the color of the mask
  ///   - maskOpacity: Set the opcaity of the mask
  ///   - tapMaskToDismiss: Tap the mask to dismiss toast
  public init(bgColor: Color,
              foregroundColor: Color,
              systemIcon: String = "",
              title: AttributedString,
              message: AttributedString = "",
              showIcon: Bool = false,
              showCancel: Bool = false,
              position: ToastPosition = .top,
              duration: Double = 3,
              swipeToDismiss: Bool = true,
              showMask: Bool = false,
              maskColor: Color = Color.clear,
              maskOpacity: CGFloat = 0.7,
              tapMaskToDismiss: Bool = false) {
    self.type = .boot
    self.theme = .custom
    self.bgColor = bgColor
    self.foregroundColor = foregroundColor
    self.systemIcon = systemIcon
    self.title = title
    self.message = message
    self.showIcon = showIcon
    self.showCancel = showCancel
    self.position = position
    self.duration = duration
    self.swipeToDismiss = swipeToDismiss
    self.showMask = showMask
    self.maskColor = maskColor
    self.maskOpacity = maskOpacity
    self.tapMaskToDismiss = tapMaskToDismiss
  }
}

/// The theme that we use to customise each toast
///
/// - Color used
///   - `.error`: red color
///   - `.warning`: orange color
///   - `.info`: light blue color
///   - `.success`: green color
///   - `.primary`: blue color
///   - `.secondary`: gray color
///   - `.custom`: light blue color if custom color not passed
/// - Icons used
///   - `.info`, `.primary`, `.secondary` uses : `"info.circle.fill"`
///   - `.warning` uses: `"exclamationmark.triangle.fill"`
///   - `.success` uses: `"checkmark.circle.fill"`
///   - `.error` uses: `"xmark.circle.fill"`
///   - `.custom`: uses: `"info.circle.fill"` if custom color not passed
public enum ToastTheme {
  case error
  case warning
  case success
  case info
  case primary
  case secondary
  case custom

  @available(iOS 15.0, macOS 11.0, watchOS 8.0, *)
  var themeColor: Color {
    switch self {
      case .error: return .error
      case .warning: return .warn
      case .info: return .info
      case .success: return .success
      case .primary: return .primary
      case .secondary: return .secondaryColor
      case .custom: return .info
    }
  }
  
  var iconFileName: String {
    switch self {
      case .info: fallthrough
      case .primary: fallthrough
      case .secondary: return "info.circle.fill"
      case .warning: return "exclamationmark.triangle.fill"
      case .success: return "checkmark.circle.fill"
      case .error: return "xmark.circle.fill"
      case .custom: return "info.circle.fill"
    }
  }

  @available(iOS 15.0, macOS 11.0, watchOS 8.0, *)
  var bootBGThemeColor: Color {
    switch self {
      case .error: return .bgError
      case .warning: return .bgWarn
      case .info: return .bgInfo
      case .success: return .bgSuccess
      case .primary: return .bgPrimary
      case .secondary: return .bgSecondary
      case .custom: return .bgInfo
    }
  }
}

/// The position of where the toast will appear
public enum ToastPosition {
  case top
  case middle
  case bottom
}

/// The type of toast UI to show
///
/// - `.fancy` will use system colors as bg and text, while having the color
/// on the left side of the toast
/// - `.boot` will have a background color of the alert (see `ToastTheme`)
/// and the text color will be a darker color
public enum ToastType {
  case fancy
  case boot
}
