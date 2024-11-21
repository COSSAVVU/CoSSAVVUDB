CREATE TABLE Members (
    MemberID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    StudentID VARCHAR(20) UNIQUE,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    JoinDate DATE,
    Major VARCHAR(50),
    GraduationYear INT
);

CREATE TABLE Events (
    EventID SERIAL PRIMARY KEY,
    EventName VARCHAR(100),
    EventDate DATE,
    Location VARCHAR(100),
    Description TEXT,
    OrganizerID INT,
    FOREIGN KEY (OrganizerID) REFERENCES Members(MemberID)
);

CREATE TABLE Registrations (
    RegistrationID SERIAL PRIMARY KEY,
    MemberID INT,
    EventID INT,
    RegistrationDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (EventID) REFERENCES Events(EventID)
);

CREATE TABLE Roles (
    RoleID SERIAL PRIMARY KEY,
    RoleName VARCHAR(50)
);

CREATE TABLE MemberRoles (
    MemberRoleID SERIAL PRIMARY KEY,
    MemberID INT,
    RoleID INT,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

CREATE TABLE Committees (
    CommitteeID SERIAL PRIMARY KEY,
    CommitteeName VARCHAR(100),
    Description TEXT
);

CREATE TABLE MemberCommittees (
    MemberCommitteeID SERIAL PRIMARY KEY,
    MemberID INT,
    CommitteeID INT,
    JoinDate DATE,
    LeaveDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (CommitteeID) REFERENCES Committees(CommitteeID)
);

CREATE TABLE Announcements (
    AnnouncementID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Content TEXT,
    PostedByID INT,
    PostedDate DATE,
    FOREIGN KEY (PostedByID) REFERENCES Members(MemberID)
);

CREATE TABLE Sponsors (
    SponsorID SERIAL PRIMARY KEY,
    SponsorName VARCHAR(100),
    ContactInfo VARCHAR(150),
    SponsorshipAmount DECIMAL(10, 2)
);

CREATE TABLE EventSponsors (
    EventSponsorID SERIAL PRIMARY KEY,
    EventID INT,
    SponsorID INT,
    SponsorshipAmount DECIMAL(10, 2),
    FOREIGN KEY (EventID) REFERENCES Events(EventID),
    FOREIGN KEY (SponsorID) REFERENCES Sponsors(SponsorID)
);

CREATE TABLE Feedback (
    FeedbackID SERIAL PRIMARY KEY,
    MemberID INT,
    EventID INT,
    Rating INT,
    Comments TEXT,
    FeedbackDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (EventID) REFERENCES Events(EventID)
);

CREATE TABLE Resources (
    ResourceID SERIAL PRIMARY KEY,
    ResourceName VARCHAR(100),
    ResourceType VARCHAR(50),
    URL VARCHAR(200),
    UploadedByID INT,
    UploadDate DATE,
    FOREIGN KEY (UploadedByID) REFERENCES Members(MemberID)
);

CREATE TABLE Meetings (
    MeetingID SERIAL PRIMARY KEY,
    MeetingName VARCHAR(100),
    MeetingDate DATE,
    Location VARCHAR(100),
    Notes TEXT,
    OrganizerID INT,
    FOREIGN KEY (OrganizerID) REFERENCES Members(MemberID)
);

CREATE TABLE Attendance (
    AttendanceID SERIAL PRIMARY KEY,
    MeetingID INT,
    MemberID INT,
    AttendanceStatus VARCHAR(10) CHECK (AttendanceStatus IN ('Present', 'Absent', 'Excused')),
    FOREIGN KEY (MeetingID) REFERENCES Meetings(MeetingID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

CREATE TABLE MembershipDues (
    PaymentID SERIAL PRIMARY KEY,
    MemberID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    PaymentMethod VARCHAR(20) CHECK (PaymentMethod IN ('Cash', 'Card', 'Online Transfer')),
    Status VARCHAR(10) CHECK (Status IN ('Paid', 'Pending')),
    Note TEXT,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);
