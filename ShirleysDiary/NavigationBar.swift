import SwiftUI

struct NavigationBar: View {
    let showNewEntry: () -> Void
    @State private var showingCalendar = false
    @State private var selectedDate = Date()
    @State private var navigateToDayView = false
    
    var body: some View {
        HStack {
            Button(action: {
                // Home action
            }) {
                VStack {
                    Image(systemName: "house.fill")
                    Text("Home")
                        .font(.caption)
                }
            }
            
            Spacer()
            
            Button(action: {
                // Search action
            }) {
                VStack {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                        .font(.caption)
                }
            }
            
            Spacer()
            
            Button(action: {
                showNewEntry()
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 44))
                    .foregroundColor(.blue)
            }
            
            Spacer()
            
            Button(action: {
                showingCalendar = true
            }) {
                VStack {
                    Image(systemName: "calendar")
                    Text("Calendar")
                        .font(.caption)
                }
            }
            .sheet(isPresented: $showingCalendar) {
                CalendarView(
                    selectedDate: $selectedDate,
                    onDateSelected: { date in
                        selectedDate = date
                        showingCalendar = false
                        navigateToDayView = true
                    }
                )
            }
            .navigationDestination(isPresented: $navigateToDayView) {
            }
            
            Spacer()
            
            Button(action: {
                // Profile action
            }) {
                VStack {
                    Image(systemName: "person.fill")
                    Text("Profile")
                        .font(.caption)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.bottom)
        .background(.ultraThinMaterial)
    }
} 
