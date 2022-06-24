select 
a.orderid,
a.orderdate,
a.shipdate,
a.ordersellingprice,
a.ordercostprice,
a.ordersellingprice - a.ordercostprice as orderprofit,
c.customerid,
c.customername,
c.segment,
c.country,
p.productid,
p.category,
p.productname,
p.subcategory,
{{ markup('ordersellingprice','ordercostprice') }} as markup

from {{ ref('raw_order') }} as a
left join {{ref('raw_customer')}} as c
on a.customerid = c.customerid
left join {{ref('raw_products')}} as p
on a.productid = p.productid