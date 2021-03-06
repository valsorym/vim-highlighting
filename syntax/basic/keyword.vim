"this

"JavaScript Prototype
syntax keyword typescriptPrototype             prototype
  \ nextgroup=typescriptDotNotation

syntax keyword typescriptCastKeyword           as
  \ nextgroup=@typescriptType
  \ skipwhite

"Program Keywords
syntax keyword typescriptIdentifier            arguments this
  \ nextgroup=typescriptDotNotation

syntax keyword typescriptVariable              let var const
  \ nextgroup=typescriptVariableDeclaration
  \ skipwhite skipempty skipnl

syntax keyword typescriptEnumKeyword const
  \ nextgroup=typescriptEnum,typescriptVariableDeclaration
  \ skipwhite

syntax region typescriptEnum matchgroup=typescriptEnumKeyword start=/enum / end=/\ze{/
  \ nextgroup=typescriptBlock
  \ skipwhite

syntax region typescriptEnum matchgroup=typescriptEnumKeyword start=/namespace / end=/\ze{/
  \ nextgroup=typescriptBlock
  \ skipwhite

syntax match typescriptVariableDeclaration /[A-Za-z_$]\k*/
  \ nextgroup=typescriptTypeAnnotation
  \ contained skipwhite skipempty skipnl

syntax keyword typescriptOperator              delete new instanceof typeof void in
  \ nextgroup=@typescriptValue,@typescriptTypes
  \ skipwhite skipempty
syntax keyword typescriptForOperator           contained in of
syntax keyword typescriptBoolean               true false nextgroup=@typescriptSymbols skipwhite skipempty
syntax keyword typescriptNull                  null undefined nextgroup=@typescriptSymbols skipwhite skipempty
syntax keyword typescriptMessage               alert confirm prompt status
  \ nextgroup=typescriptDotNotation,typescriptArgumentList
syntax keyword typescriptGlobal                self top parent
  \ nextgroup=typescriptDotNotation

"Statement Keywords
syntax keyword typescriptConditional           if else switch
  \ nextgroup=typescriptConditionalParen
  \ skipwhite skipempty skipnl
syntax keyword typescriptConditionalElse       else
syntax keyword typescriptRepeat                do while for nextgroup=typescriptLoopParen skipwhite skipempty
syntax keyword typescriptRepeat                for nextgroup=typescriptLoopParen,typescriptAsyncFor skipwhite skipempty
syntax keyword typescriptBranch                break continue
syntax keyword typescriptCase                  case nextgroup=@typescriptTypes skipwhite
syntax keyword typescriptDefault               default nextgroup=@typescriptExpression,typescriptClassKeyword skipwhite oneline
syntax keyword typescriptStatementKeyword      with yield
syntax keyword typescriptStatementKeyword      return nextgroup=@typescriptValue skipwhite contained containedin=typescriptBlock,typescriptMethodBlock

syntax keyword typescriptTry                   try
syntax keyword typescriptExceptions            catch throw finally
syntax keyword typescriptDebugger              debugger

syntax keyword typescriptAsyncFor              await nextgroup=typescriptLoopParen skipwhite skipempty contained
