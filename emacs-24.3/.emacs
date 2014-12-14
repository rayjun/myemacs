

;;home和path的路径必须在所有load-file的前面，否则它们会去c盘找。
(setenv "HOME" "D:/mywork/emacs-24.3")
(setenv "PATH" "D:/mywork/emacs-24.3")

;;兼顾中文和英文的字体设置
(set-face-attribute
  'default nil :font "Monaco 12")
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Microsoft Yahei" :size 16)))	

				  
;;eim输入法
(load-file "~/.emacs.d/site-lisp/eim.el")



;;关闭欢迎界面
(setq inhibit-startup-message t)   
  
;; 设定不产生备份文件
(setq make-backup-files nil)


;; 显示时间，格式如下
(display-time-mode 1) 
(setq display-time-24hr-format t) 
(setq display-time-day-and-date t)  


;;去掉烦人的警告铃声   
(setq visible-bell nil)     

;;滚动页面时比较舒服，不要整页的滚动   
(setq scroll-step 1   
scroll-margin 3   
scroll-conservatively 10000)   

;;session设置
;;(require 'session)
;;(add-hook 'after-init-hook 'session-initialize)
;;(load "desktop")
;;(desktop-save-mode) 

          
;;jdee-ecb配置
(load-file "~/.emacs.d/site-lisp/jdee-ecb.el")



;;格式化整个文件函数
(defun indent-whole ()
  (interactive)
  (indent-region (point-min) (point-max))
  (message "format successfully"))
;;绑定到F7键
(global-set-key [f7] 'indent-whole)



;;yasnippet
(add-to-list 'load-path "~/.emacs.d/elisp") 
(require 'yasnippet-bundle) 
(yas/global-mode 1)
;;(global-set-key (kbd "C-;") 'yas/expand)


;;主题配置
(load-file "~/.emacs.d/site-lisp/color-theme.el")

;;(load-theme 'misterioso t)
;;字体
;;(set-default-font "consolas-12") 

;;显示行号
(require 'linum)
(setq linum-format "%3d ")
(add-hook 'find-file-hooks (lambda () (linum-mode 1)))



(load-file "~/.emacs.d/site-lisp/cc++.el")



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;js的配置
(add-to-list 'load-path "~/.emacs.d/elisp")
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode)) 

;;配置multi-web
;;(add-to-list 'load-path "~/.emacs.d/elisp")
;;(require 'multi-web-mode)
;;(setq mweb-default-major-mode 'html-mode)
;;(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
  ;;                (js-mode "<script[^>]*>" "</script>")
    ;;              (css-mode "<style[^>]*>" "</style>")))
;;(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
;;(multi-web-global-mode 1)



;;以下这段代码是解决emacs中换字体中文乱码问题的关键，虽然还不知道是什么原因。
;;编码设置
(load-file "~/.emacs.d/site-lisp/encoding.el")





;; get around the Ctrl+SPACE key binding for inputing method
(global-set-key "\C-cm" 'set-mark-command)

;; highlight marked region
(transient-mark-mode t)

;; enable syntax highlight
(global-font-lock-mode t)

;; show column number on status bar
(setq column-number-mode t)

;; close toolbar
(tool-bar-mode)

;; enable mouse wheel support
(mouse-wheel-mode)
(put 'upcase-region 'disabled nil)


;;org-mode的配置
(load-file "~/.emacs.d/site-lisp/org-config.el")

;;acutex的配置
(load-file "~/.emacs.d/site-lisp/acutex.el")



;;autocomplete
(load-file "~/.emacs.d/site-lisp/auto-complete.elc")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("9fd20670758db15cc4d0b4442a74543888d2e445646b25f2755c65dcd6f1504b" default)))
 '(ecb-key-map (quote ("C-c ." (t "fh" ecb-history-filter) (t "fs" ecb-sources-filter) (t "fm" ecb-methods-filter) (t "fr" ecb-methods-filter-regexp) (t "ft" ecb-methods-filter-tagclass) (t "fc" ecb-methods-filter-current-type) (t "fp" ecb-methods-filter-protection) (t "fn" ecb-methods-filter-nofilter) (t "fl" ecb-methods-filter-delete-last) (t "ff" ecb-methods-filter-function) (t "p" ecb-nav-goto-previous) (t "n" ecb-nav-goto-next) (t "lc" ecb-change-layout) (t "lr" ecb-redraw-layout) (t "lw" ecb-toggle-ecb-windows) (t "lt" ecb-toggle-layout) (t "s" ecb-window-sync) (t "r" ecb-rebuild-methods-buffer) (t "a" ecb-toggle-auto-expand-tag-tree) (t "x" ecb-expand-methods-nodes) (t "h" ecb-show-help) (t "gl" ecb-goto-window-edit-last) (nil "C-c 0" ecb-goto-window-edit1) (t "g2" ecb-goto-window-edit2) (t "gc" ecb-goto-window-compilation) (nil "C-c 1" ecb-goto-window-directories) (nil "C-c 2" ecb-goto-window-sources) (nil "C-c 3" ecb-goto-window-methods) (nil "C-c 4" ecb-goto-window-history) (t "ga" ecb-goto-window-analyse) (t "gb" ecb-goto-window-speedbar) (t "md" ecb-maximize-window-directories) (t "ms" ecb-maximize-window-sources) (t "mm" ecb-maximize-window-methods) (t "mh" ecb-maximize-window-history) (t "ma" ecb-maximize-window-analyse) (t "mb" ecb-maximize-window-speedbar) (t "e" eshell) (t "o" ecb-toggle-scroll-other-window-scrolls-compile) (t "\\" ecb-toggle-compile-window) (t "/" ecb-toggle-compile-window-height) (t "," ecb-cycle-maximized-ecb-buffers) (t "." ecb-cycle-through-compilation-buffers))))
 '(ecb-options-version "2.40")
 '(jde-compile-option-debug (quote ("all" (t t t))))
 '(jde-compiler (quote ("javac" "")))
 '(jde-complete-function (quote jde-complete-menu))
 '(jde-jdk (quote ("1.6")))
 '(jde-jdk-registry (quote (("1.6" . "C:/Program Files/Java/jdk1.7.0_07"))))
 '(scroll-bar-mode nil)
 '(show-paren-mode t))
