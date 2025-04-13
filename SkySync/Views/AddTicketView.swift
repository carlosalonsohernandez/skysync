//
//  AddTicketView.swift
//  SkySync
//
//  Created by Carlos Hernandez on 3/30/25.
//

import SwiftUI

struct AddTicketView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: TicketViewModel

    // Input state
    @State private var name = ""
    @State private var selectedAirport = ""
    @State private var flight = ""
    @State private var date = Date()
    @State private var seat = ""
    @State private var gate = ""
    @State private var start = ""
    @State private var destination = ""
    @State private var company = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General Details")) {
                    TextField("Name", text: $name)
                    TextField("Company", text: $company)
                }

                Section(header: Text("Flight Details")) {
                    Picker("Airport", selection: $selectedAirport) {
                        if viewModel.availableAirports.isEmpty {
                            Text("No airports available").foregroundColor(.gray)
                        } else {
                            ForEach(viewModel.availableAirports, id: \.self) { airport in
                                Text(airport)
                            }
                        }
                    }
                    TextField("Flight", text: $flight)
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                    TextField("Seat", text: $seat)
                    TextField("Gate", text: $gate)
                }

                Section(header: Text("Route")) {
                    TextField("Start", text: $start)
                    TextField("Destination", text: $destination)
                }

                Section {
                    Button(action: saveTicket) {
                        HStack {
                            Spacer()
                            Text("Submit")
                                .bold()
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Add Ticket")
        }
    }

    private func saveTicket() {
        let newTicket = Ticket(
            name: name,
            airport: selectedAirport,
            flight: flight,
            date: date,
            seat: seat,
            gate: gate,
            start: start,
            destination: destination,
            company: company
        )

        viewModel.addTicket(newTicket)
        dismiss()
    }
}

struct AddTicketView_Previews: PreviewProvider {
    static var previews: some View {
        let previewViewModel = TicketViewModel()
        previewViewModel.availableAirports = ["PHX" ,"JFK", "LAX", "SFO", "ATL"]

        return AddTicketView(viewModel: previewViewModel)
    }
}
