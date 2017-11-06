/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject6;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author natemccain94
 */
public class ConnectionToMySQL 
{
    public ConnectionToMySQL(){}
    
    // <editor-fold desc="Functions that find items in the database.">
    // Determines if the specified textbook already exists.
    public static int FindTextbook(String Title, String Publisher,
            int Edition, int Date)
    {
        
        Connection conn = null;
        PreparedStatement stmt = null;
        int TextbookID = -1;
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "SELECT IFNULL((SELECT TextbookID FROM Textbooks ";
            query = query.concat("WHERE title = ?, publisher = ?, edition = ?");
            query = query.concat(", date = ?), -1)");
            
            stmt = conn.prepareStatement(query);
            stmt.setString(1, Title);
            stmt.setString(2, Publisher);
            stmt.setInt(3, Edition);
            stmt.setInt(4, Date);
            
            ResultSet results = stmt.executeQuery();
            
            while(results.next())
            {
                // Retrieve by column name.
                TextbookID = results.getInt(1);
            }
            results.close();
        }
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (Exception e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (Exception e){}
        }
        return TextbookID;
    }
    
    // Returns true if the textbook id is in the database.
    public static boolean FindTextbookByID(int id)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        int TextbookID = -1;
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "SELECT IFNULL((SELECT TextbookID FROM Textbooks ";
            query = query.concat("WHERE TextbookID = ?), -1)");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, id);
            
            ResultSet results = stmt.executeQuery();
            
            while(results.next())
            {
                // Retrieve by column name.
                TextbookID = results.getInt(1);
            }
            results.close();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
        return TextbookID != -1;
    }
    
    // Determines if the specified course already exists.
    public static int FindCourseByName(String courseName)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        int CourseID = -1;
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "SELECT IFNULL((SELECT CourseID FROM Courses WHERE";
            query = query.concat(" CourseName = ?), -1)");
            
            stmt = conn.prepareStatement(query);
            stmt.setString(1, courseName);
            
            ResultSet results = stmt.executeQuery();
            
            while(results.next())
            {
                // Retrieve by column name.
                CourseID = results.getInt(1);
            }
            results.close();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
        return CourseID;
    }
    
    // Returns true if the course id is in the database.
    public static boolean FindCourseByID(int id)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        int CourseID = -1;
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "SELECT IFNULL((SELECT CourseID FROM Courses WHERE";
            query = query.concat(" CourseID = ?), -1)");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, id);
            
            ResultSet results = stmt.executeQuery();
            
            while(results.next())
            {
                // Retrieve by column name.
                CourseID = results.getInt(1);
            }
            results.close();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
        return CourseID != -1;
    }
    
    // Determines if the specified student already exists.
    public static int FindStudentByName(String FirstName, String LastName)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        int StudentID = -1;
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "SELECT IFNULL((SELECT StudentID FROM Students ";
            query = query.concat("WHERE FirstName = ?, LastName = ?), -1)");
            
            stmt = conn.prepareStatement(query);
            stmt.setString(1, FirstName);
            stmt.setString(2, LastName);
            
            ResultSet results = stmt.executeQuery();
            
            while(results.next())
            {
                // Retrieve by column name.
                StudentID = results.getInt(1);
            }
            results.close();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
        return StudentID;
    }
    
    // Returns true if the student id is in the database.
    public static boolean FindStudentByID(int id)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        int StudentID = -1;
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "SELECT IFNULL((SELECT StudentID FROM Students ";
            query = query.concat("WHERE StudentID = ?), -1)");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, id);
            
            ResultSet results = stmt.executeQuery();
            
            while(results.next())
            {
                // Retrieve by column name.
                StudentID = results.getInt(1);
            }
            results.close();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
        return StudentID != -1;
    }
    
    // </editor-fold>

    // <editor-fold desc="Functions to insert items into the database.">
    // Insert a textbook into the textbook database.
    public static void AddTextbook(String Title, String Publisher,
            int Edition, int Date)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "INSERT INTO Textbooks (title, publisher, edition,";
            query = query.concat(" date) VALUES (?, ?, ?, ?)");
            
            stmt = conn.prepareStatement(query);
            stmt.setString(1, Title);
            stmt.setString(2, Publisher);
            stmt.setInt(3, Edition);
            stmt.setInt(4, Date);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Insert a course into the course database.
    public static void AddCourse(String courseName)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "INSERT INTO Courses (CourseName, TextOne, TextTwo) ";
            query = query.concat("VALUES (?, -1, -1)");
            
            stmt = conn.prepareStatement(query);
            stmt.setString(1, courseName);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Insert a student into the student database.
    public static void AddStudent(String FirstName, String LastName)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "INSERT INTO Students (FirstName, LastName, ";
            query = query.concat("CourseOne, CourseTwo, CourseThree, ");
            query = query.concat("CourseFour, CourseFive, TextbookOne, ");
            query = query.concat("TextbookTwo, TextbookThree, ");
            query = query.concat("TextbookFour, TextbookFive, ");
            query = query.concat("TextbookSix, TextbookSeven, ");
            query = query.concat("TextbookEight, TextbookNine, ");
            query = query.concat("TextbookTen) VALUES (?, ?, -1, -1, -1, ");
            query = query.concat("-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, ");
            query = query.concat("-1, -1)");
            
            stmt = conn.prepareStatement(query);
            stmt.setString(1, FirstName);
            stmt.setString(2, LastName);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    // </editor-fold>
    
    // <editor-fold desc="Functions to update items in the database.">
    // <editor-fold desc="Functions that update names and textbooks.">
    // Update a textbook
    public static void UpdateTextbook(int TextbookID, String Title,
            String Publisher, int Edition, int Date)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Textbooks SET title = ?, publisher = ?, ";
            query = query.concat("edition = ?, date = ? WHERE TextbookID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setString(1, Title);
            stmt.setString(2, Publisher);
            stmt.setInt(3, Edition);
            stmt.setInt(4, Date);
            stmt.setInt(5, TextbookID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Update a course name.
    public static void UpdateCourse(int CourseID, String courseName)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Courses SET CourseName = ? WHERE CourseID = ?";
            
            stmt = conn.prepareStatement(query);
            stmt.setString(1, courseName);
            stmt.setInt(2, CourseID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Update a student name.
    public static void UpdateStudent(int StudentID, String FirstName, String LastName)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET FirstName = ?, LastName = ? WHERE ";
            query = query.concat("StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setString(1, FirstName);
            stmt.setString(2, LastName);
            stmt.setInt(3, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    // </editor-fold>
    
    // <editor-fold desc="Functions to add required textbooks to a course.">
    // Add the first required textbook.
    public static void AddFirstRequiredTextbook(int CourseID, int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Courses SET TextOne = ? WHERE CourseID = ?";
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            stmt.setInt(2, CourseID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Add the second required textbook.
    public static void AddSecondRequiredTextbook(int CourseID, int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Courses SET TextTwo = ? WHERE CourseID = ?";
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            stmt.setInt(2, CourseID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    // </editor-fold>
    
    // <editor-fold desc="Functions to give a textbook to a student.">
    // Add the first textbook.
    public static void GiveStudentFirstTextbook(int StudentID, int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET TextbookOne = ? WHERE ";
            query = query.concat("StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            stmt.setInt(2, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Add the second textbook.
    public static void GiveStudentSecondTextbook(int StudentID, int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET TextbookTwo = ? WHERE ";
            query = query.concat("StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            stmt.setInt(2, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Add the third textbook.
    public static void GiveStudentThirdTextbook(int StudentID, int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET TextbookThree = ? WHERE ";
            query = query.concat("StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            stmt.setInt(2, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Add the fourth textbook.
    public static void GiveStudentFourthTextbook(int StudentID, int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET TextbookFour = ? WHERE ";
            query = query.concat("StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            stmt.setInt(2, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Add the fifth textbook.
    public static void GiveStudentFifthTextbook(int StudentID, int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET TextbookFive = ? WHERE ";
            query = query.concat("StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            stmt.setInt(2, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Add the sixth textbook.
    public static void GiveStudentSixthTextbook(int StudentID, int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET TextbookSix = ? WHERE ";
            query = query.concat("StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            stmt.setInt(2, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Add the seventh textbook.
    public static void GiveStudentSeventhTextbook(int StudentID, int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET TextbookSeven = ? WHERE ";
            query = query.concat("StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            stmt.setInt(2, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Add the eighth textbook.
    public static void GiveStudentEighthTextbook(int StudentID, int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET TextbookEight = ? WHERE ";
            query = query.concat("StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            stmt.setInt(2, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Add the ninth textbook.
    public static void GiveStudentNinthTextbook(int StudentID, int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET TextbookNine = ? WHERE ";
            query = query.concat("StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            stmt.setInt(2, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Add the tenth textbook.
    public static void GiveStudentTenthTextbook(int StudentID, int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET TextbookTen = ? WHERE ";
            query = query.concat("StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            stmt.setInt(2, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // </editor-fold>
    
    // <editor-fold desc="Functions to enroll a student in a course.">
    // Student signs up for their first class.
    public static void EnrollStudentInTheirFirstCourse(int StudentID, int CourseID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET CourseOne = ? WHERE ";
            query = query.concat("StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, CourseID);
            stmt.setInt(2, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Student signs up for their second class.
    public static void EnrollStudentInTheirSecondCourse(int StudentID, int CourseID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET CourseTwo = ? WHERE ";
            query = query.concat("StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, CourseID);
            stmt.setInt(2, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Student signs up for their third class.
    public static void EnrollStudentInTheirThirdCourse(int StudentID, int CourseID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET CourseThree = ? WHERE ";
            query = query.concat("StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, CourseID);
            stmt.setInt(2, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Student signs up for their fourth class.
    public static void EnrollStudentInTheirFourthCourse(int StudentID, int CourseID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET CourseFour = ? WHERE ";
            query = query.concat("StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, CourseID);
            stmt.setInt(2, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Student signs up for their fifth class.
    public static void EnrollStudentInTheirFifthCourse(int StudentID, int CourseID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET CourseFive = ? WHERE ";
            query = query.concat("StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, CourseID);
            stmt.setInt(2, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    // </editor-fold>
    
    // </editor-fold>
    
    // <editor-fold desc="Functions to delete items in the database.">
    // <editor-fold desc="Functions that delete entire rows from a table.">
    // Delete a textbook. Must follow up by removing the TextbookID from
    // the course list and the student list.
    public static void DeleteTextbook(int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "DELETE FROM Textbooks WHERE TextbookID = ?";
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
        
        // Call to remove this textbook from the courses list.
        RemoveRequiredTextOneFromAllCourses(TextbookID);
        RemoveRequiredTextTwoFromAllCourses(TextbookID);
        // Call to remove this textbook from the students list.
        RemoveSpecificTextbookOneFromAllStudents(TextbookID);
        RemoveSpecificTextbookTwoFromAllStudents(TextbookID);
        RemoveSpecificTextbookThreeFromAllStudents(TextbookID);
        RemoveSpecificTextbookFourFromAllStudents(TextbookID);
        RemoveSpecificTextbookFiveFromAllStudents(TextbookID);
        RemoveSpecificTextbookSixFromAllStudents(TextbookID);
        RemoveSpecificTextbookSevenFromAllStudents(TextbookID);
        RemoveSpecificTextbookEightFromAllStudents(TextbookID);
        RemoveSpecificTextbookNineFromAllStudents(TextbookID);
        RemoveSpecificTextbookTenFromAllStudents(TextbookID);
        
    }
    
    // Delete a course. Must follow up by removing the CourseID from
    // the student list.
    public static void DeleteCourse(int CourseID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "DELETE FROM Courses WHERE CourseID = ?";
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, CourseID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
        
        // Now you have to remove this CourseID from the student list.
        RemoveSpecifiedCourseFromCourseOne(CourseID);
        RemoveSpecifiedCourseFromCourseTwo(CourseID);
        RemoveSpecifiedCourseFromCourseThree(CourseID);
        RemoveSpecifiedCourseFromCourseFour(CourseID);
        RemoveSpecifiedCourseFromCourseFive(CourseID);
        
    }
    
    // Delete a student. Does not require calling other functions after executing.
    public static void DeleteStudent(int StudentID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "DELETE FROM Students WHERE StudentID = ?";
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    // </editor-fold>
    
    // <editor-fold desc="Functions to remove a textbook from a specified student.">
    // Remove the student's first textbook, then shift all remaining textbooks over.
    public static void RemoveTextbookOneFromStudent(int StudentID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("TextbookOne = TextbookTwo");
            query = query.concat("TextbookTwo = TextbookThree, ");
            query = query.concat("TextbookThree = TextbookFour, ");
            query = query.concat("TextbookFour = TextbookFive, ");
            query = query.concat("TextbookFive = TextbookSix, ");
            query = query.concat("TextbookSix = TextbookSeven, ");
            query = query.concat("TextbookSeven = TextbookEight, ");
            query = query.concat("TextbookEight = TextbookNine, ");
            query = query.concat("TextbookNine = TextbookTen, ");
            query = query.concat("TextbookTen = -1");
            query = query.concat(" WHERE StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the student's second textbook, then shift all remaining textbooks over.
    public static void RemoveTextbookTwoFromStudent(int StudentID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("TextbookTwo = TextbookThree, ");
            query = query.concat("TextbookThree = TextbookFour, ");
            query = query.concat("TextbookFour = TextbookFive, ");
            query = query.concat("TextbookFive = TextbookSix, ");
            query = query.concat("TextbookSix = TextbookSeven, ");
            query = query.concat("TextbookSeven = TextbookEight, ");
            query = query.concat("TextbookEight = TextbookNine, ");
            query = query.concat("TextbookNine = TextbookTen, ");
            query = query.concat("TextbookTen = -1");
            query = query.concat(" WHERE StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the student's third textbook, then shift all remaining textbooks over.
    public static void RemoveTextbookThreeFromStudent(int StudentID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("TextbookThree = TextbookFour, ");
            query = query.concat("TextbookFour = TextbookFive, ");
            query = query.concat("TextbookFive = TextbookSix, ");
            query = query.concat("TextbookSix = TextbookSeven, ");
            query = query.concat("TextbookSeven = TextbookEight, ");
            query = query.concat("TextbookEight = TextbookNine, ");
            query = query.concat("TextbookNine = TextbookTen, ");
            query = query.concat("TextbookTen = -1");
            query = query.concat(" WHERE StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the student's fourth textbook, then shift all remaining textbooks over.
    public static void RemoveTextbookFourFromStudent(int StudentID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("TextbookFour = TextbookFive, ");
            query = query.concat("TextbookFive = TextbookSix, ");
            query = query.concat("TextbookSix = TextbookSeven, ");
            query = query.concat("TextbookSeven = TextbookEight, ");
            query = query.concat("TextbookEight = TextbookNine, ");
            query = query.concat("TextbookNine = TextbookTen, ");
            query = query.concat("TextbookTen = -1");
            query = query.concat(" WHERE StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the student's fifth textbook, then shift all remaining textbooks over.
    public static void RemoveTextbookFiveFromStudent(int StudentID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("TextbookFive = TextbookSix, ");
            query = query.concat("TextbookSix = TextbookSeven, ");
            query = query.concat("TextbookSeven = TextbookEight, ");
            query = query.concat("TextbookEight = TextbookNine, ");
            query = query.concat("TextbookNine = TextbookTen, ");
            query = query.concat("TextbookTen = -1");
            query = query.concat(" WHERE StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the student's sixth textbook, then shift all remaining textbooks over.
    public static void RemoveTextbookSixFromStudent(int StudentID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("TextbookSix = TextbookSeven, ");
            query = query.concat("TextbookSeven = TextbookEight, ");
            query = query.concat("TextbookEight = TextbookNine, ");
            query = query.concat("TextbookNine = TextbookTen, ");
            query = query.concat("TextbookTen = -1");
            query = query.concat(" WHERE StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the student's seventh textbook, then shift all remaining textbooks over.
    public static void RemoveTextbookSevenFromStudent(int StudentID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("TextbookSeven = TextbookEight, ");
            query = query.concat("TextbookEight = TextbookNine, ");
            query = query.concat("TextbookNine = TextbookTen, ");
            query = query.concat("TextbookTen = -1");
            query = query.concat(" WHERE StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the student's eighth textbook, then shift all remaining textbooks over.
    public static void RemoveTextbookEightFromStudent(int StudentID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("TextbookEight = TextbookNine, ");
            query = query.concat("TextbookNine = TextbookTen, ");
            query = query.concat("TextbookTen = -1");
            query = query.concat(" WHERE StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the student's ninth textbook, then shift all remaining textbooks over.
    public static void RemoveTextbookNineFromStudent(int StudentID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("TextbookNine = TextbookTen, ");
            query = query.concat("TextbookTen = -1");
            query = query.concat(" WHERE StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the student's tenth textbook. No shift required.
    public static void RemoveTextbookTenFromStudent(int StudentID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("TextbookTen = -1");
            query = query.concat(" WHERE StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    // </editor-fold>
    
    // <editor-fold desc="Functions to remove a textbook from all students.">
    // Remove the specified textbook from the students' textbookOne column.
    public static void RemoveSpecificTextbookOneFromAllStudents(int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("TextbookOne = TextbookTwo");
            query = query.concat("TextbookTwo = TextbookThree, ");
            query = query.concat("TextbookThree = TextbookFour, ");
            query = query.concat("TextbookFour = TextbookFive, ");
            query = query.concat("TextbookFive = TextbookSix, ");
            query = query.concat("TextbookSix = TextbookSeven, ");
            query = query.concat("TextbookSeven = TextbookEight, ");
            query = query.concat("TextbookEight = TextbookNine, ");
            query = query.concat("TextbookNine = TextbookTen, ");
            query = query.concat("TextbookTen = -1");
            query = query.concat(" WHERE TextbookOne = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the specified textbook from the students' textbookTwo column.
    public static void RemoveSpecificTextbookTwoFromAllStudents(int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("TextbookTwo = TextbookThree, ");
            query = query.concat("TextbookThree = TextbookFour, ");
            query = query.concat("TextbookFour = TextbookFive, ");
            query = query.concat("TextbookFive = TextbookSix, ");
            query = query.concat("TextbookSix = TextbookSeven, ");
            query = query.concat("TextbookSeven = TextbookEight, ");
            query = query.concat("TextbookEight = TextbookNine, ");
            query = query.concat("TextbookNine = TextbookTen, ");
            query = query.concat("TextbookTen = -1");
            query = query.concat(" WHERE TextbookTwo = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the specified textbook from the students' textbookThree column.
    public static void RemoveSpecificTextbookThreeFromAllStudents(int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("TextbookThree = TextbookFour, ");
            query = query.concat("TextbookFour = TextbookFive, ");
            query = query.concat("TextbookFive = TextbookSix, ");
            query = query.concat("TextbookSix = TextbookSeven, ");
            query = query.concat("TextbookSeven = TextbookEight, ");
            query = query.concat("TextbookEight = TextbookNine, ");
            query = query.concat("TextbookNine = TextbookTen, ");
            query = query.concat("TextbookTen = -1");
            query = query.concat(" WHERE TextbookThree = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the specified textbook from the students' textbookFour column.
    public static void RemoveSpecificTextbookFourFromAllStudents(int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("TextbookFour = TextbookFive, ");
            query = query.concat("TextbookFive = TextbookSix, ");
            query = query.concat("TextbookSix = TextbookSeven, ");
            query = query.concat("TextbookSeven = TextbookEight, ");
            query = query.concat("TextbookEight = TextbookNine, ");
            query = query.concat("TextbookNine = TextbookTen, ");
            query = query.concat("TextbookTen = -1");
            query = query.concat(" WHERE TextbookFour = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the specified textbook from the students' textbookFive column.
    public static void RemoveSpecificTextbookFiveFromAllStudents(int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("TextbookFive = TextbookSix, ");
            query = query.concat("TextbookSix = TextbookSeven, ");
            query = query.concat("TextbookSeven = TextbookEight, ");
            query = query.concat("TextbookEight = TextbookNine, ");
            query = query.concat("TextbookNine = TextbookTen, ");
            query = query.concat("TextbookTen = -1");
            query = query.concat(" WHERE TextbookFive = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the specified textbook from the students' textbookSix column.
    public static void RemoveSpecificTextbookSixFromAllStudents(int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("TextbookSix = TextbookSeven, ");
            query = query.concat("TextbookSeven = TextbookEight, ");
            query = query.concat("TextbookEight = TextbookNine, ");
            query = query.concat("TextbookNine = TextbookTen, ");
            query = query.concat("TextbookTen = -1");
            query = query.concat(" WHERE TextbookSix = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the specified textbook from the students' textbookSeven column.
    public static void RemoveSpecificTextbookSevenFromAllStudents(int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("TextbookSeven = TextbookEight, ");
            query = query.concat("TextbookEight = TextbookNine, ");
            query = query.concat("TextbookNine = TextbookTen, ");
            query = query.concat("TextbookTen = -1");
            query = query.concat(" WHERE TextbookSeven = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the specified textbook from the students' textbookEight column.
    public static void RemoveSpecificTextbookEightFromAllStudents(int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("TextbookEight = TextbookNine, ");
            query = query.concat("TextbookNine = TextbookTen, ");
            query = query.concat("TextbookTen = -1");
            query = query.concat(" WHERE TextbookEight = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the specified textbook from the students' textbookNine column.
    public static void RemoveSpecificTextbookNineFromAllStudents(int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("TextbookNine = TextbookTen, ");
            query = query.concat("TextbookTen = -1");
            query = query.concat(" WHERE TextbookNine = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the specified textbook from the students' textbookTen column.
    public static void RemoveSpecificTextbookTenFromAllStudents(int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("TextbookTen = -1");
            query = query.concat(" WHERE TextbookTen = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    // </editor-fold>
    
    // <editor-fold desc="Functions to remove a course from a specified student.">
    // The specified student drops CourseOne.
    public static void StudentDropsCourseOne(int StudentID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("CourseOne = CourseTwo");
            query = query.concat("CourseTwo = CourseThree, ");
            query = query.concat("CourseThree = CourseFour, ");
            query = query.concat("CourseFour = CourseFive, ");
            query = query.concat("CourseFive = -1");
            query = query.concat(" WHERE StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // The specified student drops CourseTwo.
    public static void StudentDropsCourseTwo(int StudentID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("CourseTwo = CourseThree, ");
            query = query.concat("CourseThree = CourseFour, ");
            query = query.concat("CourseFour = CourseFive, ");
            query = query.concat("CourseFive = -1");
            query = query.concat(" WHERE StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // The specified student drops CourseThree.
    public static void StudentDropsCourseThree(int StudentID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("CourseThree = CourseFour, ");
            query = query.concat("CourseFour = CourseFive, ");
            query = query.concat("CourseFive = -1");
            query = query.concat(" WHERE StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // The specified student drops CourseFour.
    public static void StudentDropsCourseFour(int StudentID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("CourseFour = CourseFive, ");
            query = query.concat("CourseFive = -1");
            query = query.concat(" WHERE StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // The specified student drops CourseFive.
    public static void StudentDropsCourseFive(int StudentID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("CourseFive = -1");
            query = query.concat(" WHERE StudentID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, StudentID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    // </editor-fold>
    
    // <editor-fold desc="Functions to remove a course from all students.">
    // Remove the specified course from all students that have it listed first.
    public static void RemoveSpecifiedCourseFromCourseOne(int CourseID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("CourseOne = CourseTwo");
            query = query.concat("CourseTwo = CourseThree, ");
            query = query.concat("CourseThree = CourseFour, ");
            query = query.concat("CourseFour = CourseFive, ");
            query = query.concat("CourseFive = -1");
            query = query.concat(" WHERE CourseOne = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, CourseID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the specified course from all students that have it listed second.
    public static void RemoveSpecifiedCourseFromCourseTwo(int CourseID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("CourseTwo = CourseThree, ");
            query = query.concat("CourseThree = CourseFour, ");
            query = query.concat("CourseFour = CourseFive, ");
            query = query.concat("CourseFive = -1");
            query = query.concat(" WHERE CourseTwo = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, CourseID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the specified course from all students that have it listed third.
    public static void RemoveSpecifiedCourseFromCourseThree(int CourseID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("CourseThree = CourseFour, ");
            query = query.concat("CourseFour = CourseFive, ");
            query = query.concat("CourseFive = -1");
            query = query.concat(" WHERE CourseThree = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, CourseID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the specified course from all students that have it listed fourth.
    public static void RemoveSpecifiedCourseFromCourseFour(int CourseID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("CourseFour = CourseFive, ");
            query = query.concat("CourseFive = -1");
            query = query.concat(" WHERE CourseFour = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, CourseID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the specified course from all students that have it listed fifth.
    public static void RemoveSpecifiedCourseFromCourseFive(int CourseID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Students SET ";
            query = query.concat("CourseFive = -1");
            query = query.concat(" WHERE CourseFive = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, CourseID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    // </editor-fold>
    
    // <editor-fold desc="Functions to remove a textbook from a specified course.">
    // Remove the first required textbook from a course.
    public static void RemoveRequiredTextOneFromSpecifiedCourse(int CourseID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Courses SET ";
            query = query.concat("TextOne = TextTwo");
            query = query.concat("TextTwo = -1");
            query = query.concat(" WHERE CourseID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, CourseID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the second required textbook from a course.
    public static void RemoveRequiredTextTwoFromSpecifiedCourse(int CourseID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Courses SET ";
            query = query.concat("TextTwo = -1");
            query = query.concat(" WHERE CourseID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, CourseID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    // </editor-fold>
    
    // <editor-fold desc="Functions to remove a textbook from all courses.">
    // Remove the specified textbook from all courses (in the required
    // TextOne slot.
    public static void RemoveRequiredTextOneFromAllCourses(int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Courses SET ";
            query = query.concat("TextOne = TextTwo");
            query = query.concat("TextTwo = -1");
            query = query.concat(" WHERE TextOne = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    
    // Remove the specified textbook from all courses (in the required
    // TextTwo slot.
    public static void RemoveRequiredTextTwoFromAllCourses(int TextbookID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            
            String query = "UPDATE Courses SET ";
            query = query.concat("TextTwo = -1");
            query = query.concat(" WHERE TextTwo = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookID);
            
            stmt.execute();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
    }
    // </editor-fold>
    // </editor-fold>
    
    // <editor-fold desc="Functions to return items from the database.">
    // Get a specific course from the database.
    public static Course GetSpecificCourse(int CourseID)
            {
        Connection conn = null;
        PreparedStatement stmt = null;
        Course course = new Course();
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            String query = "SELECT * FROM Courses WHERE CourseID = ?";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, CourseID);
            
            ResultSet results = stmt.executeQuery();
            
            while(results.next())
            {
                // Add each course to the list.
                course.setCourseID(results.getInt(1));
                course.setCourseName(results.getString(2));
                course.setTextOne(results.getInt(3));
                course.setTextTwo(results.getInt(4));
            }
            results.close();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
        return course;
    }
    
    // Get a specific student from the database.
    public static Student GetSpecificStudent(int StudentID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        Student student = new Student();
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            String query = "SELECT * FROM Students WHERE StudentID = ?";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, StudentID);
            
            ResultSet results = stmt.executeQuery();
            
            while(results.next())
            {
                student.setStudentID(results.getInt(1));
                student.setFirstName(results.getString(2));
                student.setLastName(results.getString(3));
                student.setCourseOne(results.getInt(4));
                student.setCourseTwo(results.getInt(5));
                student.setCourseThree(results.getInt(6));
                student.setCourseFour(results.getInt(7));
                student.setCourseFive(results.getInt(8));
                student.setTextbookOne(results.getInt(9));
                student.setTextbookTwo(results.getInt(10)); 
                student.setTextbookThree(results.getInt(11)); 
                student.setTextbookFour(results.getInt(12));
                student.setTextbookFive(results.getInt(13));
                student.setTextbookSix(results.getInt(14));
                student.setTextbookSeven(results.getInt(15));
                student.setTextbookEight(results.getInt(16));
                student.setTextbookNine(results.getInt(17));
                student.setTextbookTen(results.getInt(18));
            }
            results.close();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
        return student;
    }
            
    // Get all textbooks from the database.
    public static List<Textbook> GetAllTextbooksFromDatabase()
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        List<Textbook> textList = new ArrayList<Textbook>();
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            String query = "SELECT * FROM Textbooks";
            
            stmt = conn.prepareStatement(query);
            
            ResultSet results = stmt.executeQuery();
            
            while(results.next())
            {
                // Add each textbook to the list.
                textList.add(new Textbook(results.getInt(1), 
                        results.getString(2), results.getString(3), 
                        results.getInt(4), results.getInt(5)));
            }
            results.close();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
        return textList;
    }
    
    // Get all courses from the database.
    public static List<Course> GetAllCoursesFromDatabase()
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        List<Course> courseList = new ArrayList<Course>();
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            String query = "SELECT * FROM Courses";
            
            stmt = conn.prepareStatement(query);
            
            ResultSet results = stmt.executeQuery();
            
            while(results.next())
            {
                // Add each course to the list.
                courseList.add(new Course(results.getInt(1), results.getString(2),
                        results.getInt(3), results.getInt(4)));
            }
            results.close();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
        return courseList;
    }
    
    // Get all students from the database.
    public static List<Student> GetAllStudentsFromDatabase()
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        List<Student> studentList = new ArrayList<Student>();
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            String query = "SELECT * FROM Students";
            
            stmt = conn.prepareStatement(query);
            
            ResultSet results = stmt.executeQuery();
            
            while(results.next())
            {
                // Add each textbook to the list.
                studentList.add(new Student(results.getInt(1), results.getString(2),
                results.getString(3), results.getInt(4), results.getInt(5), 
                results.getInt(6), results.getInt(7), results.getInt(8), 
                results.getInt(9), results.getInt(10), results.getInt(11), 
                results.getInt(12), results.getInt(13), results.getInt(14), 
                results.getInt(15), results.getInt(16), results.getInt(17), 
                results.getInt(18)));
            }
            results.close();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
        return studentList;
    }
    
    // Get all required textbooks from a course.
    public static List<Textbook> GetRequiredTextsForCourse(int TextOne,
            int TextTwo)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        List<Textbook> textList = new ArrayList<Textbook>();
        
        // If TextOne is -1, then there are no required textbooks.
        if (TextOne == -1)
            return textList;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            String query;
            query = "SELECT * FROM Textbooks WHERE TextbookID = ? OR ";
            query = query.concat("TextbookID = ?");
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextOne);
            stmt.setInt(2, TextTwo);
            
            ResultSet results = stmt.executeQuery();
            
            while(results.next())
            {
                // Add each textbook to the list.
                textList.add(new Textbook(results.getInt(1), 
                        results.getString(2), results.getString(3), 
                        results.getInt(4), results.getInt(5)));
            }
            results.close();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
        return textList;
    }
    
    // Get all required textbooks from a course.
    public static List<Textbook> GetRequiredTextsForCourse(int CourseID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        List<Textbook> textList = new ArrayList<Textbook>();
        
        try
        {
            Course course = new Course();
            course = GetSpecificCourse(CourseID);
            
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            String query;
            query = "SELECT * FROM Textbooks WHERE TextbookID = ? OR ";
            query = query.concat("TextbookID = ?");
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, course.TextOne);
            stmt.setInt(2, course.TextTwo);
            
            ResultSet results = stmt.executeQuery();
            
            while(results.next())
            {
                // Add each textbook to the list.
                textList.add(new Textbook(results.getInt(1), 
                        results.getString(2), results.getString(3), 
                        results.getInt(4), results.getInt(5)));
            }
            results.close();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
        return textList;
    }
    
    // Get all textbooks owned by a student.
    public static List<Textbook> GetTextbooksOwnedByStudent(int TextbookOne,
            int TextbookTwo, int TextbookThree, int TextbookFour, 
            int TextbookFive, int TextbookSix, int TextbookSeven, 
            int TextbookEight, int TextbookNine, int TextbookTen)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        List<Textbook> textList = new ArrayList<Textbook>();
        
        // If TextOne is -1, then the student doens't have any textbooks.
        if (TextbookOne == -1)
            return textList;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            String query;
            query = "SELECT * FROM Textbooks WHERE TextbookID = ? OR ";
            query = query.concat("TextbookID = ? OR ");
            query = query.concat("TextbookID = ? OR ");
            query = query.concat("TextbookID = ? OR ");
            query = query.concat("TextbookID = ? OR ");
            query = query.concat("TextbookID = ? OR ");
            query = query.concat("TextbookID = ? OR ");
            query = query.concat("TextbookID = ? OR ");
            query = query.concat("TextbookID = ? OR ");
            query = query.concat("TextbookID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookOne);
            stmt.setInt(2, TextbookTwo);
            stmt.setInt(3, TextbookThree);
            stmt.setInt(4, TextbookFour);
            stmt.setInt(5, TextbookFive);
            stmt.setInt(6, TextbookSix);
            stmt.setInt(7, TextbookSeven);
            stmt.setInt(8, TextbookEight);
            stmt.setInt(9, TextbookNine);
            stmt.setInt(10, TextbookTen);
            
            
            ResultSet results = stmt.executeQuery();
            
            while(results.next())
            {
                // Add each textbook to the list.
                textList.add(new Textbook(results.getInt(1), 
                        results.getString(2), results.getString(3), 
                        results.getInt(4), results.getInt(5)));
            }
            results.close();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
        return textList;
    }
    
    // Get all textbooks owned by a student.
    public static List<Textbook> GetTextbooksOwnedByStudent(int StudentID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        Student student = new Student();
        student = GetSpecificStudent(StudentID);
        List<Textbook> textList = new ArrayList<Textbook>();
        
        // If TextOne is -1, then the student doens't have any textbooks.
        if (student.TextbookOne == -1)
            return textList;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            String query;
            query = "SELECT * FROM Textbooks WHERE TextbookID = ? OR ";
            query = query.concat("TextbookID = ? OR ");
            query = query.concat("TextbookID = ? OR ");
            query = query.concat("TextbookID = ? OR ");
            query = query.concat("TextbookID = ? OR ");
            query = query.concat("TextbookID = ? OR ");
            query = query.concat("TextbookID = ? OR ");
            query = query.concat("TextbookID = ? OR ");
            query = query.concat("TextbookID = ? OR ");
            query = query.concat("TextbookID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, student.TextbookOne);
            stmt.setInt(2, student.TextbookTwo);
            stmt.setInt(3, student.TextbookThree);
            stmt.setInt(4, student.TextbookFour);
            stmt.setInt(5, student.TextbookFive);
            stmt.setInt(6, student.TextbookSix);
            stmt.setInt(7, student.TextbookSeven);
            stmt.setInt(8, student.TextbookEight);
            stmt.setInt(9, student.TextbookNine);
            stmt.setInt(10, student.TextbookTen);
            
            
            ResultSet results = stmt.executeQuery();
            
            while(results.next())
            {
                // Add each textbook to the list.
                textList.add(new Textbook(results.getInt(1), 
                        results.getString(2), results.getString(3), 
                        results.getInt(4), results.getInt(5)));
            }
            results.close();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
        return textList;
    }
    
    // Get all courses a student is enrolled in.
    public static List<Course> GetCoursesStudentIsEnrolledIn(int CourseOne,
            int CourseTwo, int CourseThree, int CourseFour, int CourseFive)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        List<Course> courseList = new ArrayList<Course>();
        
        // If CourseOne == -1, the student is not enrolled in any courses.
        if (CourseOne == -1)
            return courseList;
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            String query;
            query = "SELECT * FROM Courses WHERE CourseID = ? OR ";
            query = query.concat("CourseID = ? OR ");
            query = query.concat("CourseID = ? OR ");
            query = query.concat("CourseID = ? OR ");
            query = query.concat("CourseID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, CourseOne);
            stmt.setInt(2, CourseTwo);
            stmt.setInt(3, CourseThree);
            stmt.setInt(4, CourseFour);
            stmt.setInt(5, CourseFive);
            
            ResultSet results = stmt.executeQuery();
            
            while(results.next())
            {
                // Add each course to the list.
                courseList.add(new Course(results.getInt(1), results.getString(2),
                        results.getInt(3), results.getInt(4)));
            }
            results.close();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
        return courseList;
    }
    
    // Get all students enrolled in a specific course.
    public static List<Student> GetStudentsEnrolledInSpecifiedCourse(int CourseID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        List<Student> studentList = new ArrayList<Student>();
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            String query = "SELECT * FROM Students WHERE CourseOne = ? OR ";
            query = query.concat("CourseTwo = ? OR ");
            query = query.concat("CourseThree = ? OR ");
            query = query.concat("CourseFour = ? OR ");
            query = query.concat("CourseFive = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, CourseID);
            stmt.setInt(2, CourseID);
            stmt.setInt(3, CourseID);
            stmt.setInt(4, CourseID);
            stmt.setInt(5, CourseID);
            
            ResultSet results = stmt.executeQuery();
            
            while(results.next())
            {
                // Add each textbook to the list.
                studentList.add(new Student(results.getInt(1), results.getString(2),
                results.getString(3), results.getInt(4), results.getInt(5), 
                results.getInt(6), results.getInt(7), results.getInt(8), 
                results.getInt(9), results.getInt(10), results.getInt(11), 
                results.getInt(12), results.getInt(13), results.getInt(14), 
                results.getInt(15), results.getInt(16), results.getInt(17), 
                results.getInt(18)));
            }
            results.close();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
        return studentList;
    }
    
    // Get all students that are not in a specific course.
    // These students must have room in their schedules to add a class.
    public static List<Student> GetAllStudentsNotEnrolledInClass(int CourseID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        List<Student> studentList = new ArrayList<Student>();
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            String query = "SELECT * FROM Students WHERE NOT CourseOne = ? AND NOT ";
            query = query.concat("CourseTwo = ? AND NOT ");
            query = query.concat("CourseThree = ? AND NOT ");
            query = query.concat("CourseFour = ? AND ");
            query = query.concat("CourseFive = -1");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, CourseID);
            stmt.setInt(2, CourseID);
            stmt.setInt(3, CourseID);
            stmt.setInt(4, CourseID);
            
            ResultSet results = stmt.executeQuery();
            
            while(results.next())
            {
                // Add each textbook to the list.
                studentList.add(new Student(results.getInt(1), results.getString(2),
                results.getString(3), results.getInt(4), results.getInt(5), 
                results.getInt(6), results.getInt(7), results.getInt(8), 
                results.getInt(9), results.getInt(10), results.getInt(11), 
                results.getInt(12), results.getInt(13), results.getInt(14), 
                results.getInt(15), results.getInt(16), results.getInt(17), 
                results.getInt(18)));
            }
            results.close();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
        return studentList;
    }
    
    // Get all textbooks that are not required for a specific course.
    public static List<Textbook> GetTextbooksCurrentlyNotUsedByCourse(int TextOne,
            int TextTwo)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        List<Textbook> textList = new ArrayList<Textbook>();
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            String query;
            query = "SELECT * FROM Textbooks WHERE NOT TextbookID = ? AND NOT ";
            query = query.concat("TextbookID = ?");
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextOne);
            stmt.setInt(2, TextTwo);
            
            ResultSet results = stmt.executeQuery();
            
            while(results.next())
            {
                // Add each textbook to the list.
                textList.add(new Textbook(results.getInt(1), 
                        results.getString(2), results.getString(3), 
                        results.getInt(4), results.getInt(5)));
            }
            results.close();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
        return textList;
    }
    
    // Get all textbooks that are not owned by a student.
    // This function will only be called if the student has room for
    // another textbook (i.e. TextbookTen = -1).
    public static List<Textbook> GetTextbooksCurrentlyNotOwnedByStudent(
            int TextbookOne, int TextbookTwo, int TextbookThree, 
            int TextbookFour, int TextbookFive, int TextbookSix,
            int TextbookSeven, int TextbookEight, int TextbookNine)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        List<Textbook> textList = new ArrayList<Textbook>();
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            String query;
            query = "SELECT * FROM Textbooks WHERE NOT TextbookID = ? AND NOT ";
            query = query.concat("TextbookID = ? AND NOT ");
            query = query.concat("TextbookID = ? AND NOT ");
            query = query.concat("TextbookID = ? AND NOT ");
            query = query.concat("TextbookID = ? AND NOT ");
            query = query.concat("TextbookID = ? AND NOT ");
            query = query.concat("TextbookID = ? AND NOT ");
            query = query.concat("TextbookID = ? AND NOT ");
            query = query.concat("TextbookID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, TextbookOne);
            stmt.setInt(2, TextbookTwo);
            stmt.setInt(3, TextbookThree);
            stmt.setInt(4, TextbookFour);
            stmt.setInt(5, TextbookFive);
            stmt.setInt(6, TextbookSix);
            stmt.setInt(7, TextbookSeven);
            stmt.setInt(8, TextbookEight);
            stmt.setInt(9, TextbookNine);
            
            
            ResultSet results = stmt.executeQuery();
            
            while(results.next())
            {
                // Add each textbook to the list.
                textList.add(new Textbook(results.getInt(1), 
                        results.getString(2), results.getString(3), 
                        results.getInt(4), results.getInt(5)));
            }
            results.close();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
        return textList;
    }
    
    // Get all courses that a student is not enrolled in.
    // This function will only be called if the student has room in their
    // schedule for another course (i.e. CourseFive = -1).
    public static List<Course> GetAllCoursesStudentIsNotEnrolledIn(int CourseOne,
            int CourseTwo, int CourseThree, int CourseFour)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        List<Course> courseList = new ArrayList<Course>();
        
        try
        {
            Class.forName(JDBC_Driver);
            conn = DriverManager.getConnection(DB_URL, Username, Password);
            String query;
            query = "SELECT * FROM Courses WHERE NOT CourseID = ? AND NOT ";
            query = query.concat("CourseID = ? AND NOT ");
            query = query.concat("CourseID = ? AND NOT ");
            query = query.concat("CourseID = ?");
            
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, CourseOne);
            stmt.setInt(2, CourseTwo);
            stmt.setInt(3, CourseThree);
            stmt.setInt(4, CourseFour);
            
            ResultSet results = stmt.executeQuery();
            
            while(results.next())
            {
                // Add each course to the list.
                courseList.add(new Course(results.getInt(1), results.getString(2),
                        results.getInt(3), results.getInt(4)));
            }
            results.close();
        }
        catch(SQLException e){}
        catch(Exception e){}
        finally
        {
            try
            {
                if (stmt != null)
                    stmt.close();
            }
            catch (SQLException e){}
            try
            {
                if (conn != null)
                    conn.close();
            }
            catch (SQLException e){}
        }
        return courseList;
    }
    // </editor-fold>
    
    // JDBC driver name and database URL
    static final String JDBC_Driver = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/Bookstore"; // This should work.
    
    // Database credentials
    static final String Username = "root";
    static final String Password = "GL@SSf1sh";
    
}
