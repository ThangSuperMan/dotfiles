(setq user-full-name "Phan Tan Thang")

(setq inhibit-startup-message t)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode -1)
(global-hl-line-mode -1)

(set-face-attribute 'default nil :font "Inconsolata" :height 200)
;; (set-face-background 'hl-line "#3e4446")

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

(show-paren-mode t)

;; Packages

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(require 'use-package)

;; Languagess server for emacs
(use-package paredit :ensure t)

;; (use-package spacemacs-theme :ensure t)

(load-theme 'spacemacs-light t)

;; Leader Keybinding

(use-package general
  :ensure t
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
  :defer t
  :ensure t
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
  (setq vterm-shell "zsh")                       ;; Set this to customize the shell to launch
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
  :after vterm
  :defer t
  :ensure t
  :general
  (thanglemon/major-leader-key
    :packages '(vterm multi-vterm)
    :keymap 'vterm-mode-map
    "c" #'multi-vterm
    "j" #'multi-vterm-next
    "k" #'multi-vterm-prev))

;; Statusline

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; Reading news

(use-package elfeed
  :ensure t
  :config
  (setq elfeed-feeds
        '("https://planet.emacslife.com/atom.xml"
          "https://sachachua.com/blog/feed/"
          "https://www.macstories.net/feed/"
          "http://karpathy.github.io/feed.xml")))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package evil-nerd-commenter :ensure t)
(global-set-key (kbd "C-c /") #'evilnc-comment-or-uncomment-lines)

;; General keybindins
;; Jump out of the surrounding

(global-set-key (kbd "C-l") #'sp-forward-sexp)
 
;; download Evil

(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil

(require 'evil)
(evil-mode 1)

(global-set-key (kbd "C-s") #'evil-write)
(global-set-key (kbd "C-u") #'evil-scroll-up)
(global-set-key (kbd "C-d") #'evil-scroll-down)


;; Banner

(use-package dashboard
  :config
  (setq dashboard-items '((recents . 15)))
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-banner-logo-title "T H A N G L E M O N")
  (setq dashboard-footer-messages '("Made with love"))
  (setq dashboard-startup-banner "~/.emacs.d/banners/baby-yoda.gif")
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

;; Text

(use-package smartparens :ensure t)

(use-package move-text :ensure t)

(global-set-key (kbd "s-j") #'move-text-down)
(global-set-key (kbd "s-k") #'move-text-up)

(use-package dash :ensure t)

(use-package yaml-mode :ensure t)

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

;; Prettier

(use-package prettier
  :ensure t
  :diminish
  :hook ((mhtml-mode css-mode scss-mode rjsx-mode js2-mode typescript-mode ) . prettier-mode))

;; File explorer

(use-package lsp-treemacs
  :defer t
  :ensure t
  :requires treemacs
  :config
  (global-set-key (kbd "C-c b") 'treemacs)
  (treemacs-resize-icons 15))

(thanglemon/leader-key
  "SPC" '(counsel-M-x :wk "M-x")
  "."  '(dired-jump :which-key "Dired Jump")
  "'"   #'shell-pop
  ","   #'magit-status
  "j" '(bufler-switch-buffer :which-key "Switch Buffer")
  "k" '(dqv/switch-to-previous-buffer :wk "Switch to previous buffer")
  "oa" '(org-agenda :color blue :wk "Agenda")
  "of" '(browser-file-directory :wk "Open File in Directory")
  "/" '(browse-file-directory :wk "Open Dired Jump new Window")

  "aC" #'calendar
  "ase" #'eshell-new
  "asv" #'vterm
  "asV" #'multi-vterm
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
  "mva" #'treemacs-visit-no
  "mvc" #'treemacs-visit-node-close-treemacs
  "mvn" #'treemacs-visit-node-default
  "my" '(:ignore t :wk "yank")
  "mya" #'treemacs-copy-absolute-path-at-point
  "myp" #'treemacs-copy-project-path-at-point
  "myr" #'treemacs-copy-relative-path-at-point
  "myf" #'treemacs-copy-file
  )

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

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

;; (use-package all-the-icons
;;   :ensure t)

;; Languages servers

(use-package lsp-mode
  :ensure t
  :config
  (setq lsp-headerline-breadcrumb-enable nil)
  :config
  (lsp-enable-which-key-integration t)
  :hook
  ((go-mode) . lsp))

(setq ls-log-ion nil) ;; Dont't log everything = speed

;; Prettier

;; Dashbroad

;; Golang
(use-package go-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.go.*$" . go-mode)))


;; Typescript
(use-package typescript-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.tsx.*$" . typescript-mode)))

(use-package rjsx-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
  (add-to-list 'auto-mode-alist '("pages\\/.*\\.js\\'" . rjsx-mode)))

(use-package lsp-ui :ensure t)

(use-package flycheck :ensure t)

(setq-default flycheck-indication-mode 'left-margin)
(add-hook 'flycheck-mode-hook #'flycheck-set-indication-mode)

;; Code completion
(use-package company :ensure t)

;; Speed up the code completion
(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      create-lockfiles nil) ;; lock files will kill `npm start'

(use-package projectile
  :ensure t
  :config

  (global-set-key (kbd "C-c p") 'projectile-find-file)
  
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy)
  (setq projectile-indexing-method 'alien)
  (projectile-mode))

(use-package ivy :ensure t)

;; Org

(use-package org
  :hook (org-mode . org-setup)
  :custom					
  (org-ellipsis " ▼")
  (org-hide-emphasis-markers t)
  :config
  (setq org-cycle-separator-lines 2
        org-src-fontify-natively t
        org-src-tab-acts-natively t
        org-src-preserve-indentation nil))

;; Automatically trigger thre js-mode when open a js file
(add-hook 'js-mode-hook #'lsp)
(add-hook 'typescript-mode-hook #'lsp)

;; Text hook
(add-hook 'go-mode-hook #'smartparens-mode)
(add-hook 'js-mode-hook #'smartparens-mode)

;; Emacs lisp mode hooks
(add-hook 'emacs-lisp-mode-hook 'company-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
