;; main.el --- My Emacs configuration.

;; Keep settings from Easy Customization buffer separately:

(defconst custom-file-name "custom.el")

(setq custom-file (expand-file-name custom-file-name user-emacs-directory))

;; Turn off some bells and whistles:

(when (featurep 'menu-bar)
  (menu-bar-mode -1))

(when (featurep 'tool-bar)
  (tool-bar-mode -1))

(when (featurep 'scroll-bar)
  (scroll-bar-mode -1))

(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore)

;; Make sure default encoding is UTF-8:

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; Show line numbers and matching parens:

(add-hook 'prog-mode-hook
	  (lambda ()
	    (display-line-numbers-mode t)))

(show-paren-mode t)

;; Make sure to use spaces, not tabs:

(setq-default indent-tabs-mode nil)

(defconst indent-size 4)

(setq-default tab-width indent-size
	          c-basic-offset indent-size)

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (c-toggle-auto-state t)
	    (c-toggle-hungry-state t)))

(add-hook 'sgml-mode-hook
	  (lambda ()
	    (set (make-local-variable 'sgml-basic-offset) 1)
	    (sgml-guess-indent)))

;; Set up package manager:

(defconst package-user-dir-name "vendor")

(setq package-user-dir (expand-file-name package-user-dir-name user-emacs-directory))

(package-initialize)

(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)

(unless package-archive-contents
  (package-refresh-contents))

;; Install use-package to handle dependencies:

(package-install 'use-package)

;; Zenburn theme is low on contrast and provide weird but cool colors:

(use-package zenburn-theme
  :ensure t
  :config (load-theme 'zenburn t))

;; Add support for YAML:

(use-package yaml-mode
  :ensure t)

;; Emulate Vim:

(use-package evil
  :ensure t
  :config (evil-mode t))

;; Install Magit to handle VC operations:

(use-package magit
  :ensure t
  :init (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
  :bind ("C-c C-s" . magit-status))

;; Load settings made with Easy Customization Interface:

(when (file-exists-p custom-file)
  (load custom-file))

(provide 'supercharger)
