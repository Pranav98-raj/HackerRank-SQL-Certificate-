select A.R , A.D , B.D , C.D from ( select month (record_date) as R, max(data_value) as D
        from temperature_records where data_type="max" group by month (record_date)) A 
            inner join (select month(record_date) as R , min(data_value) as D 
        from temperature_records where data_type="min" group by month (record_date)) B on A.r=B.r 
            inner join (select month (record_date) as R , round(avg(data_value),0) as D 
            from temperature_records where data_type="avg" group by month (record_date)) C on a.r=C.r;