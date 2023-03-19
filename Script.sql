use metal;

# Find sales order id, customer id, part id, ship id, invoice id and total amount with sales description whose letter or number start with “1%”.   
select s.so_id, so.customer_id, so.part_id, s.ship_id,i.invoice_id, so.so_description, i.total_amount
from arinvoice as i 
join shipment as s
USING(ship_id)
join salesorder as so
using(so_id)
where so.so_description like '1%';



#Find PO ID, Part ID and Quantity using purchase order and describe the duration of quantity that should be completed in one to five days using case when
select  PO_id, Part_ID, quantity,
case
    when  quantity < 10 then 'One Day '
    when  quantity >=10 and quantity <20 then'Two Days '
    when  quantity >=20 and quantity <30 then'Three Days'
    when quantity >=30 and quantity <40 then'Four Days'
    when quantity >=40 and quantity <=50 then'Five Days'
end as Duration
FROM purchaseorder
order by quantity asc;


#Find supplier id, supplier name, payment type and tax whose purchase order rate is less than equal to 500

SELECT s.supplier_id,s.supplier_name, s.payment_type, s.Tax
FROM suppliers  as s
WHERE supplier_id = any
  (SELECT supplier_id
  FROM purchaseorder as p
  WHERE p.rate <= 500);

















#Question 1;
select * from salesorder;
select distinct(Customer_ID),Rate,Quantity,Amount from salesorder
group by customer_id
order by customer_id asc;
#Question 2;
select r.PO_id,r.rec_id,i.invoice_id, r.quantity, i.total_amount, i.invoicestatus
from receiptentry r
join apinvoice i
on r.rec_id=i.rec_id
having i.Total_amount < 10000;

#Present 1;
select s.so_id, so.customer_id, so.part_id, s.ship_id,i.invoice_id, so.so_description, i.total_amount
from arinvoice as i 
join shipment as s
USING(ship_id)
join salesorder as so
using(so_id)
where so.so_description like '1%';


#Question 4
select Job_ID, SO_ID,Job_Type,Inspection,Bin_No
from qualitycontrol where Job_Type Like 'F%'
limit 10;

select * from purchaseorder ;
#Question 5
select supplier_id from PURCHASEORDER
union
select supplier_id from suppliers
having count(supplier_id)
limit 10;

#Present 2;
select  PO_id, Part_ID, quantity,
case
    when  quantity < 10 then 'One Day '
    when  quantity >=10 and quantity <20 then'Two Days '
    when  quantity >=20 and quantity <30 then'Three Days'
    when quantity >=30 and quantity <40 then'Four Days'
    when quantity >=40 and quantity <=50 then'Five Days'
end as Duration
FROM purchaseorder
order by quantity asc;

#Question 7 
SELECT DISTINCT Warehouse_Name
FROM Inventory
WHERE Bin_No IN
  (SELECT Bin_No
   FROM qualitycontrol
   WHERE inspection = 'Yes')
ORDER BY Warehouse_Name;

select * from receiptentry;
select * from purchaseorder;
select * from suppliers;

#Question8
SELECT DISTINCT s.supplier_id,s.supplier_name, s.payment_type, s.Tax, r.PO_ID, r.total_amount
  FROM suppliers AS s
    LEFT JOIN purchaseorder AS p
      ON (s.Supplier_ID = p.Supplier_ID
        AND p.Supplier_ID IN (
          SELECT r.rec_id
          FROM receiptentry AS r
        ) )
where payment_type='Cash'
ORDER BY s.supplier_id;


SELECT s.supplier_id,s.supplier_name, s.payment_type, s.Tax
FROM suppliers  as s
WHERE supplier_id = any
  (SELECT supplier_id
  FROM purchaseorder as p
  WHERE p.rate <= 500);
  
  use metal;
  
  select tax from customers;






