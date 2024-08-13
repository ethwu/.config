" clone of the default neovim theme
" replaces the nvim color names with their truecolor equivalents
" https://github.com/neovim/neovim/blob/ab561302a3b4dbb161aa6ef3ea39a6d1410a72fe/src/nvim/highlight_group.c
highlight clear
let g:colors_name = 'nvim'

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
  hi Normal guifg=#14161b guibg=#e0e2ea ctermfg=NONE ctermbg=NONE

  " UI
  hi Added                guifg=#005523                                  ctermfg=2
  hi Changed              guifg=#007373                                   ctermfg=6
  hi ColorColumn                               guibg=#9b9ea4            cterm=reverse
  hi Conceal              guifg=#9b9ea4
  hi CurSearch            guifg=#eef1f8 guibg=#6b5300            ctermfg=15 ctermbg=3
  hi CursorColumn                              guibg=#c4c6cd
  hi CursorLine                                guibg=#c4c6cd
  hi DiffAdd              guifg=#07080d  guibg=#9b9ea4            ctermfg=15 ctermbg=2
  hi DiffChange           guifg=#07080d  guibg=#9b9ea4
  hi DiffDelete           guifg=#590008                          gui=bold  ctermfg=1 cterm=bold
  hi DiffText             guifg=#07080d  guibg=#8cf8f7             ctermfg=15 ctermbg=6
  hi Directory            guifg=#007373                                   ctermfg=6
  hi ErrorMsg             guifg=#590008                                    ctermfg=1
  hi FloatShadow                               guibg=#9b9ea4            ctermbg=0 " blend=80
  hi FloatShadowThrough                        guibg=#9b9ea4            ctermbg=0 " blend=100
  hi Folded               guifg=#4f5258  guibg=#c4c6cd
  hi LineNr               guifg=#9b9ea4
  hi MatchParen                                guibg=#9b9ea4  gui=bold  cterm=bold,underline
  hi ModeMsg              guifg=#005523                                  ctermfg=2
  hi MoreMsg              guifg=#007373                                   ctermfg=6
  hi NonText              guifg=#9b9ea4
  hi NormalFloat                               guibg=#eef1f8
  hi Pmenu                                     guibg=#c4c6cd            cterm=reverse
  hi PmenuSel             guifg=#c4c6cd guibg=#14161b             cterm=reverse,underline " blend=0
  hi PmenuThumb                                guibg=#9b9ea4
  hi Question             guifg=#007373                                   ctermfg=6
  hi QuickFixLine         guifg=#007373                                   ctermfg=6
  hi RedrawDebugClear                          guibg=#fce094           ctermfg=15 ctermbg=3
  hi RedrawDebugComposed                       guibg=#9b9ea4            ctermfg=15 ctermbg=2
  hi RedrawDebugRecompose                      guibg=#ffc0b9              ctermfg=15 ctermbg=1
  hi Removed              guifg=#590008                                    ctermfg=1
  hi Search               guifg=#07080d  guibg=#fce094           ctermfg=15 ctermbg=3
  hi SignColumn           guifg=#9b9ea4
  hi SpecialKey           guifg=#9b9ea4
  hi SpellBad             guisp=#590008    gui=undercurl                   cterm=undercurl
  hi SpellCap             guisp=#6b5300 gui=undercurl                   cterm=undercurl
  hi SpellLocal           guisp=#005523  gui=undercurl                   cterm=undercurl
  hi SpellRare            guisp=#007373   gui=undercurl                   cterm=undercurl
  hi StatusLine           guifg=#c4c6cd guibg=#2c2e33             cterm=reverse
  hi StatusLineNC         guifg=#2c2e33  guibg=#c4c6cd            cterm=bold,underline
  hi Title                guifg=#14161b                        gui=bold  cterm=bold
  hi Visual                                    guibg=#9b9ea4            ctermfg=15 ctermbg=0
  hi WarningMsg           guifg=#6b5300                                 ctermfg=3
  hi WinBar               guifg=#4f5258  guibg=#eef1f8  gui=bold  cterm=bold
  hi WinBarNC             guifg=#4f5258  guibg=#eef1f8            cterm=bold

  " Syntax
  hi Constant   guifg=#14161b " Use only `Normal` foreground to be usable on different background
  hi Operator   guifg=#14161b
  hi PreProc    guifg=#14161b
  hi Type       guifg=#14161b
  hi Delimiter  guifg=#14161b

  hi Comment    guifg=#4f5258
  hi String     guifg=#005523                    ctermfg=2
  hi Identifier guifg=#004c73                     ctermfg=4
  hi Function   guifg=#007373                     ctermfg=6
  hi Statement  guifg=#14161b gui=bold           cterm=bold
  hi Special    guifg=#007373                     ctermfg=6
  hi Error      guifg=#07080d guibg=#ffc0b9 ctermfg=15 ctermbg=1
  hi Todo       guifg=#14161b gui=bold           cterm=bold

  " Diagnostic
  hi DiagnosticError          guifg=#590008                      ctermfg=1
  hi DiagnosticWarn           guifg=#6b5300                   ctermfg=3
  hi DiagnosticInfo           guifg=#007373                     ctermfg=6
  hi DiagnosticHint           guifg=#004c73                     ctermfg=4
  hi DiagnosticOk             guifg=#005523                    ctermfg=2
  hi DiagnosticUnderlineError guisp=#590008    gui=underline     cterm=underline
  hi DiagnosticUnderlineWarn  guisp=#6b5300 gui=underline     cterm=underline
  hi DiagnosticUnderlineInfo  guisp=#007373   gui=underline     cterm=underline
  hi DiagnosticUnderlineHint  guisp=#004c73   gui=underline     cterm=underline
  hi DiagnosticUnderlineOk    guisp=#005523  gui=underline     cterm=underline
  hi DiagnosticDeprecated     guisp=#590008    gui=strikethrough cterm=strikethrough

  " Treesitter standard groups
  hi @variable guifg=#14161b
else
  hi Normal guifg=#e0e2ea guibg=#14161b ctermfg=NONE ctermbg=NONE

  " UI
  hi Added                guifg=#9b9ea4                                ctermfg=10
  hi Changed              guifg=#8cf8f7                                 ctermfg=14
  hi ColorColumn                                guibg=#4f5258           cterm=reverse
  hi Conceal              guifg=#4f5258
  hi CurSearch            guifg=#07080d   guibg=#fce094         ctermfg=0 ctermbg=11
  hi CursorColumn                               guibg=#2c2e33
  hi CursorLine                                 guibg=#2c2e33
  hi DiffAdd              guifg=#eef1f8  guibg=#005523           ctermfg=0 ctermbg=10
  hi DiffChange           guifg=#eef1f8  guibg=#4f5258
  hi DiffDelete           guifg=#ffc0b9                         gui=bold ctermfg=9 cterm=bold
  hi DiffText             guifg=#eef1f8  guibg=#007373            ctermfg=0 ctermbg=14
  hi Directory            guifg=#8cf8f7                                 ctermfg=14
  hi ErrorMsg             guifg=#ffc0b9                                  ctermfg=9
  hi FloatShadow                                guibg=#4f5258           ctermbg=0 " blend=80
  hi FloatShadowThrough                         guibg=#4f5258           ctermbg=0 " blend=100
  hi Folded               guifg=#9b9ea4  guibg=#2c2e33
  hi LineNr               guifg=#4f5258
  hi MatchParen                                 guibg=#4f5258  gui=bold cterm=bold,underline
  hi ModeMsg              guifg=#9b9ea4                                ctermfg=10
  hi MoreMsg              guifg=#8cf8f7                                 ctermfg=14
  hi NonText              guifg=#4f5258
  hi NormalFloat                                guibg=#07080d
  hi Pmenu                                      guibg=#2c2e33           cterm=reverse
  hi PmenuSel             guifg=#2c2e33   guibg=#e0e2ea          cterm=reverse,underline " blend=0
  hi PmenuThumb                                 guibg=#4f5258
  hi Question             guifg=#8cf8f7                                 ctermfg=14
  hi QuickFixLine         guifg=#8cf8f7                                 ctermfg=14
  hi RedrawDebugClear                           guibg=#6b5300          ctermfg=0 ctermbg=11
  hi RedrawDebugComposed                        guibg=#005523           ctermfg=0 ctermbg=10
  hi RedrawDebugRecompose                       guibg=#590008             ctermfg=0 ctermbg=9
  hi Removed              guifg=#ffc0b9                                  ctermfg=9
  hi Search               guifg=#eef1f8  guibg=#6b5300          ctermfg=0 ctermbg=11
  hi SignColumn           guifg=#4f5258
  hi SpecialKey           guifg=#4f5258
  hi SpellBad             guisp=#ffc0b9    gui=undercurl                 cterm=undercurl
  hi SpellCap             guisp=#fce094 gui=undercurl                 cterm=undercurl
  hi SpellLocal           guisp=#9b9ea4  gui=undercurl                 cterm=undercurl
  hi SpellRare            guisp=#8cf8f7   gui=undercurl                 cterm=undercurl
  hi StatusLine           guifg=#2c2e33   guibg=#c4c6cd          cterm=reverse
  hi StatusLineNC         guifg=#c4c6cd  guibg=#2c2e33           cterm=bold,underline
  hi Title                guifg=#e0e2ea                       gui=bold cterm=bold
  hi Visual                                     guibg=#4f5258           ctermfg=0 ctermbg=15
  hi WarningMsg           guifg=#fce094                               ctermfg=11
  hi WinBar               guifg=#9b9ea4  guibg=#07080d  gui=bold cterm=bold
  hi WinBarNC             guifg=#9b9ea4  guibg=#07080d           cterm=bold

  " Syntax
  hi Constant   guifg=#e0e2ea " Use only `Normal` foreground to be usable on different background
  hi Operator   guifg=#e0e2ea
  hi PreProc    guifg=#e0e2ea
  hi Type       guifg=#e0e2ea
  hi Delimiter  guifg=#e0e2ea

  hi Comment    guifg=#9b9ea4
  hi String     guifg=#9b9ea4                   ctermfg=10
  hi Identifier guifg=#a6dbff                    ctermfg=12
  hi Function   guifg=#8cf8f7                    ctermfg=14
  hi Statement  guifg=#e0e2ea gui=bold          cterm=bold
  hi Special    guifg=#8cf8f7                    ctermfg=14
  hi Error      guifg=#eef1f8 guibg=#590008 ctermfg=0 ctermbg=9
  hi Todo       guifg=#e0e2ea gui=bold          cterm=bold

  " Diagnostic
  hi DiagnosticError          guifg=#ffc0b9                      ctermfg=9
  hi DiagnosticWarn           guifg=#fce094                   ctermfg=11
  hi DiagnosticInfo           guifg=#8cf8f7                     ctermfg=14
  hi DiagnosticHint           guifg=#a6dbff                     ctermfg=12
  hi DiagnosticOk             guifg=#9b9ea4                    ctermfg=10
  hi DiagnosticUnderlineError guisp=#ffc0b9    gui=underline     cterm=underline
  hi DiagnosticUnderlineWarn  guisp=#fce094 gui=underline     cterm=underline
  hi DiagnosticUnderlineInfo  guisp=#8cf8f7   gui=underline     cterm=underline
  hi DiagnosticUnderlineHint  guisp=#a6dbff   gui=underline     cterm=underline
  hi DiagnosticUnderlineOk    guisp=#9b9ea4  gui=underline     cterm=underline
  hi DiagnosticDeprecated     guisp=#ffc0b9    gui=strikethrough cterm=strikethrough

  " Treesitter standard groups
  hi @variable guifg=#e0e2ea
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
