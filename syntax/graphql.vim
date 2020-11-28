" Copyright (c) 2016-2020 Jon Parise <jon@indelible.org>
"
" Language: GraphQL
" Maintainer: valsorym <valsorym.e@gmail.com>

if exists('b:current_syntax')
  finish
endif

syn case match

syn match   gqlComment      "#.*$" contains=@Spell
syn keyword gqlStruct       enum scalar type union input interface subscription implements query mutation fragment directive extend schema
syn keyword gqlBoolean      true false
syn keyword gqlNull         null
syn keyword gqlDirective    QUERY MUTATION SUBSCRIPTION FIELD FRAGMENT_DEFINITION FRAGMENT_SPREAD INLINE_FRAGMENT SCHEMA SCALAR OBJECT FIELD_DEFINITION ARGUMENT_DEFINITION INTERFACE UNION ENUM ENUM_VALUE INPUT_OBJECT INPUT_FIELD_DEFINITION
syn match   gqlNumber       "-\=\<\%(0\|[1-9]\d*\)\%(\.\d\+\)\=\%([eE][-+]\=\d\+\)\=\>" display
syn region  gqlString       start=+"+  skip=+\\\\\|\\"+  end=+"\|$+
syn region  gqlString       start=+"""+ skip=+\\"""+ end=+"""+
syn keyword gqlMetaFields   __schema __type __typename
syn keyword gqlType         Int Float String Boolean ID

syn region  gqlFold         matchgroup=gqlBraces start="{" end="}" transparent fold contains=ALLBUT,gqlStructure
syn region  gqlList         matchgroup=gqlBraces start="\[" end="]" transparent contains=ALLBUT,gqlDirective,gqlStructure

hi def link gqlComment      Comment
hi def link gqlStruct       Keyword
hi def link gqlBoolean      Boolean
hi def link gqlDirective    Special
hi def link gqlNull         Keyword
hi def link gqlNumber       Number
hi def link gqlString       String
hi def link gqlMetaFields   Special
hi def link gqlType         Type

syn match gqlDirective      "\<@\h\w*\>"   display
syn match gqlVariable       "\<\$\h\w*\>"  display
syn match gqlName           "\<\h\w*\>"    display
syn match gqlType           "\<_*\u\w*\>"  display

syn match ghqlOperator      "=" display
syn match ghqlOperator      "!" display
syn match ghqlOperator      "|" display
syn match ghqlOperator      "&" display
syn match ghqlOperator      "\M..." display

hi def link gqlOperator     Operator
hi def link gqlBraces       Delimiter

let b:current_syntax = 'graphql'
