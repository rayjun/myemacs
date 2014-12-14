(add-to-list 'load-path "~/.emacs.d/auto-complete/pos-tip.el")
(add-to-list 'load-path "~/.emacs.d/auto-complete/fuzzy.el")
(add-to-list 'load-path "~/.emacs.d/auto-complete/popup.el")
(add-to-list 'load-path "~/.emacs.d/auto-complete")

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/auto-complete/dict")
(ac-config-default)

(require 'pos-tip)
(setq ac-quick-help-prefer-pos-tip t)   ;default is t


