(setq user-full-name "Phan Tan Thang")

(setq inhibit-startup-message t)

;; Better simple ui
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(setq create-lockfiles -1)
(set-fringe-mode -1)
(global-hl-line-mode -1)
(blink-cursor-mode 0)
(global-display-line-numbers-mode t)

;; Better handling for files with so long lines
(global-so-long-mode 1)

;; initial threshold

(setq gc-cons-threshold (* 100 1024 1024)
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      read-process-output-max (* 1024 1024)
      create-lockfiles nil) ;; lock files will kill `npm start'

;; (defun efs/display-startup-time ()
;;   (message "Emacs loaded in %s with %d garbage collections."
;;            (format "%.2f seconds"
;;                    (float-time
;;                     (time-subtract after-init-time before-init-time)))
;;            gcs-done))

;; (add-hook 'emacs-startup-hook #'efs/display-startup-time)
;; Customize function

;; Custom functions

(defun my-smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.
       Move point to the first non-whitespace character on this line.
       If point is already there, move to the beginning of the line.
       Effectively toggle between the first non-whitespace character and
       the beginning of the line.
       If ARG is not nil or 1, move forward ARG - 1 lines first.  If
       point reaches the beginning or end of the buffer, stop there."
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

;; Handle new windows
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

;; Scrolling
(setq hscroll-step 1
      hscroll-margin 0
      scroll-step 1
      scroll-margin 0
      scroll-conservatively 101
      scroll-preserve-screen-position 'always
      auto-window-vscroll nil
      fast-but-imprecise-scrolling t)
(pixel-scroll-mode 1)

;; Battery
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

(set-face-attribute 'default nil :font "Inconsolata" :height 180)
;; (set-face-background 'hl-line "#3e4446")

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

(show-paren-mode t)

;; Packages

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(require 'use-package)

(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil

(require 'evil)
(evil-mode 1)

;; Cursor
;; (setq evil-insert-state-cursor '((bar . 2) "orange")
;;       evil-normal-state-cursor '(box "orange"))

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
    "C-a" #'my-smarter-move-beginning-of-line
    "C-e" #'end-of-line)

;; Terminal
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

;; Expand text, text in double quote or the whole file
(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

;; Yasnippet
(use-package yasnippet
  :ensure t
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas-global-mode 1))

;; Statusline
(use-package doom-modeline
  :ensure t
  :defer t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 15
         doom-modeline-enable-word-count t
         doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode)
         doom-modeline-env-version t))

;; Dired
(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

;; Org-mode stuff
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; Prettify
(defun prog-mode-set-symbols-alist ()
  (setq prettify-symbols-alist '(("lambda"  . ?λ)
                                 ("null"    . ?∅)
                                 ("nil"    . ?∅)
                                 ("NULL"    . ?∅)))
  (prettify-symbols-mode 1))

(add-hook 'prog-mode-hook #'prog-mode-set-symbols-alist)

;; Magit
(use-package magit
  :ensure t
  :bind (
	 ("C-x g" . magit-status)))

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

(use-package dockerfile-mode :ensure t)

(use-package smartparens
  :ensure t
  :defer t
  :hook (prog-mode . smartparens-mode))

;; Move text
(use-package move-text
  :ensure t)

;; Command keys
(global-set-key (kbd "s-j") #'move-text-down)
(global-set-key (kbd "s-k") #'move-text-up)

;; Avy
(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

(use-package hydra
  :ensure t)

(use-package which-key
  :ensure t
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode))

;; General keybindins
;; Jump out of the surrounding
(global-set-key (kbd "C-l") #'sp-forward-sexp)

;; Code completion

(use-package company
  :ensure t)

;; Turn on the company mode for all of the languages
(add-hook 'after-init-hook 'global-company-mode)

;; Lsp client
;; Eglot
(use-package eglot
  :ensure t)

;; Brew command to install lsp: brew install ccls
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "ccls"))

(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

;; Require gopls
(add-hook 'go-mode-hook 'eglot-ensure)

;; Require rust-analyzer
;; Masos install using homebrew: brew install rust-analyzer
(add-hook 'rust-mode-hook 'eglot-ensure)

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

;; (use-package flycheck-posframe
;;   :ensure t
;;   :hook (flycheck-mode . flycheck-posframe-mode)
;;   :config
;;   (setq flycheck-posframe-warning-prefix "! "
;;         flycheck-posframe-info-prefix    "··· "
;;         flycheck-posframe-error-prefix   "X "))

;; Show indicate error in the right bar
(setq-default flycheck-indication-mode 'left-margin)
(add-hook 'flycheck-mode-hook #'flycheck-set-indication-mode)

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

(defun setup-tide-mode()
  "Setup function for tide."
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (company-mode +1))

(use-package tide
  :ensure t
  :after (rjsx-mode company flycheck)
  :hook (tide-mode . tide-hl-identifier-mode)
  :hook (rjsx-mode . setup-tide-mode)
  (typescript-mode . setup-tide-mode)
  :general
  (thanglemon/major-leader-key
    :keymaps 'tide-mode-map
    "R"   #'tide-restart-server
    "f"   #'tide-format
    "gd"   #'tide-jump-to-definition
    "rrs" #'tide-rename-symbol
    "roi" #'tide-organize-imports))

(advice-add #'tide-setup :after #'eldoc-mode)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; lsp-mode
(setq lsp-log-io nil) ;; Don't log everything = speed
(setq lsp-keymap-prefix "C-c l")
(setq lsp-restart 'auto-restart)
(setq lsp-ui-sideline-show-diagnostics t)
;; (setq lsp-ui-sideline-show-hover t)
(setq lsp-ui-sideline-show-code-actions t)

(use-package lsp-mode
  :ensure t
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :commands lsp-deferred
  :config
  (setq lsp-headerline-breadcrumb-enable nil))

; Prettier
(use-package prettier-js
  :ensure t
  :defer t
  :after (rjsx-mode typescript-mode)
  :hook (js-mode . prettier-js-mode)
  :config
  (setq prettier-js-args '("--trailing-comma" "all" "--bracket-spacing" "true")))

;; Rust
(use-package rust-mode
  :ensure t)

(use-package go-mode
  :ensure t
  :mode "//.go$"
  :interpreter "go"
  :bind (:map go-mode-map
	      ("C-," . 'hydra-go/body))
  :init (defhydra hydra-go (:hint nil :color teal)
	  "
            ^Command^      ^Imports^     ^Doc^
            ^-------^      ^-------^     ^---^
            _r_: run       _ig_: goto    _d_: doc at point
                           _ia_: add
          ^  ^             _ir_: remove
           "
	  ("r" go-run-main)
	  ("d" godoc-at-point)
	  ("ig" go-goto-imports)
	  ("ia" go-import-add)
	  ("ir" go-remove-unused-imports)
	  ("q" nil "quit" :color blue))
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
(add-hook 'js-mode-hook #'lsp)
(add-hook 'js-mode-hook #'prettier-js-mode)
(add-hook 'typescript-mode-hook #'prettier-js-mode)
(add-hook 'typescript-mode-hook #'lsp)

(use-package all-the-icons
  :ensure t)

(use-package treemacs
  :ensure t)

(use-package treemacs-evil
  :ensure t)

(use-package centaur-tabs
  :ensure t
  :demand
  :config
  (setq centaur-tabs-set-bar 'over
          centaur-tabs-set-icons t
          centaur-tabs-gray-out-icons 'buffer
          centaur-tabs-height 24
          centaur-tabs-set-modified-marker t
          centaur-tabs-modified-marker "•")
  (centaur-tabs-headline-match)
  (centaur-tabs-mode t))

;; (use-package lsp-treemacs
;;   :ensure t 
;;   :defer t
;;   :requires treemacs
;;   :config
;;   (treemacs-resize-icons 15))

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
  (setq dashboard-items '((recents . 15)))
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
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

;; Super search feature


(use-package ido-vertical-mode
  :ensure t
  :init
  (require 'ido)
  (ido-mode t)
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-case-fold nil
        ido-auto-merge-work-directories-length -1
        ido-create-new-buffer 'always
        ido-use-filename-at-point nil
        ido-max-prospects 10)

  (require 'ido-vertical-mode)
  (ido-vertical-mode)

  (require 'dash)

  (defun my/ido-go-straight-home ()
    (interactive)
    (cond
     ((looking-back "~/") (insert "Developments/"))
     ((looking-back "/") (insert "~/"))
     (:else (call-interactively 'self-insert-command))))

  (defun my/setup-ido ()
    ;; Go straight home
    (define-key ido-file-completion-map (kbd "~") 'my/ido-go-straight-home)
    (define-key ido-file-completion-map (kbd "C-~") 'my/ido-go-straight-home))

  (add-hook 'ido-setup-hook 'my/setup-ido)
  (add-to-list 'ido-ignore-directories "node_modules"))

(use-package ivy :ensure t)

(use-package counsel 
  :ensure t)

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)
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

; (use-package spacemacs-theme :ensure t)
;; (load-theme 'spacemacs-light t)

;; Themes
;; (use-package doom-themes
;;  :ensure t
;;  :config
;;  (load-theme 'doom-solarized-dark t))

;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;; (load-theme 'catppuccin t)

;; (setq catppuccin-flavor 'mocha) ;; or 'latte, 'macchiato, or 'mocha
;; (catppuccin-reload)


(use-package zenburn-theme
  :ensure t) 

(load-theme 'zenburn t)

(thanglemon/leader-key
  "SPC" '(counsel-M-x :wk "M-x")
  "."  '(dired-jump :which-key "Dired Jump")
  ","   #'magit-status

  ;; Windows
  "w" '(:ignore t :wk "windows")
  "wh" #'evil-window-left
  "wj" #'evil-window-down
  "wk" #'evil-window-up
  "wl" #'evil-window-right
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
  "t" '(:ignore t :wk "Tabs")
  "tp" #'centaur-tabs-backward
  "tn" #'centaur-tabs-forward

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
  "mlS" #'treemacs-collapse-lsp-symbol
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
  "mTd" #'treemacs-toggle-show-dotfiles
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
