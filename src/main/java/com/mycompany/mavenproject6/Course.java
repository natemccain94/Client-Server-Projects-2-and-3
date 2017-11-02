/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject6;
import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlRootElement;
/**
 *
 * @author natemccain94
 */
@XmlRootElement
public class Course 
{
    public Course(){}
    
    public Course(int id, String name, int textOne, int textTwo)
    {
        this.CourseID = id;
        this.CourseName = name;
        this.TextOne = textOne;
        this.TextTwo = textTwo;
    }

    public int getCourseID() {
        return CourseID;
    }

    public void setCourseID(int CourseID) {
        this.CourseID = CourseID;
    }

    public String getCourseName() {
        return CourseName;
    }

    public void setCourseName(String CourseName) {
        this.CourseName = CourseName;
    }

    public int getTextOne() {
        return TextOne;
    }

    public void setTextOne(int TextOne) {
        this.TextOne = TextOne;
    }

    public int getTextTwo() {
        return TextTwo;
    }

    public void setTextTwo(int TextTwo) {
        this.TextTwo = TextTwo;
    }
    
    public int CourseID;
    public String CourseName;
    public int TextOne;
    public int TextTwo;
}
