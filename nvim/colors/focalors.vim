highlight clear
let g:colors_name = 'focalors'

hi Cursor            guifg=bg      guibg=fg
hi CursorLineNr      gui=bold      cterm=bold
hi RedrawDebugNormal gui=reverse   cterm=reverse
hi TabLineSel        gui=bold      cterm=bold
hi TermCursor        gui=reverse   cterm=reverse
hi Underlined        gui=underline cterm=underline
hi lCursor           guifg=bg      guibg=fg

" UI
hi link CursorIM         Cursor
hi link CursorLineFold   FoldColumn
hi link CursorLineSign   SignColumn
hi link EndOfBuffer      NonText
hi link FloatBorder      NormalFloat
hi link FloatFooter      FloatTitle
hi link FloatTitle       Title
hi link FoldColumn       SignColumn
hi link IncSearch        CurSearch
hi link LineNrAbove      LineNr
hi link LineNrBelow      LineNr
hi link MsgSeparator     StatusLine
hi link MsgArea          NONE
hi link NormalNC         NONE
hi link PmenuExtra       Pmenu
hi link PmenuExtraSel    PmenuSel
hi link PmenuKind        Pmenu
hi link PmenuKindSel     PmenuSel
hi link PmenuMatch       Pmenu
hi link PmenuMatchSel    PmenuSel
hi link PmenuSbar        Pmenu
hi link Substitute       Search
hi link StatusLineTerm   StatusLine
hi link StatusLineTermNC StatusLineNC
hi link TabLine          StatusLineNC
hi link TabLineFill      TabLine
hi link TermCursorNC     NONE
hi link VertSplit        WinSeparator
hi link VisualNOS        Visual
hi link Whitespace       NonText
hi link WildMenu         PmenuSel
hi link WinSeparator     Normal

""" UI """
hi ColorColumn ctermbg=DarkGray cterm=NONE
hi Conceal ctermfg=DarkGray
hi CurSearch ctermfg=White ctermbg=DarkYellow
hi CursorColumn ctermbg=DarkGray
hi CursorLine   ctermbg=DarkGray
hi CursorLineNr cterm=bold,italic
hi Directory ctermfg=DarkBlue cterm=bold,italic
hi ErrorMsg ctermfg=DarkRed ctermbg=NONE cterm=italic
hi LineNr ctermfg=Gray
hi MatchParen cterm=bold,reverse
hi ModeMsg ctermfg=DarkBlue
hi MoreMsg ctermfg=DarkBlue
hi NonText ctermfg=DarkGray
hi NormalFloat ctermfg=NONE ctermbg=NONE
hi Pmenu ctermfg=White ctermbg=DarkBlue cterm=NONE
hi PmenuSel ctermfg=White ctermbg=Blue cterm=bold
hi PmenuThumb ctermbg=Magenta
hi Question ctermfg=Green cterm=bold,italic
hi QuickFixLine ctermfg=DarkCyan
hi RedrawDebugClear ctermfg=0 ctermbg=11
hi RedrawDebugComposed ctermfg=0 ctermbg=10
hi RedrawDebugRecompose ctermfg=0 ctermbg=9
hi Search ctermfg=Black ctermbg=Yellow
hi SignColumn ctermbg=NONE
hi SpecialKey cterm=bold,reverse
hi SpellBad cterm=undercurl guisp=#dd604d
hi SpellCap cterm=undercurl guisp=#f2b843
hi SpellLocal cterm=undercurl guisp=#9aa762
hi SpellRare cterm=undercurl guisp=#ef9443
hi StatusLine ctermfg=Black cterm=bold
hi StatusLineNC ctermfg=LightGray cterm=bold
hi Visual ctermbg=Magenta
hi WarningMsg ctermfg=DarkYellow cterm=italic
hi WinBar ctermfg=Black cterm=bold
hi WinBarNC ctermfg=LightGray cterm=bold

""" Syntax """

" Basic Groups (Based on Catppuccin)

" Normal
hi Normal ctermfg=NONE ctermbg=NONE cterm=NONE
hi Ignore ctermfg=DarkGray
" Special
hi Special ctermfg=DarkMagenta
hi link Debug Special
hi link SpecialComment Special
hi Tag ctermfg=DarkMagenta cterm=bold,italic,reverse
hi link @tag Tag
" Comments: dark green italic
hi Comment ctermfg=DarkGreen cterm=italic
hi link SpecialComment Special
hi Todo ctermfg=DarkMagenta cterm=bold
hi link @comment Comment
hi link @lsp.type.comment @comment
" Modules: dark yellow bold italic
hi @module ctermfg=DarkYellow cterm=bold,italic
hi link @lsp.type.namespace @module
" Keywords: dark blue
hi Keyword ctermfg=Magenta cterm=NONE
hi link Conditional Keyword
hi link Exception Keyword
hi link Label Keyword
hi link Repeat Keyword
hi link Statement Keyword
hi link @label Label
" Operators: dark blue
hi Operator ctermfg=DarkBlue
hi link @operator Operator
hi link @lsp.type.operator Operator
" Delimiters: dark gray
hi Delimiter ctermfg=DarkGray
hi link @punctuation Delimiter
" Macros: dark magenta reverse
hi Macro ctermfg=DarkMagenta cterm=reverse
hi link PreProc Macro
hi link Define PreProc
hi link Include PreProc
hi link PreCondit PreProc
hi link @attribute Macro
hi link @constant.macro Macro
hi link @lsp.type.decorator @attribute
hi link @lsp.type.macro @constant.macro
" Strings: dark green
hi String ctermfg=DarkGreen
hi link SpecialChar Special
hi link @string String
hi link @character.special SpecialChar
hi link @string.escape SpecialChar
hi link @string.special SpecialChar
hi link @lsp.type.string @string
" Regular expressions: dark magenta
hi @string.regexp ctermfg=DarkMagenta
hi link @lsp.type.regexp @string.regexp
" Constants: dark cyan
hi Constant ctermfg=DarkCyan
hi link Boolean Constant
hi link Character Constant
hi link Number Constant
hi link Float Number
hi link @constant Constant
hi link @boolean Boolean
hi link @character Character
hi link @number Number
hi link @number.float Float
hi link @lsp.type.number @number
hi @lsp.mod.readonly ctermfg=Cyan
hi link @lsp.typemod.readonly @lsp.mod.readonly
" Enums: dark cyan
hi link @lsp.type.enum @type
hi @lsp.type.enumMember ctermfg=DarkCyan
" Types: dark yellow
hi Type ctermfg=DarkYellow
hi link StorageClass Type
hi link Structure Type
hi link Typedef Type
hi link @type Type
hi link @type.definition Type
hi link @type.qualifier StorageClass
hi link @lsp.type.class @type
hi link @lsp.type.event @type
hi link @lsp.type.modifier @type.qualifier
hi link @lsp.type.struct Structure
hi link @lsp.type.type @type
hi link @lsp.type.typeParameter @type.definition
hi link @lsp.type.variable @variable
" Functions and methods: dark blue
hi Function ctermfg=DarkBlue
hi link @function Function
hi link @lsp.type.function @function
" Parameters: light red
hi @variable.parameter ctermfg=Red
hi link @lsp.type.parameter @variable.parameter
" Variables: dark red
hi Identifier ctermfg=DarkRed
hi link @variable Identifier
" Typographic
hi Title ctermfg=DarkMagenta cterm=bold
hi Bold cterm=bold
hi Italic cterm=italic
hi Underlined cterm=underline
hi link @markup.strong Bold
hi link @markup.italic Italic
hi @markup.strikethrough cterm=strikethrough
hi link @markup.underline Underlined

hi link @markup Special
hi link @markup.heading Title
hi link @markup.link Underlined
hi link @string.special.url @markup.link

" Diffs
hi Added ctermfg=DarkGreen
hi Changed ctermfg=DarkCyan
hi Removed ctermfg=DarkRed
hi DiffAdd ctermfg=DarkGreen cterm=reverse
hi DiffChange ctermfg=DarkCyan cterm=reverse
hi DiffDelete ctermfg=DarkRed cterm=reverse
hi DiffText ctermfg=DarkBlue cterm=reverse
hi link diffAdded DiffAdd
hi link diffChanged DiffChange
hi link diffDeleted DiffDelete
hi link @diff.plus Added
hi link @diff.delta Changed
hi link @diff.minus Removed

""" Syntax Modifiers """

" Builtins: bold
hi @attribute.builtin cterm=bold
hi @constant.builtin cterm=bold
hi @module.builtin cterm=bold
hi @tag.builtin cterm=bold
hi @type.builtin ctermfg=DarkYellow cterm=bold
hi @variable.builtin cterm=bold
hi @variable.parameter.builtin cterm=bold

hi @lsp.mod.defaultLibrary cterm=bold

" Properties: dark red italic
hi @property cterm=italic
hi link @lsp.type.property @property
hi link @lsp.mod.static @property
hi link @lsp.mod.classScope @property
hi link @lsp.typemod.property.classScope @property
" Methods: dark blue italic
hi @function.method cterm=italic
hi link @lsp.type.method @function.method
hi link @lsp.typemod.method.classScope @function.method

" Globals: underline
hi @lsp.mod.globalScope cterm=underline
hi @lsp.typemod.globalScope cterm=underline
hi link @lsp.typemod.variable.globalScope @lsp.mod.globalScope

hi link @comment.error   DiagnosticError
hi link @comment.warning DiagnosticWarn
hi link @comment.note    DiagnosticInfo
hi link @comment.todo    Todo

hi link @lsp.mod.deprecated DiagnosticDeprecated

" Built-in LSP
hi link LspCodeLens                 NonText
hi link LspCodeLensSeparator        LspCodeLens
hi link LspInlayHint                NonText
hi link LspReferenceRead            LspReferenceText
hi link LspReferenceText            Visual
hi link LspReferenceWrite           LspReferenceText
hi link LspSignatureActiveParameter Visual
hi link SnippetTabstop              Visual

" Diagnostic
hi DiagnosticUnderlineError cterm=underdouble
hi link DiagnosticFloatingError    DiagnosticError
hi link DiagnosticFloatingWarn     DiagnosticWarn
hi link DiagnosticFloatingInfo     DiagnosticInfo
hi link DiagnosticFloatingHint     DiagnosticHint
hi link DiagnosticFloatingOk       DiagnosticOk
hi link DiagnosticVirtualTextError DiagnosticError
hi link DiagnosticVirtualTextWarn  DiagnosticWarn
hi link DiagnosticVirtualTextInfo  DiagnosticInfo
hi link DiagnosticVirtualTextHint  DiagnosticHint
hi link DiagnosticVirtualTextOk    DiagnosticOk
hi link DiagnosticSignError        DiagnosticError
hi link DiagnosticSignWarn         DiagnosticWarn
hi link DiagnosticSignInfo         DiagnosticInfo
hi link DiagnosticSignHint         DiagnosticHint
hi link DiagnosticSignOk           DiagnosticOk
hi link DiagnosticUnnecessary      Comment

" NvimInternalError should appear only when highlighter has a bug.
hi NvimInternalError ctermfg=Red ctermbg=Red

" Highlight groups (links) used by parser:

hi link NvimAssignment Operator
hi link NvimPlainAssignment NvimAssignment
hi link NvimAugmentedAssignment NvimAssignment
hi link NvimAssignmentWithAddition NvimAugmentedAssignment
hi link NvimAssignmentWithSubtraction NvimAugmentedAssignment
hi link NvimAssignmentWithConcatenation NvimAugmentedAssignment

hi link NvimOperator Operator

hi link NvimUnaryOperator NvimOperator
hi link NvimUnaryPlus NvimUnaryOperator
hi link NvimUnaryMinus NvimUnaryOperator
hi link NvimNot NvimUnaryOperator

hi link NvimBinaryOperator NvimOperator
hi link NvimComparison NvimBinaryOperator
hi link NvimComparisonModifier NvimComparison
hi link NvimBinaryPlus NvimBinaryOperator
hi link NvimBinaryMinus NvimBinaryOperator
hi link NvimConcat NvimBinaryOperator
hi link NvimConcatOrSubscript NvimConcat
hi link NvimOr NvimBinaryOperator
hi link NvimAnd NvimBinaryOperator
hi link NvimMultiplication NvimBinaryOperator
hi link NvimDivision NvimBinaryOperator
hi link NvimMod NvimBinaryOperator

hi link NvimTernary NvimOperator
hi link NvimTernaryColon NvimTernary

hi link NvimParenthesis Delimiter
hi link NvimLambda NvimParenthesis
hi link NvimNestingParenthesis NvimParenthesis
hi link NvimCallingParenthesis NvimParenthesis

hi link NvimSubscript NvimParenthesis
hi link NvimSubscriptBracket NvimSubscript
hi link NvimSubscriptColon NvimSubscript
hi link NvimCurly NvimSubscript

hi link NvimContainer NvimParenthesis
hi link NvimDict NvimContainer
hi link NvimList NvimContainer

hi link NvimIdentifier Identifier
hi link NvimIdentifierScope NvimIdentifier
hi link NvimIdentifierScopeDelimiter NvimIdentifier
hi link NvimIdentifierName NvimIdentifier
hi link NvimIdentifierKey NvimIdentifier

hi link NvimColon Delimiter
hi link NvimComma Delimiter
hi link NvimArrow Delimiter

hi link NvimRegister SpecialChar
hi link NvimNumber Number
hi link NvimFloat NvimNumber
hi link NvimNumberPrefix Type

hi link NvimOptionSigil Type
hi link NvimOptionName NvimIdentifier
hi link NvimOptionScope NvimIdentifierScope
hi link NvimOptionScopeDelimiter NvimIdentifierScopeDelimiter

hi link NvimEnvironmentSigil NvimOptionSigil
hi link NvimEnvironmentName NvimIdentifier

hi link NvimString String
hi link NvimStringBody NvimString
hi link NvimStringQuote NvimString
hi link NvimStringSpecial SpecialChar

hi link NvimSingleQuote NvimStringQuote
hi link NvimSingleQuotedBody NvimStringBody
hi link NvimSingleQuotedQuote NvimStringSpecial

hi link NvimDoubleQuote NvimStringQuote
hi link NvimDoubleQuotedBody NvimStringBody
hi link NvimDoubleQuotedEscape NvimStringSpecial

hi link NvimFigureBrace NvimInternalError
hi link NvimSingleQuotedUnknownEscape NvimInternalError

hi link NvimSpacing Normal

" NvimInvalid groups:

hi link NvimInvalidSingleQuotedUnknownEscape NvimInternalError

hi link NvimInvalid Error

hi link NvimInvalidAssignment NvimInvalid
hi link NvimInvalidPlainAssignment NvimInvalidAssignment
hi link NvimInvalidAugmentedAssignment NvimInvalidAssignment
hi link NvimInvalidAssignmentWithAddition NvimInvalidAugmentedAssignment
hi link NvimInvalidAssignmentWithSubtraction NvimInvalidAugmentedAssignment
hi link NvimInvalidAssignmentWithConcatenation NvimInvalidAugmentedAssignment

hi link NvimInvalidOperator NvimInvalid

hi link NvimInvalidUnaryOperator NvimInvalidOperator
hi link NvimInvalidUnaryPlus NvimInvalidUnaryOperator
hi link NvimInvalidUnaryMinus NvimInvalidUnaryOperator
hi link NvimInvalidNot NvimInvalidUnaryOperator

hi link NvimInvalidBinaryOperator NvimInvalidOperator
hi link NvimInvalidComparison NvimInvalidBinaryOperator
hi link NvimInvalidComparisonModifier NvimInvalidComparison
hi link NvimInvalidBinaryPlus NvimInvalidBinaryOperator
hi link NvimInvalidBinaryMinus NvimInvalidBinaryOperator
hi link NvimInvalidConcat NvimInvalidBinaryOperator
hi link NvimInvalidConcatOrSubscript NvimInvalidConcat
hi link NvimInvalidOr NvimInvalidBinaryOperator
hi link NvimInvalidAnd NvimInvalidBinaryOperator
hi link NvimInvalidMultiplication NvimInvalidBinaryOperator
hi link NvimInvalidDivision NvimInvalidBinaryOperator
hi link NvimInvalidMod NvimInvalidBinaryOperator

hi link NvimInvalidTernary NvimInvalidOperator
hi link NvimInvalidTernaryColon NvimInvalidTernary

hi link NvimInvalidDelimiter NvimInvalid

hi link NvimInvalidParenthesis NvimInvalidDelimiter
hi link NvimInvalidLambda NvimInvalidParenthesis
hi link NvimInvalidNestingParenthesis NvimInvalidParenthesis
hi link NvimInvalidCallingParenthesis NvimInvalidParenthesis

hi link NvimInvalidSubscript NvimInvalidParenthesis
hi link NvimInvalidSubscriptBracket NvimInvalidSubscript
hi link NvimInvalidSubscriptColon NvimInvalidSubscript
hi link NvimInvalidCurly NvimInvalidSubscript

hi link NvimInvalidContainer NvimInvalidParenthesis
hi link NvimInvalidDict NvimInvalidContainer
hi link NvimInvalidList NvimInvalidContainer

hi link NvimInvalidValue NvimInvalid

hi link NvimInvalidIdentifier NvimInvalidValue
hi link NvimInvalidIdentifierScope NvimInvalidIdentifier
hi link NvimInvalidIdentifierScopeDelimiter NvimInvalidIdentifier
hi link NvimInvalidIdentifierName NvimInvalidIdentifier
hi link NvimInvalidIdentifierKey NvimInvalidIdentifier

hi link NvimInvalidColon NvimInvalidDelimiter
hi link NvimInvalidComma NvimInvalidDelimiter
hi link NvimInvalidArrow NvimInvalidDelimiter

hi link NvimInvalidRegister NvimInvalidValue
hi link NvimInvalidNumber NvimInvalidValue
hi link NvimInvalidFloat NvimInvalidNumber
hi link NvimInvalidNumberPrefix NvimInvalidNumber

hi link NvimInvalidOptionSigil NvimInvalidIdentifier
hi link NvimInvalidOptionName NvimInvalidIdentifier
hi link NvimInvalidOptionScope NvimInvalidIdentifierScope
hi link NvimInvalidOptionScopeDelimiter NvimInvalidIdentifierScopeDelimiter

hi link NvimInvalidEnvironmentSigil NvimInvalidOptionSigil
hi link NvimInvalidEnvironmentName NvimInvalidIdentifier

" Invalid string bodies and specials are still highlighted as valid ones to
" minimize the red area.
hi link NvimInvalidString NvimInvalidValue
hi link NvimInvalidStringBody NvimStringBody
hi link NvimInvalidStringQuote NvimInvalidString
hi link NvimInvalidStringSpecial NvimStringSpecial

hi link NvimInvalidSingleQuote NvimInvalidStringQuote
hi link NvimInvalidSingleQuotedBody NvimInvalidStringBody
hi link NvimInvalidSingleQuotedQuote NvimInvalidStringSpecial

hi link NvimInvalidDoubleQuote NvimInvalidStringQuote
hi link NvimInvalidDoubleQuotedBody NvimInvalidStringBody
hi link NvimInvalidDoubleQuotedEscape NvimInvalidStringSpecial
hi link NvimInvalidDoubleQuotedUnknownEscape NvimInvalidValue

hi link NvimInvalidFigureBrace NvimInvalidDelimiter

hi link NvimInvalidSpacing ErrorMsg

" Not actually invalid, but we show the user that they are doing something
" wrong.
hi link NvimDoubleQuotedUnknownEscape NvimInvalidValue
