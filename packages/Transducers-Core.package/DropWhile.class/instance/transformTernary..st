*Transducers-transforming
transformTernary: aReducingFunction
	
	| copyBlock drop |
	copyBlock := predicate.	"copy block reference to have less indirection in copying block"
	drop := true.
	^copyBlock arity = 2
		ifTrue:
			[[:result :key :value | 
			(drop and: [copyBlock value: key value: value])
				ifTrue: [result]
				ifFalse:
					[drop := false.
					aReducingFunction value: result value: key value: value]]]
		ifFalse:
			[[:result :key :value | 
			(drop and: [copyBlock value: value])
				ifTrue: [result]
				ifFalse:
					[drop := false.
					aReducingFunction value: result value: key value: value]]]