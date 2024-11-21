

CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    StudentID VARCHAR(20) UNIQUE,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    JoinDate DATE,
    Major VARCHAR(50),
    GraduationYear INT
);

CREATE TABLE Events (
    EventID INT AUTO_INCREMENT PRIMARY KEY,
    EventName VARCHAR(100),
    EventDate DATE,
    Location VARCHAR(100),
    Description TEXT,
    OrganizerID INT,
    FOREIGN KEY (OrganizerID) REFERENCES Members(MemberID)
);

CREATE TABLE Registrations (
    RegistrationID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT,
    EventID INT,
    RegistrationDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (EventID) REFERENCES Events(EventID)
);

CREATE TABLE Roles (
    RoleID INT AUTO_INCREMENT PRIMARY KEY,
    RoleName VARCHAR(50)
);

CREATE TABLE MemberRoles (
    MemberRoleID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT,
    RoleID INT,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

CREATE TABLE Committees (
    CommitteeID INT AUTO_INCREMENT PRIMARY KEY,
    CommitteeName VARCHAR(100),
    Description TEXT
);

CREATE TABLE MemberCommittees (
    MemberCommitteeID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT,
    CommitteeID INT,
    JoinDate DATE,
    LeaveDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (CommitteeID) REFERENCES Committees(CommitteeID)
);

CREATE TABLE Announcements (
    AnnouncementID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100),
    Content TEXT,
    PostedByID INT,
    PostedDate DATE,
    FOREIGN KEY (PostedByID) REFERENCES Members(MemberID)
);

CREATE TABLE Sponsors (
    SponsorID INT AUTO_INCREMENT PRIMARY KEY,
    SponsorName VARCHAR(100),
    ContactInfo VARCHAR(150),
    SponsorshipAmount DECIMAL(10, 2)
);

CREATE TABLE EventSponsors (
    EventSponsorID INT AUTO_INCREMENT PRIMARY KEY,
    EventID INT,
    SponsorID INT,
    SponsorshipAmount DECIMAL(10, 2),
    FOREIGN KEY (EventID) REFERENCES Events(EventID),
    FOREIGN KEY (SponsorID) REFERENCES Sponsors(SponsorID)
);

CREATE TABLE Feedback (
    FeedbackID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT,
    EventID INT,
    Rating INT,
    Comments TEXT,
    FeedbackDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (EventID) REFERENCES Events(EventID)
);

CREATE TABLE Resources (
    ResourceID INT AUTO_INCREMENT PRIMARY KEY,
    ResourceName VARCHAR(100),
    ResourceType VARCHAR(50),
    URL VARCHAR(200),
    UploadedByID INT,
    UploadDate DATE,
    FOREIGN KEY (UploadedByID) REFERENCES Members(MemberID)
);

CREATE TABLE Meetings (
    MeetingID INT AUTO_INCREMENT PRIMARY KEY,
    MeetingName VARCHAR(100),
    MeetingDate DATE,
    Location VARCHAR(100),
    Notes TEXT,
    OrganizerID INT,
    FOREIGN KEY (OrganizerID) REFERENCES Members(MemberID)
);

CREATE TABLE Attendance (
    AttendanceID INT AUTO_INCREMENT PRIMARY KEY,
    MeetingID INT,
    MemberID INT,
    AttendanceStatus ENUM('Present', 'Absent', 'Excused'),
    FOREIGN KEY (MeetingID) REFERENCES Meetings(MeetingID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);


CREATE TABLE MembershipDues (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    PaymentMethod ENUM('Cash', 'Card', 'Online Transfer'),
    Status ENUM('Paid', 'Pending'),
    Note TEXT,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);



CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON COSSADB.* TO 'username'@'localhost';
FLUSH PRIVILEGES;




