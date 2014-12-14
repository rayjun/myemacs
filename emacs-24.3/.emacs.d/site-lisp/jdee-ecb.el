(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-key-map (quote ("C-c ." (t "fh" ecb-history-filter) (t "fs" ecb-sources-filter) (t "fm" ecb-methods-filter) (t "fr" ecb-methods-filter-regexp) (t "ft" ecb-methods-filter-tagclass) (t "fc" ecb-methods-filter-current-type) (t "fp" ecb-methods-filter-protection) (t "fn" ecb-methods-filter-nofilter) (t "fl" ecb-methods-filter-delete-last) (t "ff" ecb-methods-filter-function) (t "p" ecb-nav-goto-previous) (t "n" ecb-nav-goto-next) (t "lc" ecb-change-layout) (t "lr" ecb-redraw-layout) (t "lw" ecb-toggle-ecb-windows) (t "lt" ecb-toggle-layout) (t "s" ecb-window-sync) (t "r" ecb-rebuild-methods-buffer) (t "a" ecb-toggle-auto-expand-tag-tree) (t "x" ecb-expand-methods-nodes) (t "h" ecb-show-help) (t "gl" ecb-goto-window-edit-last) (nil "C-c 0" ecb-goto-window-edit1) (t "g2" ecb-goto-window-edit2) (t "gc" ecb-goto-window-compilation) (nil "C-c 1" ecb-goto-window-directories) (nil "C-c 2" ecb-goto-window-sources) (nil "C-c 3" ecb-goto-window-methods) (nil "C-c 4" ecb-goto-window-history) (t "ga" ecb-goto-window-analyse) (t "gb" ecb-goto-window-speedbar) (t "md" ecb-maximize-window-directories) (t "ms" ecb-maximize-window-sources) (t "mm" ecb-maximize-window-methods) (t "mh" ecb-maximize-window-history) (t "ma" ecb-maximize-window-analyse) (t "mb" ecb-maximize-window-speedbar) (t "e" eshell) (t "o" ecb-toggle-scroll-other-window-scrolls-compile) (t "\\" ecb-toggle-compile-window) (t "/" ecb-toggle-compile-window-height) (t "," ecb-cycle-maximized-ecb-buffers) (t "." ecb-cycle-through-compilation-buffers))))
 '(ecb-options-version "2.40")
 '(jde-compile-option-debug (quote ("all" (t t t))))
 '(jde-compiler (quote ("javac" "")))
 '(jde-complete-function (quote jde-complete-menu))
 '(jde-jdk (quote ("1.6")))
 '(jde-jdk-registry (quote (("1.6" . "C:/Program Files/Java/jdk1.7.0_07"))))
 '(scroll-bar-mode nil)
 '(show-paren-mode t))





(setq stack-trace-on-error t)

(setq debug-on-error t)   
;; 加载所需的package    
;;'(jde-jdk-registry (quote (("1.6" . "C:/Program Files/Java/jdk1.7.0_07")))) 

(add-to-list 'load-path (expand-file-name "~/.emacs.d/jdee/jdee-2.4.0.1/lisp"))  
(add-to-list 'load-path (expand-file-name "~/.emacs.d/jdee/cedet-1.0pre7/common"))  
(load-file (expand-file-name "~/.emacs.d/jdee/cedet-1.0pre7/common/cedet.el"))  
(add-to-list 'load-path (expand-file-name "~/.emacs.d/jdee/elib-1.0")) 



;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/jdee/jdee-2.4.0.1/lisp")) 
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/cedet-1.0pre7/common"))   
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/jdee/cedet-1.0pre7/semantic"))    
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/jdee/cedet-1.0pre7/speedbar"))    
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/jdee/cedet-1.0pre7/eieio"))    
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/jdee/elib-1.0")) 
;;(load-file (expand-file-name "~/.emacs.d/jdee/cedet-1.0pre7/common/cedet.el")) 

(add-to-list 'load-path (expand-file-name "~/.emacs.d/jdee/ecb-2.40"))    
(load-file (expand-file-name "~/.emacs.d/jdee/ecb-2.40/ecb.el"))     
;;(add-hook 'java-mode-hook 'turn-on-font-lock) 
(require 'cedet) 
(require 'font-lock) 
(require 'ecb) 
(require 'ecb-autoloads) 
(require 'jde)


(global-set-key [\C-f10] 'ecb-activate)   ;;启用ecb
(global-set-key [\C-f11] 'ecb-deactivate)  ;;退出ecb
