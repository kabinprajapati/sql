-- 2020年1月1日から12月31日までの1年間について、商品カテゴリ別に売上額と購入者数を計算
-- Calculate the sales amount and the number of purchasers by product category for the year from January 1st to December 31st, 2020.
-- USE exam
SELECT 
    items_ver20211022.category_lv2,
    SUM(items_ver20211022.item_price) AS sum,
    COUNT(DISTINCT transactions_ver20211022.user_id) AS count
FROM
    transactions_ver20211022
        LEFT JOIN
    items_ver20211022 ON items_ver20211022.item_id = transactions_ver20211022.item_id
WHERE
    buy_date >= '2020-01-01'
        AND buy_date <= '2020-12-31'
GROUP BY items_ver20211022.category_lv2
ORDER BY sum DESC