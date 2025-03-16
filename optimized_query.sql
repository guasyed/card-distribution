-- Add fulltext index (one-time setup)
-- ALTER TABLE Jobs ADD FULLTEXT(name, description, detail, business_skill, knowledge, location, activity, salary_statistic_group, salary_range_remarks, restriction, remarks);

SELECT 
  Jobs.id AS `Jobs id`, Jobs.name AS `Jobs name`, Jobs.description, Jobs.detail, Jobs.location,
  JobCategories.name AS `JobCategories name`, JobTypes.name AS `JobTypes name`
FROM (
  SELECT id, name, description, detail, business_skill, knowledge, location, activity, salary_statistic_group, salary_range_remarks, restriction, remarks, job_category_id, job_type_id
  FROM Jobs
  WHERE publish_status = 1 AND deleted IS NULL
  AND MATCH(name, description, detail, business_skill, knowledge, location, activity, salary_statistic_group, salary_range_remarks, restriction, remarks)
      AGAINST('キャビンアテンダント' IN NATURAL LANGUAGE MODE)
  ORDER BY sort_order DESC, id DESC
  LIMIT 50 OFFSET 0
) AS Jobs
INNER JOIN JobCategories ON JobCategories.id = Jobs.job_category_id AND JobCategories.deleted IS NULL
INNER JOIN JobTypes ON JobTypes.id = Jobs.job_type_id AND JobTypes.deleted IS NULL;
