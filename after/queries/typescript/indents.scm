;; extends

; Override template_string to fall back to vim autoindent rather than treesitter
; indent. The built-in uses @indent.ignore which does not correctly preserve
; indentation for content lines inside template literals.
(template_string) @indent.auto
