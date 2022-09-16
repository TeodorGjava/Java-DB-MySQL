ALTER TABLE products 
ADD CONSTRAINT users_fk FOREIGN KEY (category_id) 
REFERENCES categories (id);