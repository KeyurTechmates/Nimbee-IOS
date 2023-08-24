//
//  ViewController.swift
//  Nimbee
//
//  Created by iMac on 27/07/23.
//

import UIKit
import EventKit
import EventKitUI
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate {

    //MARK: - IBOutlet
    
    @IBOutlet weak var vwDelete: UIView! {
        didSet {
            vwDelete.layer.cornerRadius = 6
        }
    }
    @IBOutlet weak var btnDropDown: UIButton!
    
    @IBOutlet weak var vwCalender: UIView! {
        didSet {
            self.vwCalender.isHidden = true
            ConstvcCalender.constant = 0
        }
    }
    
    @IBOutlet weak var vwMainTimePicker: UIView! {
        didSet {
            vwMainTimePicker.isHidden = true
            ConstTimePicker.constant = 0
        }
    }
    
    @IBOutlet weak var ConstTimePicker: NSLayoutConstraint!
    @IBOutlet weak var ConstvcCalender: NSLayoutConstraint!
    @IBOutlet weak var ConstvwDateTop: NSLayoutConstraint!
    @IBOutlet weak var ConstvwDateTop1: NSLayoutConstraint!
    
    
    @IBOutlet weak var vwStartDate: UIView! {
        didSet {
            self.vwStartDate.layer.borderColor = UIColor(red: 0.075, green: 0.216, blue: 0.271, alpha: 1.0).cgColor
            self.vwStartDate.layer.borderWidth = 0.4
            self.vwStartDate.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var vwStartTime: UIView! {
        didSet {
            self.vwStartTime.layer.borderColor = UIColor(red: 0.075, green: 0.216, blue: 0.271, alpha: 1.0).cgColor
            self.vwStartTime.layer.borderWidth = 0.4
            self.vwStartTime.layer.cornerRadius = 10
        }
    }
    
    
    @IBOutlet weak var timePicker: UIDatePicker! {
        didSet {
            self.timePicker.overrideUserInterfaceStyle = .dark
        }
    }
    
    
    @IBOutlet weak var EndTimePicker: UIDatePicker! {
        didSet {
            self.EndTimePicker.overrideUserInterfaceStyle = .dark
            EndTimePicker.isHidden = true
        }
    }
    
    
    @IBOutlet weak var vwEndDate: UIView! {
        didSet {
            self.vwEndDate.layer.borderColor = UIColor(red: 0.075, green: 0.216, blue: 0.271, alpha: 1.0).cgColor
            self.vwEndDate.layer.borderWidth = 0.4
            self.vwEndDate.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var vwEndTime: UIView! {
        didSet {
            self.vwEndTime.layer.borderColor = UIColor(red: 0.075, green: 0.216, blue: 0.271, alpha: 1.0).cgColor
            self.vwEndTime.layer.borderWidth = 0.4
            self.vwEndTime.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var lblStartDate: UILabel!
    @IBOutlet weak var lblStartTime: UILabel!
        
    @IBOutlet weak var lblEndDate: UILabel!
    @IBOutlet weak var lblEndTime: UILabel!
    
    @IBOutlet weak var vwRepeate: UIView! {
        didSet {
            vwRepeate.layer.cornerRadius = 12
        }
    }
    
    @IBOutlet weak var ConstTopRepeate: NSLayoutConstraint!
    @IBOutlet weak var ConstvwRepatHeight: NSLayoutConstraint!
    @IBOutlet weak var ConstBottomRepeat: NSLayoutConstraint! {
        didSet {
            ConstBottomRepeat.constant = 24
        }
    }
    
    @IBOutlet weak var vwTimePicker: UIView!
    @IBOutlet weak var lblRepeate: UILabel!
    
    @IBOutlet weak var vwMap: UIView! {
        didSet {
            vwMap.isHidden = true
            HeightMainLocation.constant = 80
            HeightSubLocation.constant = 0
            vwMainElecTopConstrain.constant = 24
        }
    }
    @IBOutlet weak var vwlLocationWithName: UIView!
    @IBOutlet weak var lblLocationPlace: UILabel!
    
    @IBOutlet weak var tblRecentSearch: UITableView! {
        didSet {
            self.tblRecentSearch.register(UINib(nibName: "RecentSearchCell", bundle: nil), forCellReuseIdentifier: "Cell")
            self.tblRecentSearch.dataSource = self
            self.tblRecentSearch.delegate = self
        }
    }
    
    @IBOutlet weak var btnMapDropDown: UIButton!
    @IBOutlet weak var vwSetLoation: UIView!
    @IBOutlet weak var vwBottomline: UIView!
    @IBOutlet weak var vwBottomLineSearch: UIView!
    
    @IBOutlet weak var vwMapOpen: UIView! {
        didSet {
            vwMapOpen.layer.cornerRadius = 12
        }
    }
    
    @IBOutlet weak var Map: MKMapView! {
        didSet {
            Map.layer.cornerRadius = 12
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    @IBOutlet weak var vwSearchMap: UIView! {
        didSet {
            vwSearchMap.layer.cornerRadius = 12
        }
    }
    
    @IBOutlet weak var vwMainLocation: UIView!
    @IBOutlet weak var TFSearchLoaction: UITextField! {
        didSet {
            TFSearchLoaction.delegate = self
        }
    }
    
    @IBOutlet weak var HeightMainLocation: NSLayoutConstraint!
    @IBOutlet weak var HeightSubLocation: NSLayoutConstraint!
    
    @IBOutlet weak var vwMainElectricity: UIView!
    
    @IBOutlet weak var vwSubElecticity: UIView!
    @IBOutlet weak var vwSetAmount: UIStackView!
    @IBOutlet weak var vwBottomSetAmount: UIView!
    @IBOutlet weak var vwBottomSetAmount1: UIView!
    
    @IBOutlet weak var vwChargingPoint: UIView! {
        didSet {
            vwChargingPoint.layer.cornerRadius = 8
        }
    }
    
    @IBOutlet weak var btnChargingDropDown: UIButton!
    @IBOutlet weak var vwSetAmounCharge: UIView!
    @IBOutlet weak var lblKMCharge: UILabel!
    
    @IBOutlet weak var SliderAmount: UISlider! {
        didSet {
            SliderAmount.setThumbImage(UIImage(named: "ic_ThumbSlider"), for: .normal)
        }
    }
    
    @IBOutlet weak var btnRequestCharge: UIButton! {
        didSet {
            btnRequestCharge.layer.cornerRadius = 12
        }
    }
    
    @IBOutlet weak var vwMainElecTopConstrain: NSLayoutConstraint!
    
    @IBOutlet weak var vwCarReady: UIView! {
        didSet {
            vwCarReady.isHidden = true
        }
    }
    
    
    //MARK: - Variable
    private let timePickerView = TimePickerView()
    private var originalView: UIView?
    var isSelectecd = false
    var isbuttonSelected = false
    var isLocationSelected = false
    var isAmountSelected = false
    var isEndDateSeleted = false
    var selectedDurationStartTime = Date()
    var selectedDurationEndTime = Date()
    var locationManager = CLLocationManager()
    var geocoder = CLGeocoder()
    
    //MARK: - ViewLifeCycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupInitial()
        addPOI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        locationManager.startUpdatingLocation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        locationManager.stopUpdatingLocation()
    }
    
    //MARK: -  Search location
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            TFSearchLoaction.resignFirstResponder()
            if let locationText = TFSearchLoaction.text {
                geocodeLocation(locationText)
            }
            return true
        }
    
    func geocodeLocation(_ location: String) {
            geocoder.geocodeAddressString(location) { (placemarks, error) in
                if let error = error {
                    print("Geocode error: \(error.localizedDescription)")
                    return
                }
                
                if let placemark = placemarks?.first,
                   let location = placemark.location {
                    
                    self.Map.removeAnnotations(self.Map.annotations)
                    
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = location.coordinate
                    annotation.title = placemark.name
                    self.Map.addAnnotation(annotation)
                    
                    let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                    self.Map.setRegion(region, animated: true)
                }
            }
        }
    
        
    //MARK: - Location Manager Delegate Methods
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            if status == .authorizedWhenInUse {
                Map.showsUserLocation = true
                Map.userTrackingMode = .follow
            }
        }

        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let userLocation = locations.first {
                let region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
                Map.setRegion(region, animated: true)
            }
        }
    
    func addPOI() {
            let poiCoordinate = CLLocationCoordinate2D(latitude: 21.2335, longitude: 72.8636)
            let poiAnnotation = MKPointAnnotation()
            poiAnnotation.coordinate = poiCoordinate
            poiAnnotation.title = ""
            poiAnnotation.subtitle = "Apple Campus, Cupertino"
            Map.addAnnotation(poiAnnotation)
        }
    
    @objc func timePickerValueChanged() {
        let dateFormatter = Date()
        let selectedTime = timePicker.date
        
        self.selectedDurationStartTime = dateFormatter
        lblStartTime.text = getStringFromDate(date: selectedTime, format: "HH : mm")
    }
    
    @objc func timePickerValueChanged1() {
        let dateFormatter = Date()
        let selectedTime1 = EndTimePicker.date
        
        self.selectedDurationEndTime = dateFormatter
        lblEndTime.text = getStringFromDate(date: selectedTime1, format: "HH : mm")
    }
    
    func setupInitial() {
        let currentDate = Date()
        
        self.selectedDurationStartTime = currentDate
        self.lblStartTime.text = getStringFromDate(date: currentDate, format: "HH:mm")
        self.selectedDurationEndTime = currentDate.addHour(n: 1)
        self.lblEndTime.text = getStringFromDate(date: currentDate.addHour(n: 1), format: "HH:mm")
    }
    
    //MARK: - IBAction

    @IBAction func btnSelectlocation(_ sender: UIButton) {
        
        let address = "Silver Business Point"
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            if let error = error {
                print("Geocoding error: \(error.localizedDescription)")
                return
         }
            if let placemark = placemarks?.first,
                let location = placemark.location {
                let destination = MKMapItem(placemark: MKPlacemark(placemark: placemark))
                destination.name = address
                let options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
                destination.openInMaps(launchOptions: options)
            } else {
                print("Location not found.")
            }
        }
    }
    
    
    @IBAction func btnCarAvailableDropDwonClick(_ sender: UIButton) {
        isSelectecd.toggle()
        if isSelectecd  {
            self.vwCalender.isHidden = false
            self.btnDropDown.setImage(UIImage(named: "Arrow_Up"), for: .normal)
            ConstvwDateTop1.constant = 24
            ConstvcCalender.constant = 154
            ConstBottomRepeat.constant = 24
        } else {
            self.vwCalender.isHidden = true
            self.btnDropDown.setImage(UIImage(named: "Arrow_Down"), for: .normal)
            timePickerView.isHidden = true
            timePicker.isHidden = true
            EndTimePicker.isHidden = true
            ConstvwDateTop1.constant = 4
            ConstvcCalender.constant = 0
            ConstBottomRepeat.constant = 24
            ConstTimePicker.constant = 0
            vwRepeate.isHidden = true
            
        }
         
    }
  
    @IBAction func BackButtonClick(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnDeleteClick(_ sender: UIButton) {
        
    }
    
    @IBAction func btnStartTimeClick(_ sender: UIButton) {
        isbuttonSelected.toggle()
        if isbuttonSelected {
            ConstTimePicker.constant = 190
            ConstvwRepatHeight.constant = 36
            ConstTopRepeate.constant = 24
            vwMainTimePicker.isHidden = false
            timePickerView.isHidden = false
            vwTimePicker.isHidden = false
            vwRepeate.isHidden = false
            timePicker.isHidden = false
            EndTimePicker.isHidden = true
            self.vwStartTime.layer.borderColor = UIColor(red: 0.251, green: 0.714, blue: 0.902, alpha: 1.0).cgColor
            self.vwStartTime.layer.backgroundColor = UIColor(red: 0.075, green: 0.216, blue: 0.271, alpha: 1.0).cgColor
            
            vwEndTime.layer.borderColor = UIColor(red: 0.075, green: 0.216, blue: 0.271, alpha: 1.0).cgColor
            vwEndTime.layer.backgroundColor = UIColor.clear.cgColor
            
            timePicker.datePickerMode = .time
            timePicker.addTarget(self, action: #selector(timePickerValueChanged), for: .valueChanged)

        } else {
            ConstTimePicker.constant = 0
            ConstvwRepatHeight.constant = 0
            ConstTopRepeate.constant = 0
            ConstBottomRepeat.constant = 0
            
            vwStartTime.layer.borderColor = UIColor(red: 0.075, green: 0.216, blue: 0.271, alpha: 1.0).cgColor
            vwStartTime.layer.backgroundColor = UIColor.clear.cgColor
            
            vwTimePicker.isHidden = true
            timePickerView.isHidden = true
            vwRepeate.isHidden = true
            timePicker.isHidden = true
            EndTimePicker.isHidden = true
            timePicker.addTarget(self, action: #selector(timePickerValueChanged1), for: .valueChanged)
        }
        
    }
    
    @IBAction func btnEndTimeClick(_ sender: UIButton) {
        isEndDateSeleted.toggle()
        if isEndDateSeleted {
            ConstTimePicker.constant = 190
            ConstvwRepatHeight.constant = 36
            ConstTopRepeate.constant = 24
            vwMainTimePicker.isHidden = false
            timePickerView.isHidden = false
            vwTimePicker.isHidden = false
            vwRepeate.isHidden = false
            timePicker.isHidden = true
            EndTimePicker.isHidden = false
            
            
            self.vwEndTime.layer.borderColor = UIColor(red: 0.251, green: 0.714, blue: 0.902, alpha: 1.0).cgColor
            self.vwEndTime.layer.backgroundColor = UIColor(red: 0.075, green: 0.216, blue: 0.271, alpha: 1.0).cgColor
            
            vwStartTime.layer.borderColor = UIColor(red: 0.075, green: 0.216, blue: 0.271, alpha: 1.0).cgColor
            vwStartTime.layer.backgroundColor = UIColor.clear.cgColor
            
            EndTimePicker.datePickerMode = .time
            EndTimePicker.addTarget(self, action: #selector(timePickerValueChanged1), for: .valueChanged)
            
        } else {
            
            ConstTimePicker.constant = 0
            ConstvwRepatHeight.constant = 0
            ConstTopRepeate.constant = 0
            ConstBottomRepeat.constant = 0
            
            vwEndTime.layer.borderColor = UIColor(red: 0.075, green: 0.216, blue: 0.271, alpha: 1.0).cgColor
            vwEndTime.layer.backgroundColor = UIColor.clear.cgColor
            
            vwTimePicker.isHidden = true
            timePickerView.isHidden = true
            vwRepeate.isHidden = true
            timePicker.isHidden = true
            EndTimePicker.isHidden = true
            
            timePicker.addTarget(self, action: #selector(timePickerValueChanged), for: .valueChanged)

        }
        
    }
    
    @IBAction func btnLocationDropDowm(_ sender: UIButton) {
        isLocationSelected.toggle()
        if isLocationSelected {
            vwSetLoation.isHidden = true
            vwBottomline.isHidden = true
            self.btnMapDropDown.setImage(UIImage(named: "Arrow_Up"), for: .normal)
            
            vwMap.isHidden = false
            Map.isHidden = false
            Map.showsUserLocation = true
            HeightSubLocation.constant = 397
            vwMainElecTopConstrain.constant = 400
        } else {
            vwSetLoation.isHidden = false
            vwBottomline.isHidden = false
            self.btnMapDropDown.setImage(UIImage(named: "Arrow_Down"), for: .normal)
            vwMap.isHidden = true
            vwMainLocation.heightAnchor.constraint(equalToConstant: 80).isActive = true
                
            HeightSubLocation.constant = 0
            vwMainElecTopConstrain.constant = 24
        }
    }
    
    @IBAction func btnElecticityDropDown(_ sender: UIButton) {
        isAmountSelected.toggle()
        if isAmountSelected {
            vwSetAmounCharge.isHidden = false
            vwSetAmount.isHidden = true
            vwBottomSetAmount.isHidden = true
            self.btnChargingDropDown.setImage(UIImage(named: "Arrow_Up"), for: .normal)
            self.btnRequestCharge.backgroundColor = UIColor(red: 0.251, green: 0.714, blue: 0.902, alpha: 1)
            
            vwCarReady.isHidden = false
            
        } else {
            vwSetAmounCharge.isHidden = true
            vwSetAmount.isHidden = false
            vwBottomSetAmount.isHidden = false
            self.btnChargingDropDown.setImage(UIImage(named: "Arrow_Down"), for: .normal)
            self.btnRequestCharge.backgroundColor = UIColor(red: 0.251, green: 0.714, blue: 0.902, alpha: 0.3)
            
            vwCarReady.isHidden = true
        }
        
    }
    
    
    @IBAction func btnSearchLocationClick(_ sender: UIButton) {
        
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RecentSearchCell
        
        self.configCell(cell, indexPath: indexPath)
        return cell
    }
    
    
    func configCell(_ cell: RecentSearchCell, indexPath: IndexPath) {
        if indexPath.row == 1 {
            cell.lblLocation.text = "Lhotákova 33, Praha 8"
            cell.lblRecentDay.text = "2 days ago"
        }
        
        if indexPath.row == 2 {
            cell.lblLocation.text = "Joos van Hadrangardeen 312,"
            cell.lblRecentDay.text = "a week ago"
        }
    }
}
