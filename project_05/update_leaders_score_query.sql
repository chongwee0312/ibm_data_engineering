-- Use the procedure to update School_ID 610038 with score 50
SELECT School_ID, Leaders_Score, Leaders_Icon FROM chicago_public_schools;

CALL UPDATE_LEADERS_SCORE(610038, 50);

SELECT School_ID, Leaders_Score, Leaders_Icon FROM chicago_public_schools;

-- Use the procedure to update School_ID 610038 with score 38
CALL UPDATE_LEADERS_SCORE(610038, 38);

SELECT School_ID, Leaders_Score, Leaders_Icon FROM chicago_public_schools;

-- Use the procedure to update School_ID 610038 with score 101
-- Update will not be performed since the score 101 is invalid
CALL UPDATE_LEADERS_SCORE(610038, 38);

SELECT School_ID, Leaders_Score, Leaders_Icon FROM chicago_public_schools;