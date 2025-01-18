import SwiftUI

struct CalendarView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedDate: Date
    let onDateSelected: (Date) -> Void
    
    var body: some View {
        DatePicker(
            "Select Date",
            selection: $selectedDate,
            displayedComponents: [.date]
        )
        .datePickerStyle(.graphical)
        .onChange(of: selectedDate) { _, newDate in
            onDateSelected(newDate)
            dismiss()
        }
        .presentationDetents([.medium])
        .padding()
    }
} 