Book Reviewing System
=====================
Framgia has many technical books that all employees can read. To manage and use them effectively, the management and reviewing system is needed.

## User

* register for app
* signin, signout
* see the list of all books
* search books by title, category, rating, favorite, etc.
* rate and write a review for book (also can edit, delete it)
* comment to a review (also can edit, delete it)
* mark a book as reading
* mark a book as read
* mark a book as his/her favorite book
* see reading history
* follow/unfollow other users
* see other user's favorite book list
* see the activities on the timeline on home page
* send admin a request to buy a new book (also can cancel it)
* see the list of the requests he/she sent
* like/unlike to an activity

## Admin

* account is made by rake task
* cannot register on browser
* signin, signout
* manage (CRUD) books
* manage users
* manage the requests to buy a new book sent from users

## Book

* belong to a category
* have informations at least: title, publish date, author, the number of pages, category

## Activities

* follow/followed
* mark as read
* mark as favorite
* write review
* write comment
