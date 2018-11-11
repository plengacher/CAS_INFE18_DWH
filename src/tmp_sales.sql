

-- once it's finished, this should be be used to generate the Sales table
SELECT ord_d.id AS id,
       ord_d.quantity AS quantity,
       ord_d.unit_price AS unit_price,
       d.DATE_SK AS date_id,
       cust.id AS customer_id,
       prod.id AS product_id,
       ord_d.unit_price*ord_d.quantity AS turnover,
       (ord_d.unit_price*ord_d.quantity) - (prod.standard_cost*ord_d.quantity) AS profit
       
FROM staging.order_details_clean AS ord_d,
     staging.date_dim AS d,
     staging.orders AS ord,
     staging.customers AS cust,
     staging.products_dim AS prod
     
WHERE ord_d.product_id = prod.id AND
      ord_d.order_id = ord.id AND
      ord.order_date = d.day_date AND
      ord.customer_id = cust.id;
      
