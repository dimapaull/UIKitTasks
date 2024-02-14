// IngredientViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол делегата, для передачи данных с экраном ProductConfigurateViewController
protocol IngredientSelectionDelegate: AnyObject {
    func didSelectIngredients(_ ingredients: [OrderItem])
    func setupAdditionalIngredientsButton(status: AdditionalIngredientsStatus)
    func updateAdditionalPrice()
    func updateTotalPrice()
}

/// Экран выбора дополнительных ингредиентов к заказу
final class IngredientViewController: UIViewController {
    // MARK: Public Properties

    weak var delegate: IngredientSelectionDelegate?

    var selectedIngredients: [OrderItem] = []

    // MARK: Private Properties

    private let chooseIngredientsLabel = UILabel()
    private let milkLabel = UILabel()
    private let syrupLabel = UILabel()
    private let soyMilkLabel = UILabel()
    private let almondMilkLabel = UILabel()
    private let espressoLabel = UILabel()

    private let milkSwitch = UISwitch()
    private let syrupSwitch = UISwitch()
    private let soyMilkSwitch = UISwitch()
    private let almondMilkSwitch = UISwitch()
    private let espressoSwitch = UISwitch()

    // MARK: - Overrides Methods (View Life Cycles)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        setupViews()
        showViews()
        updateSwitches()
    }

    // MARK: Private Methods

    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "xmark"),
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)
        )
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
    }

    private func setColorForPriceInText(for text: String, length: Int) -> NSMutableAttributedString {
        guard length <= text.count else { return NSMutableAttributedString(string: text) }
        let range = NSRange(location: text.count - length, length: length)
        let attributedString = NSMutableAttributedString(string: text)
        let color = #colorLiteral(red: 0.3923774362, green: 0.7094224691, blue: 0.5105457902, alpha: 1)
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        return attributedString
    }

    private func setupViews() {
        chooseIngredientsLabel.text = "Выберите дополнительные ингредiенты"
        chooseIngredientsLabel.frame = CGRect(x: 40, y: 53, width: 294, height: 44)
        chooseIngredientsLabel.numberOfLines = 2
        chooseIngredientsLabel.font = UIFont(name: "Verdana-Bold", size: 18)
        chooseIngredientsLabel.textAlignment = .center

        milkLabel.frame = CGRect(x: 20, y: 124, width: 275, height: 35)
        milkLabel.attributedText = setColorForPriceInText(for: "Молоко + 50 руб", length: 8)

        syrupLabel.frame = CGRect(x: 20, y: 174, width: 275, height: 35)
        syrupLabel.attributedText = setColorForPriceInText(for: "Сироп + 20 руб", length: 8)

        soyMilkLabel.frame = CGRect(x: 20, y: 224, width: 275, height: 35)
        soyMilkLabel.attributedText = setColorForPriceInText(for: "Молоко соевое + 50 руб", length: 8)

        almondMilkLabel.frame = CGRect(x: 20, y: 274, width: 275, height: 35)
        almondMilkLabel.attributedText = setColorForPriceInText(for: "Молоко миндальное + 50 руб", length: 8)

        espressoLabel.frame = CGRect(x: 20, y: 324, width: 275, height: 35)
        espressoLabel.attributedText = setColorForPriceInText(for: "Эспрессо 50мл + 70 руб", length: 8)

        milkSwitch.addTarget(self, action: #selector(milkSwitchToggled(_:)), for: .valueChanged)
        milkSwitch.frame = CGRect(x: 301, y: 124, width: 54, height: 35)

        syrupSwitch.addTarget(self, action: #selector(syrupSwitchToggled(_:)), for: .valueChanged)
        syrupSwitch.frame = CGRect(x: 301, y: 174, width: 54, height: 35)

        soyMilkSwitch.addTarget(self, action: #selector(soyMilkSwitchToggled(_:)), for: .valueChanged)
        soyMilkSwitch.frame = CGRect(x: 301, y: 224, width: 54, height: 35)

        almondMilkSwitch.addTarget(self, action: #selector(almondMilkSwitchToggled(_:)), for: .valueChanged)
        almondMilkSwitch.frame = CGRect(x: 301, y: 274, width: 54, height: 35)

        espressoSwitch.addTarget(self, action: #selector(espressoSwitchToggled(_:)), for: .valueChanged)
        espressoSwitch.frame = CGRect(x: 301, y: 324, width: 54, height: 35)
    }

    private func showViews() {
        view.addSubview(chooseIngredientsLabel)
        view.addSubview(milkLabel)
        view.addSubview(syrupLabel)
        view.addSubview(soyMilkLabel)
        view.addSubview(almondMilkLabel)
        view.addSubview(espressoLabel)
        view.addSubview(milkSwitch)
        view.addSubview(syrupSwitch)
        view.addSubview(soyMilkSwitch)
        view.addSubview(almondMilkSwitch)
        view.addSubview(espressoSwitch)
    }

    /// Метод для обновления состояния свитчей в соответствии с выбранными ранее ингредиентами
    private func updateSwitches() {
        for item in selectedIngredients {
            switch item.name {
            case "Молоко":
                milkSwitch.isOn = true
            case "Сироп":
                syrupSwitch.isOn = true
            case "Молоко соевое":
                soyMilkSwitch.isOn = true
            case "Молоко миндальное":
                almondMilkSwitch.isOn = true
            case "Эспрессо 50мл":
                espressoSwitch.isOn = true

            default:
                break
            }
        }
    }

    /// Метод обработки переключения свитча для каждого ингредиента. В этом методе мы обновляем выбранные элементы в
    /// зависимости от состояния свитча
    private func handleSwitchToggle(_ sender: UISwitch, for item: OrderItem) {
        if sender.isOn {
            selectedIngredients.append(item)
        } else {
            if let index = selectedIngredients.firstIndex(where: { $0.name == item.name }) {
                selectedIngredients.remove(at: index)
            }
        }
    }

    @objc func milkSwitchToggled(_ sender: UISwitch) {
        handleSwitchToggle(sender, for: OrderItem(name: "Молоко", price: 50))
    }

    @objc func syrupSwitchToggled(_ sender: UISwitch) {
        handleSwitchToggle(sender, for: OrderItem(name: "Сироп", price: 20))
    }

    @objc func soyMilkSwitchToggled(_ sender: UISwitch) {
        handleSwitchToggle(sender, for: OrderItem(name: "Молоко соевое", price: 50))
    }

    @objc func almondMilkSwitchToggled(_ sender: UISwitch) {
        handleSwitchToggle(sender, for: OrderItem(name: "Молоко миндальное", price: 70))
    }

    @objc func espressoSwitchToggled(_ sender: UISwitch) {
        handleSwitchToggle(sender, for: OrderItem(name: "Эспрессо 50мл", price: 50))
    }

    @objc func backButtonTapped() {
        delegate?.didSelectIngredients(selectedIngredients)

        if selectedIngredients.isEmpty {
            delegate?.setupAdditionalIngredientsButton(status: .add)
        } else {
            delegate?.setupAdditionalIngredientsButton(status: .added)
        }
        delegate?.updateAdditionalPrice()
        delegate?.updateTotalPrice()

        dismiss(animated: true, completion: nil)
    }
}
