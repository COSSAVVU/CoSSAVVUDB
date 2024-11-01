# CoSSAVVUDB
### A database for CoSSA VVU

_Proposed tables_
A comprehensive structure for Our CoSSA database, covering members, events, roles, committees, announcements, sponsorships, feedback, resources, and meetings... 
Each table is designed to store specific information, ensuring data integrity and ease of access.

A CoSSA database can be incredibly beneficial. Here’s why:

- Organization and Efficiency: Centralizes all member information, making it easier to manage and access.
- Communication: Facilitates seamless communication between members through newsletters, events, and announcements.
- Event Planning: Helps in planning, organizing, and managing events and activities.
- Membership Tracking: Keeps track of membership status, dues, and renewals.
- Historical Records: Preserves historical data and documents for future reference.
- Community Building: Enhances community engagement and networking opportunities.
- Real Data For Your Projects.

Diagram Link 🔗: https://lucid.app/lucidchart/cdc4875c-d0c9-413c-b2e3-544e800b6e3a/edit?viewport_loc=-1819%2C-3020%2C5068%2C2749%2C0_0&invitationId=inv_5be5f9d3-3925-450f-b611-8d1554d9ceb9

---![CoSSAVVUDB](https://github.com/user-attachments/assets/30b4cb4d-f2d8-49be-90f3-d009162ac010)

|Members|  | 
|--:|:--|
|MemberID | INT AUTO_INCREMENT PK|
|Name| VARCHAR(100)|
|StudentID| VARCHAR(20) UNIQUE|
|Email|VARCHAR(100)|
|PhoneNumber|VARCHAR(15)|
|JoinDate|DATE|
|Major|VARCHAR(50)|
|GraduationYear|INT|

### Relationships
Members are connected to:
- Registrations through MemberID (one-to-many relationship)
- MemberRoles through MemberID (one-to-many relationship)
- MemberCommittees through MemberID (one-to-many relationship)
- Feedback through MemberID (one-to-many relationship)
- Attendance through MemberID (one-to-many relationship)
- Announcements through PostedByID (one-to-many relationship)
- Events through OrganizerID (one-to-many relationship)
- Resources through UploadedByID (one-to-many relationship)
- Meetings through OrganizerID (one-to-many relationship)

---
|Events|
|:--|
|EventID: INT AUTO_INCREMENT PRIMARY KEY|
|EventName: VARCHAR(100)|
|EventDate: DATE|
|Location: VARCHAR(100)|
|Description: TEXT|
|OrganizerID: INT (Foreign key referencing Members)|

### Relationships:
Events are connected to:
- Registrations through EventID (one-to-many relationship)
- Feedback through EventID (one-to-many relationship)
- EventSponsors through EventID (one-to-many relationship)

---
|Registrations|
|:--|
|RegistrationID: INT AUTO_INCREMENT PRIMARY KEY|
|MemberID: INT (Foreign key referencing Members)|
|EventID: INT (Foreign key referencing Events)|
|RegistrationDate: DATE|


---
|Roles|
|:--|
|RoleID: INT AUTO_INCREMENT PRIMARY KEY|
|RoleName: VARCHAR(50)|

### Relationship:
Roles are connected to:
- MemberRoles through RoleID (one-to-many relationship)

---
|MemberRoles|
|:--|
|MemberRoleID: INT AUTO_INCREMENT PRIMARY KEY|
|MemberID: INT (Foreign key referencing Members)|
|RoleID: INT (Foreign key referencing Roles)|
|StartDate: DATE|
|EndDate: DATE|

---
|Committees|
|:--|
|CommitteeID: INT AUTO_INCREMENT PRIMARY KEY|
|CommitteeName: VARCHAR(100)|
|Description: TEXT|

### Relationship:
Committees are connected to:
- MemberCommittees through CommitteeID (one-to-many relationship)

---
|MemberCommittees|
|:--|
|MemberCommitteeID: INT AUTO_INCREMENT PRIMARY KEY|
|MemberID: INT (Foreign key referencing Members)|
|CommitteeID: INT (Foreign key referencing Committees)|
|JoinDate: DATE|
|LeaveDate: DATE|

---
|Announcements|
|:--|
|AnnouncementID: INT AUTO_INCREMENT PRIMARY KEY|
|Title: VARCHAR(100)|
|Content: TEXT|
|PostedByID: INT (Foreign key referencing Members)|
|PostedDate: DATE|

---
|Sponsors|
|:--|
|SponsorID: INT AUTO_INCREMENT PRIMARY KEY|
|SponsorName: VARCHAR(100)|
|ContactInfo: VARCHAR(150)|
|SponsorshipAmount: DECIMAL(10, 2)|

### Relationship:
Sponsors are connected to:
- EventSponsors through SponsorID (one-to-many relationship)

---
|EventSponsors|
|:--|
|EventSponsorID: INT AUTO_INCREMENT PRIMARY KEY|
|EventID: INT (Foreign key referencing Events)|
|SponsorID: INT (Foreign key referencing Sponsors)|
|SponsorshipAmount: DECIMAL(10, 2)|

---
|Feedback|
|:--|
|FeedbackID: INT AUTO_INCREMENT PRIMARY KEY|
|MemberID: INT (Foreign key referencing Members)|
|EventID: INT (Foreign key referencing Events)|
|Rating: INT (1 to 5)|
|Comments: TEXT|
|FeedbackDate: DATE|

---
|Resources|
|:--|
|ResourceID: INT AUTO_INCREMENT PRIMARY KEY|
|ResourceName: VARCHAR(100)|
|ResourceType: VARCHAR(50)|
|URL: VARCHAR(200)|
|UploadedByID: INT (Foreign key referencing Members)|
|UploadDate: DATE|

---
|Meetings|
|:--|
|MeetingID: INT AUTO_INCREMENT PRIMARY KEY|
|MeetingName: VARCHAR(100)|
|MeetingDate: DATE|
|Location: VARCHAR(100)|
|Notes: TEXT|
|OrganizerID: INT (Foreign key referencing Members)|

### Relationship:
Meetings are connected to:
-Attendance through MeetingID (one-to-many relationship)

---
|Attendance|
|:--|
|AttendanceID: INT AUTO_INCREMENT PRIMARY KEY|
|MeetingID: INT (Foreign key referencing Meetings)|
|MemberID: INT (Foreign key referencing Members)|
|AttendanceStatus: ENUM('Present', 'Absent', 'Excused')|

You are Free To Make a Pull Request.
