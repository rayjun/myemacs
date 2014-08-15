
;;让插入的代码高亮
(setq org-src-fontify-natively t) 


(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-hide-leading-stars t)
(setq org-logde>de>de>de>-done t)



;;添加日程管理文件，然后就可以进行管理
(setq org-agenda-files (list "~/org/todo.org"))

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
