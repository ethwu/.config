" clone of the default neovim theme
" https://github.com/neovim/neovim/blob/ab561302a3b4dbb161aa6ef3ea39a6d1410a72fe/src/nvim/highlight_group.c
highlight clear
let g:colors_name = 'neovim'

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

if &background == 'light'
  hi Normal guifg=NvimDarkGrey2 guibg=NvimLightGrey2 ctermfg=NONE ctermbg=NONE

  " UI
  hi Added                guifg=NvimDarkGreen                                  ctermfg=2
  hi Changed              guifg=NvimDarkCyan                                   ctermfg=6
  hi ColorColumn                               guibg=NvimLightGrey4            cterm=reverse
  hi Conceal              guifg=NvimLightGrey4
  hi CurSearch            guifg=NvimLightGrey1 guibg=NvimDarkYellow            ctermfg=15 ctermbg=3
  hi CursorColumn                              guibg=NvimLightGrey3
  hi CursorLine                                guibg=NvimLightGrey3
  hi DiffAdd              guifg=NvimDarkGrey1  guibg=NvimLightGreen            ctermfg=15 ctermbg=2
  hi DiffChange           guifg=NvimDarkGrey1  guibg=NvimLightGrey4
  hi DiffDelete           guifg=NvimDarkRed                          gui=bold  ctermfg=1 cterm=bold
  hi DiffText             guifg=NvimDarkGrey1  guibg=NvimLightCyan             ctermfg=15 ctermbg=6
  hi Directory            guifg=NvimDarkCyan                                   ctermfg=6
  hi ErrorMsg             guifg=NvimDarkRed                                    ctermfg=1
  hi FloatShadow                               guibg=NvimLightGrey4            ctermbg=0 blend=80
  hi FloatShadowThrough                        guibg=NvimLightGrey4            ctermbg=0 blend=100
  hi Folded               guifg=NvimDarkGrey4  guibg=NvimLightGrey3
  hi LineNr               guifg=NvimLightGrey4
  hi MatchParen                                guibg=NvimLightGrey4  gui=bold  cterm=bold,underline
  hi ModeMsg              guifg=NvimDarkGreen                                  ctermfg=2
  hi MoreMsg              guifg=NvimDarkCyan                                   ctermfg=6
  hi NonText              guifg=NvimLightGrey4
  hi NormalFloat                               guibg=NvimLightGrey1
  hi Pmenu                                     guibg=NvimLightGrey3            cterm=reverse
  hi PmenuSel             guifg=NvimLightGrey3 guibg=NvimDarkGrey2             cterm=reverse,underline blend=0
  hi PmenuThumb                                guibg=NvimLightGrey4
  hi Question             guifg=NvimDarkCyan                                   ctermfg=6
  hi QuickFixLine         guifg=NvimDarkCyan                                   ctermfg=6
  hi RedrawDebugClear                          guibg=NvimLightYellow           ctermfg=15 ctermbg=3
  hi RedrawDebugComposed                       guibg=NvimLightGreen            ctermfg=15 ctermbg=2
  hi RedrawDebugRecompose                      guibg=NvimLightRed              ctermfg=15 ctermbg=1
  hi Removed              guifg=NvimDarkRed                                    ctermfg=1
  hi Search               guifg=NvimDarkGrey1  guibg=NvimLightYellow           ctermfg=15 ctermbg=3
  hi SignColumn           guifg=NvimLightGrey4
  hi SpecialKey           guifg=NvimLightGrey4
  hi SpellBad             guisp=NvimDarkRed    gui=undercurl                   cterm=undercurl
  hi SpellCap             guisp=NvimDarkYellow gui=undercurl                   cterm=undercurl
  hi SpellLocal           guisp=NvimDarkGreen  gui=undercurl                   cterm=undercurl
  hi SpellRare            guisp=NvimDarkCyan   gui=undercurl                   cterm=undercurl
  hi StatusLine           guifg=NvimLightGrey3 guibg=NvimDarkGrey3             cterm=reverse
  hi StatusLineNC         guifg=NvimDarkGrey3  guibg=NvimLightGrey3            cterm=bold,underline
  hi Title                guifg=NvimDarkGrey2                        gui=bold  cterm=bold
  hi Visual                                    guibg=NvimLightGrey4            ctermfg=15 ctermbg=0
  hi WarningMsg           guifg=NvimDarkYellow                                 ctermfg=3
  hi WinBar               guifg=NvimDarkGrey4  guibg=NvimLightGrey1  gui=bold  cterm=bold
  hi WinBarNC             guifg=NvimDarkGrey4  guibg=NvimLightGrey1            cterm=bold

  " Syntax
  hi Constant   guifg=NvimDarkGrey2 " Use only `Normal` foreground to be usable on different background
  hi Operator   guifg=NvimDarkGrey2
  hi PreProc    guifg=NvimDarkGrey2
  hi Type       guifg=NvimDarkGrey2
  hi Delimiter  guifg=NvimDarkGrey2

  hi Comment    guifg=NvimDarkGrey4
  hi String     guifg=NvimDarkGreen                    ctermfg=2
  hi Identifier guifg=NvimDarkBlue                     ctermfg=4
  hi Function   guifg=NvimDarkCyan                     ctermfg=6
  hi Statement  guifg=NvimDarkGrey2 gui=bold           cterm=bold
  hi Special    guifg=NvimDarkCyan                     ctermfg=6
  hi Error      guifg=NvimDarkGrey1 guibg=NvimLightRed ctermfg=15 ctermbg=1
  hi Todo       guifg=NvimDarkGrey2 gui=bold           cterm=bold

  " Diagnostic
  hi DiagnosticError          guifg=NvimDarkRed                      ctermfg=1
  hi DiagnosticWarn           guifg=NvimDarkYellow                   ctermfg=3
  hi DiagnosticInfo           guifg=NvimDarkCyan                     ctermfg=6
  hi DiagnosticHint           guifg=NvimDarkBlue                     ctermfg=4
  hi DiagnosticOk             guifg=NvimDarkGreen                    ctermfg=2
  hi DiagnosticUnderlineError guisp=NvimDarkRed    gui=underline     cterm=underline
  hi DiagnosticUnderlineWarn  guisp=NvimDarkYellow gui=underline     cterm=underline
  hi DiagnosticUnderlineInfo  guisp=NvimDarkCyan   gui=underline     cterm=underline
  hi DiagnosticUnderlineHint  guisp=NvimDarkBlue   gui=underline     cterm=underline
  hi DiagnosticUnderlineOk    guisp=NvimDarkGreen  gui=underline     cterm=underline
  hi DiagnosticDeprecated     guisp=NvimDarkRed    gui=strikethrough cterm=strikethrough

  " Treesitter standard groups
  hi @variable guifg=NvimDarkGrey
else
  hi Normal guifg=NvimLightGrey2 guibg=NvimDarkGrey2 ctermfg=NONE ctermbg=NONE

  " UI
  hi Added                guifg=NvimLightGreen                                ctermfg=10
  hi Changed              guifg=NvimLightCyan                                 ctermfg=14
  hi ColorColumn                                guibg=NvimDarkGrey4           cterm=reverse
  hi Conceal              guifg=NvimDarkGrey4
  hi CurSearch            guifg=NvimDarkGrey1   guibg=NvimLightYellow         ctermfg=0 ctermbg=11
  hi CursorColumn                               guibg=NvimDarkGrey3
  hi CursorLine                                 guibg=NvimDarkGrey3
  hi DiffAdd              guifg=NvimLightGrey1  guibg=NvimDarkGreen           ctermfg=0 ctermbg=10
  hi DiffChange           guifg=NvimLightGrey1  guibg=NvimDarkGrey4
  hi DiffDelete           guifg=NvimLightRed                         gui=bold ctermfg=9 cterm=bold
  hi DiffText             guifg=NvimLightGrey1  guibg=NvimDarkCyan            ctermfg=0 ctermbg=14
  hi Directory            guifg=NvimLightCyan                                 ctermfg=14
  hi ErrorMsg             guifg=NvimLightRed                                  ctermfg=9
  hi FloatShadow                                guibg=NvimDarkGrey4           ctermbg=0 blend=80
  hi FloatShadowThrough                         guibg=NvimDarkGrey4           ctermbg=0 blend=100
  hi Folded               guifg=NvimLightGrey4  guibg=NvimDarkGrey3
  hi LineNr               guifg=NvimDarkGrey4
  hi MatchParen                                 guibg=NvimDarkGrey4  gui=bold cterm=bold,underline
  hi ModeMsg              guifg=NvimLightGreen                                ctermfg=10
  hi MoreMsg              guifg=NvimLightCyan                                 ctermfg=14
  hi NonText              guifg=NvimDarkGrey4
  hi NormalFloat                                guibg=NvimDarkGrey1
  hi Pmenu                                      guibg=NvimDarkGrey3           cterm=reverse
  hi PmenuSel             guifg=NvimDarkGrey3   guibg=NvimLightGrey2          cterm=reverse,underline blend=0
  hi PmenuThumb                                 guibg=NvimDarkGrey4
  hi Question             guifg=NvimLightCyan                                 ctermfg=14
  hi QuickFixLine         guifg=NvimLightCyan                                 ctermfg=14
  hi RedrawDebugClear                           guibg=NvimDarkYellow          ctermfg=0 ctermbg=11
  hi RedrawDebugComposed                        guibg=NvimDarkGreen           ctermfg=0 ctermbg=10
  hi RedrawDebugRecompose                       guibg=NvimDarkRed             ctermfg=0 ctermbg=9
  hi Removed              guifg=NvimLightRed                                  ctermfg=9
  hi Search               guifg=NvimLightGrey1  guibg=NvimDarkYellow          ctermfg=0 ctermbg=11
  hi SignColumn           guifg=NvimDarkGrey4
  hi SpecialKey           guifg=NvimDarkGrey4
  hi SpellBad             guisp=NvimLightRed    gui=undercurl                 cterm=undercurl
  hi SpellCap             guisp=NvimLightYellow gui=undercurl                 cterm=undercurl
  hi SpellLocal           guisp=NvimLightGreen  gui=undercurl                 cterm=undercurl
  hi SpellRare            guisp=NvimLightCyan   gui=undercurl                 cterm=undercurl
  hi StatusLine           guifg=NvimDarkGrey3   guibg=NvimLightGrey3          cterm=reverse
  hi StatusLineNC         guifg=NvimLightGrey3  guibg=NvimDarkGrey3           cterm=bold,underline
  hi Title                guifg=NvimLightGrey2                       gui=bold cterm=bold
  hi Visual                                     guibg=NvimDarkGrey4           ctermfg=0 ctermbg=15
  hi WarningMsg           guifg=NvimLightYellow                               ctermfg=11
  hi WinBar               guifg=NvimLightGrey4  guibg=NvimDarkGrey1  gui=bold cterm=bold
  hi WinBarNC             guifg=NvimLightGrey4  guibg=NvimDarkGrey1           cterm=bold

  " Syntax
  hi Constant   guifg=NvimLightGrey2 " Use only `Normal` foreground to be usable on different background
  hi Operator   guifg=NvimLightGrey2
  hi PreProc    guifg=NvimLightGrey2
  hi Type       guifg=NvimLightGrey2
  hi Delimiter  guifg=NvimLightGrey2

  hi Comment    guifg=NvimLightGrey4
  hi String     guifg=NvimLightGreen                   ctermfg=10
  hi Identifier guifg=NvimLightBlue                    ctermfg=12
  hi Function   guifg=NvimLightCyan                    ctermfg=14
  hi Statement  guifg=NvimLightGrey2 gui=bold          cterm=bold
  hi Special    guifg=NvimLightCyan                    ctermfg=14
  hi Error      guifg=NvimLightGrey1 guibg=NvimDarkRed ctermfg=0 ctermbg=9
  hi Todo       guifg=NvimLightGrey2 gui=bold          cterm=bold

  " Diagnostic
  hi DiagnosticError          guifg=NvimLightRed                      ctermfg=9
  hi DiagnosticWarn           guifg=NvimLightYellow                   ctermfg=11
  hi DiagnosticInfo           guifg=NvimLightCyan                     ctermfg=14
  hi DiagnosticHint           guifg=NvimLightBlue                     ctermfg=12
  hi DiagnosticOk             guifg=NvimLightGreen                    ctermfg=10
  hi DiagnosticUnderlineError guisp=NvimLightRed    gui=underline     cterm=underline
  hi DiagnosticUnderlineWarn  guisp=NvimLightYellow gui=underline     cterm=underline
  hi DiagnosticUnderlineInfo  guisp=NvimLightCyan   gui=underline     cterm=underline
  hi DiagnosticUnderlineHint  guisp=NvimLightBlue   gui=underline     cterm=underline
  hi DiagnosticUnderlineOk    guisp=NvimLightGreen  gui=underline     cterm=underline
  hi DiagnosticDeprecated     guisp=NvimLightRed    gui=strikethrough cterm=strikethrough

  " Treesitter standard groups
  hi @variable guifg=NvimLightGrey2
endif

" NvimInternalError should appear only when highlighter has a bug.
hi NvimInternalError ctermfg=Red ctermbg=Red guifg=Red guibg=Red

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
