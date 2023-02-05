(setq user-full-name "Phan Tan Thang")

(setq inhibit-startup-message t)

;;
;; Garbage colector threshold
;;

(setq gc-cons-threshold (* 20 1024 1024)
			) ;; initial threshold

(add-hook 'emacs-startup-hook ;; threshold after init
          (lambda () (setq gc-cons-threshold (* 128 1024 1024)))) 

;;
;; Layout
;;

(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(set-fringe-mode 10)        ; Give some breathing room
(menu-bar-mode 1)           ; Disable the menu bar
(blink-cursor-mode 0)       ; Disable the cursor blink
(global-hl-line-mode -1)    ; Disable the highlight current line
(setq visible-bell t)       ; Set up the visible bell

;; (set-face-attribute 'default nil :font "SF Mono" :height 180)
(set-face-attribute 'default nil :font "Source Code Pro" :height 180)

;; (global-display-line-numbers-mode t)
(setq-default tab-width 2)

;; Better handling for files with so long lines
(global-so-long-mode 1)

;;
;; Load external config files
;;

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'lauremacs-ide-extra)

;; Make escape quite prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Full screen at startup
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;
;; Custom functions
;;

(defun my-smarter-move-beginning-of-line (arg)
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;;
;; Handle new windows
;;

(defun split-window-right-and-focus ()
  "Spawn a new window right of the current one and focus it."
  (interactive)
  (split-window-right)
  (windmove-right))

(defun split-window-below-and-focus ()
  "Spawn a new window below the current one and focus it."
  (interactive)
  (split-window-below)
  (windmove-down))

(defun kill-buffer-and-delete-window ()
  "Kill the current buffer and delete its window."
  (interactive)
  (progn
    (kill-this-buffer)
    (delete-window)))

(defun my/goto-match-paren (arg)
  "Go to the matching if on (){}[], similar to vi style of % ."
  (interactive "p")
  (cond ((looking-at "[\[\(\{]") (evil-jump-item))
        ((looking-back "[\]\)\}]" 1) (evil-jump-item))
        ((looking-at "[\]\)\}]") (forward-char) (evil-jump-item))
        ((looking-back "[\[\(\{]" 1) (backward-char) (evil-jump-item))
        (t nil)))
  (global-set-key (kbd "s-;") #'my/goto-match-paren)

;;
;; Scrolling
;;

(setq hscroll-step 1
      hscroll-margin 0
      scroll-step 1
      scroll-margin 0
      scroll-conservatively 101
      scroll-preserve-screen-position 'always
      auto-window-vscroll nil
      fast-but-imprecise-scrolling t)
(pixel-scroll-mode 1)

;;
;; Modeline modules
;;

(require 'time)
(setq display-time-format "%Y-%m-%d %H:%M")
(display-time-mode 1) ; display time in modeline

(let ((battery-str (battery)))
  (unless (or (equal "Battery status not available" battery-str)
              (string-match-p (regexp-quote "N/A") battery-str))
    (display-battery-mode 1)))

;; Turn off the scratch message
(setq-default initial-scratch-message nil)

;; If we delete a file, we want it moved to the trash, not simply deleted.
(setq delete-by-moving-to-trash t)

(setq-default scroll-up-aggressively 0.01
              scroll-down-aggressively 0.01)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

(show-paren-mode t)

;;
;; Packages
;;

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(require 'use-package)

(use-package evil
	:ensure t
	:config
	(evil-mode)
	(evil-set-undo-system 'undo-redo))

(global-set-key (kbd "C-u") #'evil-scroll-up)
(global-set-key (kbd "C-d") #'evil-scroll-down)

;; Cursor
(setq evil-insert-state-cursor '((bar . 2) "orange")
      evil-normal-state-cursor '(box "orange"))

(use-package general
  :ensure t
  :after evil
  :init
  (general-auto-unbind-keys)
  :config
  (general-create-definer thanglemon/underfine
    :keymaps 'override
    :states '(normal emacs))
  (general-create-definer thanglemon/evil
    :states '(normal))
  (general-create-definer thanglemon/leader-key
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC")
  (general-create-definer thanglemon/major-leader-key
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix ","
    :global-prefix "M-m"))

 (thanglemon/evil
    :packages '(counsel)
    "K"   #'eldoc-doc-buffer
    "U"   #'evil-redo
    "C-h" #'my-smarter-move-beginning-of-line
    "C-l" #'end-of-line)

(use-package popwin
	:ensure t)

(with-eval-after-load 'popwin
  (thanglemon/leader-key
    "oe" '(+popwin:eshell :wk "Eshell popup")
    "oE" '(eshell :wk "Eshell"))
  (defun +popwin:eshell ()
    (interactive)
    (popwin:display-buffer-1
     (or (get-buffer "*eshell*")
         (save-window-excursion
           (call-interactively 'eshell)))
     :default-config-keywords '(:position :bottom :height 14))))

(use-package vterm
  :ensure t
  :defer t
  :general
   (thanglemon/leader-key
    "ot" '(+popwin:vterm :wk "vTerm popup")
    "oT" '(vterm :wk "vTerm"))
   :preface
   (when noninteractive
     (advice-add #'vterm-module-compile :override #'ignore)
     (provide 'vterm-module))
   :custom
   (vterm-max-scrollback 5000)
   :config
   (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *")  ;; Set this to match your custom shell prompt
   (setq vterm-shell "fish")                       ;; Set this to customize the shell to launch
   (setq vterm-max-scrollback 10000)

   (with-eval-after-load 'popwin
     (defun +popwin:vterm ()
       (interactive)
       (popwin:display-buffer-1
        (or (get-buffer "*vterm*")
            (save-window-excursion
              (call-interactively 'vterm)))
        :default-config-keywords '(:position :bottom :height 14)))))

(use-package multi-vterm
  :ensure t
  :after vterm
  :defer t
  :general
  (thanglemon/major-leader-key
    :packages '(vterm multi-vterm)
    :keymap 'vterm-mode-map
    "c" #'multi-vterm
    "j" #'multi-vterm-next
    "k" #'multi-vterm-prev))

;; (use-package spacemacs-theme :ensure t)
(load-theme 'spacemacs-light t)

;; Tab
(use-package tab-bar
	:ensure t)

(use-package spinner
	:ensure t)

;; Expand text, text in double quote or the whole file
(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-'") 'er/expand-region))

;;
;; Transparency
;;

(defvar lauremacs-state//opacity 85
	"The value used as opacity when transparency is enabled.")

;;;###autoload
(defun lauremacs/toggle-transparency ()
	"Toggle transparency between alpha = `lauremacs-state//opacity' and 100."
	(interactive)
	(let* ((frame (selected-frame))
				 (current-alpha (or (car (frame-parameter frame
																								 'alpha)) 100))
				(new-alpha (if (= current-alpha 100) lauremacs-state//opacity 100)))
		(set-frame-parameter frame 'alpha
												 (cons new-alpha new-alpha))))

;;;###autoload
(defun lauremacs/set-transparency (&optional opacity)
	"Set transparency to OPACITY.
The default value is `lauremacs-state//opacity'."
	(interactive "nInsert alpha from 20 to 100: ")
	(throw-unless (if (bool opacity) (numberp opacity) t) "OPACITY should be a number")
	(let* ((alpha (or opacity lauremacs-state//opacity))
				 (new-alpha (min (max alpha 20) 100))
				(frame (selected-frame)))
		(set-frame-parameter frame 'alpha
												 (cons new-alpha new-alpha))
		(message (format "Transparency set to %s" new-alpha))))
;;
;; SQL mode
;;

;; (use-package sql
;; 	:ensure t
;; 	:mode ("\\.sql\\'" . sql-mode)
;; 	:hook ((sql-mode . lsp-deferred)
;; 				 (sql-mode . sqlind-minor-mode)
;; 				 (sql-interactive-mode . (lambda () (toggle-truncate-lines 1))))
;; 	:init
;; 	(require 'sqlau)
;; 	(require-without-throw 'sql-private)
;; 	(thanglemon/leader-key
;; 		:keymaps 'sql-mode-map
;; 		"s"  '(nil :which-key "repl")
;; 		"sb" '(sql-send-buffer              :which-key "send buffer to repl")
;; 		"sf" '(sql-send-paragraph           :which-key "send paragraph to repl")
;; 		"sr" '(sql-send-region              :which-key "send region to repl")
;; 		"sB" '(sql-send-buffer-and-focus    :which-key "send buffer repl and focus")
;; 		"sF" '(sql-send-paragraph-and-focus :which-key "send paragraph and focus")
;; 		"sR" '(sql-send-region-and-focus    :which-key "send region and focus")
;; 		"ss" '(sql-show-sqli-buffer         :which-key "show sqli buffer")
;; 		"c"  '(nil :which-key "connection")
;; 	  "cc" '(sql-connect                  :which-key "sql connect")
;; 		"cb" '(sql-set-sqli-buffer          :which-key "set sqli buffer")
;; 		"l"  '(nil :which-key "lsp functions")
;; 		"ls" '(lsp-sql-switch-connection    :which-key "switch connections")
;; 		"==" '(sqlfmt-buffer                :which-key "format buffer")
;; 		"=r" '(sqlfmt-region                :which-key "format region")))

;; (use-package sql-indent
;; 	:ensure t
;; 	:after sql)

;;
;; Tabbar
;;

(use-package tab-bar-groups
  :ensure t
  :config
  (tab-bar-groups-activate))

;;
;; Yasnippet
;;

(use-package yasnippet
  :ensure t
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas-global-mode 1))

;; (use-package simple-modeline
;;   :ensure t
;;   :hook (after-init . simple-modeline-mode))

;;
;; Doom modeline
;;

(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1)

  (doom-modeline-def-modeline 'lauremacs-modeline
    '(bar window-number buffer-info matches selection-info media-info)
    '(checker lsp word-count pdf-pages major-mode workspace-name vcs hud buffer-position))

  (doom-modeline-set-modeline 'lauremacs-modeline 'default)
  
  :custom
  (doom-modeline-buffer-file-name-style 'file-name)
  (doom-modeline-enable-word-count t)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode emacs-lisp-mode)))

;; (use-package minions
;;   :ensure t
;;   :config
;;   (setq minions-mode-line-lighter ""
;;         minions-mode-line-delimiters '("" . ""))
;;   (minions-mode 1))

(use-package projectile
  :ensure t
  :config
  ;; (define-key projectile-mode-map (kbd "C-p") 'projectile-find-file)
  (projectile-mode +1))

(define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)

;; Dired
(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; Org Mode Configuration ------------------------------------------------------

(defun efs/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
	(org-indent-mode t)

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "FiraCode Nerd Font" :weight 'regular :height (cdr face))))

;; Src block
(use-package org
  :hook (org-mode . efs/org-font-setup)
  :custom					;
  (org-ellipsis " ⤵")
  (org-hide-emphasis-markers t)
  :config
  (setq org-cycle-separator-lines 2
        org-src-fontify-natively t
        org-src-tab-acts-natively t
        org-src-preserve-indentation nil))

;; Org babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((js . t)
	 (python . t)
	 (shell . t)
))

(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("js" . "src js"))
(add-to-list 'org-structure-template-alist '("shell" . "src shell"))
(add-to-list 'org-structure-template-alist '("http" . "src restclient"))

;; Prettify
(defun prog-mode-set-symbols-alist ()
  (setq prettify-symbols-alist '(("lambda"  . ?λ)
                                 ("null"    . ?∅)
                                 ("nil"    . ?∅)
                                 ("NULL"    . ?∅)
																 ("<=" . "≤")
																 ("!=" . "≠")
																 ("=>" . "⇒")
																 ("<=" . "⇐")
																 ("->" . "→")
																 ("<-" . "←")))
  (prettify-symbols-mode 1))

(add-hook 'prog-mode-hook #'prog-mode-set-symbols-alist)

;; Magit
;; (use-package magit
;;   :ensure t
;;   :bind (
;; 	 ("C-x g" . magit-status)))

(use-package magit
	:ensure t
  :defer t
  :init
  (setq forge-add-default-bindings nil)
  :config
  (setq magit-clone-default-directory "~/fromGIT/"
         magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)
  (with-eval-after-load 'evil-collection
    (dqv/evil
      :packages '(evil-collection magit)
      :keymaps '(magit-mode-map magit-log-mode-map magit-status-mode-map)
      :states 'normal
      "t" #'magit-tag
      "s" #'magit-stage))
  :general
  (:keymaps '(git-rebase-mode-map)
   :packages 'magit
   "C-j" #'evil-next-line
   "C-k" #'evil-previous-line)
  (dqv/major-leader-key
    :keymaps 'git-rebase-mode-map
    :packages 'magit
    "," #'with-editor-finish
    "k" #'with-editor-cancel
    "a" #'with-editor-cancel)
  (dqv/leader-key
    :infix   "g"
    :packages 'magit
    ""   '(:ignore t :wk "git")
    "b"  #'magit-blame
    "c"  #'magit-clone
    "d"  #'magit-dispatch
    "i"  #'magit-init
    "s"  #'magit-status
    "y"  #'my/yadm
    "S"  #'magit-stage-file
    "U"  #'magit-unstage-file
    "f"  '(:ignore t :wk "file")
    "fd" #'magit-diff
    "fc" #'magit-file-checkout
    "fl" #'magit-file-dispatch
    "fF" #'magit-find-file))

;; Commentary
(use-package evil-nerd-commenter
  :ensure t
  :after evil)

(global-set-key (kbd "s-/") #'evilnc-comment-or-uncomment-lines)

;; Undo history advanced
;; (use-package undo-tree
;;   :ensure t
;;   :init
;;   (global-undo-tree-mode))

;; Devops
(use-package yaml-mode :ensure t)

(use-package toml-mode :ensure t)

(use-package dockerfile-mode :ensure t)

(use-package smartparens
  :ensure t
  :defer t
  :hook (prog-mode . smartparens-mode))

(use-package rainbow-delimiters
  :ensure t)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Move text
(use-package move-text
  :ensure t)

;; Command keys
(global-set-key (kbd "s-j") #'move-text-down)
(global-set-key (kbd "s-k") #'move-text-up)

(use-package cfrs
  :ensure t)

;; Avy
(use-package avy
  :ensure t
  :bind ("C-;" . avy-goto-char))

(use-package hydra
  :ensure t)

(defhydra windows-adjust-size ()
  "
^Zoom^                                ^Other
^^^^^^^-----------------------------------------
[_j_/_k_] shrink/enlarge vertically   [_q_] quit
[_h_/_l_] shrink/enlarge horizontally
"
  ("q" nil :exit t)
  ("h" shrink-window-horizontally)
  ("j" enlarge-window)
  ("k" shrink-window)
  ("l" enlarge-window-horizontally))

(use-package which-key
  :ensure t
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
	(setq which-key-idle-delay 0.3))

;; General keybindins
;; Jump out of the surrounding
(global-set-key (kbd "C-l") #'sp-forward-sexp)

;; Code completion

(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :bind (:map company-active-map
              ("<tab>" . company-complete-selection))
	:config
	(setq company-minimum-prefix-length     2
	      company-idle-delay 0.0
        company-minimum-prefix-length 1
        company-toolsip-limit             14
        company-tooltip-align-annotations t
        company-require-match             'never
        company-global-modes              '(not erc-mode message-mode help-mode gud-mode)
        company-frontends
        '(company-pseudo-tooltip-frontend ; always show candidates in overlay tooltip
          company-echo-metadata-frontend) ; show selected candidate docs in echo area
        company-backends '(company-capf)
        company-auto-commit         nil
        company-auto-complete-chars nil
        company-dabbrev-other-buffers nil
        company-dabbrev-ignore-case nil
        company-dabbrev-downcase    nil))

(use-package company-box
  :ensure t
  :after (company all-the-icons)
  :config
  (setq company-box-show-single-candidate t
        company-box-backends-colors       nil
        company-box-max-candidates        50
        company-box-icons-alist           'company-box-icons-all-the-icons
        company-box-icons-all-the-icons
        (let ((all-the-icons-scale-factor 0.8))
          `(
            (Unknown . ,(all-the-icons-material "find_in_page" :face 'all-the-icons-purple))
            (Text . ,(all-the-icons-material "text_fields" :face 'all-the-icons-green))
            (Method . ,(all-the-icons-material "functions" :face 'all-the-icons-red))
            (Function . ,(all-the-icons-material "functions" :face 'all-the-icons-red))
            (Constructor . ,(all-the-icons-material "functions" :face 'all-the-icons-red))
            (Field . ,(all-the-icons-material "functions" :face 'all-the-icons-red))
            (Variable . ,(all-the-icons-material "adjust" :face 'all-the-icons-blue))
            (Class . ,(all-the-icons-material "class" :face 'all-the-icons-red))
            (Interface . ,(all-the-icons-material "settings_input_component" :face 'all-the-icons-red))
            (Module . ,(all-the-icons-material "view_module" :face 'all-the-icons-red))
            (Property . ,(all-the-icons-material "settings" :face 'all-the-icons-red))
            (Unit . ,(all-the-icons-material "straighten" :face 'all-the-icons-red))
            (Value . ,(all-the-icons-material "filter_1" :face 'all-the-icons-red))
            (Enum . ,(all-the-icons-material "plus_one" :face 'all-the-icons-red))
            (Keyword . ,(all-the-icons-material "filter_center_focus" :face 'all-the-icons-red))
            (Snippet . ,(all-the-icons-material "short_text" :face 'all-the-icons-red))
            (Color . ,(all-the-icons-material "color_lens" :face 'all-the-icons-red))
            (File . ,(all-the-icons-material "insert_drive_file" :face 'all-the-icons-red))
            (Reference . ,(all-the-icons-material "collections_bookmark" :face 'all-the-icons-red))
            (Folder . ,(all-the-icons-material "folder" :face 'all-the-icons-red))
            (EnumMember . ,(all-the-icons-material "people" :face 'all-the-icons-red))
            (Constant . ,(all-the-icons-material "pause_circle_filled" :face 'all-the-icons-red))
            (Struct . ,(all-the-icons-material "streetview" :face 'all-the-icons-red))
            (Event . ,(all-the-icons-material "event" :face 'all-the-icons-red))
            (Operator . ,(all-the-icons-material "control_point" :face 'all-the-icons-red))
            (TypeParameter . ,(all-the-icons-material "class" :face 'all-the-icons-red))
            (Template . ,(all-the-icons-material "short_text" :face 'all-the-icons-green))
            (ElispFunction . ,(all-the-icons-material "functions" :face 'all-the-icons-red))
            (ElispVariable . ,(all-the-icons-material "check_circle" :face 'all-the-icons-blue))
            (ElispFeature . ,(all-the-icons-material "stars" :face 'all-the-icons-orange))
            (ElispFace . ,(all-the-icons-material "format_paint" :face 'all-the-icons-pink))
            ))))

(use-package eldoc
  :delight
  :hook (prog-mode . eldoc-mode)
  :custom
  (eldoc-idle-delay 0.5))

;; Turn on the company mode for all of the languages
(add-hook 'after-init-hook 'global-company-mode)

(use-package ligature
	:ensure t
  :config
  (ligature-set-ligatures 't
                          '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures '(eww-mode org-mode elfeed-show-mode)
                          '("ff" "fi" "ffi"))
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode
                          '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                            ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                            "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                            "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                            "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                            "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                            "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                            "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                            ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                            "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                            "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                            "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                            "\\\\" "://"))
  (global-ligature-mode t))

;; Lsp client
;; Eglot
;; (use-package eglot
;;   :ensure t)

;; Brew command to install lsp: brew install ccls
;; (add-to-list 'eglot-server-programs '((c++-mode c-mode) "ccls"))

;; (add-hook 'c-mode-hook 'eglot-ensure)
;; (add-hook 'c++-mode-hook 'eglot-ensure)

;; Require gopls
;; (add-hook 'go-mode-hook 'eglot-ensure)

;; Require rust-analyzer
;; Masos install using homebrew: brew install rust-analyzer
;; (add-hook 'rust-mode-hook 'eglot-ensure)

;; Added some of the essentials path variables for emacs enviroment
(use-package exec-path-from-shell
  :ensure t
  :defer t
  :init (exec-path-from-shell-initialize))

;; Typecheck (Diagnostics)

(use-package flycheck
  :ensure t
  :defer t
  :init
  (global-flycheck-mode)

	;; Customize flycheck icons
  (set-face-attribute 'flycheck-fringe-info nil
                      :background "#3a81c3"
                      :foreground "white")
  
  (set-face-attribute 'flycheck-fringe-error nil
                      :background "#e0211d"
                      :foreground "white")
  
  (set-face-attribute 'flycheck-fringe-warning nil
                      :background "#dc752f"
                      :foreground "white")

  :config
  (setq flycheck-emacs-lisp-load-path 'inherit)

  ;; Rerunning checks on every newline is a mote excessive.
  (delq 'new-line flycheck-check-syntax-automatically)
  ;; And don’t recheck on idle as often
  (setq flycheck-idle-change-delay 2.0)

  ;; For the above functionality, check syntax in a buffer that you
  ;; switched to on briefly. This allows “refreshing” the syntax check
  ;; state for several buffers quickly after e.g. changing a config
  ;; file.
  (setq flycheck-buffer-switch-check-intermediate-buffers t)

  ;; Display errors a little quicker (default is 0.9s)
  (setq flycheck-display-errors-delay 0.2))


(use-package flycheck-popup-tip
  :ensure t
  :after (flycheck evil)
  :hook (flycheck-mode . flycheck-popup-tip-mode)
  :config
  (setq flycheck-popup-tip-error-prefix "X ")
  (with-eval-after-load 'evil
    (add-hook 'evil-insert-state-entry-hook
              #'flycheck-popup-tip-delete-popup)
    (add-hook 'evil-replace-state-entry-hook
              #'flycheck-popup-tip-delete-popup)))

;; (use-package flycheck-pos-tip
;;   :disabled
;;   :after flycheck
;;   :hook (flycheck-mode . flycheck-pos-tip-mode))

;; Show indicate error in the right bar
(setq-default flycheck-indication-mode 'left-margin)
(add-hook 'flycheck-mode-hook #'flycheck-set-indication-mode)


;; Status flycheck icons
(use-package flycheck-indicator
	:ensure t
  :after flycheck
  :hook (flycheck-mode . flycheck-indicator-mode)
  :custom
  (flycheck-indicator-icon-error 9632)
  (flycheck-indicator-icon-info 9679)
  (flycheck-indicator-icon-warning 9650)
  (flycheck-indicator-status-icons
  '((running . "◉")
     (errored . "◙")
     (finished . "●")
     (interrupted . "◘")
     (suspicious . "◘")
     (not-checked . "○"))))

(use-package flycheck-posframe
  :ensure t
  :hook (flycheck-mode . flycheck-posframe-mode)
  :config
  (setq flycheck-posframe-warning-prefix "! "
        flycheck-posframe-info-prefix    "··· "
        flycheck-posframe-error-prefix   "X "))

(use-package highlight-indentation
	:ensure t
	:init
  (highlight-indentation-mode 1))
;; (add-hook 'lsp-mode-hook #'highlight-indentation-mode)

;; Backend staff
(use-package restclient
	:ensure t)

;;
;; Solidity
;;

(use-package solidity-mode
	:ensure t) 

;; HTML

;; Prerequisite
;; sudo npm install -g vscode-langservers-extracted
;; Css/Scss
(use-package css-mode
  :ensure t
  :defer t
  :hook (css-mode . smartparens-mode)
  :hook (css-mode . lsp-deferred)
  :hook (css-mode . prettier-js-mode)
  :init
  (put 'css-indent-offset 'safe-local-variable #'integerp)
  :general
  (thanglemon/major-leader-key
    :keymaps 'css-mode-map
    :packages 'css-mode
    "=" '(:ignore :wk "format")
    "g" '(:ignore :wk "goto")))

(use-package scss-mode
  :ensure t
  :hook (scss-mode . smartparens-mode)
  :hook (scss-mode . lsp-deferred)
  :hook (scss-mode . prettier-js-mode)
  :defer t
  :mode "\\.scss\\'")

;; Modes
(use-package rjsx-mode
  :ensure t
  :mode "\\.js\\'")

(use-package typescript-mode
  :ensure t
  :after flycheck
  :hook (typescript-tsx-mode . lsp-mode)
  :config
  (add-to-list 'auto-mode-alist '("\\.tsx.*$" . typescript-mode))
  (add-to-list 'auto-mode-alist '("\\.ts.*$" . typescript-mode)))

(use-package lsp-ui
  :after lsp-mode
  :ensure t
  :commands lsp-ui-mode)

(global-set-key (kbd "C-k") #'lsp-ui-doc-toggle)

;; lsp-mode
(setq lsp-log-io nil) ;; Don't log everything = speed
(setq lsp-keymap-prefix "C-c l")
(setq lsp-restart 'auto-restart)
(setq lsp-ui-sideline-show-diagnostics t)
;; (setq lsp-ui-sideline-show-hover t)
(setq lsp-ui-sideline-show-code-actions t)


;; Thansk to lauremacs
;;;###autoload
(defun lauremacs/lsp-organize-imports-before-save ()
	"Run `lsp-organize-imports' before save."
	(when (bound-and-true-p lsp-mode)
		(if (lsp-organize-imports)
				(message "Organized imports!")
			(message "Didn't organize imports")))
	t)

(use-package lsp-mode
  :ensure t
  :hook (
				 (rustic-mode . lsp-deferred)
				 (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp-deferred
  :config
	(add-hook 'before-save-hook 'lauremacs/lsp-organize-imports-before-save)
  (setq lsp-headerline-breadcrumb-enable t)
	(setq lsp-auto-guess-root t)
	:init
	(setq lsp-use-workspace-root-for-server-default-directory t))

(setq lsp-keymap-prefix "C-c l")

																				; Stay Clean, Emacs!
																				; Save the backup files to the directory .tmp/backups/
(setq backup-directory-alist `(("." . ,(expand-file-name ".tmp/backups/"
                                                         user-emacs-directory))))
;; Highlight the parenthese
;; (use-package paren
;;   :ensure t
;;   :init
;;   (show-paren-mode 1)
;;   :config
;;   (setq show-paren-style 'parenthesses)
;;   :custom-face
;;   (show-paren-match ((t(:background "none" :foreground "red")))))

;;
;; Show paren mode
;;

(use-package paren
	:ensure t
  :commands show-paren-mode
  :hook (prog-mode . show-paren-mode)
  :init
  (set-face-attribute 'show-paren-mismatch nil
                      :background "red"
                      :foreground "black"
                      :underline nil)
  (set-face-attribute 'show-paren-match nil
                      :background "#c93360"
                      :foreground "#f4d6df"
                      :underline nil))

;;
;; Prettier
;;

(use-package prettier-js
  :ensure t
  :defer t
  :after (rjsx-mode typescript-mode)
  :hook (js-mode . prettier-js-mode)
  :config
  (setq prettier-js-args '("--trailing-comma" "all" "--bracket-spacing" "true")))

;; Rust
;; If the lsp error failed can not load workspace and then run these command: lsp-workspace-folders-remove, lsp
(use-package rustic
  :ensure t
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))
  :config
  ;; uncomment for less flashiness
  ;; (setq lsp-eldoc-hook nil)
  ;; (setq lsp-enable-symbol-highlighting nil)
  ;; (setq lsp-signature-auto-activate nil)

  ;; comment to disable rustfmt on save
  (setq rustic-format-on-save t)
  (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))

(defun rk/rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm, but don't try to
  ;; save rust buffers that are not file visiting. Once
  ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
  ;; no longer be necessary.
  (when buffer-file-name
    (setq-local buffer-save-without-query t))
  (add-hook 'before-save-hook 'lsp-format-buffer nil t))

(use-package go-mode
  :ensure t
  :mode "//.go$"
  :interpreter "go"
  :config
  (setq gofmt-command "goimports")
  (if (not (executable-find "goimports"))
      (warn "go-mode: counld'n find goimports; no code formatting/fixed imports on save")
    (add-hook 'before-save-hook 'gofmt-before-save))
  (if (not (string-match "go" compile-command))	; set compile command default
      (set (make-local-variable 'compile-command)
	   "go build -v && go test -v && go vet")))

(use-package guru-mode
  :ensure t)

  (use-package go-guru
    :ensure t
    :commands (go-guru-expand-region)
    )

;; Automatically trigger the js-mode when open a js,ts or tsx file
(add-hook 'go-mode-hook #'lsp)
(add-hook 'js-mode-hook #'lsp)
(add-hook 'js-mode-hook #'prettier-js-mode)
(add-hook 'typescript-mode-hook #'prettier-js-mode)
(add-hook 'typescript-mode-hook #'lsp)
(add-hook 'typescript-mode-hook #'rjsx-mode)

(use-package all-the-icons
  :ensure t)

;; (use-package treemacs
;;   :ensure t)

;; (use-package treemacs-evil
;;   :ensure t)

;; (use-package centaur-tabs
;;   :ensure t
;;   :demand
;;   :config
;;   (setq centaur-tabs-set-bar 'over
;;         centaur-tabs-set-icons t
;;         centaur-tabs-gray-out-icons 'buffer
;;         centaur-tabs-height 24
;;         centaur-tabs-set-modified-marker t
;;         centaur-tabs-modified-marker "•")
;;   (centaur-tabs-headline-match)
;;   (centaur-tabs-mode t))

(use-package engine-mode
  :ensure t
  :config
  (engine/set-keymap-prefix (kbd "C-c s"))
  (setq browse-url-browser-function 'browse-url-default-macosx-browser
        engine/browser-function 'browse-url-default-macosx-browser)

  (defengine duckduckgo
    "https://duckduckgo.com/?q=%s"
    :keybinding "d")

  (defengine github
    "https://github.com/search?ref=simplesearch&q=%s"
    :keybinding "1")

  (defengine gitlab
    "https://gitlab.com/search?search=%s&group_id=&project_id=&snippets=false&repository_ref=&nav_source=navbar"
    :keybinding "2")

  (defengine stack-overflow
    "https://stackoverflow.com/search?q=%s"
    :keybinding "s")

  (defengine npm
    "https://www.npmjs.com/search?q=%s"
    :keybinding "n")

  (defengine crates
    "https://crates.io/search?q=%s"
    :keybinding "c")

  (defengine localhost
    "http://localhost:%s"
    :keybinding "l")

  (defengine cambridge
    "https://dictionary.cambridge.org/dictionary/english/%s"
    :keybinding "t")

  (defengine translate
    "https://translate.google.com/?hl=vi&sl=en&tl=vi&text=%s&op=translate"
    :keybinding "T")

  (defengine youtube
    "http://www.youtube.com/results?aq=f&oq=&search_query=%s"
    :keybinding "y")

  (defengine google
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
    :keybinding "g")

  (engine-mode t))

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-items '((recents . 10)))
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
	(setq dashboard-center-content nil)
	(setq dashboard-set-navigator t)
  (setq dashboard-banner-logo-title "T H A N G L E M O N")
  (setq dashboard-footer-messages '("Made with love"))
  (setq dashboard-startup-banner "~/.emacs.d/banners/squirrel.gif")
  (setq dashboard-footer-icon
	(if (display-graphic-p)
	    (all-the-icons-faicon "heart"
				  :height 1.1
				  :v-adjust -0.05
				  :face 'font-lock-keyword-face)
	  "♥"))
  (dashboard-setup-startup-hook)
  :init
  (add-hook 'emacs-startup-hook 'dashboard-refresh-buffer))

;; Adding more useful staff for searching file features
(use-package marginalia
	:ensure t
	:config
	(marginalia-mode))

(use-package ivy :ensure t)

;; Center popup window (Good for you neck haha)
(use-package ivy-posframe
  :ensure t
  :after ivy
  :custom
  (ivy-posframe-width 70)
  (ivy-posframe-height 15)
  (ivy-posframe-border-width 4)
  :config
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
  (ivy-posframe-mode 1))

(use-package counsel
  :ensure t)

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)
	 ("C-x C-f".  counsel-find-file)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
  ))

;; Languagess server for emacs
(use-package paredit :ensure t)

(add-hook 'emacs-lisp-mode-hook 'paredit-mode)


;; (use-package zenburn-theme
;;   :ensure t)

;; (load-theme 'zenburn t)


(thanglemon/leader-key
  "SPC" '(counsel-M-x :wk "M-x")
  "."  '(dired-jump :which-key "Dired Jump")
  ","   #'magit-status

	;; Files
  "f" '(:ignore t :wk "Files")
  "fr" #'lauremacs-ide-lsp-ts-rename-file

	;; Tab bar
  "g" '(:ignore t :wk "Tab bar")
  "g2" #'tab-bar-groups-new-tab
  "gr" #'tab-bar-groups-rename-group
  "gp" #'tab-bar-switch-to-prev-tab
  "gn" #'tab-bar-switch-to-next-tab
  ;; Windows

  "w" '(:ignore t :wk "windows")
  "wh" #'evil-window-left
  "wj" #'evil-window-down
  "wk" #'evil-window-up
  "wl" #'evil-window-right
	"w." #'windows-adjust-size/body
  "ws" #'split-window-below-and-focus
  "wv" #'split-window-right-and-focus
  "w0" '(winum-select-window-0-or-10 :wk t)
  "w1" '(winum-select-window-1 :wk t)
  "w2" '(winum-select-window-2 :wk t)
  "w3" '(winum-select-window-3 :wk t)
  "w4" '(winum-select-window-4 :wk t)
  "w5" '(winum-select-window-5 :wk t)
  "w6" '(winum-select-window-6 :wk t)
  "w7" '(winum-select-window-7 :wk t)
  "w8" '(winum-select-window-8 :wk t)
  "w9" '(winum-select-window-9 :wk t)
  "wc" #'kill-buffer-and-delete-window
  "wd" #'delete-window
  "wo" #'delete-other-windows

  "aC" #'calendar

  ;; Tab bar
  ;; "t" '(:ignore t :wk "Tabs")
  ;; "tp" #'centaur-tabs-backward
  ;; "tn" #'centaur-tabs-forward

  ;; Treemacs
  "m" '(:ignore t :wk "treemacs")
  "mc" '(:ignore t :wk "create")
  "mcd" #'treemacs-create-dir
  "mcf" #'treemacs-create-file
  "mci" #'treemacs-create-icon
  "mct" #'treemacs-create-theme
  "md" #'treemacs-delete-file
  "mw" '(:ignore t :wk "wordspace")
  "mws" #'treemacs-switch-workspace
  "mwc" #'treemacs-create-workspace
  "mwr" #'treemacs-remove-workspace
  "mf" '(:ignore t :wk "files")
  "mff" #'treemacs-find-file
  "mft" #'treemacs-find-tag
  "ml" '(:ignore t :wk "lsp")
  "mls" #'treemacs-expand-lsp-symbol
  "mld" #'treemacs-expand-lsp-treemacs-deps
  "mlD" #'treemacs-collapse-lsp-treemacs-deps
  "mlS" #'tre
  "mp" '(:ignore t :wk "projects")
  "mpa" #'treemacs-add-project
  "mpf" #'treemacs-project-follow-mode
  "mpn" #'treemacs-project-of-node
  "mpp" #'treemacs-project-at-point
  "mpr" #'treemacs-remove-project-from-workspace
  "mpt" #'treemacs-move-project-down
  "mps" #'treemacs-move-project-up
  "mr" '(:ignore t :wk "rename")
  "mrf" #'treemacs-rename-file
  "mrp" #'treemacs-rename-project
  "mrr" #'treemacs-rename
  "mrw" #'treemacs-rename-workspace
  "mt" #'treemacs
  "mT" '(:ignore t :wk "toggles")
  "mTd" #'treemacs-toggle-show-dotfil
  "mTn" #'treemacs-toggle-node
  "mv" '(:ignore t :wk "visit node")
  "mva" #'treemacs-visit-node-ace
  "mvc" #'treemacs-visit-node-close-treemacs
  "mvn" #'treemacs-visit-node-default
  "my" '(:ignore t :wk "yank")
  "mya" #'treemacs-copy-absolute-path-at-point
  "myp" #'treemacs-copy-project-path-at-point
  "myr" #'treemacs-copy-relative-path-at-point
  "myf" #'treemacs-copy-file

  "e"  '(:ignore t :which-key "errors")
  "e." '(hydra-flycheck/body :wk "hydra"))

(defhydra hydra-flycheck
  (:pre (flycheck-list-errors)
	:post (quit-windows-on "*Flycheck errors*")
	:hint nil)
  ("f" flycheck-error-list-set-filter "Filter")
  ("n" flycheck-next-error "Next")
  ("p" flycheck-previous-error "Previous")
  ("gg" flycheck-first-error "First")
  ("G" (progn (goto-char (point-max)) (flycheck-previous-error)) "Last")
  ("q" nil))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
	 '("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "3c451787cee570710bff441154a7db8b644cdbb7d270189b2724c6041a262381" default))
 '(package-selected-packages '(evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
