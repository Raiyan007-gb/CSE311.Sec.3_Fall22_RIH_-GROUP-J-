# CSE311.Sec.3_Fall22_RIH_-GROUP-J-

  

North South University
Department of Electrical & Computer Engineering
Project Proposal

Project Name : Blood Donation System
Course Title   : Database Management System
Course Code  : CSE311
Section           : 03

Submitted by:
Group      : J
Members : 
1.	Mohammad Taseen – 2022249642
2.	Amrita Biswas – 2022015642
3.	Raiyan Ahmed – 2013130642

Submitted to:
Course Instructor : Rifat Ahmed Hassan (RIH)
Lab Instructor      : Md Sajid Ahmed

Blood Donation System 

Introduction: 
31.5 million people are killed by accidents or other injuries yearly, with a large percentage requiring blood during the first 24 hours of treatment. Among those deaths, a huge chunk occurs due to lack of blood at the right time. Accidents aside, medical situations such as surgery or any sickness may necessitate the urgent need for blood. But, often, in such critical situations, it becomes extremely painstaking to find a blood donor. Such uncertainty, whether blood will be managed or not, make everyone suffer.

Problem Definition:
The main problem is that although there is a rise in blood donor groups, individuals still die in need of blood. People must ask various people to find blood for their loved ones, which is time-consuming. There seems to be a lack of a bridge that connects the donors and acceptors during severe emergencies.

Problem Solution:
The main goal of this project is to build a web application that will bring blood donors and blood acceptors under one roof. Blood donors can register and provide their necessary information on the website so that when someone needs blood, they can simply register on the website and request blood in their preferred area. If sufficient donors aren’t available at that moment, then the acceptors can request nearby blood banks during emergencies.

Project Definition:
User type: 03 (Admin, Donors/Acceptors, Blood banks)
Website Homepage:
There will be two input boxes for the users. One is for e-mail, and another is for passwords. Users must log in to go to their respective home pages. If they don’t have any user id, then they must register first, filling in all the necessary information. Each user will be provided with a unique id which he will use to log in later. There will also be an option for forgotten passwords/usernames.



Donor/Acceptor Homepage:
Users will land on the homepage, which contains all their records. They can edit their details, change passwords, etc. There will be a menu where they can also select whether they want to donate or request blood. Upon clicking those options, they will land on their desired page.
1.	Edit details: Users can edit their personal information, location, last donation date, health problems (if any), preferred time, etc.
2.	Change password: Users can change their passwords and retrieve their passwords.
3.	Edit notifications:  Users can modify their notification alarms based on their preferences. 
4.	Donate blood: Users will land on the donors’ page by selecting this.
5.	Request blood: Users will land on the acceptors’ page by selecting this.
Manage Donors:
In this section, users can edit their details, view blood requests, check accepted requests, print accepted request details, and contact blood banks.
1.	View blood requests: Donors can view and accept blood requests. Also, they can search for requests for any blood type or in a preferred location. Also, in case of accepting requests, there will be cross check option on whether the donor is eligible for the donation. 
2.	Check accepted requests: Donors can see patients’ details, locations, contact numbers, times, etc.
3.	 Print accepted request details: They can print the information in case they want it.
4.	Contact blood banks: If there aren’t any requests, donors can contact them in case they need blood.
Manage acceptors:
In this section, acceptors can send requests, edit requests, delete requests, search blood banks, contact donors, and print donor details.
1.	Send requests: Acceptors can send requests by providing the required patient information and preferences to nearby donors. An e-mail will be sent to the donors.
2.	Edit requests: Acceptors can edit the provided information if needed.
3.	Delete requests: Acceptors can delete the request if blood is managed from outside.
4.	Search blood banks: If no donor is available in the patient’s area, then the acceptor can search the blood banks situated in the nearby region. They can view the bank’s current stocks and their details. If they find their required blood in the bank, then they can contact the bank.
5.	Contact donors: Acceptors can see the donors’ details, locations, contact numbers, etc. 
6.	Print donor details: They can print the information of the donors.


Blood bank Homepage:
 Blood bank users will land on the homepage containing all their records. They can store their personal details and information about their storage, verification, ask for volunteers, accept requests, and contact volunteers.
1.	Add bank information: They can store their information on which blood types are available, their location, their storage capacity, their facilities, etc.
2.	 Edit storage details: They can edit data on which types of blood are available now, how many bags are available, and whether they are going to need blood later.
3.	Verification: Submit necessary documents and verify as one of the certified blood banks.
4.	Ask for volunteers: They can ask for volunteers if anyone is willing to donate.
5.	Accept request: They can accept the request if anyone calls for an emergency.
6.	Contact volunteers: They can contact volunteers willing to donate.

Admin Homepage:
Admin can see all the details of the users, including donors/acceptors and blood banks. After logging in, he/she will be redirected to the admin homepage.
Manage Admin: 
1.	User list: This will list all registered users. Admin can create, edit, delete, and deactivate any user if necessary.
2.	Public notification: Admin can send notifications to any user or every user.
3.	Username-password-reset: If any user faces issues like “username forgot” or “password forgot”, then he/she can request admin to reset that.
4.	Banks verification: Admin verifies the banks by checking necessary documents.
5.	Automated e-mail system: An automated e-mail between the users which will be managed by the admin. 
6.	Admin info: This will contain all the sensitive information about the admin, like password, first email, second email, and contact info.
7.	Password reset: If the admin forgets his password, he will be redirected here. He/she will be needed all the info except the password to reset the password.

Risks/challenges we may face:
1.	The main challenge is building a web application that operates in an automated system and sends e-mails to the donors and blood banks based on the patient’s urgency. 
2.	 We may face problems working with HTML, CSS, PHP, etc., as we don't have prior knowledge about web development. 
3.	Since we are going to work with a lot of data hence merging them all into one database might not come as easy.
Conclusion: 
Our system is very efficient. Blood donation in Bangladesh is an activity conducted by several different organizations. Therefore, our system can be the above solution to connect all the parties with one rope. Seeing the lack of a platform for blood donation, our “Blood Donation System” will help Blood transfusion service to become easily available in an emergency. This smooth and comfortable system will also encourage blood donation services’ rise. Although, it is not a promise that the system will achieve all its outcomes mentioned above. How the system is being used is up to its user. But it will surely be one step forward.



