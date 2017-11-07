<!DOCTYPE html>
<html>
<head>
	<h1><center>Bookstore</center></h1>
	<style>
		body {
			background: #6e95f4;
		}

		h3 {
			text-align: center;
		}

		div {
			display: none;
		}

		table, td, th {
			border: 1px solid #0e3084;
			text-align: left;
		}

		table, tr, td {
			width: 50%;
			height: 50%;

		}

		table {
			width: 70%;
			margin-left:auto; 
			margin-right:auto;
		}

		th, td {
			padding: 15px;
		}
	</style>
</head>
<body onload="onLoad()">

	<button type="button" onclick="showTextbooksTable()">Textbooks</button>
	<button type="button" onclick="showCoursesTable()">Courses</button>
	<button type="button" onclick="showStudentsTable()">Students</button>
	<h3 id="title"></h3>
	<div id="StudentsTable">
		<table>
			<tr>
				<td>
					<p>Student List: 
						<button type="button" onclick="AddStudentToDatabase()">Add</button>
                                                
						<button type="button" id="Delete Button for Student List in Students View"
                                                        onclick="DeleteStudentInDatabase()"
                                                        style="display:none;">Remove</button>
                                                        
                                                <button type="button" id="Update Button in Students View"
                                                        onclick="UpdateStudentInDatabase()"
                                                        style="display:none;">Update</button>
                                                        
					</p>
					<select id="Student List" size="10" 
                                                onchange="StudentSelectedInStudentView()"></select>
				</td>
				<td>
					<p>Student's Textbooks:
						<button type="button" 
                                                        id="Buy Textbook for Student"
                                                        onclick="PopulateTextbooksAvailableToBuy()">Add</button>
                                            
						<button type="button" 
                                                        id="Sell Textbook for Student"
                                                        onclick="StudentSellsTextbook()">Remove</button>
					</p>
					<p></p>
					<select id="Students Textbooks"
                                                onchange="StudentTextbookSelectedInStudentView()"
                                                size="10">
                                        </select>
				</td>
			</tr>
			<tr>
				<td>
					<p>Enrolled Courses:
						<button type="button" 
                                                        id="Student Add Class"
                                                        onclick="PopulateCoursesThatTheStudentCanEnrollIn()">Add</button>
						<button type="button" 
                                                        id="Student Drop Class"
                                                        onclick="DropStudentFromCourseInStudentView()">Remove</button>
					</p>
					<p></p>
					<select id="Enrolled Courses" size="10" 
                                                onchange="EnrolledCourseSelectedInStudentView()">
                                        </select>
				</td>
				<td>
					<p>Required Textbooks:</p>
					<select id="Required Textbooks" size="10">
                                        </select>
				</td>
			</tr>
		</table>
	</div>

	<div id="CoursesTable">
		<table>
			<tr>
				<td>
					<p>Courses List:
						<button type="button" onclick="AddCourseToDatabase()">Add</button>
                                                
						<button type="button" id="Delete Button for Course List in Courses View"
                                                        onclick="DeleteCourseInDatabase()"
                                                        style="display:none;">Remove</button>
                                                        
                                                <button type="button" id="Update Button in Courses View"
                                                        onclick="UpdateCourseInDatabase()"
                                                        style="display:none;">Update</button>
					</p>
					<p></p>
					<select id="Course List" size="10" onchange="CourseSelectedInCourseView()"></select>
				</td>
				<td>
					<p>Required Textbooks:
						<button type="button" id="Add Button for Required Textbooks List in Courses View"
                                                        style="display:visible;"
                                                        onclick="PopulateTextbooksAvailableToRequire()">Add</button>
                                            
						<button type="button" id="Delete Button for Required Textbooks List in Courses View"
                                                        style="display:none;"
                                                        onclick="RemoveRequiredTextbookFromCourse()">Remove</button>
					</p>
					<p></p>
					<select id="Course List Required Textbooks" 
                                                onchange="RequiredTextbookSelectedInCourseView()" size="10">
                                        </select>
				</td>
			</tr>
			<tr>
				<td>
					<p>Enrolled Students:
						<button type="button" onclick="PopulateStudentsThatCanEnrollInTheCourse()">Add</button>
                                                
						<button type="button" id="Delete Button for Enrolled Student List in Courses View"
                                                        style="display:none;"
                                                        onclick="DropStudentFromCourseInCourseView()">Remove</button>
					</p>
					<p></p>
					<select id="Course List Enrolled Students" size="10" 
                                                onchange="EnrolledStudentSelectedInCourseView()"></select>
				</td>
				<td>
					<p>Student's Textbooks:</p>
					<select id="Course List Students Textbooks" size="10"></select>
				</td>
			</tr>
		</table>
	</div>

	<div id="TextbooksTable">
		<table>
			<tr>
				<td>
					<p>Textbook List: 
						<button type="button" onclick="AddTextbookToDatabase()">Add</button>
						<button type="button" id="Delete Button in Textbooks View" 
                                                        onclick="DeleteTextbookInDatabase()"
                                                        style="display:none;">Remove</button>
                                                <button type="button" id="Update Button in Textbooks View"
                                                        onclick="UpdateTextbookInDatabase()"
                                                        style="display:none;">Update</button>
					</p>
                                        <select id="Textbook List" size="10" onchange="TextbookSelectedInTextbookView()"></select>
				</td>
			</tr>
		</table>
	</div>

	<div id="AddTable">
		<h3 id="AddTitle">Hello!</h3>
		<table>
			<tr>
				<td>
                                    <select id="HelperTable" onchange="HelperTableElementSelected()"
                                            size="10"></select>
                                    <button type="button" id="AddingAnElementToList"
                                            style="display:none;"
                                            onclick="AddAnElementToList()">Add</button>
				</td>
			</tr>
		</table>
	</div>


<script type="text/javascript">
// Check all open requests ie GET, POST, DELETE and check header types
var url = "http://localhost:8080/mavenproject6/webapi/myresource";
var WhatListToAddTo;

function onLoad()
{
    StudentList();
    CourseList();
    TextbookList();
}

function showStudentsTable() 
{
    document.getElementById("StudentsTable").style.display = "block";
    document.getElementById("CoursesTable").style.display = "none";
    document.getElementById("TextbooksTable").style.display = "none";
    document.getElementById("title").innerHTML = "Student View";
}

function showCoursesTable() 
{
    document.getElementById("StudentsTable").style.display = "none";
    document.getElementById("CoursesTable").style.display = "block";
    document.getElementById("TextbooksTable").style.display = "none";
    document.getElementById("title").innerHTML = "Course View";
}

function showTextbooksTable() 
{
    document.getElementById("StudentsTable").style.display = "none";
    document.getElementById("CoursesTable").style.display = "none";
    document.getElementById("TextbooksTable").style.display = "block";
    document.getElementById("title").innerHTML = "Textbook View";
}

// Come back here and move this function into other functions.
function ToggleAddSelect(text)
{
    document.getElementById("AddTable").innerHTML = text;
    if(document.getElementById("AddTable").style.display === "block")
    {
        document.getElementById("AddTable").style.display = "none";
    }
    else if(document.getElementById("AddTable").style.display === "none")
    {
        document.getElementById("AddTable").style.display = "block";
    }
}

// This function is used to clear whatever table is identified by tableName.
function ClearTable(tableName)
{
    var tableToClear = document.getElementById(tableName);
    for (var i in tableToClear)
    {
        tableToClear.remove(0);
    }
}

// This function is used to show the button belonging to the given id.
function ShowButton(givenID)
{
    document.getElementById(givenID).style="display:visible";
}

// This function is used to hide the button belonging to the given id.
function HideButton(givenID)
{
    document.getElementById(givenID).style="display:none";
}

// This function is used to delete a selected item from whatever table it 
// is listed in.
function DeleteSelectedItem(tableName)
{
    var x = document.getElementById(tableName);
    x.remove(x.selectedIndex);
}

// This function is used to insert a textbook into whatever table id is given.
function InsertTextbookIntoTableForViewing(givenID, Textbook)
{
    var x = document.getElementById(givenID);
    var insertionItem = document.createElement("option");
    insertionItem.text = Textbook.title+", "+Textbook.publisher+", "+Textbook.edition+", "+Textbook.date;
    insertionItem.value = Textbook.TextbookID;
    x.add(insertionItem);
}

// This function is used to insert a course into whatever table id is given.
function InsertCourseIntoTableForViewing(givenID, Course)
{
    var x = document.getElementById(givenID);
    var insertionItem = document.createElement("option");
    insertionItem.text = Course.CourseName;
    insertionItem.value = Course.CourseID;
    x.add(insertionItem);
}

// This function is used to insert a course into whatever table id is given.
// Specifically, it shows whether or not a student has the textbooks they need.
function InsertCourseIntoTableForViewing(givenID, Course, itemStyle)
{
    var x = document.getElementById(givenID);
    var insertionItem = document.createElement("option");
    insertionItem.text = Course.CourseName;
    insertionItem.value = Course.CourseID;
    insertionItem.style.backgroundColor = itemStyle;
    x.add(insertionItem);
}

// This function is used to insert a student into whatever table id is given.
function InsertStudentIntoTableForViewing(givenID, Student)
{
    var x = document.getElementById(givenID);
    var insertionItem = document.createElement("option");
    insertionItem.text = Student.LastName+", "+Student.FirstName;
    insertionItem.value = Student.StudentID;
    x.add(insertionItem);
}

// This function is used to insert a student into whatever table id is given.
// Specifically, it shows whether or not a students have the textbooks they need.
function InsertStudentIntoTableForViewing(givenID, Student, itemStyle)
{
    var x = document.getElementById(givenID);
    var insertionItem = document.createElement("option");
    insertionItem.text = Student.LastName+", "+Student.FirstName;
    insertionItem.value = Student.StudentID;
    insertionItem.style.backgroundColor = itemStyle;
    x.add(insertionItem);
}

// This function is used to set up the helper table for adding required textbooks
// to a course. Only called while in the course view.
function SetupHelperTableToAddRequiredTextbooks()
{
    ClearTable("HelperTable");
    HideButton("AddingAnElementToList");
    document.getElementById("AddTitle").text = "Available Textbooks to Add:";
    document.getElementById("AddTable").style.display = "block";
}

// This function is used to set up the helper table for enrolling students in
// a course. This one is to be used while in the course view.
function SetupHelperTableToAddStudentToCourse()
{
    ClearTable("HelperTable");
    HideButton("AddingAnElementToList");
    document.getElementById("AddTitle").text = "Available Students to Enroll:";
    document.getElementById("AddTable").style.display = "block";
}

// This function is used to set up the helper table for giving students textbooks.
// It is only called while in the student view.
function SetupHelperTableToAddTextbookToStudent()
{
    ClearTable("HelperTable");
    HideButton("AddingAnElementToList");
    document.getElementById("AddTitle").text = "Available Textbooks to Buy";
    document.getElementById("AddTable").style.display = "block";
}

// This function is used to set up the helper table for enrolling students
// in a course. This one is to be used while in the student view.
function SetupHelperTableToAddCourseToStudent()
{
    ClearTable("HelperTable");
    HideButton("AddingAnElementToList");
    document.getElementById("AddTitle").text = "Available Courses to Add:";
    document.getElementById("AddTable").style.display = "block";
}

</script>

<script type="text/javascript">
//Gets List of All Courses and input into Selected options
function StudentList(){
    ClearTable("Student List");
    ClearTable("Students Textbooks");
    ClearTable("Enrolled Courses");
    ClearTable("Required Textbooks");
    ClearTable("HelperTable");
    
    var StudentListxhttp = new XMLHttpRequest();
    StudentListxhttp.open("GET", url+"/GetAllStudents");
    StudentListxhttp.setRequestHeader("Content-type", "application/json");
    StudentListxhttp.send();
    StudentListxhttp.onreadystatechange=function()
    {
        if(StudentListxhttp.status === 200 && StudentListxhttp.readyState === 4)
        {
            var Students = JSON.parse(StudentListxhttp.responseText);
            for(var i in Students)
            {
                InsertStudentIntoTableForViewing("Student List", Students[i]);
            }
        }
    };
}

// When a student is selected in the student list while in the students view.
function StudentSelectedInStudentView()
{
    HelperTableNoLongerTheFocus();
    
    var temp = document.getElementById("Student List");
    var id = temp.options[temp.selectedIndex].value;
    
    ClearTable("Students Textbooks");
    ClearTable("Enrolled Courses");
    ClearTable("Required Textbooks");
    
    ShowButton("Delete Button for Student List in Students View");
    ShowButton("Update Button in Students View");
    ShowButton("Buy Textbook for Student");
    ShowButton("Student Add Class");
    
    HideButton("Sell Textbook for Student");
    HideButton("Student Drop Class");
    
    // Populate the student's owned textbooks list.
    PopulateStudentTextbooksInStudentView(id);
    // Populate the courses the student is enrolled in.
    PopulateStudentEnrolledCoursesInStudentView(id);
}

// When the user clicks the add button to add a new student in the students view.
function AddStudentToDatabase()
{
    var FirstName = prompt("Please enter the first name of the student", "");
    if(FirstName === null || FirstName === "")
    {
        return;
    }
    var LastName = prompt("Please enter the last name of the student:", "");
    if (LastName === null || LastName === "")
    {
        return;
    }
    var AddStudentToStudentListxhttp = new XMLHttpRequest();
    AddStudentToStudentListxhttp.open("POST", url+"/AddNewStudent/"+FirstName+"/"+LastName);
    AddStudentToStudentListxhttp.setRequestHeader("Content-type", "text/html");
    AddStudentToStudentListxhttp.send();
    AddStudentToStudentListxhttp.onreadystatechange=function()
    {
        if(AddStudentToStudentListxhttp.status === 204 && AddStudentToStudentListxhttp.readyState === 4)
        {
            StudentList();
        }
    };
}

// When the user clicks the update button in the students view.
function UpdateStudentInDatabase()
{
    var temp = document.getElementById("Student List");
    var id = temp.options[temp.selectedIndex].value;
    
    var FirstName = prompt("Please enter the first name of the student", "");
    if(FirstName === null || FirstName === "")
    {
        return;
    }
    var LastName = prompt("Please enter the last name of the student:", "");
    if (LastName === null || LastName === "")
    {
        return;
    }
    var UpdateStudentToStudentListxhttp = new XMLHttpRequest();
    UpdateStudentToStudentListxhttp.open("POST", url+"/UpDateSelectedStudent/"+id+"/"+FirstName+"/"+LastName);
    UpdateStudentToStudentListxhttp.setRequestHeader("Content-type", "text/html");
    UpdateStudentToStudentListxhttp.send();
    UpdateStudentToStudentListxhttp.onreadystatechange=function()
    {
        if(UpdateStudentToStudentListxhttp.status === 204 && UpdateStudentToStudentListxhttp.readyState === 4)
        {
            HideButton("Update Button in Students View");
            HideButton("Delete Button for Student List in Students View");
            StudentList();
        }
    };
}

// When the user deletes a student from the database in the students view.
function DeleteStudentInDatabase()
{
    var temp = document.getElementById("Student List");
    var id = temp.options[temp.selectedIndex].value;
    
    HideButton("Delete Button for Student List in Students View");
    
    var RemoveStudentFromDatabasexhttp = new XMLHttpRequest();
    RemoveStudentFromDatabasexhttp.open("DELETE", url+"/DeleteSelectedStudent/"+id);
    RemoveStudentFromDatabasexhttp.setRequestHeader("Content-type", "text/html");
    RemoveStudentFromDatabasexhttp.send();
    RemoveStudentFromDatabasexhttp.onreadystatechange=function()
    {
    	if(RemoveStudentFromDatabasexhttp.status === 204 && RemoveStudentFromDatabasexhttp.readyState === 4)
        {
            StudentList();
	}
    };
}

// Populate the owned textbooks list in the students View.
function PopulateStudentTextbooksInStudentView(StudentID)
{
    var GetTextbooksOwnedByStudentxhttp = new XMLHttpRequest();
    GetTextbooksOwnedByStudentxhttp.open("GET", url+"/GetStudentTextbooks/"+StudentID);
    GetTextbooksOwnedByStudentxhttp.setRequestHeader("Content-type", "application/json");
    GetTextbooksOwnedByStudentxhttp.send();
    GetTextbooksOwnedByStudentxhttp.onreadystatechange=function()
    {
        if(GetTextbooksOwnedByStudentxhttp.status === 200 && GetTextbooksOwnedByStudentxhttp.readyState === 4)
        {
            var Textbooks = JSON.parse(GetTextbooksOwnedByStudentxhttp.responseText);
            for(var i in Textbooks)
            {
                InsertTextbookIntoTableForViewing("Students Textbooks", Textbooks[i]);
                if (i > 8)
                {
                    HideButton("Buy Textbook for Student");
                }
                else
                {
                    ShowButton("Buy Textbook for Student");
                }
            }
        }
    };
}

// Populate the enrolled courses list in the students View.
function PopulateStudentEnrolledCoursesInStudentView(StudentID)
{
    var GetStudentsEnrolledCoursestsxhttp = new XMLHttpRequest();
    GetStudentsEnrolledCoursestsxhttp.open("GET", url+"/GetCoursesStudentIsTaking/"+StudentID);
    GetStudentsEnrolledCoursestsxhttp.setRequestHeader("Content-type", "application/json");
    GetStudentsEnrolledCoursestsxhttp.send();
    GetStudentsEnrolledCoursestsxhttp.onreadystatechange=function()
    {
        if(GetStudentsEnrolledCoursestsxhttp.status === 200 && GetStudentsEnrolledCoursestsxhttp.readyState === 4)
        {
            var Courses = JSON.parse(GetStudentsEnrolledCoursestsxhttp.responseText);
            for(var i in Courses)
            {
                if (i > 3)
                {
                    HideButton("Student Add Class");
                }
                else
                {
                    ShowButton("Student Add Class");
                }
                // Color the courses here based on if the student has the required textbooks.
                DoesStudentHaveRequiredTextbooksForClass(StudentID, Courses[i]);
            }
        }
    };
}

// When a textbook is selected in owned textbooks list while in the students view.
function StudentTextbookSelectedInStudentView()
{
    HelperTableNoLongerTheFocus();
    
    // Show the remove button
    ShowButton("Sell Textbook for Student");
    HideButton("Student Drop Class");
}

// Populates the bottom textbox with available textbooks for the student to buy.
function PopulateTextbooksAvailableToBuy()
{
    var temp = document.getElementById("Student List");
    var StudentID = temp.options[temp.selectedIndex].value;
    
    // Call to set the bottom table appropriately.
    SetupHelperTableToAddTextbookToStudent();
    
    var GetTextbooksNotOwnedByStudentxhttp = new XMLHttpRequest();
    GetTextbooksNotOwnedByStudentxhttp.open("GET", url+"/GetTextbooksNotOwnedByStudent/"+StudentID);
    GetTextbooksNotOwnedByStudentxhttp.setRequestHeader("Content-type", "application/json");
    GetTextbooksNotOwnedByStudentxhttp.send();
    GetTextbooksNotOwnedByStudentxhttp.onreadystatechange=function()
    {
        if(GetTextbooksNotOwnedByStudentxhttp.status === 200 && GetTextbooksNotOwnedByStudentxhttp.readyState === 4)
        {
            var Textbooks = JSON.parse(GetTextbooksNotOwnedByStudentxhttp.responseText);
            for(var i in Textbooks)
            {
                InsertTextbookIntoTableForViewing("HelperTable", Textbooks[i]);
            }
        }
    };
}

// When a user wants a student to buy a textbook while in the students view.
// Requires a helpertable function.
function StudentBuysTextbook(StudentID, TextbookID)
{
    var BuyTextbookxhttp = new XMLHttpRequest();
    BuyTextbookxhttp.open("POST", url+"/GiveStudentTheTextbook/"+StudentID+"/"+TextbookID);
    BuyTextbookxhttp.setRequestHeader("Content-type", "text/html");
    BuyTextbookxhttp.send();
    BuyTextbookxhttp.onreadystatechange=function()
    {
        if(BuyTextbookxhttp.status === 204 && BuyTextbookxhttp.readyState === 4)
        {
            StudentSelectedInStudentView();
        }
    };
}

// When a user wants a student to sell a textbook while in the students view.
function StudentSellsTextbook()
{
    var currentStudent = document.getElementById("Student List");
    var studentIdentifier = currentStudent.options[currentStudent.selectedIndex].value;
    var currentBook = document.getElementById("Students Textbooks");
    var bookIdentifier = currentBook.options[currentBook.selectedIndex].value;
    
    var RemoveRequiredTextbookFromCoursexhttp = new XMLHttpRequest();
    RemoveRequiredTextbookFromCoursexhttp.open("POST", url+"/SellStudentTextbook/"+studentIdentifier+"/"+bookIdentifier);
    RemoveRequiredTextbookFromCoursexhttp.setRequestHeader("Content-type", "text/html");
    RemoveRequiredTextbookFromCoursexhttp.send();
    RemoveRequiredTextbookFromCoursexhttp.onreadystatechange=function()
    {
    	if(RemoveRequiredTextbookFromCoursexhttp.status === 204 && RemoveRequiredTextbookFromCoursexhttp.readyState === 4)
        {
            ClearTable("Students Textbooks");
            ShowButton("Buy Textbook for Student");
            HideButton("Sell Textbook for Student");
            PopulateStudentTextbooksInStudentView(studentIdentifier);
	}
    };
}

// When a course is selected in the enrolled courses list while in the students view.
function EnrolledCourseSelectedInStudentView()
{
    HelperTableNoLongerTheFocus();
    
    // Show the remove button
    HideButton("Sell Textbook for Student");
    ShowButton("Student Drop Class");
    
    var temp = document.getElementById("Enrolled Courses");
    var id = temp.options[temp.selectedIndex].value;
    
    ClearTable("Required Textbooks");
    PopulateTheSelectedCourseRequiredTextbooksInStudentView(id);
}

// Populates the selected course's required textbooks while in the students view.
function PopulateTheSelectedCourseRequiredTextbooksInStudentView(CourseID)
{
    var GetRequiredTextbooksxhttp = new XMLHttpRequest();
    GetRequiredTextbooksxhttp.open("GET", url+"/GetRequiredTextbooks/"+CourseID);
    GetRequiredTextbooksxhttp.setRequestHeader("Content-type", "application/json");
    GetRequiredTextbooksxhttp.send();
    GetRequiredTextbooksxhttp.onreadystatechange=function()
    {
        if(GetRequiredTextbooksxhttp.status === 200 && GetRequiredTextbooksxhttp.readyState === 4)
        {
            var Textbooks = JSON.parse(GetRequiredTextbooksxhttp.responseText);
            for(var i in Textbooks)
            {
                InsertTextbookIntoTableForViewing("Required Textbooks", Textbooks[i]);
            }
        }
    };
}

// Populate the bottom textbox with courses the student is not enrolled in.
function PopulateCoursesThatTheStudentCanEnrollIn()
{
    var temp = document.getElementById("Student List");
    var StudentID = temp.options[temp.selectedIndex].value;
    
    // Call to set the bottom table appropriately.
    SetupHelperTableToAddCourseToStudent();
    
    var GetCoursesStudentNotEnrolledInxhttp = new XMLHttpRequest();
    GetCoursesStudentNotEnrolledInxhttp.open("GET", url+"/GetCoursesTheStudentCanAdd/"+StudentID);
    GetCoursesStudentNotEnrolledInxhttp.setRequestHeader("Content-type", "application/json");
    GetCoursesStudentNotEnrolledInxhttp.send();
    GetCoursesStudentNotEnrolledInxhttp.onreadystatechange=function()
    {
        if(GetCoursesStudentNotEnrolledInxhttp.status === 200 && GetCoursesStudentNotEnrolledInxhttp.readyState === 4)
        {
            var Courses = JSON.parse(GetCoursesStudentNotEnrolledInxhttp.responseText);
            for(var i in Courses)
            {
                InsertCourseIntoTableForViewing("HelperTable", Courses[i]);
            }
            
        }
    }; 
}

// When a user wants to enroll a student in a course while in the students view.
// Requires a helpertable function.
function EnrollStudentInCourseInStudentView(StudentID, CourseID)
{
    var AddCourseToStudentxhttp = new XMLHttpRequest();
    AddCourseToStudentxhttp.open("POST", url+"/SignStudentUpForClass/"+StudentID+"/"+CourseID);
    AddCourseToStudentxhttp.setRequestHeader("Content-type", "text/html");
    AddCourseToStudentxhttp.send();
    AddCourseToStudentxhttp.onreadystatechange=function()
    {
        if(AddCourseToStudentxhttp.status === 204 && AddCourseToStudentxhttp.readyState === 4)
        {
            StudentSelectedInStudentView();
        }
    };
}

// When a user wants to drop a student from a course while in the students view.
function DropStudentFromCourseInStudentView()
{
    var currentStudent = document.getElementById("Student List");
    var studentIdentifier = currentStudent.options[currentStudent.selectedIndex].value;
    var currentCourse = document.getElementById("Enrolled Courses");
    var currentCourseIdentifier = currentCourse.options[currentCourse.selectedIndex].value;
    
    var RemoveRequiredTextbookFromCoursexhttp = new XMLHttpRequest();
    RemoveRequiredTextbookFromCoursexhttp.open("POST", url+"/StudentDropsSpecifiedClass/"+studentIdentifier+"/"+currentCourseIdentifier);
    RemoveRequiredTextbookFromCoursexhttp.setRequestHeader("Content-type", "text/html");
    RemoveRequiredTextbookFromCoursexhttp.send();
    RemoveRequiredTextbookFromCoursexhttp.onreadystatechange=function()
    {
    	if(RemoveRequiredTextbookFromCoursexhttp.status === 204 && RemoveRequiredTextbookFromCoursexhttp.readyState === 4)
        {
            ClearTable("Enrolled Courses");
            HideButton("Student Drop Class");
            PopulateStudentEnrolledCoursesInStudentView(studentIdentifier);
	}
    };
}

</script>

<script type="text/javascript">
//Gets List of All Courses and input into Selected options
function CourseList(){
    ClearTable("Course List");
    ClearTable("Course List Required Textbooks");
    ClearTable("Course List Enrolled Students");
    ClearTable("Course List Students Textbooks");
    ClearTable("HelperTable");
    
    var CourseListxhttp = new XMLHttpRequest();
    CourseListxhttp.open("GET", url+"/GetAllCourses");
    CourseListxhttp.setRequestHeader("Content-type", "application/json");
    CourseListxhttp.send();
    CourseListxhttp.onreadystatechange=function()
    {
        if(CourseListxhttp.status === 200 && CourseListxhttp.readyState === 4)
        {
            var Courses = JSON.parse(CourseListxhttp.responseText);
            for(var i in Courses)
            {
                InsertCourseIntoTableForViewing("Course List", Courses[i]);
            }
        }
    };
}

// When a course is selected in the courses list while in the courses view.
function CourseSelectedInCourseView()
{
    HelperTableNoLongerTheFocus();
    
    var temp = document.getElementById("Course List");
    var id = temp.options[temp.selectedIndex].value;
    
    ClearTable("Course List Required Textbooks");
    ClearTable("Course List Enrolled Students");
    
    ShowButton("Delete Button for Course List in Courses View");
    ShowButton("Update Button in Courses View");
    ShowButton("Add Button for Required Textbooks List in Courses View");
    
    HideButton("Delete Button for Enrolled Student List in Courses View");
    HideButton("Delete Button for Required Textbooks List in Courses View");
    
    // Populate the required textbooks list.
    PopulateTheRequiredTextbooksListInCourseView(id);
    // Populate the enrolled students list.
    PopulateTheEnrolledStudentsListInCourseView(id);
}

// When the user clicks the add button to add a new course in the courses view.
function AddCourseToDatabase()
{
    var CourseName = prompt("Please enter the name of the course:", "");
    if(CourseName === null || CourseName === "")
    {
        return;
    }
    var AddCourseToCourseListxhttp = new XMLHttpRequest();
    AddCourseToCourseListxhttp.open("POST", url+"/AddNewCourse/"+CourseName);
    AddCourseToCourseListxhttp.setRequestHeader("Content-type", "text/html");
    AddCourseToCourseListxhttp.send();
    AddCourseToCourseListxhttp.onreadystatechange=function()
    {
        if(AddCourseToCourseListxhttp.status === 204 && AddCourseToCourseListxhttp.readyState === 4)
        {
            ClearTable("Course List");
            CourseList();
        }
    };
}

// When the user clicks the update button in the courses view.
function UpdateCourseInDatabase()
{
    var temp = document.getElementById("Course List");
    var id = temp.options[temp.selectedIndex].value;
    
    var CourseName = prompt("Please enter the name of the course:", "");
    if(CourseName === null || CourseName === "")
    {
        return;
    }
    
    var UpdateCourseFromDatabasexhttp = new XMLHttpRequest();
    UpdateCourseFromDatabasexhttp.open("POST", url+"/UpDateSelectedCourse/"+id+"/"+CourseName);
    UpdateCourseFromDatabasexhttp.setRequestHeader("Content-type", "text/html");
    UpdateCourseFromDatabasexhttp.send();
    UpdateCourseFromDatabasexhttp.onreadystatechange=function()
    {
    	if(UpdateCourseFromDatabasexhttp.status === 204 && UpdateCourseFromDatabasexhttp.readyState === 4)
        {
            HideButton("Delete Button for Course List in Courses View");
            HideButton("Update Button in Courses View");
            CourseList();
	}
    };
}

// When the user deletes a course from the database in the courses view.
function DeleteCourseInDatabase()
{
    var temp = document.getElementById("Course List");
    var id = temp.options[temp.selectedIndex].value;
    
    var RemoveCourseFromDatabasexhttp = new XMLHttpRequest();
    RemoveCourseFromDatabasexhttp.open("DELETE", url+"/DeleteSelectedCourse/"+id);
    RemoveCourseFromDatabasexhttp.setRequestHeader("Content-type", "text/html");
    RemoveCourseFromDatabasexhttp.send();
    RemoveCourseFromDatabasexhttp.onreadystatechange=function()
    {
    	if(RemoveCourseFromDatabasexhttp.status === 204 && RemoveCourseFromDatabasexhttp.readyState === 4)
        {
            HideButton("Delete Button for Course List in Courses View");
            HideButton("Update Button in Courses View");
            onLoad();
	}
    };
}

// Populate the required textbooks list in the Courses View.
function PopulateTheRequiredTextbooksListInCourseView(CourseID)
{
    HideButton("Delete Button for Required Textbooks List in Courses View");
    
    var GetCourseListRequiredTextbooksxhttp = new XMLHttpRequest();
    GetCourseListRequiredTextbooksxhttp.open("GET", url+"/GetRequiredTextbooks/"+CourseID);
    GetCourseListRequiredTextbooksxhttp.setRequestHeader("Content-type", "application/json");
    GetCourseListRequiredTextbooksxhttp.send();
    GetCourseListRequiredTextbooksxhttp.onreadystatechange=function()
    {
        if(GetCourseListRequiredTextbooksxhttp.status === 200 && GetCourseListRequiredTextbooksxhttp.readyState === 4)
        {
            var Textbooks = JSON.parse(GetCourseListRequiredTextbooksxhttp.responseText);
            for(var i in Textbooks)
            {
                InsertTextbookIntoTableForViewing("Course List Required Textbooks", Textbooks[i]);
                if (i > 0)
                {
                    HideButton("Add Button for Required Textbooks List in Courses View");
                }
                else
                {
                    ShowButton("Add Button for Required Textbooks List in Courses View");
                }
            }
        }
    };
}

// Populate the enrolled students list in the Courses View.
function PopulateTheEnrolledStudentsListInCourseView(CourseID)
{
    HideButton("Delete Button for Enrolled Student List in Courses View");
    
    var GetCourseEnrolledStudentsxhttp = new XMLHttpRequest();
    GetCourseEnrolledStudentsxhttp.open("GET", url+"/GetCourseRoster/"+CourseID);
    GetCourseEnrolledStudentsxhttp.setRequestHeader("Content-type", "application/json");
    GetCourseEnrolledStudentsxhttp.send();
    GetCourseEnrolledStudentsxhttp.onreadystatechange=function()
    {
        if(GetCourseEnrolledStudentsxhttp.status === 200 && GetCourseEnrolledStudentsxhttp.readyState === 4)
        {
            var Students = JSON.parse(GetCourseEnrolledStudentsxhttp.responseText);
            for(var i in Students)
            {
                // This function will color the students appropriately based on if they
                // have the required textbooks.
                DoAllStudentsHaveRequiredTextbooksForClass(Students[i], CourseID);
            }
        }
    };
}

// When a textbook is selected in required textbooks list while in the courses view.
function RequiredTextbookSelectedInCourseView()
{
    HelperTableNoLongerTheFocus();
    
    // Show the remove button
    ShowButton("Delete Button for Required Textbooks List in Courses View");
    HideButton("Delete Button for Enrolled Student List in Courses View");
}

// Populates the bottom textbox with available textbooks for the course to require.
function PopulateTextbooksAvailableToRequire()
{
    var temp = document.getElementById("Course List");
    var CourseID = temp.options[temp.selectedIndex].value;
    
    // Call to set the bottom table appropriately.
    SetupHelperTableToAddRequiredTextbooks();
    
    var GetTextbooksNotRequiredByCoursexhttp = new XMLHttpRequest();
    GetTextbooksNotRequiredByCoursexhttp.open("GET", url+"/GetTextbooksNotRequiredByCourse/"+CourseID);
    GetTextbooksNotRequiredByCoursexhttp.setRequestHeader("Content-type", "application/json");
    GetTextbooksNotRequiredByCoursexhttp.send();
    GetTextbooksNotRequiredByCoursexhttp.onreadystatechange=function()
    {
        if(GetTextbooksNotRequiredByCoursexhttp.status === 200 && GetTextbooksNotRequiredByCoursexhttp.readyState === 4)
        {
            var Textbooks = JSON.parse(GetTextbooksNotRequiredByCoursexhttp.responseText);
            for(var i in Textbooks)
            {
                InsertTextbookIntoTableForViewing("HelperTable", Textbooks[i]);
            }
        }
    };
}

// When a user wants to add a required textbook to a course while in the courses view.
// Requires a helpertable function.
function AddRequiredTextbookToCourse(CourseID, TextbookID)
{
    var AddRequiredTextbookToCoursexhttp = new XMLHttpRequest();
    AddRequiredTextbookToCoursexhttp.open("POST", url+"/AddRequiredText/"+CourseID+"/"+TextbookID);
    AddRequiredTextbookToCoursexhttp.setRequestHeader("Content-type", "text/html");
    AddRequiredTextbookToCoursexhttp.send();
    AddRequiredTextbookToCoursexhttp.onreadystatechange=function()
    {
        if(AddRequiredTextbookToCoursexhttp.status === 204 && AddRequiredTextbookToCoursexhttp.readyState === 4)
        {
            CourseSelectedInCourseView();
        }
    };
}

// When a user wants to remove a required textbook from a course while in the courses view.
function RemoveRequiredTextbookFromCourse()
{
    var currentCourse = document.getElementById("Course List");
    var courseIdentifier = currentCourse.options[currentCourse.selectedIndex].value;
    var currentBook = document.getElementById("Course List Required Textbooks");
    var bookIdentifier = currentBook.options[currentBook.selectedIndex].value;
    
    var RemoveRequiredTextbookFromCoursexhttp = new XMLHttpRequest();
    RemoveRequiredTextbookFromCoursexhttp.open("POST", url+"/RemoveSpecifiedRequiredText/"+courseIdentifier+"/"+bookIdentifier);
    RemoveRequiredTextbookFromCoursexhttp.setRequestHeader("Content-type", "text/html");
    RemoveRequiredTextbookFromCoursexhttp.send();
    RemoveRequiredTextbookFromCoursexhttp.onreadystatechange=function()
    {
    	if(RemoveRequiredTextbookFromCoursexhttp.status === 204 && RemoveRequiredTextbookFromCoursexhttp.readyState === 4)
        {
            ClearTable("Course List Required Textbooks");
            ClearTable("Course List Enrolled Students");
            ShowButton("Add Button for Required Textbooks List in Courses View");
            
            PopulateTheRequiredTextbooksListInCourseView(courseIdentifier);
            PopulateTheEnrolledStudentsListInCourseView(courseIdentifier);
	}
    };
}

// When a student is selected in the enrolled students list while in the courses view.
function EnrolledStudentSelectedInCourseView()
{
    HelperTableNoLongerTheFocus();
    
    ShowButton("Delete Button for Enrolled Student List in Courses View");
    HideButton("Delete Button for Required Textbooks List in Courses View");
    
    var temp = document.getElementById("Course List Enrolled Students");
    var id = temp.options[temp.selectedIndex].value;
    
    ClearTable("Course List Students Textbooks");
    PopulateTheSelectedStudentTextbooksInCourseView(id);
    
}

// Populates the selected student's textbooks in while in the courses view.
function PopulateTheSelectedStudentTextbooksInCourseView(StudentID)
{
    var StudentOwnedTextbooksxhttp = new XMLHttpRequest();
    StudentOwnedTextbooksxhttp.open("GET", url+"/GetStudentTextbooks/"+StudentID);
    StudentOwnedTextbooksxhttp.setRequestHeader("Content-type", "application/json");
    StudentOwnedTextbooksxhttp.send();
    StudentOwnedTextbooksxhttp.onreadystatechange=function()
    {
        if(StudentOwnedTextbooksxhttp.status === 200 && StudentOwnedTextbooksxhttp.readyState === 4)
        {
            var Textbooks = JSON.parse(StudentOwnedTextbooksxhttp.responseText);
            for(var i in Textbooks)
            {
                InsertTextbookIntoTableForViewing("Course List Students Textbooks", Textbooks[i]);
            }
        }
    };
}

// Populate the bottom textbox with students not enrolled in the course.
function PopulateStudentsThatCanEnrollInTheCourse()
{
    var temp = document.getElementById("Course List");
    var CourseID = temp.options[temp.selectedIndex].value;
    
    // Call to set the bottom table appropriately.
    SetupHelperTableToAddStudentToCourse();
    
    var GetStudentsNotEnrolledInCoursexhttp = new XMLHttpRequest();
    GetStudentsNotEnrolledInCoursexhttp.open("GET", url+"/GetAllStudentsNotInThisCourse/"+CourseID);
    GetStudentsNotEnrolledInCoursexhttp.setRequestHeader("Content-type", "application/json");
    GetStudentsNotEnrolledInCoursexhttp.send();
    GetStudentsNotEnrolledInCoursexhttp.onreadystatechange=function()
    {
        if(GetStudentsNotEnrolledInCoursexhttp.status === 200 && GetStudentsNotEnrolledInCoursexhttp.readyState === 4)
        {
            var Students = JSON.parse(GetStudentsNotEnrolledInCoursexhttp.responseText);
            for(var i in Students)
            {
                InsertStudentIntoTableForViewing("HelperTable", Students[i]);
            }
            
        }
    }; 
}

// When a user wants to enroll a student in a course while in the courses view.
// Requires a helpertable function.
function EnrollNewStudentInCourseInCourseView(StudentID, CourseID)
{
    var AddStudentToCoursexhttp = new XMLHttpRequest();
    AddStudentToCoursexhttp.open("POST", url+"/SignStudentUpForClass/"+StudentID+"/"+CourseID);
    AddStudentToCoursexhttp.setRequestHeader("Content-type", "text/html");
    AddStudentToCoursexhttp.send();
    AddStudentToCoursexhttp.onreadystatechange=function()
    {
        if(AddStudentToCoursexhttp.status === 204 && AddStudentToCoursexhttp.readyState === 4)
        {
            CourseSelectedInCourseView();
        }
    };
}

// When a user wants to drop a student from a course while in the courses view.
function DropStudentFromCourseInCourseView()
{
    var currentCourse = document.getElementById("Course List");
    var courseIdentifier = currentCourse.options[currentCourse.selectedIndex].value;
    var currentStudent = document.getElementById("Course List Enrolled Students");
    var currentStudentIdentifier = currentStudent.options[currentStudent.selectedIndex].value;
    
    var RemoveRequiredTextbookFromCoursexhttp = new XMLHttpRequest();
    RemoveRequiredTextbookFromCoursexhttp.open("POST", url+"/StudentDropsSpecifiedClass/"+currentStudentIdentifier+"/"+courseIdentifier);
    RemoveRequiredTextbookFromCoursexhttp.setRequestHeader("Content-type", "text/html");
    RemoveRequiredTextbookFromCoursexhttp.send();
    RemoveRequiredTextbookFromCoursexhttp.onreadystatechange=function()
    {
    	if(RemoveRequiredTextbookFromCoursexhttp.status === 204 && RemoveRequiredTextbookFromCoursexhttp.readyState === 4)
        {
            ClearTable("Course List Enrolled Students");
            ClearTable("Course List Students Textbooks");
            HideButton("Delete Button for Enrolled Student List in Courses View");
            PopulateTheEnrolledStudentsListInCourseView(courseIdentifier);
	}
    };
}


</script>

<script type="text/javascript">

//Gets List of All Textbooks and input into Selected options
function TextbookList()
{
    ClearTable("Textbook List");
    
    var TextbookListxhttp = new XMLHttpRequest();
    TextbookListxhttp.open("GET", url+"/GetAllTextbooks");
    TextbookListxhttp.setRequestHeader("Content-type", "application/json");
    TextbookListxhttp.send();
    TextbookListxhttp.onreadystatechange=function()
    {
        if(TextbookListxhttp.status === 200 && TextbookListxhttp.readyState === 4)
        {
            var Textbooks = JSON.parse(TextbookListxhttp.responseText);
            AllTextbooks = Textbooks;
            for(var i in Textbooks)
            {
                InsertTextbookIntoTableForViewing("Textbook List", Textbooks[i]);
            }
        }
    };
}

// When a textbook is selected from the textbook list while in the textbooks view.
function TextbookSelectedInTextbookView()
{
    ShowButton("Delete Button in Textbooks View");
    ShowButton("Update Button in Textbooks View");
}

// When the user clicks the add button in the textbooks view.
function AddTextbookToDatabase()
{
    var Title = prompt("Please Enter Title of Textbook:", "");
    if(Title === null || Title === "")
    {
        return;
    }
    var Publisher = prompt("Please Enter Publisher of Textbook:", "");
    if(Publisher === null || Publisher === "")
    {
        return;
    }
    var Edition = prompt("Please Enter Edition of Textbook", "");
    if(Edition === null || Edition === "")
    {
        return;
    }
    var Dates = prompt("Please Enter Date of textbook", "");
    if(Dates === null || Dates === "")
    {
        return;
    }
    var AddTextbookToTextbookListxhttp = new XMLHttpRequest();
    AddTextbookToTextbookListxhttp.open("POST", url+"/AddNewTextbook/"+Title+"/"+Publisher+"/"+Edition+"/"+Dates);
    AddTextbookToTextbookListxhttp.setRequestHeader("Content-type", "text/html");
    AddTextbookToTextbookListxhttp.send();
    AddTextbookToTextbookListxhttp.onreadystatechange=function()
    {
        if(AddTextbookToTextbookListxhttp.status === 204 && AddTextbookToTextbookListxhttp.readyState === 4)
        {
            ClearTable("Textbook List");
            HideButton("Delete Button in Textbooks View");
            HideButton("Update Button in Textbooks View");
            TextbookList();
        }
    };
}

// When the user clicks the update button in the textbooks view.
function UpdateTextbookInDatabase()
{
    var temp = document.getElementById("Textbook List");
    var id = temp.options[temp.selectedIndex].value;
    var Title = prompt("Please Enter Title of Textbook:", "");
    if(Title === null || Title === "")
    {
        return;
    }
    var Publisher = prompt("Please Enter Publisher of Textbook:", "");
    if(Publisher === null || Publisher === "")
    {
        return;
    }
    var Edition = prompt("Please Enter Edition of Textbook", "");
    if(Edition === null || Edition === "")
    {
        return;
    }
    var Dates = prompt("Please Enter Date of textbook", "");
    if(Dates === null || Dates === "")
    {
        return;
    }
    
    var UpdateTextbookFromDatabasexhttp = new XMLHttpRequest();
    UpdateTextbookFromDatabasexhttp.open("POST", url+"/UpDateSelectedTextbook/"+id+"/"+Title+"/"+Publisher+"/"+Edition+"/"+Dates);
    UpdateTextbookFromDatabasexhttp.setRequestHeader("Content-type", "text/html");
    UpdateTextbookFromDatabasexhttp.send();
    UpdateTextbookFromDatabasexhttp.onreadystatechange=function()
    {
    	if(UpdateTextbookFromDatabasexhttp.status === 204 && UpdateTextbookFromDatabasexhttp.readyState === 4)
        {
            ClearTable("Textbook List");
            HideButton("Delete Button in Textbooks View");
            HideButton("Update Button in Textbooks View");
            TextbookList();
	}
    };
}

// When the user clicks the delete button in the textbooks view.
function DeleteTextbookInDatabase()
{
    var temp = document.getElementById("Textbook List");
    var id = temp.options[temp.selectedIndex].value;
    var RemoveTextbookFromDatabasexhttp = new XMLHttpRequest();
    RemoveTextbookFromDatabasexhttp.open("DELETE", url+"/DeleteSelectedTextbook/"+id);
    RemoveTextbookFromDatabasexhttp.setRequestHeader("Content-type", "text/html");
    RemoveTextbookFromDatabasexhttp.send();
    RemoveTextbookFromDatabasexhttp.onreadystatechange=function()
    {
    	if(RemoveTextbookFromDatabasexhttp.status === 204 && RemoveTextbookFromDatabasexhttp.readyState === 4)
        {
            ClearTable("Textbook List");
            onLoad();
            HideButton("Delete Button in Textbooks View");
            HideButton("Update Button in Textbooks View");
            //TextbookList();
	}
    };
}
</script>

<script type="text/javascript">


// This function is called when the add button on the helper table is clicked.
function AddAnElementToList()
{
    // Hide the add button after it has been clicked.
    HideButton("AddingAnElementToList");
    
    // Adding a required textbook to a course.
    if (document.getElementById("AddTitle").text === "Available Textbooks to Add:")
    {
        var temp = document.getElementById("Course List");
        var itemAddingTo = temp.options[temp.selectedIndex].value;
        
        var otherTemp = document.getElementById("HelperTable");
        var itemBeingAdded = otherTemp.options[otherTemp.selectedIndex].value;
        
        document.getElementById("AddTable").style.display = "none";
        AddRequiredTextbookToCourse(itemAddingTo, itemBeingAdded);
        
    }
    // Enrolling a student in a course.
    else if (document.getElementById("AddTitle").text === "Available Students to Enroll:")
    {
        var temp = document.getElementById("HelperTable");
        var itemAddingTo = temp.options[temp.selectedIndex].value;
        
        var otherTemp = document.getElementById("Course List");
        var itemBeingAdded = otherTemp.options[otherTemp.selectedIndex].value;
        
        document.getElementById("AddTable").style.display = "none";
        EnrollNewStudentInCourseInCourseView(itemAddingTo, itemBeingAdded);
    }
    // Student is buying a textbook.
    else if (document.getElementById("AddTitle").text === "Available Textbooks to Buy")
    {
        var temp = document.getElementById("Student List");
        var itemAddingTo = temp.options[temp.selectedIndex].value;
        
        var otherTemp = document.getElementById("HelperTable");
        var itemBeingAdded = otherTemp.options[otherTemp.selectedIndex].value;
        
        document.getElementById("AddTable").style.display = "none";
        StudentBuysTextbook(itemAddingTo, itemBeingAdded);
        
    }
    // Student is signing up for a course.
    else
    {
        var temp = document.getElementById("Student List");
        var itemAddingTo = temp.options[temp.selectedIndex].value;
        
        var otherTemp = document.getElementById("HelperTable");
        var itemBeingAdded = otherTemp.options[otherTemp.selectedIndex].value;
        
        document.getElementById("AddTable").style.display = "none";
        EnrollStudentInCourseInStudentView(itemAddingTo, itemBeingAdded);
    }
    
}

function HelperTableElementSelected()
{
    ShowButton("AddingAnElementToList");
}

function HelperTableNoLongerTheFocus()
{
    HideButton("AddingAnElementToList");
    document.getElementById("AddTable").style.display = "none";
}

function DoesStudentHaveRequiredTextbooksForClass(StudentID, Course)
{
    var StudentHasRequiredTextbooksxhttp = new XMLHttpRequest();
    StudentHasRequiredTextbooksxhttp.open("GET", url+"/DoesStudentHaveRequiredTextbooksForCourse/"+StudentID+"/"+Course.CourseID);
    StudentHasRequiredTextbooksxhttp.setRequestHeader("Content-type", "text/html");
    StudentHasRequiredTextbooksxhttp.send();
    StudentHasRequiredTextbooksxhttp.onreadystatechange=function()
    {
        if(StudentHasRequiredTextbooksxhttp.status === 200 && StudentHasRequiredTextbooksxhttp.readyState === 4)
        {
            if (StudentHasRequiredTextbooksxhttp.responseText === "true")
            {
                InsertCourseIntoTableForViewing("Enrolled Courses", Course, "green");
            }
            else
            {
                InsertCourseIntoTableForViewing("Enrolled Courses", Course, "red");
            }
        }
    };
}

function DoAllStudentsHaveRequiredTextbooksForClass(Student, CourseID)
{
    var StudentHasRequiredTextbooksxhttp = new XMLHttpRequest();
    StudentHasRequiredTextbooksxhttp.open("GET", url+"/DoesStudentHaveRequiredTextbooksForCourse/"+Student.StudentID+"/"+CourseID);
    StudentHasRequiredTextbooksxhttp.setRequestHeader("Content-type", "text/html");
    StudentHasRequiredTextbooksxhttp.send();
    StudentHasRequiredTextbooksxhttp.onreadystatechange=function()
    {
        if(StudentHasRequiredTextbooksxhttp.status === 200 && StudentHasRequiredTextbooksxhttp.readyState === 4)
        {
            if (StudentHasRequiredTextbooksxhttp.responseText === "true")
            {
                InsertStudentIntoTableForViewing("Course List Enrolled Students", Student, "green");
            }
            else
            {
                InsertStudentIntoTableForViewing("Course List Enrolled Students", Student, "red");
            }
        }
    };
}


</script>

</body>
</html>