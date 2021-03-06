*Transducers-transforming
transformBinary: aReducingFunction
	
	| copyBlock |
	copyBlock := predicate.	"copy block reference to have less indirection in copying block"
	^copyBlock arity = 2
		ifTrue:
			[[:result :key :value | 
			(copyBlock value: key value: value)
				ifTrue: [result]
				ifFalse: [aReducingFunction value: result value: value]]]
		ifFalse:
			[[:result :value | 
			(copyBlock value: value)
				ifTrue: [result]
				ifFalse: [aReducingFunction value: result value: value]]]