//
//  CalanderVC.swift
//  Nimbee
//
//  Created by iMac on 28/07/23.
//

import UIKit
import EventKit
import EventKitUI
import CalendarKit
import ECWeekView
import SwiftDate
import QVRWeekView


class CalanderVC: UIViewController{
    
    //MARK: - IBOutlet

    @IBOutlet weak var lblHeader: UILabel!
    
    @IBOutlet weak var vwPlus: UIView! {
        didSet {
            self.vwPlus.layer.cornerRadius = vwPlus.frame.height/2
        }
    }
    
    @IBOutlet weak var tblCal: UITableView! {
        didSet {
            tblCal.dataSource = self
            tblCal.delegate = self
            self.tblCal.register(UINib(nibName: "TVTime", bundle: nil), forCellReuseIdentifier: "Cell")
        }
    }
    
    @IBOutlet weak var cvCal: UICollectionView! {
        didSet {
            cvCal.dataSource = self
            cvCal.delegate = self
            self.cvCal.register(UINib(nibName: "CVCalendar", bundle: nil), forCellWithReuseIdentifier: "Cell")
        }
    }
    
    @IBOutlet weak var weekview: WeekView!
    
    //MARK: - Variable
       let currentDate = Date()
       let calendar = Calendar.current
       var dates: [Date] = []
       var timeArray: [Date] = []

  //  var time = ["00:00","01:00","02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00"]
    var currentTimeIndex: Int = 0
    
    private let eventDetailLauncher = EventDetailLauncher()
    let viewModel = DefaultViewModel()

    let eventStore = EKEventStore()
    var weekView: WeekView!
    var events: [YourEventModel] = []
    
    //MARK: - ViewLifeCycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
      //  weekview.delegate = self
        
        weekview.mainBackgroundColor = UIColor.clear
        weekview.todayViewColor = UIColor.clear
        weekview.visibleDaysInPortraitMode = 1
        weekview.defaultTopBarHeight = 0
        weekview.defaultDayViewColor = UIColor.clear
        weekview.passedDayViewColor = UIColor.clear
        weekview.weekendDayViewColor = UIColor.clear
        weekview.dayViewDashedSeparatorColor = UIColor.clear
        weekview.dayViewHourIndicatorColor = UIColor(red: 0.251, green: 0.714, blue: 0.902, alpha: 1.0)
        weekview.dayViewHourIndicatorThickness = 1
        weekview.hourLabelTextColor = UIColor.gray
        weekview.hourLabelDateFormat = "HH:mm"
        
        tblCal.reloadData()
        setupDates()
    }
    
    func dayViewDidSelectEventView(_ eventView: EventView) {
        
    }
    
    func weekView(_ weekView: WeekView, didSelectEvent event: Event) {
           let eventData = event
           if let nextViewController = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
               navigationController?.pushViewController(nextViewController, animated: true)
           }
       }
    
          private func setupDates() {
                let numberOfDaysToShow = 88400
                var dateComponent = DateComponents()
                dateComponent.day = 1

                var currentDate = self.currentDate
                for _ in 0..<numberOfDaysToShow {
                    dates.append(currentDate)
                    currentDate = calendar.date(byAdding: dateComponent, to: currentDate)!
                }
                cvCal.reloadData()
            }
    
    func addEventToCalendar(title: String, description: String?, startDate: Date, endDate: Date, completion: ((_ success: Bool, _ error: NSError?) -> Void)? = nil) {

        let eventStore = EKEventStore()

         eventStore.requestAccess(to: .event, completion: { (granted, error) in
            if (granted) && (error == nil) {
               let event = EKEvent(eventStore: eventStore)
               event.title = title
               event.startDate = startDate
               event.endDate = endDate
               event.notes = description
            
               event.calendar = eventStore.defaultCalendarForNewEvents
               do {
                   try eventStore.save(event, span: .thisEvent)
               } catch let e as NSError {
                   completion?(false, e)
                   return
               }
               completion?(true, nil)
            } else {
               completion?(false, error as NSError?)
            }
        })
    }
    
    // MARK: - IBAction

    @IBAction func btnPlusClick(_ sender: UIButton) {
        let vc: ViewController = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - ECWeekViewDataSource

extension CalanderVC: ECWeekViewDataSource {
    func weekViewGenerateEvents(_ weekView: ECWeekView, date: DateInRegion, eventCompletion: @escaping ([ECWeekViewEvent]?) -> Void) -> [ECWeekViewEvent]? {
            let lunchStart = date.dateBySet(hour: 10, min: 0, secs: 0)!
            let lunchEnd = date.dateBySet(hour: 15, min: 0, secs: 0)!
            let lunch = ECWeekViewEvent(title: "Schedule Charge", subtitle: "Select Time", start: lunchStart, end: lunchEnd)

            DispatchQueue.global(qos: .background).async {
                eventCompletion([lunch])
            }
            return nil
        }
}

// MARK: - ECWeekViewDelegate

extension CalanderVC: ECWeekViewDelegate {
    func weekViewDidClickOnEvent(_ weekView: ECWeekView, event: ECWeekViewEvent, view: UIView) {
        eventDetailLauncher.event = event
        eventDetailLauncher.present()
    }

    func weekViewDidClickOnFreeTime(_ weekView: ECWeekView, date: DateInRegion) {
        print(#function, "date:", date.toString())
    }
}


extension CalanderVC :  UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
  //    return time.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TVTime
//        cell.lblCurrentTime.isHidden = true
//        let currentTime = getCurrentTime()
//        let currentTimeIndex = time.firstIndex(of: currentTime) ?? -1
//
//        if indexPath.row == currentTimeIndex {
//            cell.lblCurrentTime.isHidden = false
//            cell.lblCurrentTime.textColor = UIColor.green
//        } else {
//            cell.lblTime.textColor = UIColor.gray
//        }
//
//        cell.lblTime.text = time[indexPath.row]
        return cell
    }
    
    func getCurrentTime() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.string(from: Date())
        }
}

extension CalanderVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CVCalendar
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        cell.lblDate.text = dateFormatter.string(from: dates[indexPath.item])

        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "E"
        cell.lblDay.text = dayFormatter.string(from: dates[indexPath.item])

        return cell
        
    }
}
