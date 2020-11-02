--1
select distinct products.manufactured_date 
from products;

--2 sprawdzam ilosc unikatowych kodow jest mniejsza od 10 wiec kody powtarzaja sie
select count(distinct products.product_code) from products;

--3
select * from products where product_code in('PRD1', 'PRD9');

--4
select * from sales where sal_date between '01/08/2020' and '31/08/2020'
order by sal_value desc, sal_date;

--5

select * from products p
where not exists (select 1
                  from sales s
                  where p.id =s.sal_product_id);
                  
--6              
select * from products p
where 100 < any (select s.sal_value 
                    from sales s
                    where p.id =s.sal_product_id );      
              
--7
drop table if exists PRODUCTS_OLD_WAREHOUSE ;

create table PRODUCTS_OLD_WAREHOUSE (

    id                SERIAL,
    product_name      VARCHAR(100),
    product_code      VARCHAR(10),
    product_quantity  NUMERIC(10,2),
    manufactured_date DATE,
    added_by          TEXT DEFAULT 'admin',
    created_date      TIMESTAMP DEFAULT now()
                                    );   
                                
 insert into PRODUCTS_OLD_WASREHOUSE (product_name, product_code, product_quantity, manufactured_date)
 values ('Produkt100', 'PRD100', 25.25, '1/5/2000'),
        ('Produkt200', 'PRD200', 35.25, '1/6/2000'),
        ('Produkt300', 'PRD300', 45.25, '1/7/2000'),
        ('Produkt400', 'PRD400', 55.25, '1/8/2000');
 
--8
    (select p.product_name, p.product_code
    from products p limit 5)
    union
    select w.product_name, w.product_code
    from products_old_warehouse w;
    

(select p.product_name, p.product_code
    from products p limit 5)
    union all
    select w.product_name, w.product_code
    from products_old_warehouse w;
 -- w przybadku braku limitu oba zapytania zwracają taka sama ilosc rekordow, poniewaz
 -- nie wystepuja recordy które mialy by takie same wartosci w dwoch kolumnach
 
--9
select p.product_code
    from products p
    except
    select w.product_code
    from products_old_warehouse w;
--10
(select * from sales limit 10)
 order by sal_value desc;
 
 --11
 select sal_description, substring(sal_description, 1,3) as cut
 from sales;
 
 --12
  select * from sales where sal_description like 'c4c%';


    