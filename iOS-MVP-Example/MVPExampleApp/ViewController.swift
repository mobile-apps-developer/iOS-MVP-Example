import UIKit

final class ViewController: UIViewController, UserRegistrationService {
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var personNameTextField: UITextField!
    @IBOutlet private var addressTextField: UITextField!
    @IBOutlet private var progressSpinnerView: UIView!

    private lazy var registrationPresenter = UserRegistrationPresenter(delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func registerUserAction(_ sender: UIButton) {
        self.registrationPresenter.registerUser(
            email: self.emailTextField.text!,
            personName: self.personNameTextField.text!,
            address: self.addressTextField.text!
        )
    }

    func registrationDidComplete() {
        alert(
            title: "Success",
            message: "Successfully Registered",
            buttonTitle: "Ok",
            withCancelOption: false,
            handler: nil
        )
    }

    func registrationDidFail(message: String) {
        alert(
            title: "Error",
            message: message,
            buttonTitle: "Ok",
            withCancelOption: false,
            handler: nil
        )
    }

    func showSpinner() {
        self.progressSpinnerView.isHidden = false
    }

    func hideSpinner() {
        self.progressSpinnerView.isHidden = true
    }
}
