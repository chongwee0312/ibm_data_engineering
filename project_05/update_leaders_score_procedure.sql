DELIMITER //

CREATE PROCEDURE UPDATE_LEADERS_SCORE(
	IN in_School_ID INTEGER,
    IN in_Leader_Score INTEGER
    )
BEGIN
	IF in_Leader_Score >=80 and in_Leader_Score <= 99 THEN
		UPDATE chicago_public_schools
		SET Leaders_Score = in_Leader_Score,
			Leaders_Icon = 'Very Strong'
		WHERE School_ID = in_School_ID;
	ELSEIF in_Leader_Score >=60 and in_Leader_Score <= 79 THEN
		UPDATE chicago_public_schools
		SET Leaders_Score = in_Leader_Score,
			Leaders_Icon = 'Strong'
		WHERE School_ID = in_School_ID;
	ELSEIF in_Leader_Score >=40 and in_Leader_Score <= 59 THEN
		UPDATE chicago_public_schools
		SET Leaders_Score = in_Leader_Score,
			Leaders_Icon = 'Average'
		WHERE School_ID = in_School_ID;
	ELSEIF in_Leader_Score >=20 and in_Leader_Score <= 39 THEN
		UPDATE chicago_public_schools
		SET Leaders_Score = in_Leader_Score,
			Leaders_Icon = 'Weak'
		WHERE School_ID = in_School_ID;
	ELSEIF in_Leader_Score >=0 and in_Leader_Score <= 19 THEN
		UPDATE chicago_public_schools
		SET Leaders_Score = in_Leader_Score,
			Leaders_Icon = 'Very Weak'
		WHERE School_ID = in_School_ID;
	ELSE
		ROLLBACK;
	END IF;
    
COMMIT;
END //
DELIMITER ;