package com.mycompany.mavenproject6;
import static com.mycompany.mavenproject6.ConnectionToMySQL.*;
import java.util.List;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.POST;
import javax.ws.rs.PathParam;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 * Root resource (exposed at "myresource" path)
 */
@Path("myresource")
public class MyResource {

    /**
     * Method handling HTTP GET requests. The returned object will be sent
     * to the client as "text/plain" media type.
     * 
     * @return String that will be returned as a text/plain response.
     */
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String getIt() {
        return "Got it!";
    }
    
    // This function is used to test that the jax rs is playing nicely with glassfish.
    @GET
    @Path("zoom/boom/{look}")
    @Produces(MediaType.TEXT_PLAIN)
    public String test(@PathParam("look") String me)
    {
        return "boom" + me;
    }
    
    // <editor-fold desc="User wishes to add a core item to the database.">
    // Add a textbook to the database.
    @POST
    @Path("AddNewTextbook/{Title}/{Publisher}/{Edition}/{Date}")
    @Consumes(MediaType.TEXT_HTML)
    public void AddNewTextbook(@PathParam("Title") String Title, 
            @PathParam("Publisher") String Publisher, 
            @PathParam("Edition") int Edition, @PathParam("Date") int Date)
    {
        if (FindTextbook(Title,Publisher,Edition,Date) == -1)
            AddTextbook(Title,Publisher,Edition,Date);
            
    }
    
    // Add a course to the database.
    @POST
    @Path("AddNewCourse/{CourseName}")
    @Consumes(MediaType.TEXT_HTML)
    public void AddNewCourse(@PathParam("CourseName") String CourseName)
    {
        if (FindCourseByName(CourseName) == -1)
            AddCourse(CourseName);
    }
    
    // Add a student to the database.
    @POST
    @Path("AddNewStudent/{FirstName}/{LastName}")
    @Consumes(MediaType.TEXT_HTML)
    public void AddNewStudent(@PathParam("FirstName") String FirstName,
            @PathParam("LastName") String LastName)
    {
        if (FindStudentByName(FirstName,LastName) == -1)
            AddStudent(FirstName,LastName);
    }
    // </editor-fold>
    
    // <editor-fold desc="User wishes to upDate a core item.">
    // UpDate a textbook.
    @POST
    @Path("UpDateSelectedTextbook/{TextbookID}/{Title}/{Publisher}/{Edition}/{Date}")
    @Consumes(MediaType.TEXT_HTML)
    public void UpDateSelectedTextbook(@PathParam("TextbookID") int TextbookID, 
            @PathParam("Title") String Title, 
            @PathParam("Publisher") String Publisher, 
            @PathParam("Edition") int Edition, @PathParam("Date") int Date)
    {
        UpdateTextbook(TextbookID, Title, Publisher, Edition, Date);
    }
    
    // UpDate a course.
    @POST
    @Path("UpDateSelectedCourse/{CourseID}/{CourseName}")
    @Consumes(MediaType.TEXT_HTML)
    public void UpDateSelectedCourse(@PathParam("CourseID") int CourseID, 
            @PathParam("CourseName") String CourseName)
    {
        UpdateCourse(CourseID, CourseName);
    }
    
    // UpDate a student.
    @POST
    @Path("UpDateSelectedStudent/{StudentID}/{FirstName}/{LastName}")
    @Consumes(MediaType.TEXT_HTML)
    public void UpDateSelectedStudent(@PathParam("StudentID") int StudentID, 
            @PathParam("FirstName") String FirstName, 
            @PathParam("LastName") String LastName)
    {
        UpdateStudent(StudentID, FirstName, LastName);
    }
    // </editor-fold>
    
    // <editor-fold desc="User wishes to delete a core item.">
    // User wants to delete a textbook.
    @DELETE
    @Path("DeleteSelectedTextbook/{TextbookID}")
    @Consumes(MediaType.TEXT_HTML)
    public void DeleteSelectedTextbook(@PathParam("TextbookID") int TextbookID)
    {
        DeleteTextbook(TextbookID);
    }
    
    // User wants to delete a course.
    @DELETE
    @Path("DeleteSelectedCourse/{CourseID}")
    @Consumes(MediaType.TEXT_HTML)
    public void DeleteSelectedCourse(@PathParam("CourseID") int CourseID)
    {
        DeleteCourse(CourseID);
    }
    
    // User wants to delete a student.
    @DELETE
    @Path("DeleteSelectedStudent/{StudentID}")
    @Consumes(MediaType.TEXT_HTML)
    public void DeleteSelectedStudent(@PathParam("StudentID") int StudentID)
    {
        DeleteStudent(StudentID);
    }
    // </editor-fold>
    
    // <editor-fold desc="View needs to get a list of items from the database.">
    // <editor-fold desc="Functions to get everything from a table.">
    // Get all textbooks from the database.
    @GET
    @Path("GetAllTextbooks")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Textbook> GetAllTextbooks()
    {
        return GetAllTextbooksFromDatabase();
    }
    
    // Get all courses from the database.
    @GET
    @Path("GetAllCourses")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Course> GetAllCourses()
    {
        return GetAllCoursesFromDatabase();
    }
    
    // Get all students from the database.
    @GET
    @Path("GetAllStudents")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Student> GetAllStudents()
    {
        return GetAllStudentsFromDatabase();
    }
    // </editor-fold>
    
    // <editor-fold desc="Functions to get everything associated with an item.">
    // Get all required textbooks for a course.
    @GET
    @Path("GetRequiredTextbooks/{TextOne}/{TextTwo}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Textbook> GetRequiredTextbooks(@PathParam("TextOne") int TextOne,
            @PathParam("TextTwo") int TextTwo)
    {
        return GetRequiredTextsForCourse(TextOne,TextTwo);
    }
    
    // Get all required textbooks for a course.
    @GET
    @Path("GetRequiredTextbooks/{CourseID}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Textbook> GetRequiredTextbooks(@PathParam("CourseID") int CourseID)
    {
        return GetRequiredTextsForCourse(CourseID);
    }
    
    // Get all textbooks owned by a student.
    @GET
    @Path("GetStudentTextbooks/{one}/{two}/{three}/{four}/{five}/{six}/{seven}/{eight}/{nine}/{ten}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Textbook> GetStudentTextbooks(@PathParam("one") int TextbookOne,
            @PathParam("two") int TextbookTwo, @PathParam("three") int TextbookThree, 
            @PathParam("four") int TextbookFour, @PathParam("five") int TextbookFive, 
            @PathParam("six") int TextbookSix, @PathParam("seven") int TextbookSeven, 
            @PathParam("eight") int TextbookEight, @PathParam("nine") int TextbookNine, 
            @PathParam("ten") int TextbookTen)
    {
        return GetTextbooksOwnedByStudent(TextbookOne,
            TextbookTwo, TextbookThree, TextbookFour, 
            TextbookFive, TextbookSix, TextbookSeven, 
            TextbookEight, TextbookNine, TextbookTen);
    }
   
    // Get all textbooks owned by a student.
    @GET
    @Path("GetStudentTextbooks/{StudentID}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Textbook> GetStudentTextbooks(@PathParam("StudentID") int StudentID)
    {
        return GetTextbooksOwnedByStudent(StudentID);
    }
    
    // Get all students enrolled in the course.
    @GET
    @Path("GetCourseRoster/{CourseID}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Student> GetCourseRoster(@PathParam("CourseID") int CourseID)
    {
        return GetStudentsEnrolledInSpecifiedCourse(CourseID);
    }
    
    // Get all courses a student is enrolled in.
    @GET
    @Path("GetCoursesStudentIsTaking/{CourseOne}/{CourseTwo}/{CourseThree}/{CourseFour}/{CourseFive}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Course> GetCoursesStudentIsTaking(@PathParam("CourseOne") 
            int CourseOne, @PathParam("CourseTwo") int CourseTwo, 
            @PathParam("CourseThree") int CourseThree,
            @PathParam("CourseFour") int CourseFour, 
            @PathParam("CourseFive") int CourseFive)
    {
        return GetCoursesStudentIsEnrolledIn(CourseOne,
            CourseTwo, CourseThree, CourseFour, CourseFive);
    }
    // </editor-fold>
    
    // <editor-fold desc="Functions to get everything not associated with an item.">
    // Get all textbooks not owned by the student.
    // This will only be called if the student has room for another textbook.
    @GET
    @Path("GetTextbooksNotOwnedByStudent/{one}/{two}/{three}/{four}/{five}/{six}/{seven}/{eight}/{nine}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Textbook> GetTextbooksNotOwnedByStudent(@PathParam("one") int TextbookOne,
            @PathParam("two") int TextbookTwo, @PathParam("three") int TextbookThree, 
            @PathParam("four") int TextbookFour, @PathParam("five") int TextbookFive, 
            @PathParam("six") int TextbookSix, @PathParam("seven") int TextbookSeven, 
            @PathParam("eight") int TextbookEight, @PathParam("nine") int TextbookNine)
    {
        return GetTextbooksCurrentlyNotOwnedByStudent(TextbookOne, TextbookTwo, 
                TextbookThree, TextbookFour, TextbookFive, TextbookSix,
            TextbookSeven, TextbookEight, TextbookNine);
    }
    
    // Get all students not enrolled in the course.
    @GET
    @Path("GetAllStudentsNotInThisCourse/{CourseID}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Student> GetAllStudentsNotInThisCourse(@PathParam("CourseID") 
            int CourseID)
    {
        return GetAllStudentsNotEnrolledInClass(CourseID);
    }
    
//    // Get all textbooks not being used by the course.
//    @GET
//    @Path("GetTextbooksNotRequiredByCourse/{TextOne}/{TextTwo}")
//    @Produces(MediaType.APPLICATION_JSON)
//    public List<Textbook> GetTextbooksNotRequiredByCourse(@PathParam("TextOne") 
//            int TextOne, @PathParam("TextTwo") int TextTwo)
//    {
//        return GetTextbooksCurrentlyNotUsedByCourse(TextOne, TextTwo);
//    }
    
    // Get all textbooks not being used by the course.
    @GET
    @Path("GetTextbooksNotRequiredByCourse/{CourseID}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Textbook> GetTextbooksNotRequiredByCourse(@PathParam("CourseID") int CourseID)
    {
        Course course = new Course();
        course = GetSpecificCourse(CourseID);
        return GetTextbooksCurrentlyNotUsedByCourse(course.TextOne, course.TextTwo);
    }
    
    // Get all courses the student is not enrolled in.
    // This will only be called if the student has room to add a course.
    @GET
    @Path("GetCoursesTheStudentCanAdd/{CourseOne}/{CourseTwo}/{CourseThree}/{CourseFour}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Course> GetCoursesTheStudentCanAdd(@PathParam("CourseOne") 
            int CourseOne, @PathParam("CourseTwo") int CourseTwo, 
            @PathParam("CourseThree") int CourseThree,
            @PathParam("CourseFour") int CourseFour)
    {
        return GetAllCoursesStudentIsNotEnrolledIn(CourseOne, CourseTwo,
                CourseThree, CourseFour);
    }
    // </editor-fold>
    // </editor-fold>
    
    // <editor-fold desc="Functions to do stuff to a student's textbooks.">
    // Give a student a textbook. BookSlot indicates how many books the
    // student owns.
    @POST
    @Path("GiveStudentTheTextbook/{StudentID}/{TextbookID}/{BookSlot}")
    @Consumes(MediaType.TEXT_HTML)
    public void GiveStudentTheTextbook(@PathParam("StudentID") int StudentID, 
            @PathParam("TextbookID") int TextbookID, 
            @PathParam("BookSlot") int BookSlot)
    {
        switch(BookSlot)
        {
            case 1:
                GiveStudentFirstTextbook(StudentID, TextbookID);
                break;
            case 2:
                GiveStudentSecondTextbook(StudentID, TextbookID);
                break;
            case 3:
                GiveStudentThirdTextbook(StudentID, TextbookID);
                break;
            case 4:
                GiveStudentFourthTextbook(StudentID, TextbookID);
                break;
            case 5:
                GiveStudentFifthTextbook(StudentID, TextbookID);
                break;
            case 6:
                GiveStudentSixthTextbook(StudentID, TextbookID);
                break;
            case 7:
                GiveStudentSeventhTextbook(StudentID, TextbookID);
                break;
            case 8:
                GiveStudentEighthTextbook(StudentID, TextbookID);
                break;
            case 9:
                GiveStudentNinthTextbook(StudentID, TextbookID);
                break;
            default:
                GiveStudentTenthTextbook(StudentID, TextbookID);
                break;
        }
    }
    
    // Remove a student's textbook from the specified slot.
    // They won't get any money from the textbook sale.
    @POST
    @Path("SellStudentTextbook/{StudentID}/{BookSlot}")
    @Consumes(MediaType.TEXT_HTML)
    public void SellStudentTextbook(@PathParam("StudentID") int StudentID, 
            @PathParam("BookSlot") int BookSlot)
    {
        switch(BookSlot)
        {
            case 1:
                RemoveTextbookOneFromStudent(StudentID);
                break;
            case 2:
                RemoveTextbookTwoFromStudent(StudentID);
                break;
            case 3:
                RemoveTextbookThreeFromStudent(StudentID);
                break;
            case 4:
                RemoveTextbookFourFromStudent(StudentID);
                break;
            case 5:
                RemoveTextbookFiveFromStudent(StudentID);
                break;
            case 6:
                RemoveTextbookSixFromStudent(StudentID);
                break;
            case 7:
                RemoveTextbookSevenFromStudent(StudentID);
                break;
            case 8:
                RemoveTextbookEightFromStudent(StudentID);
                break;
            case 9:
                RemoveTextbookNineFromStudent(StudentID);
                break;
            default:
                RemoveTextbookTenFromStudent(StudentID);
                break;
        }
    }
    // </editor-fold>
    
    // <editor-fold desc="Functions to do stuff to a course's textbooks.">
//    // Add a textbook to the course's required textbooks list.
//    @POST
//    @Path("AddRequiredText/{CourseID}/{TextbookID}/{BookSlot}")
//    @Consumes(MediaType.TEXT_HTML)
//    public void AddRequiredText(@PathParam("CourseID") int CourseID, 
//            @PathParam("TextbookID") int TextbookID, 
//            @PathParam("BookSlot") int BookSlot)
//    {
//        if (BookSlot == 1)
//            AddFirstRequiredTextbook(CourseID, TextbookID);
//        else
//            AddSecondRequiredTextbook(CourseID, TextbookID);
//    }
    
    // Add a textbook to the course's required textbooks list.
    @POST
    @Path("AddRequiredText/{CourseID}/{TextbookID}")
    @Consumes(MediaType.TEXT_HTML)
    public void AddRequiredText(@PathParam("CourseID") int CourseID, 
            @PathParam("TextbookID") int TextbookID)
    {
        Course course = new Course();
        course = GetSpecificCourse(CourseID);
        
        if (course.TextOne != -1)
            AddSecondRequiredTextbook(CourseID, TextbookID);
        else
            AddFirstRequiredTextbook(CourseID, TextbookID);
    }
    
//    // Remove a textbook from the course's required textbooks list.
//    @POST
//    @Path("RemoveRequiredText/{CourseID}/{BookSlot}")
//    @Consumes(MediaType.TEXT_HTML)
//    public void RemoveRequiredText(@PathParam("CourseID") int CourseID, 
//            @PathParam("BookSlot") int BookSlot)
//    {
//        if (BookSlot == 1)
//            RemoveRequiredTextOneFromSpecifiedCourse(CourseID);
//        else
//            RemoveRequiredTextTwoFromSpecifiedCourse(CourseID);
//    }
    
    // Remove a textbook from the course's required textbooks list.
    @POST
    @Path("RemoveSpecifiedRequiredText/{CourseID}/{TextbookID}")
    @Consumes(MediaType.TEXT_HTML)
    public void RemoveSpecifiedRequiredText(@PathParam("CourseID") int CourseID, 
            @PathParam("TextbookID") int TextbookID)
    {
        Course course = new Course();
        course = GetSpecificCourse(CourseID);
        
        if (course.TextOne == TextbookID)
            RemoveRequiredTextOneFromSpecifiedCourse(CourseID);
        else
            RemoveRequiredTextTwoFromSpecifiedCourse(CourseID);
    }
    // </editor-fold>
    
    // <editor-fold desc="Functions to do stuff between courses and students.">
    // Enroll a student in a class.
    @POST
    @Path("SignStudentUpForClass/{StudentID}/{CourseID}/{ClassSlot}")
    @Consumes(MediaType.TEXT_HTML)
    public void SignStudentUpForClass(@PathParam("StudentID") int StudentID,
            @PathParam("CourseID") int CourseID, 
            @PathParam("ClassSlot") int ClassSlot)
    {
        switch(ClassSlot)
        {
            case 1:
                EnrollStudentInTheirFirstCourse(StudentID, CourseID);
                break;
            case 2:
                EnrollStudentInTheirSecondCourse(StudentID, CourseID);
                break;
            case 3:
                EnrollStudentInTheirThirdCourse(StudentID, CourseID);
                break;
            case 4:
                EnrollStudentInTheirFourthCourse(StudentID, CourseID);
                break;
            default:
                EnrollStudentInTheirFifthCourse(StudentID, CourseID);
                break;
        }
    }
    
    // Specified student drops a class.
    @POST
    @Path("StudentDropsClass/{StudentID}/{ClassSlot}")
    @Consumes(MediaType.TEXT_HTML)
    public void StudentDropsClass(@PathParam("StudentID") int StudentID, 
            @PathParam("ClassSlot") int ClassSlot)
    {
        switch(ClassSlot)
        {
            case 1:
                StudentDropsCourseOne(StudentID);
                break;
            case 2:
                StudentDropsCourseTwo(StudentID);
                break;
            case 3:
                StudentDropsCourseThree(StudentID);
                break;
            case 4:
                StudentDropsCourseFour(StudentID);
                break;
            default:
                StudentDropsCourseFive(StudentID);
                break;
        }
    }
    
    // Sign a student up for the specified course, if possible.
    @POST
    @Path("SignStudentUpForClass/{StudentID}/{CourseID}")
    @Consumes(MediaType.TEXT_HTML)
    public void SignStudentUpForClass(@PathParam("StudentID") int StudentID,
            @PathParam("CourseID") int CourseID)
    {
        Student student = new Student();
        student = GetSpecificStudent(StudentID);
        
        if (student.CourseOne == -1)
        {
            EnrollStudentInTheirFirstCourse(StudentID, CourseID);
        }
        else if (student.CourseTwo == -1)
        {
            EnrollStudentInTheirSecondCourse(StudentID, CourseID);
        }
        else if (student.CourseThree == -1)
        {
            EnrollStudentInTheirThirdCourse(StudentID, CourseID);
        }    
        else if (student.CourseFour == -1)
        {
            EnrollStudentInTheirFourthCourse(StudentID, CourseID);
        }    
        else if (student.CourseFive == -1)
        {
            EnrollStudentInTheirFifthCourse(StudentID, CourseID);
        }    
        else
        {
            // Student can't enroll in any more classes. Do nothing.
        }
    }
    
    // Make a student drop the specified course.
    @POST
    @Path("StudentDropsSpecifiedClass/{StudentID}/{CourseID}")
    @Consumes(MediaType.TEXT_HTML)
    public void StudentDropsSpecifiedClass(@PathParam("StudentID") int StudentID,
            @PathParam("CourseID") int CourseID)
    {
        Student student = new Student();
        student = GetSpecificStudent(StudentID);
        
        if (student.CourseOne == CourseID)
        {
            StudentDropsCourseOne(StudentID);
        }
        else if (student.CourseTwo == CourseID)
        {
            StudentDropsCourseTwo(StudentID);
        }
        else if (student.CourseThree == CourseID)
        {
            StudentDropsCourseThree(StudentID);
        }    
        else if (student.CourseFour == CourseID)
        {
            StudentDropsCourseFour(StudentID);
        }    
        else if (student.CourseFive == CourseID)
        {
            StudentDropsCourseFive(StudentID);
        }    
        else
        {
            // Student is not enrolled in the specified course. Do nothing.
        }
    }
    // </editor-fold>
}
