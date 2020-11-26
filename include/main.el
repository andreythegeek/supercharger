;; main.el --- My Emacs configuration.

;; Keep settings from Easy Customization buffer separately:

(defconst custom-file-name "custom.el")

(setq custom-file (expand-file-name custom-file-name user-emacs-directory))

;; Turn off GUI features:

(when (featurep 'menu-bar)
  (menu-bar-mode -1))

(when (featurep 'tool-bar)
  (tool-bar-mode -1))

(when (featurep 'scroll-bar)
  (scroll-bar-mode -1))

;; Make sure default encoding is UTF-8:

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; Set up package manager:

(defconst package-user-dir-name "vendor")

(setq package-user-dir (expand-file-name package-user-dir-name user-emacs-directory))

(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)

(package-refresh-contents)

;; Install use-package to handle dependencies:

(package-install 'use-package)

;; Load settings made with Easy Customization Interface:

(when (file-exists-p custom-file)
  (load custom-file))

(provide 'supercharger)
