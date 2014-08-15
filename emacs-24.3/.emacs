

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


;;主题配置
(load-file "~/.emacs.d/site-lisp/color-theme.el")

;;(load-theme 'misterioso t)
;;字体
;;(set-default-font "consolas-12") 

;;显示行号
(require 'linum)
(setq linum-format "%3d ")
(add-hook 'find-file-hooks (lambda () (linum-mode 1)))



;;(setq compile-command (concat "D:/Dev-Cpp/bin/g++ -g " "/"" buffer-file-name "/"")) (
;;global-set-key (kbd "<f9>") 'smart-compile)( 
;;defun smart-compile()
  
  ;;  "比较智能的C/C++编译命令
  ;;如果当前目录有makefile则用make -k编译，否则，如果是
  ;;处于c-mode，就用gcc -Wall编译，如果是c++-mode就用 g++ -Wall编译"
 ;; (interactive)
  ;; 查找 Makefile
 ;; (let ((candidate-make-file-name '("makefile" "Makefile" "GNUmakefile"))
;;	(command nil))
  ;;  (if (not (null
;;	      (find t candidate-make-file-name :key
;;		    '(lambda (f) (file-readable-p f)))))
;;	(setq command "make -k ")
      ;; 没有找到 Makefile ，查看当前 mode 是否是已知的可编译的模式
  ;;    (if (null (buffer-file-name (current-buffer)))
;;	  (message "Buffer not attached to a file, won't compile!")
;;	(if (eq major-mode 'c-mode)
;;	    (setq command
;;		  (concat "D:/mywork/DevC++/Dev-Cpp/MinGW64/bin/gcc.exe -Wall -o "      ;;你要明确知道自己的编译器在哪里,
;;			  (file-name-sans-extension                          ;;这样,用你的gcc.exe的地址代替这里的D:/Dev-Cpp/bin/gcc.exe     
;;			   (file-name-nondirectory buffer-file-name)) ;;注意,这里的路径的斜杠和vista的习惯相反,你要注意修改 
;;			  " "
;;			  (file-name-nondirectory buffer-file-name)
;;			  " -g -lm "))
;;	  (if (eq major-mode 'c++-mode)
;;	      (setq command
;;		    (concat "D:/mywork/DevC++/Dev-Cpp/MinGW64/bin/g++.exe -Wall -o " ;;还有这里的g++,也同gcc一样...
;;			    (file-name-sans-extension
;;			     (file-name-nondirectory buffer-file-name))
			    " "
;;			    (file-name-nondirectory buffer-file-name)
;;			    " -g -lm "))
;;	    (message "Unknow mode, won't compile!")))))
  ;;  (if (not (null command))
;;	(let ((command (read-from-minibuffer "Compile command: " command)))
;;	  (compile command)))))
      
  (defun my-c-mode-hook()
  ;; 将回车代替C-j的功能，换行的同时对齐
  (define-key c-mode-map [return] 'newline-and-indent)
  (interactive)
  ;; 设置C程序的对齐风格
  ;; (c-set-style "K&R")
  ;; 自动模式，在此种模式下当你键入{时，会自动根据你设置的对齐风格对齐
  ;; (c-toggle-auto-state)
  ;; 此模式下，当按Backspace时会删除最多的空格
  (c-toggle-hungry-state)
  ;; TAB键的宽度设置为8
  (setq c-basic-offset 4)
  ;; 在菜单中加入当前Buffer的函数索引
  (imenu-add-menubar-index)
  ;; 在状态条上显示当前光标在哪个函数体内部
  (which-function-mode)
  )
(defun my-c++-mode-hook()
  (define-key c++-mode-map [return] 'newline-and-indent)
  (interactive)
  (c-set-style "stroustrup")
  (c-toggle-auto-state)
  (c-toggle-hungry-state)
  (setq c-basic-offset 4)
  (imenu-add-menubar-index)
  (which-function-mode)
  )
(defun my-java-mode()
  (define-key java-mode-map [return] 'newline-and-indent)
  (interactive)
  (c-set-style "java")
  (c-toggle-auto-state)
  (c-toggle-hungry-state)
  (setq c-basic-offset 4)
  (imenu-add-menubar-index)
  (which-function-mode)
  )
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-hook 'java-mode-hook 'my-java-mode)


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
