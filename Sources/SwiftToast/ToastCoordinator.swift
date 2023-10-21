//
//  ToastCoordinator.swift
//  SwiftToast
//
//  Created by はると on 9/12/22.
//

import Foundation

/// Coordinator for the root view controller.
/// This will be used with modifier to show the toasts.
///
/// This should be added to the root controller:
///
///     struct MenuView: View {
///       @ObservedObject var toastCoordinator = ToastCoordinator()
///
///       var body: some View {
///         VStack {
///           Text("Hello World")
///         }
///         .modifier(ToastModifier())
///         .environmentObject(toastCoordinator)
///       }
///     }
///
/// This is how it is used in the rest of the views:
///
///     import SwiftToast
///
///     struct MenuViewTest: View {
///       @EnvironmentObject var toastCoordinator: ToastCoordinator
///
///       var body: some View {
///         VStack {
///           Button("no icon, no button") {
///             toastCoordinator.showToast(Toast(type: .boot,
///                                              title: "test",
///                                              message: "test",
///                                              duration: 1))
///           }
///         }
///       }
///     }
@available(iOS 15.0, macOS 12.0, watchOS 8.0, *)
public class ToastCoordinator: ObservableObject {
  @Published var shownToast: Toast? = nil
  private var toastQueue: [Toast] = []
  
  public init() {
    self.shownToast = nil
    self.toastQueue = []
  }
  
  public func showToast(_ toast: Toast) {
    if shownToast == nil {
      shownToast = toast
    } else {
      toastQueue.append(toast)
    }
  }
  
  public func removeToast() {
    shownToast = nil
    if toastQueue.count > 0 {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        self.shownToast = self.toastQueue.removeFirst()
      }
    }
  }
}
