mysql -uroot -p < Lesson_2.sql
mysqldump -uroot -p GeekBrainsDB > dump.sql
mysql -uroot -p -f newDB < dump.sql
