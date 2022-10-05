//
//  ViewController.swift
//  Custom Calender
//
//  Created by Vinay Dadwal on 05/10/22.
//

import UIKit

class CalendarViewVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lbDateRange: UILabel!
    @IBOutlet weak var lbWeekDay1: UILabel!
    @IBOutlet weak var lbWeekDay2: UILabel!
    @IBOutlet weak var lbWeekDay3: UILabel!
    @IBOutlet weak var lbWeekDay4: UILabel!
    @IBOutlet weak var lbWeekDay5: UILabel!
    @IBOutlet weak var lbWeekDay6: UILabel!
    @IBOutlet weak var lbWeekDay7: UILabel!
    @IBOutlet weak var lbWeekDate1: UILabel!
    @IBOutlet weak var lbWeekDate2: UILabel!
    @IBOutlet weak var lbWeekDate3: UILabel!
    @IBOutlet weak var lbWeekDate4: UILabel!
    @IBOutlet weak var lbWeekDate5: UILabel!
    @IBOutlet weak var lbWeekDate6: UILabel!
    @IBOutlet weak var lbWeekDate7: UILabel!
    
    //MARK: - Variables
    var selectedDate: Date?
    var calendar = Calendar.current
    
    private lazy var dateFormat: DateFormatter = {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        return dateFormat
    }()
    
    //MARK: Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        selectedDate = Date()
        
        calendar.locale      = Locale(identifier: "en_US_POSIX")
        calendar.timeZone    = TimeZone(identifier: "UTC")!
        
        setDates()
        dateColor(value: 0)
        setTitleDate()
    }
    
    //MARK: - Button Actions
    @IBAction func btRight(_ sneder: UIButton) {
        selectedDate = nextDate(value: 6)
        setDates()
        setTitleDate()
        dateColor(value: 0)
    }
    
    @IBAction func btLeft(_ sneder: UIButton) {
        selectedDate = nextDate(value: -6)
        setDates()
        setTitleDate()
        dateColor(value: 0)
    }
    
    @IBAction func btSelectDate(_ sender: UIButton) {
        dateColor(value: sender.tag)
    }
    
    //MARK: - Functions
    private func setDates() {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd"
        let dayFormat = DateFormatter()
        dayFormat.dateFormat = "EEE"
        
        for i in 0...6 {
            let mDate = self.nextDate(value: i)
            switch i {
            case 0:
                lbWeekDate1.text = dateFormat.string(from: mDate)
                lbWeekDay1.text = dayFormat.string(from: mDate)
                break
            case 1:
                lbWeekDate2.text = dateFormat.string(from: mDate)
                lbWeekDay2.text = dayFormat.string(from: mDate)
                break
            case 2:
                lbWeekDate3.text = dateFormat.string(from: mDate)
                lbWeekDay3.text = dayFormat.string(from: mDate)
                break
            case 3:
                lbWeekDate4.text = dateFormat.string(from: mDate)
                lbWeekDay4.text = dayFormat.string(from: mDate)
                break
            case 4:
                lbWeekDate5.text = dateFormat.string(from: mDate)
                lbWeekDay5.text = dayFormat.string(from: mDate)
                break
            case 5:
                lbWeekDate6.text = dateFormat.string(from: mDate)
                lbWeekDay6.text = dayFormat.string(from: mDate)
                break
            case 6:
                lbWeekDate7.text = dateFormat.string(from: mDate)
                lbWeekDay7.text = dayFormat.string(from: mDate)
                break
            default:
                break
            }
        }
    }
    
    private func setTitleDate() {
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = "dd MMM"
        let startDate = dateFormate.string(from: selectedDate!)
        dateFormate.dateFormat = "dd MMM yyyy"
        let endDate = dateFormate.string(from: nextDate(value:6))
        lbDateRange.text = "\(startDate) - \(endDate)"
    }
    
    private func dateColor(value: Int) {
        if #available(iOS 13.0, *) {
            lbWeekDay1.textColor = UIColor.darkGray
            lbWeekDay2.textColor = UIColor.darkGray
            lbWeekDay3.textColor = UIColor.darkGray
            lbWeekDay4.textColor = UIColor.darkGray
            lbWeekDay5.textColor = UIColor.darkGray
            lbWeekDay6.textColor = UIColor.darkGray
            lbWeekDay7.textColor = UIColor.darkGray
            lbWeekDate1.textColor = UIColor.label
            lbWeekDate2.textColor = UIColor.label
            lbWeekDate3.textColor = UIColor.label
            lbWeekDate4.textColor = UIColor.label
            lbWeekDate5.textColor = UIColor.label
            lbWeekDate6.textColor = UIColor.label
            lbWeekDate7.textColor = UIColor.label
        } else {
            lbWeekDay1.textColor = UIColor.darkGray
            lbWeekDay2.textColor = UIColor.darkGray
            lbWeekDay3.textColor = UIColor.darkGray
            lbWeekDay4.textColor = UIColor.darkGray
            lbWeekDay5.textColor = UIColor.darkGray
            lbWeekDay6.textColor = UIColor.darkGray
            lbWeekDay7.textColor = UIColor.darkGray
            lbWeekDate1.textColor = UIColor.black
            lbWeekDate2.textColor = UIColor.black
            lbWeekDate3.textColor = UIColor.black
            lbWeekDate4.textColor = UIColor.black
            lbWeekDate5.textColor = UIColor.black
            lbWeekDate6.textColor = UIColor.black
            lbWeekDate7.textColor = UIColor.black
        }
        
        switch value {
        case 0:
            lbWeekDate1.textColor = .blue
            lbWeekDay1.textColor = .blue
            break
        case 1:
            lbWeekDate2.textColor = .blue
            lbWeekDay2.textColor = .blue
            break
        case 2:
            lbWeekDate3.textColor = .blue
            lbWeekDay3.textColor = .blue
            break
        case 3:
            lbWeekDate4.textColor = .blue
            lbWeekDay4.textColor = .blue
            break
        case 4:
            lbWeekDate5.textColor = .blue
            lbWeekDay5.textColor = .blue
            break
        case 5:
            lbWeekDate6.textColor = .blue
            lbWeekDay6.textColor = .blue
            break
        case 6:
            lbWeekDate7.textColor = .blue
            lbWeekDay7.textColor = .blue
            break
        default:
            break
        }
    }
}

extension CalendarViewVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        23
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalendarTVCell", for: indexPath) as! CalendarTVCell
//        cell.lbTime.font = Font(.installed(.PoppinsRegular), size: .standard(.h5)).instance
//        cell.lbAvailable.font = Font(.installed(.PoppinsMedium), size: .standard(.h3)).instance
//        cell.lbClientName.font = Font(.installed(.PoppinsSemiBold), size: .standard(.h4)).instance
//        cell.lbSessionTime.font = Font(.installed(.PoppinsRegular), size: .standard(.h4)).instance
        
        var index = indexPath.row + 1
        if index > 12 {
            index = index - 12
            cell.lbTime.text = "\(index):00 PM"
        }
        else {
            cell.lbTime.text = "\(index):00 AM"
        }
        
        cell.viewBookSessionColor.isHidden = true
        cell.lbAvailable.isHidden = false
        cell.lbAvailable.text = "Not Available"
        cell.viewColorBar.backgroundColor = .systemRed
        
//        for model in calendarData?.customTiming ?? [] {
//            var timeString = model.startTime?.split(separator: ":")
//            let startHour = Int("\(timeString?[0] ?? "0")") ?? 0
//
//            timeString = model.endTime?.split(separator: ":")
//            let endHour = Int("\(timeString?[0] ?? "0")") ?? 0
//
//            if indexPath.row >= (startHour - 1) && indexPath.row <= (endHour - 1) {
//                cell.viewBookSessionColor.isHidden = true
//                cell.lbAvailable.isHidden = false
//                cell.lbAvailable.text = "Available"
//                cell.viewColorBar.backgroundColor = UIColor.systemYellow
//            }
//        }
        
//        for model in calendarData?.calendarSession ?? [] {
//            let timeString = model.time?.split(separator: ":")
//            let startHour = Int("\(timeString?[0] ?? "0")") ?? 0
//            let minute = Int("\(timeString?[1] ?? "0")") ?? 0
//
//            if indexPath.row >= (startHour - 1) && indexPath.row < startHour {
//                cell.lbAvailable.isHidden = false
//                cell.viewBookSessionColor.isHidden = false
//                cell.viewBookSessionColor.backgroundColor = UIColor(named: "Bell_icon")
//                let startTime = time(dateAsString: "\(startHour):\(minute):00")
//                let endTime = time(dateAsString: "\(startHour + 1):\(minute):00")
//
//                cell.lbSessionTime.text = "\(startTime) - \(endTime)"
//                cell.lbClientName.text = model.user
//            }
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension CalendarViewVC {
    func nextDate(value: Int) -> Date {
        var dayComponent        = DateComponents()
        dayComponent.day        = value
        let nextDate            = calendar.date(byAdding: dayComponent, to: selectedDate!)
        return nextDate!
    }
    
    func time(dateAsString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let date = dateFormatter.date(from: dateAsString)
        dateFormatter.dateFormat = "hh:mm a"
        let startTime = dateFormatter.string(from: date ?? Date())
        return startTime
    }
}
