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
						<button type="button" onclick="AddCourseListRequiedTextbooks()">Add</button>
						<button type="button" onclick="RemoveCourseRequiredTextbook()">Remove</button>
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
						<button type="button" onclick="RemoveCourseEnrolledStudent()">Remove</button>
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
					<select id="Add1" size="10"></select>
					<button type="button" onclick="SubmitAddStudentTextbook()">Add</button>
				</td>
			</tr>
		</table>
	</div>


<script type="text/javascript">
// Check all open requests ie GET, POST, DELETE and check header types
var url = "http://localhost:8080/mavenproject6/webapi/myresource";
var AllTextbooks;


function onLoad(){
	StudentList();
	CourseList();
	TextbookList();
}

function showStudentsTable() {
	document.getElementById("StudentsTable").style.display = "block";
	document.getElementById("CoursesTable").style.display = "none";
	document.getElementById("TextbooksTable").style.display = "none";
	document.getElementById("title").innerHTML = "Student View";
}

function showCoursesTable() {
	document.getElementById("StudentsTable").style.display = "none";
	document.getElementById("CoursesTable").style.display = "block";
	document.getElementById("TextbooksTable").style.display = "none";
	document.getElementById("title").innerHTML = "Course View";
}

function showTextbooksTable() {
	document.getElementById("StudentsTable").style.display = "none";
	document.getElementById("CoursesTable").style.display = "none";
	document.getElementById("TextbooksTable").style.display = "block";
	document.getElementById("title").innerHTML = "Textbook View";
}

function ToggleAddSelect(text, divID){
	document.getElementById(divID).innerHTML = text;
	if(document.getElementById(divID).style.display === "block"){
		document.getElementById(divID).style.display = "none";
	}else if(document.getElementById(divID).style.display === "none"){
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
                InsertCourseIntoTableForViewing("Course List");
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

// When a student is selected in the enrolled students list while in the courses view.
function EnrolledStudentSelectedInCourseView()
{
    
}











//Runs onchange on Course List. Matches Selected Course with a Course in the database.
function GetCourseListRequiredTextbooks(){
	var temp = document.getElementById("Course List");
	var id = temp.options[temp.selectedIndex].value;
	
}

//Ran by GetCourseListRequiredTextbooks(). Inputs Textbooks into Selected options
function PrintCourseListRequiredTextbooks(one, two,){
	var PrintCourseListRequiredTextbooksxhttp = new XMLHttpRequest();
	PrintCourseListRequiredTextbooksxhttp.open("GET", url+"/GetRequiredTextbooks/"+one+"/"+two);
	PrintCourseListRequiredTextbooksxhttp.setRequestHeader("Content-type", "application/json");
	PrintCourseListRequiredTextbooksxhttp.send();
	PrintCourseListRequiredTextbooksxhttp.onreadystatechange=function(){
		if(PrintCourseListRequiredTextbooksxhttp.status === 200 && PrintCourseListRequiredTextbooksxhttp.readyState === 4){
			var Textbooks = JSON.parse(PrintCourseListRequiredTextbooksxhttp.responseText);
			for(var i in Textbooks){
				document.getElementById("Course List Required Textbook").childNodes[i].innerHTML = Textbooks[i].title+" "+Textbooks[i].publisher+" "+Textbooks[i].edition+" "+Textbooks[i].date;
				document.getElementById("Course List Required Textbook").childNodes[i].value = Textbooks[i].TextbookID;
			}
		}
	}
}

//Runs onchange on Course List. Matches Selected Course with a Course in the database.
function GetCourseEnrolledStudents(){
	var temp = document.getElementById("Course List");
	var id = temp.options[temp.selectedIndex].value;
	var GetCourseEnrolledStudentsxhttp = new XMLHttpRequest();
	GetCourseEnrolledStudentsxhttp.open("GET", url+"/GetAllCourses");
	GetCourseEnrolledStudentsxhttp.setRequestHeader("Content-type", "application/json");
	GetCourseEnrolledStudentsxhttp.send();
	GetCourseEnrolledStudentsxhttp.onreadystatechange=function(){
		if(GetCourseEnrolledStudentsxhttp.status === 200 && GetCourseEnrolledStudentsxhttp.readyState === 4){
			var Courses = JSON.parse(GetCourseEnrolledStudentsxhttp.responseText);
			for(var i in Courses){//switch to foreach loop
				if(Courses[i].CourseID === id){
					PrintCourseEnrolledStudents(Courses[i].CourseID);
					break;
				}
			}
		}
	}
}

//Ran by GetCourseEnrolledStudents(). Inputs Students into Selected options
function PrintCourseEnrolledStudents(one){
	var PrintCourseEnrolledStudentsxhttp = new XMLHttpRequest();
	PrintCourseEnrolledStudentsxhttp.open("GET", url+"/GetCourseRoster/"+one);
	PrintCourseEnrolledStudentsxhttp.setRequestHeader("Content-type", "application/json");
	PrintCourseEnrolledStudentsxhttp.send();
	PrintCourseEnrolledStudentsxhttp.onreadystatechange=function(){
		if(PrintCourseEnrolledStudentsxhttp.status === 200 && PrintCourseEnrolledStudentsxhttp.readyState === 4){
			var Students = JSON.parse(PrintCourseEnrolledStudentsxhttp.responseText);
			for(var i in Students){
				document.getElementById("Course List Enrolled Students").childNodes[i].innerHTML = Students[i].FirstName + " " + Students[i].LastName;
				document.getElementById("Course List Enrolled Students").childNodes[i].value = Students[i].StudentID;
			}
		}
	}
}

//Runs onchange on Course List Enrolled Students. Matches selected Student with a Student in the database.
function GetCourseListEnrolledStudents(){
	var temp = document.getElementById("Course List Enrolled Students");
	var id = temp.options[temp.selectedIndex].value;
	var GetCourseListEnrolledStudentsxhttp = new XMLHttpRequest();
	GetCourseListEnrolledStudentsxhttp.open("GET", url+"/GetAllStudents");
	GetCourseListEnrolledStudentsxhttp.setRequestHeader("Content-type", "application/json");
	GetCourseListEnrolledStudentsxhttp.send();
	GetCourseListEnrolledStudentsxhttp.onreadystatechange=function(){
		if(GetCourseListEnrolledStudentsxhttp.status === 200 && GetCourseListEnrolledStudentsxhttp.readyState === 4){
			var Students = JSON.parse(GetCourseListEnrolledStudentsxhttp.responseText);
			for(var i in Students){//switch to foreach loop
				if(Students[i].StudentID === id){
					PrintEnrolledStudentsTextbook(Students[i].TextbookOne, Students[i].TextbookTwo, Students[i].TextbookThree,
												  Students[i].TextbookFour, Students[i].TextbookFive, Students[i].TextbookSix,
												  Students[i].TextbookSeven, Students[i].TextbookEight, Students[i].TextbookNine,
												  Students[i].TextbookTen);
					break;
				}
			}
		}
	}
}

//Ran by GetCourseListEnrolledStudents(). Inputs Textbook into Selected options
function PrintEnrolledStudentsTextbook(one, two, three, four, five, six, seven, eight, nine, ten){
	var PrintRequiredTextbooksxhttp = new XMLHttpRequest();
	PrintRequiredTextbooksxhttp.open("GET", url+"/GetStudentTextbooks/"+one+"/"+two+"/"+three+"/"+four+"/"+five+"/"+six+"/"+seven+"/"+eight+"/"+nine+"/"+ten);
	PrintRequiredTextbooksxhttp.setRequestHeader("Content-type", "application/json");
	PrintRequiredTextbooksxhttp.send();
	PrintRequiredTextbooksxhttp.onreadystatechange=function(){
		if(PrintRequiredTextbooksxhttp.status === 200 && PrintRequiredTextbooksxhttp.readyState === 4){
			var Textbooks = JSON.parse(PrintRequiredTextbooksxhttp.responseText);
			for(var i in Textbooks){
				document.getElementById("Course List Students Textbooks").childNodes[i].innerHTML = Textbooks[i].title+" "+Textbooks[i].publisher+" "+Textbooks[i].edition+" "+Textbooks[i].date;
				document.getElementById("Course List Students Textbooks").childNodes[i].value = Textbooks[i].TextbookID;
			}
		}
	}
}

function OnChangeCourseListSelected(){
	GetCourseListRequiredTextbooks();
	GetCourseEnrolledStudents();
}

function OnChangeEnrolledStudentsSelected(){
	GetCourseListEnrolledStudents();
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

function AddStudentToStudentList(){
	var FirstName = prompt("Please Enter First Name of Student:", "");
	if(FirstName === null || FirstName === ""){
		return;
	}
	var LastName = prompt("Please Enter Last Name of Student:", "");
	if(LastName === null || LastName === ""){
		return;
	}
	var AddStudentToStudentListxhttp = new XMLHttpRequest();
	AddStudentToStudentListxhttp.open("POST", url+"/AddNewStudent/"+FirstName+"/"+LastName);
	AddStudentToStudentListxhttp.setRequestHeader("Content-type", "text/html");
	AddStudentToStudentListxhttp.send();
	AddStudentToStudentListxhttp.onreadystatechange=function(){
		if(AddStudentToStudentListxhttp.status === 200 && AddStudentToStudentListxhttp.readyState === 4){
			StudentList();
			Deselect("Student List");
		}	
	};
}

function RemoveStudentFromDatabase(){
	var temp = document.getElementById("Student List");
	for(var i = 0; i<10; i++){
		if(temp.options[i].selected === true){
			break;
		}
		if(i === 9){
			return;
		}
	}
	var id = temp.options[temp.selectedIndex].value;
	var RemoveStudentFromDatabasexhttp = new XMLHttpRequest();
	RemoveStudentFromDatabasexhttp.open("DELETE", url+"/DeleteSelectedStudent/"+id);
	RemoveStudentFromDatabasexhttp.setRequestHeader("Content-type", "text/html");
	RemoveStudentFromDatabasexhttp.send();
	RemoveStudentFromDatabasexhttp.onreadystatechange=function(){
		if(RemoveStudentFromDatabasexhttp.status === 200 && RemoveStudentFromDatabasexhttp.readyState === 4){
			for(var i = 0;i < 10; i++){
				document.getElementById("Students Textbooks").childNodes[i].innerHTML = "";
				document.getElementById("Students Textbooks").childNodes[i].value = "";
				document.getElementById("Enrolled Courses").childNodes[i].innerHTMLL = "";
				document.getElementById("Enrolled Courses").childNodes[i].value = "";
				document.getElementById("Required Textbooks").childNodes[i].innerHTML = "";
				document.getElementById("Required Textbooks").childNodes[i].value = "";
			}
		}
	};
}

function RemoveStudentTextbook(){
	var bookslot = document.getElementById("Students Textbooks").selectedIndex+1;
	var studenttemp = document.getElementById("Student List");
	var studentid = studenttemp.options[studenttemp.selectedIndex].value;
	var RemoveStudentTextbookxhttp = new XMLHttpRequest();
	RemoveStudentTextbookxhttp.open("DELETE", url+"/SellStudentTextbook/"+studentid+"/"+bookslot);
	RemoveStudentTextbookxhttp.setRequestHeader("Content-type", "text/html");
	RemoveStudentTextbookxhttp.send();
	RemoveStudentTextbookxhttp.onreadystatechange=function(){
		if(RemoveStudentTextbookxhttp.status === 200 && RemoveStudentTextbookxhttp.readyState === 4){
			OnChangeStudentListSelected();
		}
	};
}

function RemoveStudentEnrolledCourse(){
	var classSlot = document.getElementById("Enrolled Courses").selectedIndex+1;
	var studenttemp = document.getElementById("Student List");
	var studentid = studenttemp.options[studenttemp.selectedIndex].value;
	var RemoveStudentEnrolledCoursexhttp = new XMLHttpRequest();
	RemoveStudentEnrolledCoursexhttp.open("DELETE", url+"/StudentDropsClass/"+studentid+"/"+classSlot);
	RemoveStudentEnrolledCoursexhttp.setRequestHeader("Content-type", "text/html");
	RemoveStudentEnrolledCoursexhttp.send();
	RemoveStudentEnrolledCoursexhttp.onreadystatechange=function(){
		if(RemoveStudentEnrolledCoursexhttp.status === 200 && RemoveStudentEnrolledCoursexhttp.readyState === 4){
			OnChangeStudentListSelected();
		}
	};
}


function AddCourseToCourseList(){
	var CourseName = prompt("Please Enter Name of Course:", "");
	if(CourseName === null || CourseName === ""){
		return;
	}
	var AddCourseToCourseListxhttp = new XMLHttpRequest();
	AddCourseToCourseListxhttp.open("POST", url+"/AddNewCourse/"+CourseName);
	AddCourseToCourseListxhttp.setRequestHeader("Content-type", "text/html");
	AddCourseToCourseListxhttp.send();
	AddCourseToCourseListxhttp.onreadystatechange=function(){
		if(AddCourseToCourseListxhttp.status === 200 && AddCourseToCourseListxhttp.readyState === 4){
			CourseList();
			Deselect("Course List");
		}	
	};
}

function RemoveCourseFromDatabase(){
	var temp = document.getElementById("Course List");
	for(var i = 0; i<10; i++){
		if(temp.options[i].selected === true){
			break;
		}
		if(i === 9){
			return;
		}
	}
	var id = temp.options[temp.selectedIndex].value;
	var RemoveCourseFromDatabasexhttp = new XMLHttpRequest();
	RemoveCourseFromDatabasexhttp.open("Delete", url+"/DeleteSelectedCourse/"+id);
	RemoveCourseFromDatabasexhttp.setRequestHeader("Content-type", "text/html");
	RemoveCourseFromDatabasexhttp.send();
	RemoveCourseFromDatabasexhttp.onreadystatechange=function(){
		if(RemoveCourseFromDatabasexhttp.status === 200 && RemoveCourseFromDatabasexhttp.readyState === 4){
			CourseList();
			Deselect("Course List");
		}
	};
}

function RemoveCourseRequiredTextbook(){
	var bookslot = document.getElementById("Course List Required Textbook").selectedIndex+1;
	var coursetemp = document.getElementById("Course List");
	var courseid = coursetemp.options[coursetemp.selectedIndex].value;
	var RemoveCourseRequiredTextbookxhttp = new XMLHttpRequest();
	RemoveCourseRequiredTextbookxhttp.open("DELETE", url+"/RemoveRequiredText/"+studentid+"/"+bookslot);
	RemoveCourseRequiredTextbookxhttp.setRequestHeader("Content-type", "text/html");
	RemoveCourseRequiredTextbookxhttp.send();
	RemoveCourseRequiredTextbookxhttp.onreadystatechange=function(){
		if(RemoveCourseRequiredTextbookxhttp.status === 200 && RemoveCourseRequiredTextbookxhttp.readyState === 4){
			OnChangeCourseListSelected();
		}
	};
}

function RemoveCourseEnrolledStudent(){
	var studenttemp = document.getElementById("Course List Enrolled Students");
	var studentid = studenttemp.options[studenttemp.selectedIndex].value;
	var classtemp = document.getElementById("Course List");
	var classid = classtemp.options[classtemp.selectedIndex].value;
	var RemoveCourseEnrolledStudentxhttp = new XMLHttpRequest();
	RemoveCourseEnrolledStudentxhttp.open("Get", url+"/GetAllStudents/");
	RemoveCourseEnrolledStudentxhttp.setRequestHeader("Content-type", "text/html");
	RemoveStudentEnrolledCoursexhttp.send();
	RemoveCourseEnrolledStudentxhttp.onreadystatechange=function(){
		if(RemoveCourseEnrolledStudentxhttp.status === 200 && RemoveCourseEnrolledStudentxhttp.readyState === 4){
			var Students = JSON.parse(RemoveCourseEnrolledStudentxhttp.responseText);
			for(var i in Students){//switch to foreach loop
				if(Students[i].StudentID === studentid){
					if(Students[i].CourseOne === classid){
						FindStudentCourseSlot2(studentid, 1);
					}
					if(Students[i].CourseTwo === classid){
						FindStudentCourseSlot2(studentid, 2);
					}
					if(Students[i].CourseThree === classid){
						FindStudentCourseSlot2(studentid, 3);
					}
					if(Students[i].CourseFour === classid){
						FindStudentCourseSlot2(studentid, 4);
					}
					if(Students[i].CourseFive === classid){
						FindStudentCourseSlot2(studentid, 5);
					}
				}
			}
		}
	};
}

function FindStudentCourseSlot2(StudentID, CourseSlot){
	var FindStudentCourseSlot2xhttp = new XMLHttpRequest();
	FindStudentCourseSlot2xhttp.open("DELETE", url+"/StudentDropsClass"+StudentID+"/"+CourseSlot);
	FindStudentCourseSlot2xhttp.setRequestHeader("Content-type", "application/json");
	FindStudentCourseSlot2xhttp.send();
	FindStudentCourseSlot2xhttp.onreadystatechange=function(){
		if(FindStudentCourseSlot2xhttp.status === 200 && FindStudentCourseSlot2xhttp.readyState === 4){
			OnChangeCourseListSelected();
		}
	};
}


//--------------------Add Function 1-------------------//

function AddStudentListTextbook(){
	document.getElementById("AddTitle1").innerHTML = "Students Textbooks";
	document.getElementById("AddTable1").style.display = "block";
	GetStudentTextbooks2();
}

function GetStudentTextbooks2(){
	var temp = document.getElementById("Student List");
	var id = temp.options[temp.selectedIndex].value;
	var GetStudentTextbooks2xhttp = new XMLHttpRequest();
	GetStudentTextbooks2xhttp.open("GET", url+"/GetAllStudents");
	GetStudentTextbooks2xhttp.setRequestHeader("Content-type", "application/json");
	GetStudentTextbooks2xhttp.send();
	GetStudentTextbooks2xhttp.onreadystatechange=function(){
		if(GetStudentTextbooks2xhttp.status === 200 && GetStudentTextbooks2xhttp.readyState === 4){
			var Students = JSON.parse(GetStudentTextbooks2xhttp.responseText);
			for(var i in Students){//switch to foreach loop
				if(Students[i].StudentID === id){
					 PrintStudentTextbooks2(Students[i].TextbookOne, Students[i].TextbookTwo, Students[i].TextbookThree,
										 Students[i].TextbookFour, Students[i].TextbookFive, Students[i].TextbookSix,
										 Students[i].TextbookSeven, Students[i].TextbookEight, Students[i].TextbookNine);
				}
			}
		}
	};
}

function PrintStudentTextbooks2(one, two, three, four, five, six, seven, eight, nine){
	var PrintStudentTextbooks2xhttp = new XMLHttpRequest();
	PrintStudentTextbooks2xhttp.open("GET", url+"/GetTextbooksNotOwnedByStudent/"+one+"/"+two+"/"+three+"/"+four+"/"+five+"/"+six+"/"+seven+"/"+eight+"/"+nine);
	PrintStudentTextbooks2xhttp.setRequestHeader("Content-type", "application/json");
	PrintStudentTextbooks2xhttp.send();
	PrintStudentTextbooks2xhttp.onreadystatechange=function(){
		if(PrintStudentTextbooks2xhttp.status === 200 && PrintStudentTextbooks2xhttp.readyState === 4){
			var Textbooks = JSON.parse(PrintStudentTextbooks2xhttp.responseText);
			for(var i in Textbooks){
					document.getElementById("Add1").childNodes[i].innerHTML = Textbooks[i].title+" "+Textbooks[i].publisher+" "+AllTextbooks[i].edition+" "+AllTextbooks[i].date;
					document.getElementById("Add1").childNodes[i].value = Textbooks[i].TextbookID;
			}
		}
	};
}

//kjgfhjkgfgjhfjhf
function SubmitAddStudentTextbook(){
	var temp = document.getElementById("Student List");
	var id = temp.options[temp.selectedIndex].value;
	var SubmitAddStudentTextbookxhttp = new XMLHttpRequest();
	SubmitAddStudentTextbookxhttp.open("GET", url+"/GetAllStudents");
	SubmitAddStudentTextbookxhttp.setRequestHeader("Content-type", "application/json");
	SubmitAddStudentTextbookxhttp.send();
	SubmitAddStudentTextbookxhttp.onreadystatechange=function(){
		if(SubmitAddStudentTextbookxhttp.status === 200 && SubmitAddStudentTextbookxhttp.readyState === 4){
			var Students = JSON.parse(SubmitAddStudentTextbookxhttp.responseText);
			for(var i in Students){//switch to foreach loop
				if(Students[i].StudentID === id){
					if(Students[i].TextbookOne === -1){
						SubmitAddStudentTextbook2(1);						
						break;
					}
					if(Students[i].TextbookTwo === -1){
						SubmitAddStudentTextbook2(2);						
						break;
					}
					if(Students[i].TextbookThree === -1){
						SubmitAddStudentTextbook2(3);						
						break;
					}
					if(Students[i].TextbookFour === -1){
						SubmitAddStudentTextbook2(4);						
						break;
					}
					if(Students[i].TextbookFive === -1){
						SubmitAddStudentTextbook2(5);						
						break;
					}
					if(Students[i].TextbookSix === -1){
						SubmitAddStudentTextbook2(6);						
						break;
					}
					if(Students[i].TextbookSeven === -1){
						SubmitAddStudentTextbook2(7);						
						break;
					}
					if(Students[i].TextbookEight === -1){
						SubmitAddStudentTextbook2(8);						
						break;
					}
					if(Students[i].TextbookNine === -1){
						SubmitAddStudentTextbook2(9);						
						break;
					}
					if(Students[i].TextbookTen === -1){
						SubmitAddStudentTextbook2(10);						
						break;
					}
					//Couldn't add if code reached this far					
					return;
				}
			}
		}
	};
}

function SubmitAddStudentTextbook2(textbookSlot){
	var studenttemp = document.getElementById("Student List");
	var studentid = studenttemp.options[studenttemp.selectedIndex].value;
	var textbooktemp = document.getElementById("Add1");
	var textbookid = textbooktemp.options[textbooktemp.selectedIndex].value;
	var SubmitAddStudentTextbook2xhttp = new XMLHttpRequest();
	SubmitAddStudentTextbook2xhttp.open("POST", url+"/GiveStudentTheTextbook/"+studentid+"/"+textbookid+"/"+textbookSlot);
	SubmitAddStudentTextbook2xhttp.setRequestHeader("Content-type","text/html");
	SubmitAddStudentTextbook2xhttp.send();
	SubmitAddStudentTextbook2xhttp.onreadystatechange=function(){
		if(SubmitAddStudentTextbook2xhttp.status === 200 && SubmitAddStudentTextbook2xhttp.readyState === 4){
			document.getElementById("AddTitle1").innerHTML = "";
			document.getElementById("AddTable1").style.display = "none";
		}
	};
}

//--------------------Add Function 2-------------------//

function AddStudentListEnrolledCourses(){
	document.getElementById("AddTitle2").innerHTML = "Enrolled Courses";
	document.getElementById("AddTable2").style.display = "block";
	GetStudentTextbooks2();
}

function GetEnrolledCourses2(){
	var temp = document.getElementById("Student List");
	var id = temp.options[temp.selectedIndex].value;
	var GetEnrolledCourses2xhttp = new XMLHttpRequest();
	GetEnrolledCourses2xhttp.open("GET", url+"/GetAllStudents");
	GetEnrolledCourses2xhttp.setRequestHeader("Content-type", "application/json");
	GetEnrolledCourses2xhttp.send();
	GetEnrolledCourses2xhttp.onreadystatechange=function(){
		if(GetEnrolledCourses2xhttp.status === 200 && GetEnrolledCourses2xhttp.readyState === 4){
			var Students = JSON.parse(GetEnrolledCourses2xhttp.responseText);
			for(var i in Students){//switch to foreach loop
				if(Students[i].StudentID === id){
					 PrintNotEnrolledCourses(Students[i].CourseOne, Students[i].CourseTwo, Students[i].CourseThree,
										 Students[i].CourseFour);
				}
			}
		}
	};
}

function PrintNotEnrolledCourses(one, two, three, four){
	var PrintNotEnrolledCoursesxhttp = new XMLHttpRequest();
	PrintNotEnrolledCoursesxhttp.open("GET", url+"/GetCoursesTheStudentCanAdd/"+one+"/"+two+"/"+three+"/"+four);
	PrintNotEnrolledCoursesxhttp.setRequestHeader("Content-type", "application/json");
	PrintNotEnrolledCoursesxhttp.send();
	PrintNotEnrolledCoursesxhttp.onreadystatechange=function(){
		if(PrintNotEnrolledCoursesxhttp.status === 200 && PrintNotEnrolledCoursesxhttp.readyState === 4){
			var Courses = JSON.parse(PrintNotEnrolledCoursesxhttp.responseText);
			for(var i in Textbooks){
					document.getElementById("Add1").childNodes[i].innerHTML = Courses[i].CourseName;
					document.getElementById("Add1").childNodes[i].value = Courses[i].CourseID;
			}
		}
	};
}

//kjgfhjkgfgjhfjhf
function SubmitNotEnrolledCourses(){
	var temp = document.getElementById("Student List");
	var id = temp.options[temp.selectedIndex].value;
	var SubmitNotEnrolledCoursesxhttp = new XMLHttpRequest();
	SubmitNotEnrolledCoursesxhttp.open("GET", url+"/GetAllStudents");
	SubmitNotEnrolledCoursesxhttp.setRequestHeader("Content-type", "application/json");
	SubmitNotEnrolledCoursesxhttp.send();
	SubmitNotEnrolledCoursesxhttp.onreadystatechange=function(){
		if(SubmitNotEnrolledCoursesxhttp.status === 200 && SubmitNotEnrolledCoursesxhttp.readyState === 4){
			var Students = JSON.parse(SubmitNotEnrolledCoursesxhttp.responseText);
			for(var i in Students){//switch to foreach loop
				if(Students[i].StudentID === id){
					if(Students[i].CourseOne === -1){
						SubmitNotEnrolledCourses2(1);						
						break;
					}
					if(Students[i].CourseTwo === -1){
						SubmitNotEnrolledCourses2(2);						
						break;
					}
					if(Students[i].CourseThree === -1){
						SubmitNotEnrolledCourses2(3);						
						break;
					}
					if(Students[i].CourseFour === -1){
						SubmitNotEnrolledCourses2(4);						
						break;
					}
					if(Students[i].CourseFive === -1){
						SubmitNotEnrolledCourses2(5);						
						break;
					}
					//Couldn't add if code reached this far					
					return;
				}
			}
		}
	};
}

function SubmitNotEnrolledCourses2(coursesSlot){
	var studenttemp = document.getElementById("Student List");
	var studentid = studenttemp.options[studenttemp.selectedIndex].value;
	var coursetemp = document.getElementById("Add2");
	var courseid = textbooktemp.options[textbooktemp.selectedIndex].value;
	var SubmitAddStudentTextbook2xhttp = new XMLHttpRequest();
	SubmitAddStudentTextbook2xhttp.open("POST", url+"/SignStudentUpForClass/"+studentid+"/"+courseid+"/"+coursesSlot);
	SubmitAddStudentTextbook2xhttp.setRequestHeader("Content-type","text/html");
	SubmitAddStudentTextbook2xhttp.send();
	SubmitAddStudentTextbook2xhttp.onreadystatechange=function(){
		if(SubmitAddStudentTextbook2xhttp.status === 200 && SubmitAddStudentTextbook2xhttp.readyState === 4){
			document.getElementById("AddTitle2").innerHTML = "";
			document.getElementById("AddTable2").style.display = "none";
		}
	};
}

//--------------------Add Function 3-------------------//

function AddCourseListRequiedTextbooks(){
	document.getElementById("AddTitle3").innerHTML = "Requied Textbooks";
	document.getElementById("AddTable3").style.display = "block";
	GetCourseList2();
}

function GetCourseList2(){
	var temp = document.getElementById("Course List");
	var id = temp.options[temp.selectedIndex].value;
	var GetCourseList2xhttp = new XMLHttpRequest();
	GetCourseList2xhttp.open("GET", url+"/GetAllCourses");
	GetCourseList2xhttp.setRequestHeader("Content-type", "application/json");
	GetCourseList2xhttp.send();
	GetCourseList2xhttp.onreadystatechange=function(){
		if(GetCourseList2xhttp.status === 200 && GetCourseList2xhttp.readyState === 4){
			var Courses = JSON.parse(GetCourseList2xhttp.responseText);
			for(var i in Courses){//switch to foreach loop
				if(Courses[i].CourseID === id){
					 PrintCourseViewRequiredTextbooks(Courses[i].TextOne, Courses[i].TextTwo);
				}
			}
		}
	};
}

function PrintCourseViewRequiredTextbooks(one, two){
	var PrintCourseViewRequiredTextbooksxhttp = new XMLHttpRequest();
	PrintCourseViewRequiredTextbooksxhttp.open("GET", url+"/GetTextbooksNotRequiredByCourse/"+one+"/"+two);
	PrintCourseViewRequiredTextbooksxhttp.setRequestHeader("Content-type", "application/json");
	PrintCourseViewRequiredTextbooksxhttp.send();
	PrintCourseViewRequiredTextbooksxhttp.onreadystatechange=function(){
		if(PrintCourseViewRequiredTextbooksxhttp.status === 200 && PrintCourseViewRequiredTextbooksxhttp.readyState === 4){
			var Textbooks = JSON.parse(PrintCourseViewRequiredTextbooksxhttp.responseText);
			for(var i in Textbooks){
					document.getElementById("Add3").childNodes[i].innerHTML = Textbooks[i].title+" "+Textbooks[i].publisher+" "+AllTextbooks[i].edition+" "+AllTextbooks[i].date;
					document.getElementById("Add3").childNodes[i].value = Textbooks[i].TextbookID;
			}
		}
	};
}

//kjgfhjkgfgjhfjhf
function SubmitCourseViewRequiredTextbook(){
	var temp = document.getElementById("Course List");
	var id = temp.options[temp.selectedIndex].value;
	var SubmitCourseViewRequiredTextbookxhttp = new XMLHttpRequest();
	SubmitCourseViewRequiredTextbookxhttp.open("GET", url+"/GetAllCourses");
	SubmitCourseViewRequiredTextbookxhttp.setRequestHeader("Content-type", "application/json");
	SubmitCourseViewRequiredTextbookxhttp.send();
	SubmitCourseViewRequiredTextbookxhttp.onreadystatechange=function(){
		if(SubmitCourseViewRequiredTextbookxhttp.status === 200 && SubmitCourseViewRequiredTextbookxhttp.readyState === 4){
			var Courses = JSON.parse(SubmitCourseViewRequiredTextbookxhttp.responseText);
			for(var i in Courses){//switch to foreach loop
				if(Courses[i].StudentID === id){
					if(Courses[i].TextOne === -1){
						SubmitCourseViewRequiredTextbook2(1);						
						break;
					}
					if(Courses[i].TextTwo === -1){
						SubmitCourseViewRequiredTextbook2(2);						
						break;
					}
					//Couldn't add if code reached this far					
					return;
				}
			}
		}
	};
}

function SubmitCourseViewRequiredTextbook2(textbookSlot){
	var coursetemp = document.getElementById("Course List");
	var courseid = coursetemp.options[coursetemp.selectedIndex].value;
	var textbooktemp = document.getElementById("Add3");
	var textbookid = textbooktemp.options[textbooktemp.selectedIndex].value;
	var SubmitCourseViewRequiredTextbook2xhttp = new XMLHttpRequest();
	SubmitCourseViewRequiredTextbook2xhttp.open("POST", url+"/AddRequiredText/"+courseid+"/"+textbookid+"/"+textbookSlot);
	SubmitCourseViewRequiredTextbook2xhttp.setRequestHeader("Content-type","text/html");
	SubmitCourseViewRequiredTextbook2xhttp.send();
	SubmitCourseViewRequiredTextbook2xhttp.onreadystatechange=function(){
		if(SubmitCourseViewRequiredTextbook2xhttp.status === 200 && SubmitCourseViewRequiredTextbook2xhttp.readyState === 4){
			document.getElementById("AddTitle3").innerHTML = "";
			document.getElementById("AddTable3").style.display = "none";
		}
	};
}

//--------------------Add Function 4-------------------//


function AddStudentForCourseView(){
	document.getElementById("AddTitle4").innerHTML = "Enrolled Students";
	document.getElementById("AddTable4").style.display = "block";
	GetCourseList3();
}

function GetCourseList3(){
	var temp = document.getElementById("Course List");
	var id = temp.options[temp.selectedIndex].value;
	var GetCourseList3xhttp = new XMLHttpRequest();
	GetCourseList3xhttp.open("GET", url+"/GetAllCourses");
	GetCourseList3xhttp.setRequestHeader("Content-type", "application/json");
	GetCourseList3xhttp.send();
	GetCourseList3xhttp.onreadystatechange=function(){
		if(GetCourseList3xhttp.status === 200 && GetCourseList3xhttp.readyState === 4){
			var Courses = JSON.parse(GetCourseList3xhttp.responseText);
			for(var i in Courses){//switch to foreach loop
				if(Courses[i].CourseID === id){
					 PrintNotEnrolledStudents(Courses[i].CourseID);
				}
			}
		}
	};
}

function PrintNotEnrolledStudents(one){
	var PrintNotEnrolledStudentsxhttp = new XMLHttpRequest();
	PrintNotEnrolledStudentsxhttp.open("GET", url+"/GetAllStudentsNotInThisCourse/"+one);
	PrintNotEnrolledStudentsxhttp.setRequestHeader("Content-type", "application/json");
	PrintNotEnrolledStudentsxhttp.send();
	PrintNotEnrolledStudentsxhttp.onreadystatechange=function(){
		if(PrintNotEnrolledStudentsxhttp.status === 200 && PrintNotEnrolledStudentsxhttp.readyState === 4){
			var Students = JSON.parse(PrintNotEnrolledStudentsxhttp.responseText);
			for(var i in Students){
					document.getElementById("Add4").childNodes[i].innerHTML = Students[i].FirstName+" "+Students[i].LastName;
					document.getElementById("Add4").childNodes[i].value = Students[i].StudentID;
			}
		}
	};
}

//kjgfhjkgfgjhfjhf
function SubmitNotEnrolledStudent(){
	var temp = document.getElementById("Add4");
	var id = temp.options[temp.selectedIndex].value;
	var SubmitNotEnrolledStudentxhttp = new XMLHttpRequest();
	SubmitNotEnrolledStudentxhttp.open("GET", url+"/GetAllStudents");
	SubmitNotEnrolledStudentxhttp.setRequestHeader("Content-type", "application/json");
	SubmitNotEnrolledStudentxhttp.send();
	SubmitNotEnrolledStudentxhttp.onreadystatechange=function(){
		if(SubmitNotEnrolledStudentxhttp.status === 200 && SubmitNotEnrolledStudentxhttp.readyState === 4){
			var Students = JSON.parse(SubmitNotEnrolledCoursesxhttp.responseText);
			for(var i in Students){//switch to foreach loop
				if(Students[i].StudentID === id){
					if(Students[i].CourseOne === -1){
						SubmitNotEnrolledStudent2(1);						
						break;
					}
					if(Students[i].CourseTwo === -1){
						SubmitNotEnrolledStudent2(2);						
						break;
					}
					if(Students[i].CourseThree === -1){
						SubmitNotEnrolledStudent2(3);						
						break;
					}
					if(Students[i].CourseFour === -1){
						SubmitNotEnrolledStudent2(4);						
						break;
					}
					if(Students[i].CourseFive === -1){
						SubmitNotEnrolledStudent2(5);						
						break;
					}
					//Couldn't add if code reached this far					
					return;
				}
			}
		}
	};
}

function SubmitNotEnrolledStudent2(classSlot){
	var coursetemp = document.getElementById("Course List");
	var courseid = coursetemp.options[coursetemp.selectedIndex].value;
	var studenttemp = document.getElementById("Add3");
	var studentid = studenttemp.options[studenttemp.selectedIndex].value;
	var SubmitNotEnrolledStudent2xhttp = new XMLHttpRequest();
	SubmitNotEnrolledStudent2xhttp.open("POST", url+"/SignStudentUpForClass/"+studentid+"/"+courseid+"/"+classSlot);
	SubmitNotEnrolledStudent2xhttp.setRequestHeader("Content-type","text/html");
	SubmitNotEnrolledStudent2xhttp.send();
	SubmitNotEnrolledStudent2xhttp.onreadystatechange=function(){
		if(SubmitNotEnrolledStudent2xhttp.status === 200 && SubmitNotEnrolledStudent2xhttp.readyState === 4){
			document.getElementById("AddTitle4").innerHTML = "";
			document.getElementById("AddTable4").style.display = "none";
		}
	};
}

function Deselect(ElementID){
	var temp = document.getElementById(ElementID);
	temp.options[temp.selectedIndex].selected = false;
}





</script>

</body>
</html>