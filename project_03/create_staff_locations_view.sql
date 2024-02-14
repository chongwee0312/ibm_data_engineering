-- Create a staff location view
CREATE VIEW staff_locations_view AS (
	SELECT
		staff.staff_id,
		staff.first_name,
		staff.last_name,
		staff.location
	FROM 
		staff
	WHERE 
		staff.position NOT IN ('CEO', 'CFO')
);

SELECT * FROM staff_locations_view;
