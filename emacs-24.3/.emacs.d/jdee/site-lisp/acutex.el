;;acutex的配置安装
;; 基本配置
 (add-to-list 'load-path
              "~/site-lisp/auctex/site-lisp/site-start.d")
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(if (string-equal system-type "windows-nt")
     (require 'tex-mik))
;;自动换行，数学公式，reftex和现实行号的功能
(mapc (lambda (mode)
         (add-hook 'LaTeX-mode-hook mode))
         (list 'auto-fill-mode
               'LaTeX-math-mode
               'turn-on-reftex
               'linum-mode))
;;默认使用pdf格式，默认使用xelatex生成pdf文件
 (add-hook 'LaTeX-mode-hook
              (lambda ()
                (setq TeX-auto-untabify t     ; remove all tabs before saving
                      TeX-engine 'xetex       ; use xelatex default
                      TeX-show-compilation t) ; display compilation windows
                (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
                (setq TeX-save-query nil)
                (imenu-add-menubar-index)
                (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)))
