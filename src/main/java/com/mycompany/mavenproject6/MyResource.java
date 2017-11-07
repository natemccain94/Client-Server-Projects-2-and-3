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
        if (FindTextbookByInfo(Title,Publisher,Edition,Date) == 0)
        {
            AddTextbook(Title,Publisher,Edition,Date);
        }
    }
    
    // Add a course to the database.
    @POST
    @Path("AddNewCourse/{CourseName}")
    @Consumes(MediaType.TEXT_HTML)
    public void AddNewCourse(@PathParam("CourseName") String CourseName)
    {
        if (FindCourseByName(CourseName) == 0)
            AddCourse(CourseName);
    }
    
    // Add a student to the database.
    @POST
    @Path("AddNewStudent/{FirstName}/{LastName}")
    @Consumes(MediaType.TEXT_HTML)
    public void AddNewStudent(@PathParam("FirstName") String FirstName,
            @PathParam("LastName") String LastName)
    {
        if (FindStudentByName(FirstName,LastName) == 0)
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
        if (FindTextbookByInfo(Title,Publisher,Edition,Date) == 0)
        {
            UpDateTextbook(TextbookID, Title, Publisher, Edition, Date);
        }
    }
    
    // UpDate a course.
    @POST
    @Path("UpDateSelectedCourse/{CourseID}/{CourseName}")
    @Consumes(MediaType.TEXT_HTML)
    public void UpDateSelectedCourse(@PathParam("CourseID") int CourseID, 
            @PathParam("CourseName") String CourseName)
    {
        if (FindCourseByName(CourseName) == 0)
        {
            UpDateCourse(CourseID, CourseName);
        }
    }
    
    // UpDate a student.
    @POST
    @Path("UpDateSelectedStudent/{StudentID}/{FirstName}/{LastName}")
    @Consumes(MediaType.TEXT_HTML)
    public void UpDateSelectedStudent(@PathParam("StudentID") int StudentID, 
            @PathParam("FirstName") String FirstName, 
            @PathParam("LastName") String LastName)
    {
        if (FindStudentByName(FirstName,LastName) == 0)
        {
            UpDateStudent(StudentID, FirstName, LastName);
        }
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
    
    // Get all courses a student is enrolled in.
    @GET
    @Path("GetCoursesStudentIsTaking/{StudentID}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Course> GetCoursesStudentIsTaking(@PathParam("StudentID") 
            int StudentID)
    {
        Student student = new Student();
        student = GetSpecificStudent(StudentID);
        
        return GetCoursesStudentIsEnrolledIn(student.CourseOne,
            student.CourseTwo, student.CourseThree, 
            student.CourseFour, student.CourseFive);
    }
    // </editor-fold>
    
    // <editor-fold desc="Functions to get everything not associated with an item.">
    // Get all textbooks not owned by the student.
    // This will only be called if the student has room for another textbook.
    @GET
    @Path("GetTextbooksNotOwnedByStudent/{StudentID}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Textbook> GetTextbooksNotOwnedByStudent(@PathParam("StudentID")
            int StudentID)
    {
        Student student = new Student();
        student = GetSpecificStudent(StudentID);
        
        return GetTextbooksCurrentlyNotOwnedByStudent(student.TextbookOne, 
                student.TextbookTwo, student.TextbookThree, 
                student.TextbookFour, student.TextbookFive, 
                student.TextbookSix,student.TextbookSeven, 
            student.TextbookEight, student.TextbookNine);
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
    @Path("GetCoursesTheStudentCanAdd/{StudentID}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Course> GetCoursesTheStudentCanAdd(@PathParam("StudentID") 
            int StudentID)
    {
        Student student = new Student();
        student = GetSpecificStudent(StudentID);
        
        return GetAllCoursesStudentIsNotEnrolledIn(student.CourseOne, 
                student.CourseTwo,student.CourseThree, student.CourseFour);
    }
    // </editor-fold>
    // </editor-fold>
    
    // <editor-fold desc="Functions to do stuff to a student's textbooks.">
    // Give a student a textbook. BookSlot indicates how many books the
    // student owns.
    @POST
    @Path("GiveStudentTheTextbook/{StudentID}/{TextbookID}")
    @Consumes(MediaType.TEXT_HTML)
    public void GiveStudentTheTextbook(@PathParam("StudentID") int StudentID, 
            @PathParam("TextbookID") int TextbookID)
    {
        Student student = new Student();
        student = GetSpecificStudent(StudentID);
        
        if (student.TextbookOne == -1)
        {
            GiveStudentFirstTextbook(StudentID, TextbookID);
        }
        else if (student.TextbookTwo == -1)
        {
            GiveStudentSecondTextbook(StudentID, TextbookID);
        }
        else if (student.TextbookThree == -1)
        {
            GiveStudentThirdTextbook(StudentID, TextbookID);
        }
        else if (student.TextbookFour == -1)
        {
            GiveStudentFourthTextbook(StudentID, TextbookID);
        }
        else if (student.TextbookFive == -1)
        {
            GiveStudentFifthTextbook(StudentID, TextbookID);
        }
        else if (student.TextbookSix == -1)
        {
            GiveStudentSixthTextbook(StudentID, TextbookID);
        }
        else if (student.TextbookSeven == -1)
        {
            GiveStudentSeventhTextbook(StudentID, TextbookID);
        }
        else if (student.TextbookEight == -1)
        {
            GiveStudentEighthTextbook(StudentID, TextbookID);
        }
        else if (student.TextbookNine == -1)
        {
            GiveStudentNinthTextbook(StudentID, TextbookID);
        }
        else
        {
            GiveStudentTenthTextbook(StudentID, TextbookID);
        }
    }
    
    // Remove a student's textbook from the specified slot.
    // They won't get any money from the textbook sale.
    @POST
    @Path("SellStudentTextbook/{StudentID}/{TextbookID}")
    @Consumes(MediaType.TEXT_HTML)
    public void SellStudentTextbook(@PathParam("StudentID") int StudentID, 
            @PathParam("TextbookID") int TextbookID)
    {
        Student student = new Student();
        student = GetSpecificStudent(StudentID);
        
        if (student.TextbookOne == TextbookID)
        {
            RemoveTextbookOneFromStudent(StudentID);
        }
        else if (student.TextbookTwo == TextbookID)
        {
            RemoveTextbookTwoFromStudent(StudentID);
        }
        else if (student.TextbookThree == TextbookID)
        {
            RemoveTextbookThreeFromStudent(StudentID);
        }
        else if (student.TextbookFour == TextbookID)
        {
            RemoveTextbookFourFromStudent(StudentID);
        }
        else if (student.TextbookFive == TextbookID)
        {
            RemoveTextbookFiveFromStudent(StudentID);
        }
        else if (student.TextbookSix == TextbookID)
        {
            RemoveTextbookSixFromStudent(StudentID);
        }
        else if (student.TextbookSeven == TextbookID)
        {
            RemoveTextbookSevenFromStudent(StudentID);
        }
        else if (student.TextbookEight == TextbookID)
        {
            RemoveTextbookEightFromStudent(StudentID);
        }
        else if (student.TextbookNine == TextbookID)
        {
            RemoveTextbookNineFromStudent(StudentID);
        }
        else
        {
            RemoveTextbookTenFromStudent(StudentID);
        }
    }
    // </editor-fold>
    
    // <editor-fold desc="Functions to do stuff to a course's textbooks.">  
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
        Course course = new Course();
        student = GetSpecificStudent(StudentID);
        course = GetSpecificCourse(CourseID);
        
        if (student.CourseOne == course.CourseID)
        {
            StudentDropsCourseOne(StudentID);
        }
        else if (student.CourseTwo == course.CourseID)
        {
            StudentDropsCourseTwo(StudentID);
        }
        else if (student.CourseThree == course.CourseID)
        {
            StudentDropsCourseThree(StudentID);
        }    
        else if (student.CourseFour == course.CourseID)
        {
            StudentDropsCourseFour(StudentID);
        }    
        else
        {
            StudentDropsCourseFive(StudentID);
        } 
    }
    // </editor-fold>
    
    // <editor-fold desc="Lists returning whether or not a student has the required textbooks.">
    // Return true if the student has all of their required textbooks for a course.
    @GET
    @Path("DoesStudentHaveRequiredTextbooksForCourse/{StudentID}/{CourseID}")
    @Consumes(MediaType.TEXT_HTML)
    @Produces(MediaType.TEXT_PLAIN)
    public boolean DoesStudentHaveRequiredTextbooksForCourse(@PathParam("StudentID") 
            int StudentID, @PathParam("CourseID") int CourseID)
    {
        Student student = new Student();
        Course course = new Course();
        
        student = GetSpecificStudent(StudentID);
        course = GetSpecificCourse(CourseID);
        
        
        
        // Course has two required textbooks.
        if ((course.TextOne != -1) && (course.TextTwo != -1))
        {
            // check the first required textbook.
            if ((student.TextbookOne == course.TextOne) || 
                    (student.TextbookTwo == course.TextOne) ||
                    (student.TextbookThree == course.TextOne) ||
                    (student.TextbookFour == course.TextOne) ||
                    (student.TextbookFive == course.TextOne) ||
                    (student.TextbookSix == course.TextOne) ||
                    (student.TextbookSeven == course.TextOne) ||
                    (student.TextbookEight == course.TextOne) ||
                    (student.TextbookNine == course.TextOne) ||
                    (student.TextbookTen == course.TextOne))
            {
                // check the second required textbook.
                return (student.TextbookOne == course.TextTwo) || 
                        (student.TextbookTwo == course.TextTwo) ||
                        (student.TextbookThree == course.TextTwo) ||
                        (student.TextbookFour == course.TextTwo) ||
                        (student.TextbookFive == course.TextTwo) ||
                        (student.TextbookSix == course.TextTwo) ||
                        (student.TextbookSeven == course.TextTwo) ||
                        (student.TextbookEight == course.TextTwo) ||
                        (student.TextbookNine == course.TextTwo) ||
                        (student.TextbookTen == course.TextTwo); 
            }
            
            else
            {
                return false; // student doesn't have the required textbooks.
            }
        }
        
        // Course has one required textbook.
        else if (course.TextOne != -1 && course.TextTwo == -1)
        {
            return (student.TextbookOne == course.TextOne) || 
                    (student.TextbookTwo == course.TextOne) ||
                    (student.TextbookThree == course.TextOne) ||
                    (student.TextbookFour == course.TextOne) ||
                    (student.TextbookFive == course.TextOne) ||
                    (student.TextbookSix == course.TextOne) ||
                    (student.TextbookSeven == course.TextOne) ||
                    (student.TextbookEight == course.TextOne) ||
                    (student.TextbookNine == course.TextOne) ||
                    (student.TextbookTen == course.TextOne); 
        }
        
        else
        {
            return true; // no required textbooks
        }
    }
    
    // </editor-fold>
}
