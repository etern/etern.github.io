;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

((dired-mode . ((eval . (progn
                          (defun insert-front-matter (&optional title)
                            (insert "---\ntitle: ")
                            (insert (or title (substring (file-name-base (buffer-name)) 11)))
                            (insert "\ndate: ")
                            (insert (format-time-string "%Y-%m-%d %H:%M:%S %z\n---")))
                          (defun dired-create-jekyll-post ()
                            (interactive)
                            (let* ((title (read-string "Title: "))
                                   (name (downcase (replace-regexp-in-string " +" "-" title)))
                                   (post-name (format "%s-%s.md" (format-time-string "%Y-%m-%d") name)))
                              (find-file post-name)
                              (insert-front-matter title)))
                          (define-auto-insert (rx (seq (= 4 digit) ?- (= 2 digit) ?- (= 2 digit) (one-or-more any) ".md"))
                            #'insert-front-matter)
                          (define-key dired-mode-map "c" 'dired-create-jekyll-post))))))
