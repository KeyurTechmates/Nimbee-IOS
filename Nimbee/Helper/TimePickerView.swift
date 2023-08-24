//
//  TimePickerView.swift
//  Nimbee
//
//  Created by iMac on 28/07/23.
//

import Foundation
import UIKit

class TimePickerView: UIView {
    var onTimeSelected: ((Date) -> Void)?

    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        return picker
    }()

    private let doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Done", for: .normal)
        button.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        // Add subviews and set up constraints
        addSubview(datePicker)
        addSubview(doneButton)

        // Set up constraints
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        doneButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: topAnchor),
            datePicker.leadingAnchor.constraint(equalTo: leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: trailingAnchor),
            doneButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
            doneButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    @objc private func doneButtonTapped() {
        let selectedTime = datePicker.date
        onTimeSelected?(selectedTime)
    }
}


func getStringFromDate(date:Date,format:String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = format
    let strDate = formatter.string(from: date)
    return strDate
}



public enum JKCalendarMarkType{
    case circle
    case hollowCircle
    case underline
    case dot
}
