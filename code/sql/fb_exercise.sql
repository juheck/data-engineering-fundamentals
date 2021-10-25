/*
Question 1:
What brands have an average price above $3 and contain at least 2 different products?

Question 2:
To improve sales, the marketing department runs various types of promotions.
The marketing manager would like to analyze the effectiveness of these promotion campaigns.
In particular, what percent of our sales transactions had a valid promotion applied?

Question 3:
We want to run a new promotion for our most successful category of products
(we call these categories “product classes”).
Can you find out what are the top 3 selling product classes by total sales?

Question 4:
We are considering running a promo across brands. We want to target
customers who have bought products from two specific brands.
Can you find out which customers have bought products from both the
“Fort West" and the "Golden" brands?
*/

/*
Q5. What are the top five (ranked in decreasing order) single-channel media types that correspond 
to the most money the grocery chain had spent on its promotional campaigns?

Q6. the proportion of valid sales that occurred on certain dates.

Q7. Manager want to analyze the how the promotions on certain products are performing.
Find how the the percent of promoted sales?
count of promoted sales* 100 /total sale

Q8. Get the top3 product class_id by the total sales.
*/

CREATE TABLE first_project_bq_dataset.sales (
    product_id int64,
    store_id int64,
    customer_id int64,
    promotion_id int64,
    store_sales numeric,
    store_cost numeric,
    units_sold numeric,
    transaction_date date
);

CREATE TABLE first_project_bq_dataset.products (
    product_id int64,
    product_class_id int64,
    brand_name string,
    product_name string,
    is_low_fat_flg int64,
    is_recyclable_flg int64,
    gross_weight numeric,
    net_weight numeric
);

CREATE TABLE first_project_bq_dataset.promotions (
    promotion_id int64,
    promotion_name string,
    media_type string,
    cost numeric,
    start_date date,
    end_date date
);

CREATE TABLE first_project_bq_dataset.product_classes (
    product_class_id int64,
    product_subcategory string,
    product_category string,
    product_department string,
    product_family string
);


-- 1. what %age of products have both low fat and recycable.

 with flag_total as (
    Select 
        SUM (CASE when is_low_fat_flg =1 and is_recyclable_flg =1 then 1 else 0 end) as flag_count,
        count(distinct product_id) as prod_count
   from products
 )

  select 
      flag_count/ prod_count * 100 as percent
 from flag_total
 ;

 /* 2. Find top 5 sales products having promotions
*/

 select product_id 
 from sales
 where promotion_id is not null
 group by product_id
 order by sum(store_cost * units_sold) desc
 limit 5
 ;


/*
3. What %age of sales happened on first and last day of the promotion
Not sure if this asked for all promotions or % for each promotion. in case all -
*/
 select s.promotion_id,
 round((sum(case when s.transaction_date = (p.promo_start_date) 
            or s.transaction_date = (p.promo_end_date) then (store_cost * units_sold) else 0 end) * 100.0
 / sum((store_cost * units_sold))),2)
 from sales s inner join  promotion p -- left join? 
 on p.promotion_id = s.promotion_id 
 group by s.promotion_id
 ;


 /* 4. Which product had the highest sales with promotions and sales 
 */


/* We want to run a new promotion for our most successful category of products
(we call these categories “product classes”).
Can you find out what are the top 3 selling product classes by total sales?
*/

select p.product_class_id, sum(store_cost * units_sold)
from products p join sales 
on p.product_id = s.product_id
group by p.product_class_id
order by sum(store_cost * units_sold) desc
limit 3