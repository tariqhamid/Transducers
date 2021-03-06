*Transducers-transforming
transformBinary: aReducingFunction
	
	| copyBlock |
	copyBlock := function.	"copy block reference to have less indirection in copying block"
	^copyBlock arity = 2
		ifTrue:
			[[:result :key :value | 
			aReducingFunction
				value: result
				value: (copyBlock value: key value: value)]]
		ifFalse:
			[[:result :value | 
			aReducingFunction
				value: result
				value: (copyBlock value: value)]]