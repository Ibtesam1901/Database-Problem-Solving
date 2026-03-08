SELECT id, COUNT(*) AS num
FROM (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
) t
GROUP BY id
HAVING num = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM (
            SELECT requester_id AS id FROM RequestAccepted
            UNION ALL
            SELECT accepter_id AS id FROM RequestAccepted
        ) x
        GROUP BY id
    ) y
);
