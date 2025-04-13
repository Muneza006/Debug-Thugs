--1. Finding the Earliest Records
WITH earliest_projects AS (
    SELECT 
        project_id,
        project_name,
        category,
        start_date,
        ROW_NUMBER() OVER (PARTITION BY category ORDER BY start_date) AS start_order
    FROM engineering_projects
)
SELECT *
FROM earliest_projects
WHERE start_order <= 2;

-- 2. Aggregation with Window Functions
SELECT 
    project_id,
    project_name,
    category,
    budget,
    MAX(budget) OVER (PARTITION BY category) AS category_max_budget,
    MAX(budget) OVER () AS overall_max_budget
FROM engineering_projects;
/
    End loop
    End
commit;
