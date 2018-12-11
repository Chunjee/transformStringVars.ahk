transformStringVars(encodedString)
{ 
global	
; converts a variable to whatever its value is (Example: "this is a string with a %var% embedded")
; * %Var% expands to whatever value variable Var is, but Var must be a global or built-in variable.
; ------------------------
; Input variables
; 	encodedString -> A string, possibly with an encoded %var%/$var in it
; Output variables
; 	plaintextString -> A string with any %var%/$var replaced by those variables values.
	plaintextString := ""
	
	if (encodedString != "") {
		; Expand %var%
		if (RegExMatch(encodedString,"%\w+%"))
		{ 
			; variables need to be ** global ** to be DeRef'ed
			Transform, encodedString, DeRef, %encodedString% ; convert any variables to actual values
		}
		; copy the now-expanded string to the output string
		plaintextString := encodedString
	}
	return plaintextString
}
