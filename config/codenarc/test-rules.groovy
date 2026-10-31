ruleset {
  description 'A CodeNarc ruleset to improve test code quality'

  ruleset('rulesets/basic.xml')
  ruleset('rulesets/dry.xml') {
    DuplicateStringLiteral {
      ignoreStrings = 'true,false'
    }
    DuplicateNumberLiteral {
      ignoreNumbers = '0,1,-1'
    }
  }
  ruleset('rulesets/unused.xml')
}
