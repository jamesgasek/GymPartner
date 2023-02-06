//
//  WorkoutList.swift
//  GymPartner
//
//  Created by James Gasek on 1/29/23.
//

import Foundation
import SwiftUI

struct WorkoutList: View {
        
    @Binding var Splits: [Workout]
    @State private var toAdd: String = ""
    @State private var isAdding: Bool = false
    
    var body: some View {
            NavigationStack {
                List {
                    ForEach(Splits, id: \.self) { Split in
                        HStack {
                            NavigationLink {
                                WorkoutView(workoutType: Split)
                            } label: {
                                Text(Split.name)
                            }
                        }
                        .contextMenu {
                            Button(action: {
                                self.Splits.removeAll(where: { $0 == Split })
                            }) {
                                Text("Delete")
                            }
                        }
                    }
                    .onDelete(perform: delete)
                }
                .listStyle(.insetGrouped)
                
                //button to add a workout to the list
                .navigationTitle("Workouts")
                .navigationBarItems(trailing:
                    Button(action: {
                        self.isAdding = true
                    }, label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    })
                )
            }.sheet(isPresented: $isAdding) {
                AddWorkoutView(isPresented: self.$isAdding, workoutName: self.$toAdd, workoutList: self.$Splits)
            }
        }
    
    func delete(at offsets: IndexSet) {
        Splits.remove(atOffsets: offsets)
    }
}


struct AddWorkoutView: View {
    @Binding var isPresented: Bool
    @Binding var workoutName: String
    @Binding var workoutList: [Workout]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                TextField("Enter workout name", text: $workoutName, onCommit: {
                    let newWorkout = Workout(name: self.workoutName, exercises: [])
                    self.workoutList.append(newWorkout)
                    self.isPresented = false
                })
                .padding()
                .background(Color(.systemGray4))
                .cornerRadius(5.0)
                .padding(.horizontal, 20)
                HStack {
                    Button(action: {
                        let newWorkout = Workout(name: self.workoutName, exercises: [])
                        self.workoutList.append(newWorkout)
                        self.isPresented = false
                    }, label: {
                        Text("Add")
                    })
                    Button(action: {
                        self.isPresented = false
                    }, label: {
                        Text("Cancel")
                    })
                    .foregroundColor(Color.red)
                }
            }
        }
    }
}
