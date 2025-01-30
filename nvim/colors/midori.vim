highlight clear
let g:colors_name = 'midori'

" Color definitions.
let s:NO = 'NONE'
let s:bg = 0    " background
let s:lw = 8    " low contrast
let s:dm = 7    " dimmed text
let s:tx = 15   " text
let s:re = 1
let s:or = 6    " orange is cyan
let s:ye = 3
let s:gr = 2
let s:cy = 6
let s:bl = 4
let s:pu = 5
let s:ma = 5
" Bright colors.
let s:Re = s:re + 8
let s:Or = s:or + 8
let s:Ye = s:ye + 8
let s:Gr = s:gr + 8
let s:Cy = s:cy + 8
let s:Bl = s:bl + 8
let s:Pu = s:pu + 8
let s:Ma = s:ma + 8
" Font styles.
let s:bo = 'bold'
let s:it = 'italic'
let s:bi = 'bold,italic'
let s:ul = 'underline'
let s:rv = 'reverse'

" Values
let s:colors = {
            \ 'bg': { 'ctermfg': s:bg, },
            \ 'lw': { 'ctermfg': s:lw, },
            \ 'dm': { 'ctermfg': s:dm, },
            \ 'tx': { 'ctermfg': s:tx, },
            \ 'hidden':     { 'ctermfg': s:NO, },
            \ 'ignore':     { 'ctermfg': s:lw, },
            \ 'comment':    { 'ctermfg': s:dm, 'cterm': s:it, },
            \ 'normal':     { 'ctermfg': s:NO, 'ctermbg': s:NO, 'cterm': s:NO, },
            \ 'invalid':    { 'ctermfg': s:bg, 'ctermbg': s:re, },
            \ 'keyword':    { 'ctermfg': s:ye, 'cterm': s:bo, },
            \ 'keyword:branch': { 'ctermfg': s:gr, 'cterm': s:bo, }, 
            \ 'keyword:define': { 'ctermfg': s:cy, 'cterm': s:bo, },
            \ 'keyword:error':  { 'ctermfg': s:re, 'cterm': s:bo, },
            \ 'keyword:loop':   { 'ctermfg': s:gr, 'cterm': s:bo, },
            \ 'keyword:import': { 'ctermfg': s:ye, 'cterm': s:bo, },
            \ 'special':  { 'ctermfg': s:bg, 'ctermbg': s:tx, },
            \ 'value:variable':             { 'ctermfg': s:NO, },
            \ 'value:variable:parameter':   { 'ctermfg': s:re, },
            \ 'value:variable:property':    { 'ctermfg': s:cy, },
            \ 'value:function':             { 'ctermfg': s:NO, },
            \ 'value:function:method':      { 'ctermfg': s:cy, },
            \ 'value:type':                 { 'ctermfg': s:bl, },
            \ 'value:constant':         { 'ctermfg': s:ma, },
            \ 'value:macro':            { 'ctermfg': s:Ma, 'cterm': s:bo, },
            \ 'value:enumitem':         { 'ctermfg': s:ma, },
            \ 'value:literal':          { 'ctermfg': s:ma, },
            \ 'value:literal:int':      { 'ctermfg': s:ma, },
            \ 'value:literal:float':    { 'ctermfg': s:Ma, },
            \ 'value:literal:char':     { 'ctermfg': s:Gr, },
            \ 'value:literal:string':   { 'ctermfg': s:gr, },
            \ 'value:module':           { 'ctermfg': s:Cy, },
            \ 'escape':     { 'ctermfg': s:re, },
            \ '+builtin':   { 'cterm': s:bo, },
            \ '+global':    { 'cterm': s:ul, },
            \ '+property':  { 'cterm': s:NO, },
            \ 'operator':   { 'ctermfg': s:dm, },
            \ 'error': { 'ctermfg': s:re, },
            \ 'warning': { 'ctermfg': s:ye, },
            \ 'info': { 'ctermfg': s:bl, },
            \ 'msg:error':      { 'ctermfg': s:bg, 'ctermbg': s:re, },
            \ 'msg:warning':    { 'ctermfg': s:bg, 'ctermbg': s:ye, },
            \ 'msg:mode':       { 'ctermfg': s:bl, 'ctermbg': s:NO, },
            \ 'gutter:linenumbers': { 'ctermfg': s:dm },
            \ 'gutter:thisline': { 'ctermfg': s:tx, 'cterm': s:bo },
            \ 'linehighlight': { 'ctermbg': s:lw },
            \ 'ruler': { 'ctermbg': s:lw, 'cterm': s:NO },
            \ 'search:result': { 'ctermfg': s:bg, 'ctermbg': s:ye },
            \ 'search:result:highlighted': { 'ctermfg': s:bg, 'ctermbg': s:Ye },
            \ 'matchparen': { 'ctermbg': s:lw, },
            \ 'menu:preview':   { 'ctermfg': s:bg, 'ctermbg': s:tx, },
            \ 'menu:window':    { 'ctermfg': s:bg, 'ctermbg': s:bl, 'cterm': s:NO, },
            \ 'menu:selected':  { 'ctermfg': s:bg, 'ctermbg': s:Bl, 'cterm': s:NO, },
            \ 'menu:scroll':    { 'ctermfg': s:tx, 'ctermbg': s:dm, 'cterm': s:NO, },
            \ }

command! -nargs=+ Hi call Greenwash(<f-args>)
" Hi Comment comment
function! Greenwash(color, spec)
    if !has_key(s:colors, a:spec)
        echoerr 'No such color spec ' . a:spec
        return
    endif
    let cmd = 'hi ' . a:color
    for [key, val] in items(s:colors[a:spec])
        let cmd .= ' ' . key . '=' . val
    endfor
    exe cmd
endfunc

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
Hi ColorColumn ruler
Hi Conceal hidden
Hi CursorColumn linehighlight
Hi CursorLine linehighlight
Hi LineNr gutter:linenumbers
Hi CursorLineNr gutter:thisline
Hi Search search:result
Hi CurSearch search:result:highlighted

hi Directory ctermfg=DarkBlue cterm=bold,italic
Hi ErrorMsg msg:error
Hi MatchParen matchparen
Hi ModeMsg msg:mode
hi link MoreMsg ModeMsg
hi NormalFloat ctermfg=NONE ctermbg=NONE
Hi NormalFloat menu:preview
Hi Pmenu menu:window
Hi PmenuSel menu:selected
Hi PmenuThumb menu:scroll
hi Question ctermfg=Green cterm=bold,italic
hi QuickFixLine ctermfg=DarkCyan
hi RedrawDebugClear ctermfg=0 ctermbg=11
hi RedrawDebugComposed ctermfg=0 ctermbg=10
hi RedrawDebugRecompose ctermfg=0 ctermbg=9
hi SignColumn ctermbg=NONE
hi SpecialKey cterm=bold,reverse
hi SpellBad cterm=undercurl guisp=#dd604d
hi SpellCap cterm=undercurl guisp=#f2b843
hi SpellLocal cterm=undercurl guisp=#9aa762
hi SpellRare cterm=undercurl guisp=#ef9443
hi StatusLine ctermfg=Black cterm=bold
hi StatusLineNC ctermfg=8 cterm=bold
hi Visual ctermbg=Magenta
hi WarningMsg ctermfg=DarkYellow cterm=italic
Hi WarningMsg msg:warning
hi WinBar ctermfg=Black cterm=bold
hi WinBarNC ctermfg=8 cterm=bold

""" Syntax """

" Basic Groups (Based on Catppuccin)

" Normal
Hi Normal normal
Hi Ignore ignore
Hi NonText ignore
" Special
Hi Special special
hi link Debug Special
hi link SpecialComment Special
Hi Tag value:function
hi link @tag Tag
" Comments: light gray italic
Hi Comment comment
hi link SpecialComment Special
" hi Todo ctermfg=DarkMagenta cterm=bold
hi link @comment Comment
hi link @lsp.type.comment @comment
" Module
Hi @module value:module
hi link @lsp.type.namespace @module
" Keywords
Hi Keyword keyword
Hi Conditional keyword:branch
Hi Exception keyword:error
Hi Repeat keyword:loop
hi link Label Repeat
hi link Statement Keyword
hi link @label Label
" Operators
Hi Operator operator
hi link @operator Operator
hi link @lsp.type.operator Operator
" Punctuation and Delimiters
Hi Delimiter operator
hi link @punctuation Delimiter
" Macros
Hi Macro keyword
Hi PreProc keyword
Hi Define keyword:define
Hi Include keyword:import
Hi PreCondit keyword:branch
hi link PreCondit PreProc
hi link @attribute Macro
hi link @lsp.type.decorator @attribute
Hi @constant.macro value:macro
hi link @lsp.type.macro @constant.macro
" Strings: dark green
Hi String value:literal:string
Hi SpecialChar escape
hi link @string String
hi link @character.special SpecialChar
hi link @string.escape SpecialChar
hi link @string.special SpecialChar
hi link @lsp.type.string @string
" Regular expressions: dark magenta
hi @string.regexp ctermfg=DarkMagenta
hi link @lsp.type.regexp @string.regexp
" Constants
Hi Constant value:constant
hi link @constant Constant
hi link @lsp.typemod.variable.readonly Constant
" Literals
Hi Boolean value:literal
Hi Character value:literal:char
Hi Number value:literal:int
Hi Float value:literal:float
hi link @boolean Boolean
hi link @character Character
hi link @number Number
hi link @number.float Float
hi link @lsp.type.number @number
" Hi @lsp.mod.readonly +readonly
" hi link @lsp.typemod.readonly @lsp.mod.readonly
" Enums: dark cyan
Hi @lsp.type.enumMember value:enumitem
hi link @lsp.type.enum @lsp.type.enumMember
" Types
Hi Type value:type
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
Hi Function value:function
hi link @function Function
hi link @lsp.type.function @function
" Parameters
Hi @variable.parameter value:variable:parameter
hi link @lsp.type.parameter @variable.parameter
" Variables
Hi Identifier value:variable
Hi @variable value:variable
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
Hi @variable.builtin +builtin
hi link @attribute.builtin @variable.builtin
hi link @attribute.builtin @variable.builtin
hi link @constant.builtin @variable.builtin
hi link @module.builtin @variable.builtin
hi link @tag.builtin @variable.builtin
hi link @type.builtin @variable.builtin
hi link @variable.parameter.builtin @variable.builtin

hi link @lsp.mod.defaultLibrary @variable.builtin

" Properties
Hi @lsp.type.property value:variable:property
Hi @property +property
hi link @lsp.mod.static @property
hi link @lsp.mod.classScope @property
hi link @lsp.typemod.property.classScope @property
" Methods
Hi @function.method value:function:method
hi link @lsp.type.method @function.method
hi link @lsp.typemod.method.classScope @function.method

" Globals: underline
Hi @lsp.mod.globalScope +global
hi link @lsp.typemod.globalScope @lsp.mod.globalScope
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

" Rainbow delimiters
hi red ctermfg=Red
hi green ctermfg=Green
hi yellow ctermfg=Yellow
hi blue ctermfg=Blue
hi magenta ctermfg=Magenta
hi cyan ctermfg=Cyan
hi darkred ctermfg=DarkRed
hi darkgreen ctermfg=DarkGreen
hi darkyellow ctermfg=DarkYellow
hi darkblue ctermfg=DarkBlue
hi darkmagenta ctermfg=DarkMagenta
hi darkcyan ctermfg=DarkCyan

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

Hi NvimInvalid invalid

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

