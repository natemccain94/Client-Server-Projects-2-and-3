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
						<button type="button" onclick="AddStudentToStudentList()">Add</button>
						<button type="button" id="Delete Button for Student List in Students View"
                                                        onclick="RemoveStudentFromDatabase()"
                                                        style="display:none;">Remove</button>
                                                <button type="button" id="Update Button in Students View"
                                                        onclick="UpdateStudentInDatabase()"
                                                        style="display:none;">Update</button>
					</p>
					<select id="Student List" size="10" onchange="OnChangeStudentListSelected()"></select>
				</td>
				<td>
					<p>Student's Textbooks:
						<button type="button" onclick="AddStudentListTextbook()">Add</button>
						<button type="button" onclick="RemoveStudentTextbook()">Remove</button>
					</p>
					<p></p>
					<select id="Students Textbooks" size="10">
                                        </select>
				</td>
			</tr>
			<tr>
				<td>
					<p>Enrolled Courses:
						<button type="button" onclick="AddStudentListEnrolledCourses()">Add</button>
						<button type="button" onclick="RemoveStudentEnrolledCourse()">Remove</button>
					</p>
					<p></p>
					<select id="Enrolled Courses" size="10" onchange="OnChangeCoursesSelected()">
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
                                                        onclick="AddCourseListRequiedTextbooks()">Add</button>
                                            
						<button type="button" id="Delete Button for Required Textbooks List in Courses View"
                                                        style="display:none;"
                                                        onclick="RemoveCourseRequiredTextbook()">Remove</button>
					</p>
					<p></p>
					<select id="Course List Required Textbooks" size="10">
                                        </select>
				</td>
			</tr>
			<tr>
				<td>
					<p>Enrolled Students:
						<button type="button" onclick="AddStudentForCourseView()">Add</button>
                                                
						<button type="button" id="Delete Button for Enrolled Student List in Courses View"
                                                        style="display:none;"
                                                        onclick="RemoveCourseEnrolledStudent()">Remove</button>
					</p>
					<p></p>
					<select id="Course List Enrolled Students" size="10" 
                                                onchange="OnChangeEnrolledStudentsSelected()"></select>
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

	<div id="AddTable1">
		<h3 id="AddTitle1"></h3>
		<table>
			<tr>
				<td>
					<select id="HelperTable" size="10"></select>
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
var AllTextbooks;
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

function ToggleAddSelect(text, divID)
{
    document.getElementById(divID).innerHTML = text;
    if(document.getElementById(divID).style.display === "block")
    {
        document.getElementById(divID).style.display = "none";
    }
    else if(document.getElementById(divID).style.display === "none")
    {
        document.getElementById(divID).style.display = "block";
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

// This function is used to insert a student into whatever table id is given.
function InsertStudentIntoTableForViewing(givenID, Student)
{
    var x = document.getElementById(givenID);
    var insertionItem = document.createElement("option");
    insertionItem.text = Student.LastName+", "+Student.FirstName;
    insertionItem.value = Student.StudentID;
    x.add(insertionItem);
}

</script>
//--------------------Student View Functions--------------------//
<script type="text/javascript">
//Gets List of All Students and input into Selected options
function StudentList(){
	var StudentListxhttp = new XMLHttpRequest();
	StudentListxhttp.open("GET", url+"/GetAllStudents");
	StudentListxhttp.setRequestHeader("Content-type", "application/json");
	StudentListxhttp.send();
	StudentListxhttp.onreadystatechange=function(){
		if(StudentListxhttp.status === 200 && StudentListxhttp.readyState === 4){
			var Students = JSON.parse(StudentListxhttp.responseText);
                        var textArea = document.getElementById("Student List");
			for(var i in Students){
                                var option = document.createElement("option");
                                option.text = Students[i].LastName + ", " + Students[i].FirstName;
                                option.value = Students[i].StudentID;
                                textArea.add(option);
				//document.getElementById("Student List").childNodes[i].innerHTML = Students[i].FirstName + " " + Students[i].LastName;
				//document.getElementById("Student List").childNodes[i].value = Students[i].StudentID;
			}
		}
	}
}

//Runs onchange on Student List. Matches Selected Student with a Student in the database.
function GetStudentTextbooks(){
	var temp = document.getElementById("Student List");
	var id = temp.options[temp.selectedIndex].value;
	var GetStudentTextbooksxhttp = new XMLHttpRequest();
	GetStudentTextbooksxhttp.open("GET", url+"/GetAllStudents");
	GetStudentTextbooksxhttp.setRequestHeader("Content-type", "application/json");
	GetStudentTextbooksxhttp.send();
	GetStudentTextbooksxhttp.onreadystatechange=function(){
		if(GetStudentTextbooksxhttp.status === 200 && GetStudentTextbooksxhttp.readyState === 4){
			var Students = JSON.parse(GetStudentTextbooksxhttp.responseText);
			for(var i in Students){//switch to foreach loop
				if(Students[i].StudentID === id){
					PrintStudentTextbooks(Students[i].TextbookOne, Students[i].TextbookTwo, Students[i].TextbookThree,
										 Students[i].TextbookFour, Students[i].TextbookFive, Students[i].TextbookSix,
										 Students[i].TextbookSeven, Students[i].TextbookEight, Students[i].TextbookNine,
										 Students[i].TextbookTen);
					break;
				}
			}
		}
	}
}

//Ran by GetStudentTextBooks(). Inputs Textbooks into Selected options
function PrintStudentTextbooks(one, two, three, four, five, six, seven, eight, nine, ten){
	var PrintStudentTextbooksxhttp = new XMLHttpRequest();
	PrintStudentTextbooksxhttp.open("GET", url+"/GetStudentTextbooks/"+one+"/"+two+"/"+three+"/"+four+"/"+five+"/"+six+"/"+seven+"/"+eight+"/"+nine+"/"+ten);
	PrintStudentTextbooksxhttp.setRequestHeader("Content-type", "application/json");
	PrintStudentTextbooksxhttp.send();
	PrintStudentTextbooksxhttp.onreadystatechange=function(){
		if(PrintStudentTextbooksxhttp.status === 200 && PrintStudentTextbooksxhttp.readyState === 4){
			var Textbooks = JSON.parse(PrintStudentTextbooksxhttp.responseText);
			for(var i in Textbooks){
				document.getElementById("Students Textbooks").childNodes[i].innerHTML = Textbooks[i].title+" "+Textbooks[i].publisher+" "+Textbooks[i].edition+" "+Textbooks[i].date;
				document.getElementById("Students Textbooks").childNodes[i].value = Textbooks[i].TextbookID;
			}
		}
	}
}

//Runs onchange on Student List. Matches selected Student with a Student in the database.
function GetStudentEnrolledCourses(){
	var temp = document.getElementById("Student List");
	var id = temp.options[temp.selectedIndex].value;
	var GetEnrolledCoursesxhttp = new XMLHttpRequest();
	GetEnrolledCoursesxhttp.open("GET", url+"/GetAllStudents");
	GetEnrolledCoursesxhttp.setRequestHeader("Content-type", "application/json");
	GetEnrolledCoursesxhttp.send();
	GetEnrolledCoursesxhttp.onreadystatechange=function(){
		if(GetEnrolledCoursesxhttp.status === 200 && GetEnrolledCoursesxhttp.readyState === 4){
			var Students = JSON.parse(GetEnrolledCoursesxhttp.responseText);
			for(var i in Students){//switch to foreach loop
				if(Students[i].StudentID === id){
					PrintStudentEnrolledCourses(Students[i].CourseOne, Students[i].CourseTwo, Students[i].CourseThree,
												Students[i].CourseFour, Students[i].CourseFive);
					break;
				}
			}
		}
	};
}

//Ran by GetStudentTextBooks(). Inputs Courses into Selected options
function PrintStudentEnrolledCourses(one, two, three, four, five){
	var PrintEnrolledCoursesxhttp = new XMLHttpRequest();
	PrintEnrolledCoursesxhttp.open("GET", url+"/GetCoursesStudentIsTaking/"+one+"/"+two+"/"+three+"/"+four+"/"+five);
	PrintEnrolledCoursesxhttp.setRequestHeader("Content-type", "application/json");
	PrintEnrolledCoursesxhttp.send();
	PrintEnrolledCoursesxhttp.onreadystatechange=function(){
		if(PrintEnrolledCoursesxhttp.status === 200 && PrintEnrolledCoursesxhttp.readyState === 4){
			var Courses = JSON.parse(PrintEnrolledCoursesxhttp.responseText);
			for(var i in Courses){
				document.getElementById("Enrolled Courses").childNodes[i].innerHTML = Courses[i].title;
				document.getElementById("Enrolled Courses").childNodes[i].value = Courses[i].CourseID;
			}
		}
	}
}

//Runs onchange on Enrolled Courses. Matches selected Course with a Course in the database.
function GetRequiredTextbooks(){
	var temp = document.getElementById("Enrolled Courses");
	var id = temp.options[temp.selectedIndex].value;
	var GetRequiredTextbooksxhttp = new XMLHttpRequest();
	GetRequiredTextbooksxhttp.open("GET", url+"/GetAllCourses");
	GetRequiredTextbooksxhttp.setRequestHeader("Content-type", "application/json");
	GetRequiredTextbooksxhttp.send();
	GetRequiredTextbooksxhttp.onreadystatechange=function(){
		if(GetRequiredTextbooksxhttp.status === 200 && GetRequiredTextbooksxhttp.readyState === 4){
			var Courses = JSON.parse(GetRequiredTextbooksxhttp.responseText);
			for(var i in Courses){//switch to foreach loop
				if(Courses[i].CourseID === id){
					PrintRequiredTextbooks(Courses[i].Textone, Courses[i].TextTwo);
					break;
				}
			}
		}
	}
}

//Ran by GetRequiredTextbooks(). Inputs Textbook into Selected options
function PrintRequiredTextbooks(one, two){
	var PrintRequiredTextbooksxhttp = new XMLHttpRequest();
	PrintRequiredTextbooksxhttp.open("GET", url+"/GetRequiredTextbooks/"+one+"/"+two);
	PrintRequiredTextbooksxhttp.setRequestHeader("Content-type", "application/json");
	PrintRequiredTextbooksxhttp.send();
	PrintRequiredTextbooksxhttp.onreadystatechange=function(){
		if(PrintRequiredTextbooksxhttp.status === 200 && PrintRequiredTextbooksxhttp.readyState === 4){
			var Textbooks = JSON.parse(PrintRequiredTextbooksxhttp.responseText);
			for(var i in Textbooks){
				document.getElementById("Required Textbooks").childNodes[i].innerHTML = Textbooks[i].title+" "+Textbooks[i].publisher+" "+Textbooks[i].edition+" "+Textbooks[i].date;
				document.getElementById("Required Textbooks").childNodes[i].value = Textbooks[i].TextbookID;
			}
		}
	}
}

function OnChangeStudentListSelected(){
	GetStudentTextbooks();
	GetStudentEnrolledCourses();
}

function OnChangeCoursesSelected(){
	GetRequiredTextbooks();
}

</script>
//--------------------Course View Functions--------------------//
<script type="text/javascript">
//Gets List of All Courses and input into Selected options
function CourseList(){
    ClearTable("Course List Required Textbooks");
    ClearTable("Course List Enrolled Students");
    ClearTable("Course List Students Textbooks");
    ClearTable("Add1");
    
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
    var temp = document.getElementById("Course List");
    var id = temp.options[temp.selectedIndex].value;
    
    ClearTable("Course List Required Textbooks");
    ClearTable("Course List Enrolled Students");
    
    ShowButton("Delete Button for Course List in Courses View");
    ShowButton("Update Button in Courses View");
    
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
        if(AddCourseToCourseListxhttp.status === 200 && AddCourseToCourseListxhttp.readyState === 4)
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
            ClearTable("Course List");
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
            ClearTable("Course List");
            HideButton("Delete Button for Course List in Courses View");
            HideButton("Update Button in Courses View");
            TextbookList();
	}
    };
}

// Populate the required textbooks list in the Courses View.
function PopulateTheRequiredTextbooksListInCourseView(CourseID)
{
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
                if (i === 1)
                {
                    HideButton("Add Button for Required Textbooks List in Courses View");
                }
            }
        }
    };
}

// Populate the enrolled students list in the Courses View.
function PopulateTheEnrolledStudentsListInCourseView(CourseID)
{
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
                InsertStudentIntoTableForViewing("Course List Enrolled Students", Students[i]);
                // Color the students here based on if they have the appropriate textbooks.
                // Nate look here!!!!
            }
        }
    };
}

// When a textbook is selected in required textbooks list while in the courses view.
function RequiredTextbookSelectedInCourseView()
{
    
}

// Populates the bottom textbox with available textbooks for the course to require.
function PopulateTextbooksAvailableToRequire()
{
    
}

// When a user wants to add a required textbook to a course while in the courses view.
function AddRequiredTextbookToCourse()
{
    
}

// When a user wants to remove a required textbook from a course while in the courses view.
function RemoveRequiredTextbookFromCourse()
{
    var currentCourse = document.getElementById("Course List");
    var courseIdentifier = currentCourse.options[currentCourse.selectedIndex].value;
    var currentBook = document.getElementById("Course List Required Textbooks");
    
    var RemoveRequiredTextbookFromCoursexhttp = new XMLHttpRequest();
    RemoveRequiredTextbookFromCoursexhttp.open("DELETE", url+"/RemoveRequiredText/"+courseIdentifier+"/"+currentBook.selectedIndex);
    RemoveRequiredTextbookFromCoursexhttp.setRequestHeader("Content-type", "text/html");
    RemoveRequiredTextbookFromCoursexhttp.send();
    RemoveRequiredTextbookFromCoursexhttp.onreadystatechange=function()
    {
    	if(RemoveRequiredTextbookFromCoursexhttp.status === 204 && RemoveRequiredTextbookFromCoursexhttp.readyState === 4)
        {
            ClearTable("Course List Required Textbooks");
            HideButton("Delete Button for Required Textbooks List in Courses View");
            PopulateTheRequiredTextbooksListInCourseView(courseIdentifier);
	}
    };
}

// When a student is selected in the enrolled students list while in the courses view.
function EnrolledStudentSelectedInCourseView()
{
    
}

// Populates the selected student's textbooks in while in the courses view.
function PopulateTheSelectedStudentTextbooksInCourseView(StudentID)
{
    
}

// Populate the bottom textbox with students not enrolled in the course.
function StudentsThatCanEnrollInTheCourse()
{
    
}

// When a user wants to enroll a student in a course while in the courses view.
function EnrollNewStudentInCourseInCourseView()
{
    
}

// When a user wants to drop a student from a course while in the courses view.
function DropStudentFromCourseInCourseView()
{
    
}


</script>
//--------------------Textbook View Functions--------------------//
<script type="text/javascript">

//Gets List of All Textbooks and input into Selected options
function TextbookList()
{
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
        if(AddTextbookToTextbookListxhttp.status === 200 && AddTextbookToTextbookListxhttp.readyState === 4)
        {
            ClearTable("Textbook List");
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
            HideButton("Delete Button in Textbooks View");
            HideButton("Update Button in Textbooks View");
            TextbookList();
	}
    };
}
</script>

<script type="text/javascript">
//--------------------Button Functions--------------------//

function Deselect(ElementID){
	var temp = document.getElementById(ElementID);
	temp.options[temp.selectedIndex].selected = false;
}





</script>

</body>
</html>