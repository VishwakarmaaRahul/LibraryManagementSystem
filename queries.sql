select * from Libraries; 
select * from books ;
select * from categories;
select * from borrowing;
select * from members;
select * from reviews;
select * from authors;  
select * from bookauthor;
select * from bookcategory;


-- Book with their author and categories

select bk.book_id, bk.title,ba.author_id,CONCAT(a.first_name,' ', a.last_name) as AuthorName, bc.category_id ,c.category 
from  books bk 
left join bookauthor ba  on bk.book_id = ba.book_id 
left join authors a on ba.author_id = a.author_id
left join BookCategory bc on bc.book_id = bk.book_id
left join categories c on c.category_id = bc.category_id  ;


-- Most borrowd books in the last 30 days

select b.book_id ,b.title
from books b 
join borrowing br 
on b.book_id = br.book_id 
where br.borrow_date  >= CURRENT_DATE - INTERVAL 30 DAY;

-- Average rating per book with author information

select bk.book_id, bk.title,ba.author_id,CONCAT(a.first_name,' ', a.last_name) as AuthorName, 
a.birth_date ,a.nationality ,a.biography  ,AVG(r.rating) as "Average Rating"  
from  books bk 
left join bookauthor ba on bk.book_id = ba.book_id 
left join authors a on ba.author_id = a.author_id
join reviews r on bk.book_id = r.book_id
group by bk.book_id, bk.title,ba.author_id,a.first_name, a.last_name,a.birth_date ,a.nationality ,a.biography,r.rating
order by AVG(r.rating)  desc;


-- Books available in each library with stock levels

SELECT 
    b.book_id,
    b.title,
    b.isbn,
    b.publication_date,
    b.available_copies,
    l.library_id,
    l.library_name
FROM 
    books b
JOIN 
    libraries l ON b.library_id = l.library_id;
    


-- Window function (Rank books by average rating (within each library))


SELECT 
    l.library_name,
    b.title,
    ROUND(AVG(r.rating), 2) AS avg_rating,
    RANK() OVER (PARTITION BY l.library_id ORDER BY AVG(r.rating) DESC) AS rating_rank
FROM 
    Books b
JOIN 
    Libraries l ON b.library_id = l.library_id
JOIN 
    Reviews r ON b.book_id = r.book_id
GROUP BY 
    l.library_id, l.library_name, b.book_id, b.title;


-- Dense Rank

SELECT 
    l.library_name,
    b.title,
    ROUND(AVG(r.rating), 2) AS avg_rating,
    DENSE_RANK() OVER (PARTITION BY l.library_id ORDER BY AVG(r.rating) DESC) AS rating_rank
FROM 
    Books b
JOIN 
    Libraries l ON b.library_id = l.library_id
JOIN 
    Reviews r ON b.book_id = r.book_id
GROUP BY 
    l.library_id, l.library_name, b.book_id, b.title;


-- find how many books each member has borrowed

WITH BorrowCount AS (
    SELECT 
        member_id,
        COUNT(*) AS total_borrowed
    FROM 
        Borrowing
    GROUP BY 
        member_id
)
SELECT 
    m.member_id,
    CONCAT(m.first_name, ' ', m.last_name) AS member_name,
    bc.total_borrowed
FROM 
    Members m
JOIN 
    BorrowCount bc ON m.member_id = bc.member_id
ORDER BY 
    total_borrowed DESC;




