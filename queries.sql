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


select bk.book_id, bk.title,ba.author_id,CONCAT(a.first_name,' ', a.last_name) as AuthorName 
from  books bk 
left join bookauthor ba  on bk.book_id = ba.book_id 
left join authors a on ba.author_id = a.author_id;

