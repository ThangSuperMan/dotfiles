;;; lauremacs-ide-extra.el --- extra functions to lsp-mode
;;
;; @author Laura Viglioni
;; 2021
;; GNU Public License 3.0
;;


;;; Commentary:
;; 

;;; Code:

;;
;; Typescript/Javascript
;;

;;;###autoload
(defun lauremacs-ide-lsp-ts-rename-file ()
  "Rename current file and all it's references in other files."
  (interactive)
  (let* ((name (buffer-name))
         (old (buffer-file-name))
         (basename (file-name-nondirectory old)))
    (unless (and old (file-exists-p old))
      (error "Buffer '%s' is not visiting a file" name))
    (let ((new (read-file-name "New name: " (file-name-directory old) basename nil basename)))
      (when (get-file-buffer new)
        (error "A buffer named '%s' already exists" new))
      (when (file-exists-p new)
        (error "A file named '%s' already exists" new))
      (lsp--send-execute-command
       "_typescript.applyRenameFile"
       (vector (list :sourceUri (lsp--buffer-uri)
                     :targetUri (lsp--path-to-uri new))))
      (mkdir (file-name-directory new) t)
      (rename-file old new)
      (rename-buffer new)
      (set-visited-file-name new)
      (set-buffer-modified-p nil)
      (lsp-disconnect)
      (setq-local lsp-buffer-uri nil)
      (lsp)
      (lsp--info "Renamed '%s' to '%s'." name (file-name-nondirectory new)))))






(provide 'lauremacs-ide-extra)

;;; lauremacs-ide-extra.el ends here
