//
//  MainView.swift
//  GymPartner
//
//  Created by James Gasek on 1/15/23.
//

import SwiftUI

struct Workout : Hashable{
    var name: String
    var exercises: [Exercise]
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(name)
    }
    
    static func == (lhs: Workout, rhs: Workout) -> Bool {
        return lhs.name == rhs.name
    }
}

struct Exercise : Identifiable {
    var id = UUID()
    var name: String
    var sets: [Set]
}

struct Set: Identifiable {
    var id = UUID()
    var weight: Int
    var repsCompleted: Int
    var repsTargeted: Int?
    var delayBefore: Int?
}

struct MainView: View {
    @Binding var auth: Bool
    
    @State private var selectedWorkout: String? = nil
    
    @State private var showingAddWorkoutPage = false
    
    
    @State var Splitlist: [Workout] =
    [Workout(
        name: "Chest",
        exercises: [
            Exercise(name: "Bench Press", sets: [
                Set(weight: 100, repsCompleted: 10),
                Set(weight: 100, repsCompleted: 10),
                Set(weight: 100, repsCompleted: 10),
                Set(weight: 100, repsCompleted: 10),
            ])
        ]
    )]

        
    

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            WorkoutList(Splits: $Splitlist)
                .tabItem {
                    Image(systemName: "dumbbell")
                    Text("Workout")
                }
            SettingsView(auth: $auth)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
            }
        }
    }
}

struct WorkoutView : View {
    var workoutType: Workout

    @State private var exerciseName: String = ""
    @State private var sets: [Int] = []
    @State private var weights: [Int] = []
    @State private var showAddExercise = false
    @State private var selectedExercise: Exercise?

    
    var body: some View {
        NavigationView {
            List {
                ForEach(workoutType.exercises) { exercise in
                    HStack {
                        NavigationLink(destination: ExerciseView(exercise: self.$selectedExercise)) {
                            Text(exercise.name)
                            Spacer()
                            Spacer()
                            Text("\(exercise.sets.count)x\(exercise.sets[0].repsCompleted)")
                            Text("\(exercise.sets[0].weight)lbs")
                        }
                    }.onTapGesture {
                        self.selectedExercise = exercise
                    }
                }
            }

            .sheet(isPresented: $showAddExercise) {
                //add workout sheet
            }
        }
        
        .navigationTitle(workoutType.name)
        .navigationBarItems(trailing:
            Button(action: {
                self.showAddExercise = true
            }, label: {
                Image(systemName: "plus")
                    .imageScale(.large)
            })
        )
    }
}

struct ExerciseView: View{
    @Binding var exercise: Exercise?
    
    var body: some View {
            if let exercise = exercise {
                Text("Home")
                .navigationTitle(exercise.name)
            } else {
                Text("No exercise selected")
            }
        }
}


struct HomeView: View{
    var body: some View {
        Text("Home")
        .navigationTitle("Home")
    }
}


struct MainView_Previews: PreviewProvider {

    @State static var auth = true

    static var previews: some View {
        MainView(auth: $auth)
            .previewDevice("iPhone 14")
    }
}
