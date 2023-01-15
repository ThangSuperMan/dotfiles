(setq user-full-name "Phan Tan Thang")

(menu-bar-mode -1)

(global-hl-line-mode t)
(set-face-background 'hl-line "#3e4446")

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

(show-paren-mode t)

;; Packages

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(require 'use-package)

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

;; Text

(use-package smartparens :ensure t)

(use-package move-text :ensure t)

(global-set-key (kbd "C-j") #'move-text-down)
(global-set-key (kbd "C-k") #'move-text-up)

(use-package dash :ensure t)

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
  :requires treemacs
  :config
  (global-set-key (kbd "C-c b") 'treemacs)
  (treemacs-resize-icons 15))

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

 (use-package engine-mode
    :config
    (engine/set-keymap-prefix (kbd "C-c s"))
    (setq browse-url-browser-function 'browse-url-default-macosx-browser
          engine/browser-function 'browse-url-default-macosx-browser
          )

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

(use-package all-the-icons
  :ensure t)

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

;; Speed up the codec completion
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

(add-hook 'go-mode-hook #'smartparens-mode)
(add-hook 'js-mode-hook #'smartparens-mode)

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
