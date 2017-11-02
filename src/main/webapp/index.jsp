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
						<button type="button" onclick="RemoveStudentFromDatabase()" style="display: inline;">Remove</button>
					</p>
					<select id="Student List" size="10" onchange="OnChangeStudentListSelected()">
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
					</select>
				</td>
				<td>
					<p>Student's Textbooks:
						<button type="button" onclick="AddStudentListTextbook()">Add</button>
						<button type="button" onclick="RemoveStudentTextbook()">Remove</button>
					</p>
					<p></p>
					<select id="Students Textbooks" size="10">
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<p>Enrolled Courses:
						<button type="button" onclick="">Add</button>
						<button type="button" onclick="RemoveStudentEnrolledCourse()">Remove</button>
					</p>
					<p></p>
					<select id="Enrolled Courses" size="10" onchange="OnChangeCoursesSelected()">
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
					</select>
				</td>
				<td>
					<p>Required Textbooks:</p>
					<select id="Required Textbooks" size="10">
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
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
						<button type="button" onclick="AddCourseToCourseList()">Add</button>
						<button type="button" onclick="RemoveCourseFromDatabase()">Remove</button>
					</p>
					<p></p>
					<select id="Course List" size="10" onchange="OnChangeCourseListSelected()">
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
					</select>
				</td>
				<td>
					<p>Required Textbooks:
						<button type="button" onclick="">Add</button>
						<button type="button" onclick="RemoveCourseRequiredTextbook()">Remove</button>
					</p>
					<p></p>
					<select id="Course List Required Textbook" size="10">
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<p>Enrolled Students:
						<button type="button" onclick="">Add</button>
						<button type="button" onclick="RemoveCourseEnrolledStudent()">Remove</button>
					</p>
					<p></p>
					<select id="Course List Enrolled Students" size="10" onchange="OnChangeEnrolledStudentsSelected()">
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
					</select>
				</td>
				<td>
					<p>Student's Textbooks:</p>
					<select id="Course List Students Textbooks" size="10">
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
					</select>
				</td>
			</tr>
		</table>
	</div>

	<div id="TextbooksTable">
		<table>
			<tr>
				<td>
					<p>Textbook List: 
						<button type="button" onclick="">Add</button>
						<button type="button" onclick="">Remove</button>
					</p>
					<select id="Textbook List" size="10">
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
					</select>
				</td>
			</tr>
		</table>
	</div>

	<div id="AddTable1">
		<h3 id="AddTitle1"></h3>
		<table>
			<tr>
				<td>
					<select id="Add1" size="10">
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
					</select>
					<button type="button" onclick="SubmitAddStudentTextbook()">Add</button>
				</td>
			</tr>
		</table>
	</div>

	<div id="AddTable2">
		<h3 id="AddTitle2"></h3>
		<table>
			<tr>
				<td>
					<select id="Add2" size="10">
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
					</select>
					<button type="button" onclick="">Add</button>
				</td>
			</tr>
		</table>
	</div>
	<div id="AddTable3">
		<h3 id="AddTitle3"></h3>
		<table>
			<tr>
				<td>
					<select id="Add3" size="10">
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
					</select>
					<button type="button" onclick="">Add</button>
				</td>
			</tr>
		</table>
	</div>
	<div id="AddTable4">
		<h3 id="AddTitle4"></h3>
		<table>
			<tr>
				<td>
					<select id="Add4" size="10">
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
					</select>
					<button type="button" onclick="">Add</button>
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
	if(document.getElementById(divID).style.display == "block"){
		document.getElementById(divID).style.display = "none";
	}else if(document.getElementById(divID).style.display == "none"){
		document.getElementById(divID).style.display = "block";
	}
}


//--------------------Student View Functions--------------------//

//Gets List of All Students and input into Selected options
function StudentList(){
	var StudentListxhttp = new XMLHttpRequest();
	StudentListxhttp.open("GET", url+"/GetAllStudents");
	StudentListxhttp.setRequestHeader("Content-type", "application/json");
	StudentListxhttp.send();
	StudentListxhttp.onreadystatechange=function(){
		if(StudentListxhttp.status == 200 && StudentListxhttp.readyState == 4){
			var Students = JSON.parse(StudentListxhttp.responseText);
			for(var i in Students){
				document.getElementById("Student List").childNodes[i].innerHTML = Students[i].FirstName + " " + Students[i].LastName;
				document.getElementById("Student List").childNodes[i].value = Students[i].StudentID;
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
		if(GetStudentTextbooksxhttp.status == 200 && GetStudentTextbooksxhttp.readyState == 4){
			var Students = JSON.parse(GetStudentTextbooksxhttp.responseText);
			for(var i in Students){//switch to foreach loop
				if(Students[i].StudentID == id){
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
		if(PrintStudentTextbooksxhttp.status == 200 && PrintStudentTextbooksxhttp.readyState == 4){
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
		if(GetEnrolledCoursesxhttp.status == 200 && GetEnrolledCoursesxhttp.readyState == 4){
			var Students = JSON.parse(GetEnrolledCoursesxhttp.responseText);
			for(var i in Students){//switch to foreach loop
				if(Students[i].StudentID == id){
					PrintStudentEnrolledCourses(Students[i].CourseOne, Students[i].CourseTwo, Students[i].CourseThree,
												Students[i].CourseFour, Students[i].CourseFive);
					break;
				}
			}
		}
	}
}

//Ran by GetStudentTextBooks(). Inputs Courses into Selected options
function PrintStudentEnrolledCourses(one, two, three, four, five){
	var PrintEnrolledCoursesxhttp = new XMLHttpRequest();
	PrintEnrolledCoursesxhttp.open("GET", url+"/GetCoursesStudentIsTaking/"+one+"/"+two+"/"+three+"/"+four+"/"+five);
	PrintEnrolledCoursesxhttp.setRequestHeader("Content-type", "application/json");
	PrintEnrolledCoursesxhttp.send();
	PrintEnrolledCoursesxhttp.onreadystatechange=function(){
		if(PrintEnrolledCoursesxhttp.status == 200 && PrintEnrolledCoursesxhttp.readyState == 4){
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
		if(GetRequiredTextbooksxhttp.status == 200 && GetRequiredTextbooksxhttp.readyState == 4){
			var Courses = JSON.parse(GetRequiredTextbooksxhttp.responseText);
			for(var i in Courses){//switch to foreach loop
				if(Courses[i].CourseID == id){
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
		if(PrintRequiredTextbooksxhttp.status == 200 && PrintRequiredTextbooksxhttp.readyState == 4){
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

//--------------------Course View Functions--------------------//

//Gets List of All Courses and input into Selected options
function CourseList(){
	var CourseListxhttp = new XMLHttpRequest();
	CourseListxhttp.open("GET", url+"/GetAllCourses");
	CourseListxhttp.setRequestHeader("Content-type", "application/json");
	CourseListxhttp.send();
	CourseListxhttp.onreadystatechange=function(){
		if(CourseListxhttp.status == 200 && CourseListxhttp.readyState == 4){
			var Courses = JSON.parse(CourseListxhttp.responseText);
			for(var i in Courses){
				document.getElementById("Course List").childNodes[i].innerHTML = Courses[i].CourseName;
				document.getElementById("Course List").childNodes[i].value = Courses[i].CourseID;
			}
		}
	}
}

//Runs onchange on Course List. Matches Selected Course with a Course in the database.
function GetCourseListRequiredTextbooks(){
	var temp = document.getElementById("Course List");
	var id = temp.options[temp.selectedIndex].value;
	var GetCourseListRequiredTextbooksxhttp = new XMLHttpRequest();
	GetCourseListRequiredTextbooksxhttp.open("GET", url+"/GetAllCourses");
	GetCourseListRequiredTextbooksxhttp.setRequestHeader("Content-type", "application/json");
	GetCourseListRequiredTextbooksxhttp.send();
	GetCourseListRequiredTextbooksxhttp.onreadystatechange=function(){
		if(GetCourseListRequiredTextbooksxhttp.status == 200 && GetCourseListRequiredTextbooksxhttp.readyState == 4){
			var Courses = JSON.parse(GetCourseListRequiredTextbooksxhttp.responseText);
			for(var i in Courses){//switch to foreach loop
				if(Courses[i].CourseID == id){
					PrintCourseListRequiredTextbooks(Courses[i].Textone, Courses[i].TextTwo);
					break;
				}
			}
		}
	}
}

//Ran by GetCourseListRequiredTextbooks(). Inputs Textbooks into Selected options
function PrintCourseListRequiredTextbooks(one, two,){
	var PrintCourseListRequiredTextbooksxhttp = new XMLHttpRequest();
	PrintCourseListRequiredTextbooksxhttp.open("GET", url+"/GetRequiredTextbooks/"+one+"/"+two);
	PrintCourseListRequiredTextbooksxhttp.setRequestHeader("Content-type", "application/json");
	PrintCourseListRequiredTextbooksxhttp.send();
	PrintCourseListRequiredTextbooksxhttp.onreadystatechange=function(){
		if(PrintCourseListRequiredTextbooksxhttp.status == 200 && PrintCourseListRequiredTextbooksxhttp.readyState == 4){
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
		if(GetCourseEnrolledStudentsxhttp.status == 200 && GetCourseEnrolledStudentsxhttp.readyState == 4){
			var Courses = JSON.parse(GetCourseEnrolledStudentsxhttp.responseText);
			for(var i in Courses){//switch to foreach loop
				if(Courses[i].CourseID == id){
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
		if(PrintCourseEnrolledStudentsxhttp.status == 200 && PrintCourseEnrolledStudentsxhttp.readyState == 4){
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
		if(GetCourseListEnrolledStudentsxhttp.status == 200 && GetCourseListEnrolledStudentsxhttp.readyState == 4){
			var Students = JSON.parse(GetCourseListEnrolledStudentsxhttp.responseText);
			for(var i in Students){//switch to foreach loop
				if(Students[i].StudentID == id){
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
		if(PrintRequiredTextbooksxhttp.status == 200 && PrintRequiredTextbooksxhttp.readyState == 4){
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

//--------------------Textbook View Functions--------------------//

//Gets List of All Textbooks and input into Selected options
function TextbookList(){
	var TextbookListxhttp = new XMLHttpRequest();
	TextbookListxhttp.open("GET", url+"/GetAllTextbooks");
	TextbookListxhttp.setRequestHeader("Content-type", "application/json");
	TextbookListxhttp.send();
	TextbookListxhttp.onreadystatechange=function(){
		if(TextbookListxhttp.status == 200 && TextbookListxhttp.readyState == 4){
			var Textbooks = JSON.parse(TextbookListxhttp.responseText);
			AllTextbooks = Textbooks;
			for(var i in Textbooks){
				document.getElementById("Textbook List").childNodes[i].innerHTML = Textbooks[i].title+" "+Textbooks[i].publisher+" "+Textbooks[i].edition+" "+Textbooks[i].date;
				document.getElementById("Textbook List").childNodes[i].value = Textbooks[i].TextbookID;
			}
		}
	}
}

//--------------------Button Functions--------------------//

function AddStudentToStudentList(){
	var FirstName = prompt("Please Enter First Name of Student:", "");
	if(FirstName == null || FirstName == ""){
		return;
	}
	var LastName = prompt("Please Enter Last Name of Student:", "");
	if(LastName == null || LastName == ""){
		return;
	}
	var AddStudentToStudentListxhttp = new XMLHttpRequest();
	AddStudentToStudentListxhttp.open("POST", url+"/AddNewStudent/"+FirstName+"/"+LastName);
	AddStudentToStudentListxhttp.setRequestHeader("Content-type", "text/html");
	AddStudentToStudentListxhttp.send();
	AddStudentToStudentListxhttp.onreadystatechange=function(){
		if(AddStudentToStudentListxhttp.status == 200 && AddStudentToStudentListxhttp.readyState == 4){
			StudentList();
			Deselect("Student List");
		}	
	}
}

function RemoveStudentFromDatabase(){
	var temp = document.getElementById("Student List");
	for(var i = 0; i<10; i++){
		if(temp.options[i].selected == true){
			break;
		}
		if(i == 9){
			return;
		}
	}
	var id = temp.options[temp.selectedIndex].value;
	var RemoveStudentFromDatabasexhttp = new XMLHttpRequest();
	RemoveStudentFromDatabasexhttp.open("DELETE", url+"/DeleteSelectedStudent/"+id);
	RemoveStudentFromDatabasexhttp.setRequestHeader("Content-type", "text/html");
	RemoveStudentFromDatabasexhttp.send();
	RemoveStudentFromDatabasexhttp.onreadystatechange=function(){
		if(GetCourseListEnrolledStudentsxhttp.status == 200 && GetCourseListEnrolledStudentsxhttp.readyState == 4){
			for(var i = 0;i < 10; i++){
				document.getElementById("Students Textbooks").childNodes[i].innerHTML = "";
				document.getElementById("Students Textbooks").childNodes[i].value = "";
				document.getElementById("Enrolled Courses").childNodes[i].innerHTMLL = "";
				document.getElementById("Enrolled Courses").childNodes[i].value = "";
				document.getElementById("Required Textbooks").childNodes[i].innerHTML = "";
				document.getElementById("Required Textbooks").childNodes[i].value = "";
			}
		}
	}
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
		if(RemoveStudentTextbookxhttp.status == 200 && RemoveStudentTextbookxhttp.readyState == 4){
			OnChangeStudentListSelected();
		}
	}
}

function RemoveStudentEnrolledCourse(){
	var classSlot = document.getElementById("Enrolled Courses").selectedIndex+1;
	var studenttemp = document.getElementById("Student List");
	var studentid = studenttemp.options[studenttemp.selectedIndex].value;
	var RemoveStudentFromDatabasexhttp = new XMLHttpRequest();
	RemoveStudentEnrolledCoursexhttp.open("DELETE", url+"/StudentDropsClass/"+studentid+"/"+classSlot);
	RemoveStudentEnrolledCoursexhttp.setRequestHeader("Content-type", "text/html");
	RemoveStudentEnrolledCoursexhttp.send();
	RemoveStudentEnrolledCoursexhttp.onreadystatechange=function(){
		if(RemoveStudentEnrolledCoursexhttp.status == 200 && RemoveStudentEnrolledCoursexhttp.readyState == 4){
			OnChangeStudentListSelected();
		}
	}
}


function AddCourseToCourseList(){
	var CourseName = prompt("Please Enter Name of Course:", "");
	if(CourseName == null || CourseName == ""){
		return;
	}
	var AddCourseToCourseListxhttp = new XMLHttpRequest();
	AddCourseToCourseListxhttp.open("POST", url+"/AddNewStudent/"+CourseName);
	AddCourseToCourseListxhttp.setRequestHeader("Content-type", "text/html");
	AddCourseToCourseListxhttp.send();
	AddCourseToCourseListxhttp.onreadystatechange=function(){
		if(AddCourseToCourseListxhttp.status == 200 && AddCourseToCourseListxhttp.readyState == 4){
			CourseList();
			Deselect("Course List");
		}	
	}
}

function RemoveCourseFromDatabase(){
	var temp = document.getElementById("Course List");
	for(var i = 0; i<10; i++){
		if(temp.options[i].selected == true){
			break;
		}
		if(i == 9){
			return;
		}
	}
	var id = temp.options[temp.selectedIndex].value;
	var RemoveCourseFromDatabasexhttp = new XMLHttpRequest();
	RemoveCourseFromDatabasexhttp.open("Delete", url+"/DeleteSelectedCourse/"+id);
	RemoveCourseFromDatabasexhttp.setRequestHeader("Content-type", "text/html");
	RemoveCourseFromDatabasexhttp.send();
	RemoveCourseFromDatabasexhttp.onreadystatechange=function(){
		if(RemoveCourseFromDatabasexhttp.status == 200 && RemoveCourseFromDatabasexhttp.readyState == 4){
			CourseList();
			Deselect("Course List");
		}
	}
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
		if(RemoveCourseRequiredTextbookxhttp.status == 200 && RemoveCourseRequiredTextbookxhttp.readyState == 4){
			OnChangeCourseListSelected();
		}
	}
}

function RemoveCourseEnrolledStudent(){
	var studenttemp = document.getElementById("Course List Enrolled Students");
	var studentid = studenttemp.options[studenttemp.selectedIndex].value;
	var classtemp = document.getElementById("Course List");
	var classid = classtemp.options[classtemp.selectedIndex].value;
	var classSlot = FindStudentCourseSlot(studentid, classid);
	var RemoveCourseEnrolledStudentxhttp = new XMLHttpRequest();
	RemoveCourseEnrolledStudentxhttp.open("DELETE", url+"/StudentDropsClass/"+studentid+"/"+classSlot);
	RemoveCourseEnrolledStudentxhttp.setRequestHeader("Content-type", "text/html");
	RemoveStudentEnrolledCoursexhttp.send();
	RemoveCourseEnrolledStudentxhttp.onreadystatechange=function(){
		if(RemoveCourseEnrolledStudentxhttp.status == 200 && RemoveCourseEnrolledStudentxhttp.readyState == 4){
			OnChangeCourseListSelected();
		}
	}
}

function FindStudentCourseSlot(StudentID, CourseID){
	var GetStudentTextbooksxhttp = new XMLHttpRequest();
	GetStudentTextbooksxhttp.open("GET", url+"/GetAllStudents");
	GetStudentTextbooksxhttp.setRequestHeader("Content-type", "application/json");
	GetStudentTextbooksxhttp.send();
	GetStudentTextbooksxhttp.onreadystatechange=function(){
		if(GetStudentTextbooksxhttp.status == 200 && GetStudentTextbooksxhttp.readyState == 4){
			var Students = JSON.parse(GetStudentTextbooksxhttp.responseText);
			for(var i in Students){//switch to foreach loop
				if(Students[i].StudentID == StudentID){
					if(Students[i].CourseOne == CourseID){
						return 1;					
					}
					if(Students[i].CourseTwo == CourseID){
						return 2;					
					}
					if(Students[i].CourseThree == CourseID){
						return 3;					
					}
					if(Students[i].CourseFour == CourseID){
						return 4;					
					}
					if(Students[i].CourseFive == CourseID){
						return 5;					
					}
				}
			}
		}
	}
}

function RemovetextbookFromDatabase(){
	var temp = document.getElementById("Textbook List");
	for(var i = 0; i<10; i++){
		if(temp.options[i].selected == true){
			break;
		}
		if(i == 9){
			return;
		}
	}
	var id = temp.options[temp.selectedIndex].value;
	var RemoveStudentFromDatabasexhttp = new XMLHttpRequest();
	RemovetextbookFromDatabasexhttp.open("DELETE", url+"/DeleteSelectedTextbook/"+id);
	RemovetextbookFromDatabasexhttp.setRequestHeader("Content-type", "text/html");
	RemovetextbookFromDatabasexhttp.send();
	RemovetextbookFromDatabasexhttp.onreadystatechange=function(){
		if(RemovetextbookFromDatabasexhttp.status == 200 && RemovetextbookFromDatabasexhttp.readyState == 4){
			TextbookList();
		}
	}
}



function GetStudentTextbooks2(){
	var temp = document.getElementById("Student List");
	var id = temp.options[temp.selectedIndex].value;
	var GetStudentTextbooks2xhttp = new XMLHttpRequest();
	GetStudentTextbooks2xhttp.open("GET", url+"/GetAllStudents");
	GetStudentTextbooks2xhttp.setRequestHeader("Content-type", "application/json");
	GetStudentTextbooks2xhttp.send();
	GetStudentTextbooks2xhttp.onreadystatechange=function(){
		if(GetStudentTextbooks2xhttp.status == 200 && GetStudentTextbooks2xhttp.readyState == 4){
			var Students = JSON.parse(GetStudentTextbooks2xhttp.responseText);
			for(var i in Students){//switch to foreach loop
				if(Students[i].StudentID == id){
					 PrintStudentTextbooks2(Students[i].TextbookOne, Students[i].TextbookTwo, Students[i].TextbookThree,
										 Students[i].TextbookFour, Students[i].TextbookFive, Students[i].TextbookSix,
										 Students[i].TextbookSeven, Students[i].TextbookEight, Students[i].TextbookNine);
				}
			}
		}
	}
}

function AddStudentListTextbook(){
	document.getElementById("AddTitle1").innerHTML = "Students Textbooks";
	document.getElementById("AddTable1").style.display = "block";
	GetStudentTextbooks2();
}

function PrintStudentTextbooks2(one, two, three, four, five, six, seven, eight, nine){
	var PrintStudentTextbooks2xhttp = new XMLHttpRequest();
	PrintStudentTextbooks2xhttp.open("GET", url+"/GetTextbooksNotOwnedByStudent/"+one+"/"+two+"/"+three+"/"+four+"/"+five+"/"+six+"/"+seven+"/"+eight+"/"+nine);
	PrintStudentTextbooks2xhttp.setRequestHeader("Content-type", "application/json");
	PrintStudentTextbooks2xhttp.send();
	PrintStudentTextbooks2xhttp.onreadystatechange=function(){
		if(PrintStudentTextbooks2xhttp.status == 200 && PrintStudentTextbooks2xhttp.readyState == 4){
			var Textbooks = JSON.parse(PrintStudentTextbooks2xhttp.responseText);
			for(var i in Textbooks){
					document.getElementById("Add1").childNodes[i].innerHTML = Textbooks[i].title+" "+Textbooks[i].publisher+" "+AllTextbooks[i].edition+" "+AllTextbooks[i].date;
					document.getElementById("Add1").childNodes[i].value = Textbooks[i].TextbookID;
			}
				
		}
	}
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
		if(SubmitAddStudentTextbookxhttp.status == 200 && SubmitAddStudentTextbookxhttp.readyState == 4){
			var Students = JSON.parse(SubmitAddStudentTextbookxhttp.responseText);
			for(var i in Students){//switch to foreach loop
				if(Students[i].StudentID == id){
					if(Students[i].TextbookOne == -1){
						SubmitAddStudentTextbook2(1);						
						break;
					}
					if(Students[i].TextbookTwo == -1){
						SubmitAddStudentTextbook2(2);						
						break;
					}
					if(Students[i].TextbookThree == -1){
						SubmitAddStudentTextbook2(3);						
						break;
					}
					if(Students[i].TextbookFour == -1){
						SubmitAddStudentTextbook2(4);						
						break;
					}
					if(Students[i].TextbookFive == -1){
						SubmitAddStudentTextbook2(5);						
						break;
					}
					if(Students[i].TextbookSix == -1){
						SubmitAddStudentTextbook2(6);						
						break;
					}
					if(Students[i].TextbookSeven == -1){
						SubmitAddStudentTextbook2(7);						
						break;
					}
					if(Students[i].TextbookEight == -1){
						SubmitAddStudentTextbook2(8);						
						break;
					}
					if(Students[i].TextbookNine == -1){
						SubmitAddStudentTextbook2(9);						
						break;
					}
					if(Students[i].TextbookTen == -1){
						SubmitAddStudentTextbook2(10);						
						break;
					}
					//Couldn't add if code reached this far					
					return;
				}
			}
		}
	}
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
		if(SubmitAddStudentTextbook2xhttp.status == 200 && SubmitAddStudentTextbook2xhttp.readyState == 4){
			document.getElementById("AddTitle1").innerHTML = "";
			document.getElementById("AddTable1").style.display = "none";
		}
	}
}




function Deselect(ElementID){
	var temp = document.getElementById(ElementID);
	temp.options[temp.selectedIndex].selected = false;
}





</script>

</body>
</html>