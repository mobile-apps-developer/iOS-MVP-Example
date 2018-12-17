import Foundation

protocol UserRegistrationService: class {
    /// USer registration completed successfully.
    func registrationDidComplete()

    /// USer registration failed with error message
    /// - Parameter message: error message to display when the registration fails
    func registrationDidFail(message: String)

    /// Show the progress spinner on the UI
    func showSpinner()

    /// Hide the progress spinner from the UI
    func hideSpinner()
}

final class UserRegistrationPresenter {
    private weak var delegate: UserRegistrationService?

    init(delegate: UserRegistrationService) {
        self.delegate = delegate
    }

    private func validate(email: String, personName: String, address: String) -> (status: Bool, message: String) {
        if email.isEmpty {
            return (false, "Email is mandatory")
        }

        if personName.isEmpty {
            return (false, "Person name is mandatory")
        }

        if address.isEmpty {
            return (false, "Address is mandatory")
        }

        return (true, "All inputs passed validations")
    }

    func registerUser(email: String, personName: String, address: String) {
        let validationResult = validate(email: email, personName: personName, address: address)
        if validationResult.status {
            self.delegate?.showSpinner()
            /* A simple delay is added to mimic the behavior of an aynchronous operation typicall a network call. */
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
                self?.delegate?.hideSpinner()
                self?.delegate?.registrationDidComplete()
            }
        } else {
            self.delegate?.registrationDidFail(message: validationResult.message)
        }
    }
}
