CREATE TABLE item_bought (
    buyer TEXT NOT NULL,
    item TEXT NOT NULL
);

INSERT INTO item_bought (buyer, item) VALUES
('A', 'Asus'),
('B', 'Lenovo'),
('C', 'Lenovo'),
('D', 'Acer'),
('E', 'Acer'),
('F', 'Acer');

SELECT ib1.item
FROM (
    -- Mencari nama item paling laku
    SELECT item
    FROM item_bought
    GROUP BY item
    ORDER BY COUNT(*) DESC
    LIMIT 1
) AS top_item
CROSS JOIN (
    -- Mencari nama item paling tidak laku
    SELECT item
    FROM item_bought
    GROUP BY item
    ORDER BY COUNT(*) ASC
    LIMIT 1
) AS bottom_item
JOIN item_bought AS ib1 ON ib1.item <> top_item.item AND ib1.item <> bottom_item.item
GROUP BY ib1.item;