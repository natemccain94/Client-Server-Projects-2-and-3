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
public class Student 
{
    public Student(){}
    
    public Student(int id, String first, String last, int courseOne,
            int courseTwo, int courseThree, int courseFour, int courseFive,
            int textOne, int textTwo, int textThree, int textFour,
            int textFive, int textSix, int textSeven, int textEight,
            int textNine, int textTen)
    {
        this.StudentID = id;
        this.FirstName = first;
        this.LastName = last;
        this.CourseOne = courseOne;
        this.CourseTwo = courseTwo;
        this.CourseThree = courseThree;
        this.CourseFour = courseFour;
        this.CourseFive = courseFive;
        this.TextbookOne = textOne;
        this.TextbookTwo = textTwo;
        this.TextbookThree = textThree;
        this.TextbookFour = textFour;
        this.TextbookFive = textFive;
        this.TextbookSix = textSix;
        this.TextbookSeven = textSeven;
        this.TextbookEight = textEight;
        this.TextbookNine = textNine;
        this.TextbookTen = textTen;
    }

    public int getStudentID() {
        return StudentID;
    }

    public void setStudentID(int StudentID) {
        this.StudentID = StudentID;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public int getCourseOne() {
        return CourseOne;
    }

    public void setCourseOne(int CourseOne) {
        this.CourseOne = CourseOne;
    }

    public int getCourseTwo() {
        return CourseTwo;
    }

    public void setCourseTwo(int CourseTwo) {
        this.CourseTwo = CourseTwo;
    }

    public int getCourseThree() {
        return CourseThree;
    }

    public void setCourseThree(int CourseThree) {
        this.CourseThree = CourseThree;
    }

    public int getCourseFour() {
        return CourseFour;
    }

    public void setCourseFour(int CourseFour) {
        this.CourseFour = CourseFour;
    }

    public int getCourseFive() {
        return CourseFive;
    }

    public void setCourseFive(int CourseFive) {
        this.CourseFive = CourseFive;
    }

    public int getTextbookOne() {
        return TextbookOne;
    }

    public void setTextbookOne(int TextbookOne) {
        this.TextbookOne = TextbookOne;
    }

    public int getTextbookTwo() {
        return TextbookTwo;
    }

    public void setTextbookTwo(int TextbookTwo) {
        this.TextbookTwo = TextbookTwo;
    }

    public int getTextbookThree() {
        return TextbookThree;
    }

    public void setTextbookThree(int TextbookThree) {
        this.TextbookThree = TextbookThree;
    }

    public int getTextbookFour() {
        return TextbookFour;
    }

    public void setTextbookFour(int TextbookFour) {
        this.TextbookFour = TextbookFour;
    }

    public int getTextbookFive() {
        return TextbookFive;
    }

    public void setTextbookFive(int TextbookFive) {
        this.TextbookFive = TextbookFive;
    }

    public int getTextbookSix() {
        return TextbookSix;
    }

    public void setTextbookSix(int TextbookSix) {
        this.TextbookSix = TextbookSix;
    }

    public int getTextbookSeven() {
        return TextbookSeven;
    }

    public void setTextbookSeven(int TextbookSeven) {
        this.TextbookSeven = TextbookSeven;
    }

    public int getTextbookEight() {
        return TextbookEight;
    }

    public void setTextbookEight(int TextbookEight) {
        this.TextbookEight = TextbookEight;
    }

    public int getTextbookNine() {
        return TextbookNine;
    }

    public void setTextbookNine(int TextbookNine) {
        this.TextbookNine = TextbookNine;
    }

    public int getTextbookTen() {
        return TextbookTen;
    }

    public void setTextbookTen(int TextbookTen) {
        this.TextbookTen = TextbookTen;
    }
    
    
    
    public int StudentID;
    public String FirstName;
    public String LastName;
    public int CourseOne, CourseTwo, CourseThree, CourseFour, CourseFive;
    public int TextbookOne, TextbookTwo, TextbookThree, TextbookFour;
    public int TextbookFive, TextbookSix, TextbookSeven, TextbookEight;
    public int TextbookNine, TextbookTen;
}
