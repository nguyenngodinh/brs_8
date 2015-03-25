[Book Reviewing System] Framgia has many technical books that all employees can read. To manage and use them effectively, the management and reviewing system is needed.

User

can register for app
can signin, signout
can see the list of all books
can search books by title, category, rating, favorite, etc.
can rate and write a review for book (also can edit, delete it)
can comment to a review (also can edit, delete it)
can mark a book as reading
can mark a book as read
can mark a book as his/her favorite book
can see reading history
can follow/unfollow other users
can see other user's favorite book list
can see the activities on the timeline on home page
can send admin a request to buy a new book (also can cancel it)
can see the list of the requests he/she sent
can like/unlike to an activity

Admin

account is made by rake task
cannot register on browser
can signin, signout
can manage (CRUD) books
can manage users
can manage the requests to buy a new book sent from users

Book

must belong to a category
must have informations at least: title, publish date, author, the number of pages, category

Activities

follow/followed
mark as read
mark as favorite
write review
write comment