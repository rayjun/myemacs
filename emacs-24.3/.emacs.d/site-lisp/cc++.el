;;(setq compile-command (concat "D:/Dev-Cpp/bin/g++ -g " "/"" buffer-file-name "/"")) 
(global-set-key (kbd "<f9>") 'smart-compile)
(defun smart-compile()
  
  ;;  "比较智能的C/C++编译命令
  ;;如果当前目录有makefile则用make -k编译，否则，如果是
  ;;处于c-mode，就用gcc -Wall编译，如果是c++-mode就用 g++ -Wall编译"
  (interactive)
  ;; 查找 Makefile
  (let ((candidate-make-file-name '("makefile" "Makefile" "GNUmakefile"))
	(command nil))
    (if (not (null
	      (find t candidate-make-file-name :key
		    '(lambda (f) (file-readable-p f)))))
	(setq command "make -k ")
      ;; 没有找到 Makefile ，查看当前 mode 是否是已知的可编译的模式
      (if (null (buffer-file-name (current-buffer)))
	  (message "Buffer not attached to a file, won't compile!")
	(if (eq major-mode 'c-mode)
	    (setq command
		  (concat "D:/mywork/DevC++/Dev-Cpp/MinGW64/bin/gcc.exe -Wall -o "      ;;你要明确知道自己的编译器在哪里,
			  (file-name-sans-extension                          ;;这样,用你的gcc.exe的地址代替这里的D:/Dev-Cpp/bin/gcc.exe     
			   (file-name-nondirectory buffer-file-name)) ;;注意,这里的路径的斜杠和vista的习惯相反,你要注意修改 
			  " "
			  (file-name-nondirectory buffer-file-name)
			  " -g -lm "))
	  (if (eq major-mode 'c++-mode)
	      (setq command
		    (concat "D:/mywork/DevC++/Dev-Cpp/MinGW64/bin/g++.exe -Wall -o " ;;还有这里的g++,也同gcc一样...
			    (file-name-sans-extension
			     (file-name-nondirectory buffer-file-name))
			    " "
			    (file-name-nondirectory buffer-file-name)
			    " -g -lm "))
	    (message "Unknow mode, won't compile!")))))
    (if (not (null command))
	(let ((command (read-from-minibuffer "Compile command: " command)))
	  (compile command)))))


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
