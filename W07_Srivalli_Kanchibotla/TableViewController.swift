//
//  TableViewController.swift
//  W07_Srivalli_Kanchibotla
//
//  Created by KANCHIBOTLA SRIVALLI  on 10/18/16.
//  Copyright © 2016 KANCHIBOTLA SRIVALLI . All rights reserved.
//
import UIKit

import CoreData

class TableViewController: UITableViewController {
    
    // Some initial data for our database.
    var initialData = [
        (dept: "MATH", num: 1513, title: "College Algebra"),
        (dept: "CS", num: 1113, title: "CS 1"),
        (dept: "CS", num: 2113, title: "CS 2"),
        (dept: "CS", num: 4153, title: "Mobile App Dev")
    ]
    
    var studentRecords = [(studentID : 11663161, name : "Srivalli"),(studentID : 11663162, name : "Sri"),(studentID : 11663163, name : "Charan"),(studentID : 11663164, name : "Pradeep"),(studentID : 11663165, name : "Revathi"),(studentID : 11663166, name : "Jyotsna"),(studentID : 11663167, name : "Mahesh"),(studentID : 11663168, name : "Anusha"),(studentID : 11663170, name : "Anu"),(studentID : 11663171, name : "John"),(studentID : 11663172, name : "Brenda"),(studentID : 11663173, name : "Roy")]
    
    // Our array of managed objects.
    var courses: [NSManagedObject] = []
    var studentCourses: [[NSManagedObject]] = []
    var students: [NSManagedObject] = []
    var x : NSMutableSet?
    var t : String = " "
    var c : Int = 0
    var title1: String?
    
    var temp : NSMutableSet?
    var count : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Courses"
        let appDelegate1 = UIApplication.shared.delegate as! AppDelegate
        let context1 = appDelegate1.persistentContainer.viewContext
        
        let entity1 = NSEntityDescription.entity(forEntityName: "Student", in: context1)!
        let fetchRequest1 = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do {
            if try context1.count(for: fetchRequest1) == 0 {
                // The database is empty; initialize it.
                for data in studentRecords {
                    // Create a managed object and insert it into the context.
                    let student = NSManagedObject(entity: entity1, insertInto: context1)
                    
                    // Populate the new managed object with course data.
                    student.setValue(data.name, forKey: "name")
                    student.setValue(data.studentID, forKey: "studentID")
                    
                }
            }
        }
        catch let error as NSError {
            print("Cannot count records - \(error), \(error.userInfo)")
        }
        
        
        
        
        // Fetch the records.
        do {
            students = try context1.fetch(fetchRequest1)
            print("students count")
          
        }
        catch let error as NSError
        {
            print("Cannot fetch records - \(error), \(error.userInfo)")
        }
        do {
            try context1.save()
        }
        catch let error as NSError {
            print("Cannot save - \(error), \(error.userInfo)")
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        studentCourses = [
            [students[0], students[1], students[2], students[3]],
            [students[1], students[2], students[3], students[5]],
            [students[2], students[3], students[4], students[1]],
            [students[3], students[4], students[1]]]
        
        // Get the app delegate object.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        // Get the managed object context from the app delegate.
        let context = appDelegate.persistentContainer.viewContext
        
        // Create a fetch request for course records.
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Course")
        
        do {
            if try context.count(for: fetchRequest) == 0 {
                // The database is empty; initialize it.
                initializeDB(context: context, fetchRequest: fetchRequest)
            }
        }
        catch let error as NSError {
            print("Cannot count records - \(error), \(error.userInfo)")
        }
        
        // Now fetch the records.
        fetchRecords(context: context, fetchRequest: fetchRequest)
    }
    
    func fetchRecords(context: NSManagedObjectContext,
                      fetchRequest: NSFetchRequest<NSManagedObject>) {
        // Fetch the records.
        do {
            courses = try context.fetch(fetchRequest)
        }
        catch let error as NSError
        {
            print("Cannot fetch records - \(error), \(error.userInfo)")
        }
    }
    
    func initializeDB(context: NSManagedObjectContext,
                      fetchRequest: NSFetchRequest<NSManagedObject>) {
        
        // Define the type of entity we are adding.
        let entity = NSEntityDescription.entity(forEntityName: "Course", in: context)!
        var i = 0
        for data in initialData {
            // Create a managed object and insert it into the context.
            let course = NSManagedObject(entity: entity, insertInto: context)
            
            // Populate the new managed object with course data.
            course.setValue(data.dept, forKey: "deptAbbr")
            course.setValue(data.num, forKey: "courseNum")
            course.setValue(data.title, forKey: "title")
            
            let temp = course.mutableSetValue(forKey: "enrollees")
            temp.addObjects(from: (studentCourses[i]))
            
            i += 1
        }
        
        // Save the managed object context contents to the database.
        do {
            try context.save()
        }
        catch let error as NSError {
            print("Cannot save - \(error), \(error.userInfo)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Populate the title.
        cell.textLabel!.text = (courses[indexPath.row].value(forKey: "deptAbbr") as! String) +
            String(courses[indexPath.row].value(forKey: "courseNum") as! Int)
        
        // Populate the subtitle.
        cell.detailTextLabel!.text = (courses[indexPath.row].value(forKey: "title") as! String)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        temp = courses[(indexPath as NSIndexPath).row].value(forKey: "enrollees") as? NSMutableSet
        let x = temp!.allObjects as NSArray
        count = x.count
       print(count)
        t = (courses[indexPath.row].value(forKey: "deptAbbr") as? String)!
        c = courses[indexPath.row].value(forKey: "courseNum") as! Int
        title1 = t.appending(String(c))
        self.performSegue(withIdentifier: "mySegue", sender: self)
    
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? StudentTableViewController {
            
            dest.viewTitle = title1!
                dest.students = temp
            dest.count = count!
            
        }
}
}
