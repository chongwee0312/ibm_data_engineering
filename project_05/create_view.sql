/* Create a view that enables users to select just the school name and the icon fields 
from the CHICAGO_PUBLIC_SCHOOLS table.
*/
CREATE VIEW school_view AS
SELECT
	NAME_OF_SCHOOL AS School_Name,
    Safety_Icon AS Safety_Rating,
    Family_Involvement_Icon AS Family_Rating,
    Environment_Icon AS Environment_Rating,
    Instruction_Icon AS Instruction_Rating,
    Leaders_Icon AS Leaders_Rating,
    Teachers_Icon AS Teachers_Rating
FROM chicago_public_schools;

-- Returns all of the columns from the view.
SELECT * FROM school_view;

-- Returns the school name and leaders rating from the view.
SELECT School_Name, Leaders_Rating
FROM school_view;