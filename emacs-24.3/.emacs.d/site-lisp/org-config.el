
;;让插入的代码高亮
(setq org-src-fontify-natively t) 
(setq org-agenda-ndays 1)


;;这个函数用来扩展org文档中插入源代码的功能，但是输入<s加tab也能有同样的效果 
(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

;;设置快捷键
(add-hook 'org-mode-hook '(lambda ()
                            ;;设置latex，让出现拼写错误的地方报错
                            ;;(flyspell-mode 1)
                            ;; C-TAB for expanding
                            ;;(local-set-key (kbd "C-<tab>")
                            ;;               'yas/expand-from-trigger-key)
                            ;; keybinding for editing source code blocks
                            ;;(local-set-key (kbd "C-c s e")
                            ;;               'org-edit-src-code)
                            ;; 设置插入源代码的快捷键
                            (local-set-key (kbd "C-c i s")
                                           'org-insert-src-block)
                            ))



(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-hide-leading-stars t)
(setq org-logde>de>de>de>-done t)



;;添加日程管理文件，然后就可以进行管理
(setq org-agenda-files (list "~/org/todo.org"
                             "~/org/todo-2014-9.org"
			     "~/org/todo-2014-10.org"
			     "~/org/todo-2014-11.org"))

;;(defun wl-org-agenda-to-appt ()
  ;;(org-agenda-to-appt t "TODO"))
;;(wl-org-agenda-to-appt)
;;(defadvice  org-agenda-redo (after org-agenda-redo-add-appts)
  ;;"Pressing `r' on the agenda will also add appointments."
  ;;(progn
    ;;(let ((config (current-window-configuration)))
      ;;(appt-check t)
      ;;(set-window-configuration config))
    ;;(wl-org-agenda-to-appt)))
;;(ad-activate 'org-agenda-redo)



;;设置事件状态关键字
(setq org-todo-keywords
    '((sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
      (sequence "TODO(T!)" "|" "DONE" "CANCELED(C@/!)")
     ))   
