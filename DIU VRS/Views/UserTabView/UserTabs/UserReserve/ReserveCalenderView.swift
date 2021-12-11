//
//  ReserveCalenderView.swift
//  DIU VRS
//
//  Created by Fahim Rahman on 12/11/21.
//

import SwiftUI

// MARK: - Enum Field
private enum Field: Hashable {
    case name, phone
}

struct ReserveCalenderView: View {
    
    // Properties
    @ObservedObject var venueIdSelection: VenueIdSelection
    @State var currentDate: Date = Date()
    @State private var currentMonth: Int = 0
    @State private var selectedDate: Int = Int()
    @State private var getReservationModel = GetReservationModel()
    @ObservedObject var reserveVenueCredentials: ReserveVenueCredentials
    @FocusState private var focusedField: Field?
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 7)
    private let days: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    @State private var bookedDatesForCurrentMonth: [Int] = [Int]()
    @State private var bookedDatesForNextMonth: [Int] = [Int]()

    
    var body: some View {
        // navigation
        NavigationView {
            // scrollView
            ScrollView(.vertical, showsIndicators: false) {
                // vstack
                VStack(spacing: 35) {
                    // hstack
                    HStack(spacing: 20) {
                        // vstack
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text(extraDate().first!)
                                .font(.caption)
                                .fontWeight(.semibold)
                            
                            Text(extraDate().last!)
                                .font(.title)
                                .fontWeight(.bold)
                            
                        } //: vstack
                        
                        Spacer()
                        
                        // button
                        Button {
                            self.currentMonth = 0
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(Font.title.weight(.semibold))
                                .foregroundColor(.indigo)
                        } //: button
                        .padding(.horizontal, 5)
                        
                        
                        // button
                        Button {
                            self.currentMonth = 1
                        } label: {
                            Image(systemName: "chevron.right")
                                .font(Font.title.weight(.semibold))
                                .foregroundColor(.indigo)
                        } //: button
                        .padding(.horizontal, 5)
                        
                        
                    } //: hstack
                    .padding(.horizontal)
                    
                    // hstack
                    HStack(spacing: 0) {
                        // foreach
                        ForEach(days, id: \.self) { day in
                            Text(day)
                                .font(.callout)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                        } //: foreach
                    } //: hstack
                    
                    
                    // vgrid
                    LazyVGrid(columns: columns, spacing: 15) {
                        // foreach
                        ForEach(extractDate()) { value in
                            cardView(value: value)
                                .background(
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 8, height: 8)
                                        .offset(x: 0, y: 15)
                                        .opacity(getBookedDatesForSelectedMonth().contains(value.day) ? 0.7 : 0)
                                )
                            
                        } //: foreach
                    } //: vgrid
                    
                    Spacer()
                    
                    // group box
                    GroupBox {
                        // vstack
                        VStack {
                            // hstack
                            HStack {
                                // icon
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .foregroundColor(.customGreen)
                                    .frame(width: 25, height: 25)
                                
                                // text input field
                                TextField("Name", text: $reserveVenueCredentials.name)
                                    .padding([.top, .bottom, .trailing], 20)
                                    .padding(.leading, 10)
                                    .keyboardType(.emailAddress)
                                    .focused($focusedField, equals: .name)
                                
                            } //: hstack
                            .padding(.top, 0)
                            
                            // hstack
                            HStack {
                                // icon
                                Image(systemName: "phone.fill")
                                    .resizable()
                                    .foregroundColor(.customGreen)
                                    .frame(width: 20, height: 26)
                                
                                // text input field
                                TextField("Phone", text: $reserveVenueCredentials.phone)
                                    .padding([.top, .bottom, .trailing], 20)
                                    .padding(.leading, 15)
                                    .keyboardType(.namePhonePad)
                                    .focused($focusedField, equals: .phone)
                                    
                            } //: hstack
                            .padding(.bottom, 0)
                            
                            
                            ReserveVenueButtonView(reserveVenueCredentials: reserveVenueCredentials, date: $selectedDate, month: $currentMonth, venueId: $venueIdSelection.venueId)
                                .padding()
                            
                            
                        } //: vstack
                        .task  {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                self.focusedField = .name
                            } //: DispatchQueue
                        } //: task
                    } //: group box
                    .padding([.leading, .trailing], 10)
                    
                } //: vstack
                .onChange(of: currentMonth) { newValue in
                    // updating month
                    self.currentDate = getCurrentMonth()
                }
            } //: scroll view
            .clipped()
            .navigationBarHidden(true)
            .navigationBarTitleDisplayMode(.inline)
        } //: navigation
        .task {
            print(venueIdSelection.venueId)
            
            Networking.getRequest(url: URL.getReservationsURL(venueId: venueIdSelection.venueId), expecting: GetReservationModel.self) { result in
                do {
                    try self.getReservationModel = result.get()
                    
                    if self.getReservationModel.data != nil {
                        
                        for i in 0..<((self.getReservationModel.data?.count)!) {
                            if self.getReservationModel.data?[i].month == 0 {
                                // append current month
                                if (self.getReservationModel.data?[i].morning)! && (self.getReservationModel.data?[i].allDay)! && (self.getReservationModel.data?[i].afternoon)! {
                                    
                                    self.bookedDatesForCurrentMonth.append((self.getReservationModel.data?[i].date)!)
                                }
                            }
                            else {
                                // append next month
                                if (self.getReservationModel.data?[i].morning)! && (self.getReservationModel.data?[i].allDay)! && (self.getReservationModel.data?[i].afternoon)! {
                                    
                                    self.bookedDatesForNextMonth.append((self.getReservationModel.data?[i].date)!)
                                }
                            }
                        }
                    }
                    
                } catch {
                    print(error)
                }
            }
        } //: task
    }
    
    @ViewBuilder func cardView(value: DateValueModel) -> some View {
        // vstack
        VStack {
            if value.day != -1 {
                Text("\(value.day)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(self.selectedDate == value.day && !getBookedDatesForSelectedMonth().contains(self.selectedDate) ? .red : .black)
                    .background(
                        Capsule()
                            .fill(Color.yellow)
                            .frame(width: 35, height: 55)
                            .frame(maxWidth: .infinity)
                            .opacity(Date.getCurrentDate() == String(value.day) && currentMonth == 0 ? 0.3 : 0)
                    )
                    .onTapGesture {
                        if !getBookedDatesForSelectedMonth().contains(value.day) {
                            self.selectedDate = value.day
                            print(self.selectedDate)
                        }
                    }
            }
            
        } //: vstack
        .padding(.vertical, 8)
        .frame(height: 45, alignment: .top)
    }
    
    
    // get current month
    func getCurrentMonth() -> Date {
        let calender = Calendar.current
        
        // getting current month
        guard let currentMonth = calender.date(byAdding: .month, value: self.currentMonth, to: Date()) else { return Date() }
        
        return currentMonth
    }
    
    
    // extract year and month
    func extraDate() -> [String] {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        let date = formatter.string(from: self.currentDate)
        return date.components(separatedBy: " ")
    }
    
    
    // extract date
    func extractDate() -> [DateValueModel] {
        
        let calender = Calendar.current
        
        // getting current month
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDatesFromCurrentMonth().compactMap { date -> DateValueModel in
            
            // getting day
            let day = calender.component(.day, from: date)
            
            return DateValueModel(day: day, date: date)
        }
        
        // adding offset days to get exact week day
        let firstWeekDay = calender.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekDay - 1 {
            days.insert(DateValueModel(day: -1, date: Date()), at: 0)
        }
        
        return days
    }
    
    // get days from current month
    func getBookedDatesForSelectedMonth() -> [Int] {
        
        var dates: [Int] = [Int]()
        
        for value in extractDate() {
            if value.day != -1 {
                dates.append(value.day)
            }
        }
        
        if currentMonth == 0 {
            return dates.filter { bookedDatesForCurrentMonth.contains($0) }
        }
        else {
            return dates.filter { bookedDatesForNextMonth.contains($0) }
        }
    }
}



extension Date {
    
    // get current the dates from current month
    func getAllDatesFromCurrentMonth() -> [Date] {
        let calender = Calendar.current
        
        let startDate = calender.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        let range = calender.range(of: .day, in: .month, for: startDate)!
        
        return range.compactMap({ day -> Date in
            return calender.date(byAdding: .day, value: day - 1, to: startDate)!
        })
    }
    
    // get current date
    static func getCurrentDate() -> String {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd"
        
        return dateFormatter.string(from: Date())
    }
}




struct ReserveCalenderView_Previews: PreviewProvider {
    static var previews: some View {
        ReserveCalenderView(venueIdSelection: .init(), reserveVenueCredentials: ReserveVenueCredentials.init())
    }
}
