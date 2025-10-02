WITH orders AS (
	SELECT 1 Id, 'A' category UNION ALL
    SELECT 2, NULL UNION ALL
    SELECT 3, '' UNION ALL
    SELECT 4, ' '
    )
    
SELECT
	*,
    length(category) as lenghtul,
    TRIM(category) as trimmedcategory,
    length(TRIM(category)) as finaldata,
    NULLIF(TRIM(Category), "") as nullifmethod,
    COALESCE(NULLIF(TRIM(Category), ""), "unknown") method3
    /*
    CASE WHEN TRIM(category) = "" THEN NULL
    ELSE category
    END AS Final
    */
FROM orders

-- did some tests checked to black space vs empty string then transformed blanck and empty strings to null
    