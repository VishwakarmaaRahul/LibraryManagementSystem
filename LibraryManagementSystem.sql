CREATE TABLE libraryName(
    library_id INT PRIMARY KEY,
    name VARCHAR(50),
    campus_location INT,
    contact_email VARCHAR(50),
    phone_number VARCHAR(30)
);


CREATE TABLE Book   (
    book_id INT PRIMARY KEY,
    title VARCHAR(50),
    isbn VARCHAR(50),
    publication_date DATE,
    total_copies INT,
    available_copies INT,
    library_id INT,
    FOREIGN KEY (library_id) REFERENCES libraryName(library_id)
);

CREATE TABLE Author    (
    author_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE,
    nationality VARCHAR(50),
    biography VARCHAR(50)
);


CREATE TABLE Category   (
    category_id INT PRIMARY KEY,
    name VARCHAR(50),
    description VARCHAR(50)
);

CREATE TABLE Member     (
    member_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(50),
    member_type VARCHAR(20),
    registration_date DATE,
    CHECK (member_type IN ('student', 'faculty'))
);


CREATE TABLE Borrowing    (
    borrowing_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    due_date DATE,
    return_date DATE,
    late_fee INT,
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)  
);


CREATE TABLE Review (
    review_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    rating INT,
    comment TEXT,
    review_date DATE,
    CHECK (rating BETWEEN 1 AND 5),
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    UNIQUE (member_id, book_id) 
);

CREATE TABLE BookAuthor (
    book_id INT,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Author(author_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    PRIMARY KEY (book_id, author_id)  
);


CREATE TABLE BookCategory (
    book_id INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    PRIMARY KEY (book_id, category_id)
);








