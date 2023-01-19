//
//  MainView.swift
//  GymPartner
//
//  Created by James Gasek on 1/15/23.
//

import SwiftUI

struct MainView: View {
    @State private var selectedWorkout: String? = nil
    
    //make binding string 'toAdd' to add to the list
 
    var body: some View {
 
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            WorkoutList()
                .tabItem {
                    Image(systemName: "dumbbell")
                    Text("Workout")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

struct WorkoutView : View {
    var workoutType: String

    var body: some View {
        Text(workoutType)
        .navigationTitle(workoutType)
    }
}

struct WorkoutList: View {
    
    private var Workouts: [String] = [ "Chest", "Back", "Legs", "Arms", "Shoulders", "Abs", "Cardio"]
    
    @State private var toAdd: String = ""

    
    var body: some View {
        NavigationStack {
            List(Workouts, id: \.self) { Workout in
                NavigationLink {
                    WorkoutView(workoutType: Workout)
                    
                } label: {
                    Text(Workout)
                }
                
            }
            .listStyle(.insetGrouped)
            
            //button to add a workout to the list
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        VStack{
                            TextField("add workout", text: $toAdd)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(5.0)
                                .padding(.horizontal, 20)
                            
                            
                        }
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }.navigationTitle("Workouts")
        }
    }
}

struct SettingsView: View {
    var body: some View {
            NavigationStack{
                //Text("Settings")
                List{
                    Section(header: Text("Account")) {
                        NavigationLink(destination: Text("Profile")) {
                            Text("Profile")
                        }
                        NavigationLink(destination: Text("Sign Out")) {
                            Text("Sign Out")
                        }
                    }
                    
                    Section(header: Text("GymPartner")) {
                        NavigationLink(destination: Text("Notifications")) {
                            Text("Notifications")
                        }
                        //insert gap between sections
                        NavigationLink(destination: Text("Help")) {
                            Text("Help")
                        }
                        NavigationLink(destination: Text("About")) {
                            Text("About")
                        }
                    }
                }
            }
    }
}

struct HomeView: View{
    var body: some View {
        Text("Home")
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewDevice("iPhone 14")
    }
}
