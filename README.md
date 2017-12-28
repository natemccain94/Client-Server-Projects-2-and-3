# Client-Server-Projects-2-and-3

Here is the project description as written by the professor:

Project 2: Course Textbook Controller

We will pretend that we are creating a program that looks up (for course instructors)
whether or not a student has appropriate textbooks for the course, and whether he/she has
the correct textbook with the correct edition and correct printing date. NOTE THAT
YOU SHOULD BE ABLE TO HANDLE MULTIPLE COURSES.

What you will do is create an HTML form page that will work the following way:

1) Instructor enters required text information: book title, book publisher, book edition,
   and date of printing for each of up to 2 textbooks of the course.
   
2) Student name (firstname and lastname), book title, book publisher, book edition, and
   date of printing, for each student for a particular course. Allow up to 2 textbooks per
   course. For book publisher, this should be a company name (Random House,
   Elsevier, Springer). You can assume the book publisher is a one word entity. For a 
   title, you should assume a string. For book edition assume an integer number (1, 2, 3,
   4, etc.). Date is the year of publication.
   
3) The client should be able to view all textbook information for all students. How you
   initially show this is up to you. I suggest that you should keep a constant screen with
   all current student/textbook information showing while you enter new student data.
   However, I will allow you to decide to either do this, or else update on request.
   
Your server will be located at localhost. You will use JAX-RS for all connections to
your server.

Your server will store all the students you enter in a file. You should flag when students
do not have the same edition of the textbook. You should flag when students have the
wrong textbook or wrong edition of the text or wrong date for the wrong edition of the
text.

Your server will look up the appropriate information, and return it to the client.

You will use JAX-RS to handle all your web services. Your web server will run on
Glassfish, in the VMs provided in the CS lab.

Turn in: CDROM or flash drive, printout (listing)


Grading for Project 2

Runs and does any data transfer to/from browser client/server       20%
Textbooks handled, including all appropriate displays               20%
Students handled, including all appropriate displays                20%
Courses handled, including all appropriate displays                 20%
Stores data appropriately                                           10%
Appropriate comments                                                10%

For the RESTful program:
you should be able to display all courses
you should be able to display all textbooks
you should be able to display all students
you should be able to display the textbooks for a course
you should be able to display the students for a course
you should be able to display the courses for a student
you should be able to display the textbooks for a student
you should be able to update textbooks
you should be able to update students
you should be able to update courses



Project 3: Securing a Web Server

You will create your OWN certificate authority.

Your certificate authority will provide a certificate to your Course Textbook Controller
website.

You will update your Firefox browser on your VM to use the root certificate produced by
your certificate authority.

You will show that your Course Textbook Controller website is secured by a certificate.

Grading for Project 3:

Create certificate, and display it to instructor                                25 points

Illustrate Firefox results prior to updating the browser with root certificate  25 points

Each person on team explains the specific certificate process for Glassfish     25 points

Show full certificate security in place                                         25 points
