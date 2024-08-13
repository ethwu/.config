highlight clear
let g:colors_name = 'fontaine'

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

" Syntax
hi link Character      Constant
hi link Number         Constant
hi link Boolean        Constant
hi link Float          Number
hi link Conditional    Statement
hi link Repeat         Statement
hi link Label          Statement
hi link Keyword        Statement
hi link Exception      Statement
hi link Include        PreProc
hi link Define         PreProc
hi link Macro          PreProc
hi link PreCondit      PreProc
hi link StorageClass   Type
hi link Structure      Type
hi link Typedef        Type
hi link Tag            Special
hi link SpecialChar    Special
hi link SpecialComment Special
hi link Debug          Special
hi link Ignore         Normal

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

" Treesitter standard groups
hi link @variable.builtin           Special
hi link @variable.parameter.builtin Special

hi link @constant         Constant
hi link @constant.builtin Special

hi link @module         Structure
hi link @module.builtin Special
hi link @label          Label

hi link @string             String
hi link @string.regexp      @string.special
hi link @string.escape      @string.special
hi link @string.special     SpecialChar
hi link @string.special.url Underlined

hi link @character         Character
hi link @character.special SpecialChar

hi link @boolean      Boolean
hi link @number       Number
hi link @number.float Float

hi link @type         Type
hi link @type.builtin Special

hi link @attribute         Macro
hi link @attribute.builtin Special
hi link @property          Identifier

hi link @function         Function
hi link @function.builtin Special

hi link @constructor Special
hi link @operator    Operator

hi link @keyword Keyword

hi link @punctuation         Delimiter " fallback for subgroups; never used itself
hi link @punctuation.special Special

hi link @comment Comment

hi link @comment.error   DiagnosticError
hi link @comment.warning DiagnosticWarn
hi link @comment.note    DiagnosticInfo
hi link @comment.todo    Todo

hi @markup.strong        gui=bold          cterm=bold
hi @markup.italic        gui=italic        cterm=italic
hi @markup.strikethrough gui=strikethrough cterm=strikethrough
hi @markup.underline     gui=underline     cterm=underline

hi link @markup         Special " fallback for subgroups; never used itself
hi link @markup.heading Title
hi link @markup.link    Underlined

hi link @diff.plus  Added
hi link @diff.minus Removed
hi link @diff.delta Changed

hi link @tag         Tag
hi link @tag.builtin Special

" LSP semantic tokens
hi link @lsp.type.class         @type
hi link @lsp.type.comment       @comment
hi link @lsp.type.decorator     @attribute
hi link @lsp.type.enum          @type
hi link @lsp.type.enumMember    @constant
hi link @lsp.type.event         @type
hi link @lsp.type.function      @function
hi link @lsp.type.interface     @type
hi link @lsp.type.keyword       @keyword
hi link @lsp.type.macro         @constant.macro
hi link @lsp.type.method        @function.method
hi link @lsp.type.modifier      @type.qualifier
hi link @lsp.type.namespace     @module
hi link @lsp.type.number        @number
hi link @lsp.type.operator      @operator
hi link @lsp.type.parameter     @variable.parameter
hi link @lsp.type.property      @property
hi link @lsp.type.regexp        @string.regexp
hi link @lsp.type.string        @string
hi link @lsp.type.struct        @type
hi link @lsp.type.type          @type
hi link @lsp.type.typeParameter @type.definition
hi link @lsp.type.variable      @variable

hi link @lsp.mod.deprecated DiagnosticDeprecated

hi Normal ctermfg=NONE ctermbg=NONE
if &background == 'light'
  " UI
  hi Added                  ctermfg=DarkGreen
  hi Changed                ctermfg=DarkCyan
  hi ColorColumn                                ctermbg=Gray
  hi Conceal                ctermfg=Gray
  hi CurSearch              ctermfg=White       ctermbg=DarkYellow  cterm=bold
  hi CursorColumn                               ctermbg=Gray
  hi CursorLine                                 ctermbg=Gray
  hi CursorLineNr           ctermfg=Black                           cterm=bold
  hi DiffAdd                ctermfg=Black       ctermbg=Green
  hi DiffChange             ctermfg=Black       ctermbg=Cyan
  hi DiffDelete             ctermfg=Black       ctermbg=Red
  hi DiffText               ctermfg=Black       ctermbg=Blue
  hi Directory              ctermfg=DarkBlue                        cterm=bold,italic
  hi ErrorMsg               ctermfg=DarkRed     ctermbg=NONE        cterm=italic
  hi FloatShadow                                ctermbg=0 blend=80
  hi FloatShadowThrough                         ctermbg=0 blend=100
  hi Folded                 ctermfg=DarkGray    ctermbg=Gray
  hi LineNr                 ctermfg=DarkGray
  hi MatchParen                                                     cterm=bold,underline,reverse
  hi ModeMsg                ctermfg=DarkBlue
  hi MoreMsg                ctermfg=DarkBlue
  hi NonText                ctermfg=DarkGray
  hi NormalFloat            ctermfg=Black       ctermbg=Blue
  hi Pmenu                  ctermfg=Black       ctermbg=Blue
  hi PmenuSel               ctermfg=Black       ctermbg=DarkBlue        cterm=bold blend=0
  hi PmenuThumb                                 ctermbg=DarkYellow
  hi Question               ctermfg=Black       ctermbg=Magenta cterm=italic
  hi QuickFixLine           ctermfg=DarkCyan
  hi RedrawDebugClear       ctermfg=0 ctermbg=11
  hi RedrawDebugComposed    ctermfg=0 ctermbg=10
  hi RedrawDebugRecompose   ctermfg=0 ctermbg=9
  hi Removed                ctermfg=DarkRed
  hi Search                 ctermfg=Black       ctermbg=Yellow
  hi SignColumn                                 ctermbg=NONE
  hi SpecialKey                                                     cterm=bold,reverse
  hi SpellBad             guisp=Red    gui=undercurl                 cterm=undercurl
  hi SpellCap             guisp=Yellow gui=undercurl                 cterm=undercurl
  hi SpellLocal           guisp=Green  gui=undercurl                 cterm=undercurl
  hi SpellRare            guisp=Cyan   gui=undercurl                 cterm=undercurl
  hi StatusLine           ctermfg=Black                             cterm=bold
  hi StatusLineNC         ctermfg=DarkGray                          cterm=bold
  hi Title                ctermfg=DarkYellow                        cterm=bold
  hi Visual                                     ctermbg=DarkMagenta
  hi WarningMsg           ctermfg=DarkYellow                        cterm=italic
  hi WinBar               ctermfg=Black                             cterm=bold
  hi WinBarNC             ctermfg=DarkGray                          cterm=bold

  " Syntax
  hi Constant   ctermfg=DarkBlue
  hi Operator   ctermfg=DarkGray
  hi PreProc    ctermfg=DarkRed     cterm=bold
  hi Type       ctermfg=DarkGreen   cterm=italic
  hi Delimiter  ctermfg=DarkGray

  hi Comment    ctermfg=DarkGray        cterm=italic
  hi String     ctermfg=DarkBlue
  hi Identifier ctermfg=DarkBlue
  hi Function   ctermfg=DarkMagenta     cterm=italic
  hi Statement  ctermfg=DarkYellow      cterm=bold
  hi Special    ctermfg=Black           cterm=bold
  hi Error      ctermfg=Black           ctermbg=Red
  hi Todo       ctermfg=Black           ctermbg=Yellow  cterm=bold

  " Diagnostic
  hi DiagnosticError          ctermfg=DarkRed
  hi DiagnosticWarn           ctermfg=DarkYellow
  hi DiagnosticInfo           ctermfg=DarkCyan
  hi DiagnosticHint           ctermfg=DarkBlue
  hi DiagnosticOk             ctermfg=DarkGreen
  hi DiagnosticUnderlineError ctermfg=DarkRed       cterm=underline
  hi DiagnosticUnderlineWarn  ctermfg=DarkYellow    cterm=underline
  hi DiagnosticUnderlineInfo  ctermfg=DarkCyan      cterm=underline
  hi DiagnosticUnderlineHint  ctermfg=DarkBlue      cterm=underline
  hi DiagnosticUnderlineOk    ctermfg=DarkGreen     cterm=underline
  hi DiagnosticDeprecated     ctermfg=DarkRed       cterm=strikethrough

  " Treesitter standard groups
  hi @variable ctermfg=DarkMagenta  cterm=bold
else
  " UI
  hi Added                  ctermfg=Green
  hi Changed                ctermfg=Cyan
  hi ColorColumn                                ctermbg=DarkGray
  hi Conceal                ctermfg=DarkGray
  hi CurSearch              ctermfg=Black       ctermbg=Yellow      cterm=bold
  hi CursorColumn                               ctermbg=DarkGray
  hi CursorLine                                 ctermbg=DarkGray
  hi CursorLineNr           ctermfg=White                           cterm=bold
  hi DiffAdd                ctermfg=White       ctermbg=DarkGreen
  hi DiffChange             ctermfg=White       ctermbg=DarkCyan
  hi DiffDelete             ctermfg=White       ctermbg=DarkRed
  hi DiffText               ctermfg=White       ctermbg=DarkBlue
  hi Directory              ctermfg=Blue                            cterm=bold,italic
  hi ErrorMsg               ctermfg=Red         ctermbg=NONE        cterm=italic
  hi FloatShadow                                ctermbg=0 blend=80
  hi FloatShadowThrough                         ctermbg=0 blend=100
  hi Folded                 ctermfg=Gray        ctermbg=DarkGray
  hi LineNr                 ctermfg=Gray
  hi MatchParen                                                     cterm=bold,underline,reverse
  hi ModeMsg                ctermfg=Blue
  hi MoreMsg                ctermfg=Blue
  hi NonText                ctermfg=Gray
  hi NormalFloat            ctermfg=White       ctermbg=DarkBlue
  hi Pmenu                  ctermfg=White       ctermbg=DarkBlue
  hi PmenuSel               ctermfg=White       ctermbg=Blue        cterm=bold blend=0
  hi PmenuThumb                                 ctermbg=Yellow
  hi Question               ctermfg=White       ctermbg=DarkMagenta cterm=italic
  hi QuickFixLine           ctermfg=Cyan
  hi RedrawDebugClear       ctermfg=0 ctermbg=11
  hi RedrawDebugComposed    ctermfg=0 ctermbg=10
  hi RedrawDebugRecompose   ctermfg=0 ctermbg=9
  hi Removed                ctermfg=Red
  hi Search                 ctermfg=White       ctermbg=DarkYellow
  hi SignColumn                                 ctermbg=NONE
  hi SpecialKey                                                     cterm=bold,reverse
  hi SpellBad             guisp=Red    gui=undercurl                 cterm=undercurl
  hi SpellCap             guisp=Yellow gui=undercurl                 cterm=undercurl
  hi SpellLocal           guisp=Green  gui=undercurl                 cterm=undercurl
  hi SpellRare            guisp=Cyan   gui=undercurl                 cterm=undercurl
  hi StatusLine           ctermfg=White                             cterm=bold
  hi StatusLineNC         ctermfg=Gray                              cterm=bold
  hi Title                ctermfg=Yellow                            cterm=bold
  hi Visual                                     ctermbg=DarkMagenta
  hi WarningMsg           ctermfg=Yellow                            cterm=italic
  hi WinBar               ctermfg=White                             cterm=bold
  hi WinBarNC             ctermfg=Gray                              cterm=bold

  " Syntax
  hi Constant   ctermfg=Blue
  hi Operator   ctermfg=Gray
  hi PreProc    ctermfg=Red     cterm=bold
  hi Type       ctermfg=Green   cterm=italic
  hi Delimiter  ctermfg=Gray

  hi Comment    ctermfg=Gray        cterm=italic
  hi String     ctermfg=Blue
  hi Identifier ctermfg=Blue
  hi Function   ctermfg=Magenta     cterm=italic
  hi Statement  ctermfg=Yellow      cterm=bold
  hi Special    ctermfg=White       cterm=bold
  hi Error      ctermfg=White       ctermbg=DarkRed
  hi Todo       ctermfg=White       ctermbg=DarkYellow  cterm=bold

  " Diagnostic
  hi DiagnosticError          ctermfg=Red
  hi DiagnosticWarn           ctermfg=Yellow
  hi DiagnosticInfo           ctermfg=Cyan
  hi DiagnosticHint           ctermfg=Blue
  hi DiagnosticOk             ctermfg=Green
  hi DiagnosticUnderlineError ctermfg=Red       cterm=underline
  hi DiagnosticUnderlineWarn  ctermfg=Yellow    cterm=underline
  hi DiagnosticUnderlineInfo  ctermfg=Cyan      cterm=underline
  hi DiagnosticUnderlineHint  ctermfg=Blue      cterm=underline
  hi DiagnosticUnderlineOk    ctermfg=Green     cterm=underline
  hi DiagnosticDeprecated     ctermfg=Red       cterm=strikethrough

  " Treesitter standard groups
  hi @variable ctermfg=Magenta  cterm=bold
endif

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
