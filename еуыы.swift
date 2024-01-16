import UIKit

class CalculatorViewController: UIViewController {

    var currentInput: Double = 0
    var previousInput: Double = 0
    var operation = ""

    let displayLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(displayLabel)

        let buttons: [[String]] = [
            ["7", "8", "9", "/"],
            ["4", "5", "6", "x"],
            ["1", "2", "3", "-"],
            ["C", "0", "=", "+"]
        ]

        var stackViews: [UIStackView] = []

        for row in buttons {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.spacing = 10

            for buttonTitle in row {
                let button = UIButton(type: .system)
                button.setTitle(buttonTitle, for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
                button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
                stackView.addArrangedSubview(button)
            }

            stackViews.append(stackView)
        }

        let mainStackView = UIStackView(arrangedSubviews: stackViews)
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        mainStackView.spacing = 10

        view.addSubview(mainStackView)

        NSLayoutConstraint.activate([
            displayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            displayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            displayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            mainStackView.topAnchor.constraint(equalTo: displayLabel.bottomAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    @objc func buttonPressed(_ sender: UIButton) {
        if let title = sender.titleLabel?.text {
            handleInput(title)
            updateDisplay()
        }
    }

    func handleInput(_ input: String) {
        // Implement logic to handle button presses and perform calculations
        // You need to differentiate between digits, arithmetic operations, and the reset button
    }

    func updateDisplay() {
        // Update the display label with the current input value
        // You may need to format the display based on your requirements
    }
}

// To use the ViewController, you need to create an instance and present it in your application.
// For example, in your AppDelegate.swift, you can add the following code:

// let calculatorViewController = CalculatorViewController()
// let window = UIWindow(frame: UIScreen.main.bounds)
// window.rootViewController = calculatorViewController
// window.makeKeyAndVisible()
