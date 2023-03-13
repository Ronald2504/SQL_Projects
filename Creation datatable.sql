/* Customers datatable */
CREATE TABLE customers(
    customer_id varchar(80),
    customer_unique_id varchar(80),
    customer_zip_code_prefix char(5),
    customer_city varchar(80),
    customer_state char(2),
    CONSTRAINT customer_key PRIMARY KEY (customer_id)
);

/* Order datatable */
CREATE TABLE orders(
    order_id varchar(80),
    customer_id varchar(80) REFERENCES customers (customer_id),
    order_status varchar(80),
    order_purchase_timestamp timestamp,
    order_approved_at timestamp,
    order_delivered_carrier_date timestamp,
    order_delivered_customer_date timestamp,
    order_estimated_delivery_date timestamp,
    CONSTRAINT order_key PRIMARY KEY (order_id)
);

/* Geolocation datatable */
CREATE TABLE geo_location(
    geolocation_zip_code_prefix varchar(10),
    geo_latitude double precision,
    geo_longitude double precision,
    geo_city varchar(80),
    geo_state char(2)
    );
	

/* Product datatable */
CREATE TABLE products(
    product_id varchar(80),
    product_category_name varchar(80),
    product_name_length smallint,
    product_description_length smallint,
    product_photos_qty smallint,
    product_weight_g integer,
    product_length_cm smallint,
    product_height_cm smallint,
    product_width_cm smallint,
    CONSTRAINT product_key PRIMARY KEY (product_id)
);

/* Sellers datatable */
CREATE TABLE sellers(
    seller_id varchar(80),
    seller_zipcode_prefix char(5),
    seller_city varchar(80),
    seller_state varchar(20),
    CONSTRAINT seller_key PRIMARY KEY (seller_id)
);


/* Order item datatable */
CREATE TABLE order_items(
    order_id varchar(80) REFERENCES orders (order_id),
    order_item_id smallint,
    product_id varchar(80) REFERENCES products (product_id),
    seller_id varchar(80) REFERENCES sellers (seller_id),
    shipping_limit_date timestamp,
    price real,
    freight_value real
);

/* Order payments datatable */
CREATE TABLE order_payments(
    order_id varchar(80) REFERENCES orders (order_id),
    payment_sequential smallint,
    payment_type varchar(20),
    payment_installments smallint,
    payment_value double precision
);

/* Order review datatable */
CREATE TABLE order_reviews(
    review_id varchar(80),
    order_id varchar(80) REFERENCES orders (order_id), 
    review_score smallint,
    review_comment_title text,
    review_comment_message text,
    review_create_date timestamp,
    review_answer_timestamp timestamp
);
    
/* Product name translation datatable */
CREATE TABLE product__name_translation(
    product_category_name varchar(80),
    product_category_name_english varchar(80)
);
    