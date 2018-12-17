import Foundation
import UIKit.UIViewController

extension UIViewController {
    func alert(
        title: String?,
        message messageToShow: String?,
        buttonTitle: String,
        withCancelOption: Bool,
        handler: ((UIAlertAction) -> Void)?
    ) {
        let alert = UIAlertController(
            title: title,
            message: messageToShow,
            preferredStyle: UIAlertController.Style.alert
        )

        if withCancelOption {
            alert.addAction(UIAlertAction(
                title: "cancel",
                style: UIAlertAction.Style.cancel,
                handler: nil
            ))
        }

        let defaultAction = UIAlertAction(
            title: buttonTitle,
            style: withCancelOption ? .default : .cancel,
            handler: handler
        )

        alert.addAction(defaultAction)

        present(alert, animated: true, completion: nil)
    }
}
