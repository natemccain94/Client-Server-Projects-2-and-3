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
public class Textbook 
{
    public Textbook(){}
    
    public Textbook(int id, String Title, String Publisher, 
            int Edition, int Date)
    {
        this.TextbookID = id;
        this.title = Title;
        this.publisher = Publisher;
        this.edition = Edition;
        this.date = Date;
    }

    public int getTextbookID() {
        return TextbookID;
    }

    public void setTextbookID(int TextbookID) {
        this.TextbookID = TextbookID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public int getEdition() {
        return edition;
    }

    public void setEdition(int edition) {
        this.edition = edition;
    }

    public int getDate() {
        return date;
    }

    public void setDate(int date) {
        this.date = date;
    }
    
    public int TextbookID;
    public String title;
    public String publisher;
    public int edition;
    public int date;
}
