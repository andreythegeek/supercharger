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

;; Load settings made with Easy Customization Interface:

(when (file-exists-p custom-file)
  (load custom-file))

(provide 'supercharger)
