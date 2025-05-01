(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(setq scroll-conservatively 101)
(setq scroll-margin 10)
(setq backup-directory-alist '(("." . "/tmp")))
(setq create-lockfiles nil)
(add-to-list 'package-archives '("MELPA" . "https://melpa.org/packages/"))
(electric-pair-mode 1)
(fido-mode 1)
(set-frame-font "JetBrains Mono Medium 14" nil t)
(keymap-global-set "C-," 'duplicate-line)

(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package no-littering
  :config
  (no-littering-theme-backups))

(use-package pdf-tools)

(use-package zenburn-theme
  :config
  (load-theme 'zenburn t))

(use-package eat)

(use-package treesit-auto
  :config
  (global-treesit-auto-mode))

(use-package ace-window
  :bind
  (("M-o" . ace-window)))

(use-package eglot
  :bind (("C-c s e e" . eglot)
	 ("C-c s e d" . eldoc)
	 ("C-c s e r" . eglot-rename)
	 ("C-c s e s" . eglot-shutdown)
	 ("C-c s e f" . eglot-find-declaration)
	 ("C-c s e i" . eglot-find-implementation))
  :hook
  (python-ts-mode . eglot-ensure)
  (rust-ts-mode . eglot-ensure))


(use-package corfu
  :hook (emacs-startup . global-corfu-mode)
  :bind (:map corfu-map
              ("<tab>" . corfu-next)
              ("<backtab>" . corfu-previous))
  :custom
  (corfu-preselect 'prompt)
  (corfu-auto t)
  (corfu-popupinfo-delay 5)
  (corfu-auto-delay 0)
  (corfu-auto-prefix 2)
  (corfu-count 16)
  (corfu-max-width 120)
  (corfu-scroll-margin 4)
  (corfu-on-exact-match nil)
  (tab-always-indent 'complete)
  (corfu-cycle t)
  :config
  (global-corfu-mode)
  (corfu-popupinfo-mode))

(use-package poetry)

(use-package eldoc-box
  :bind
  (("C-c K" . eldoc-box-hover-mode))
  :config
  (setq eldoc-box-max-pixel-width 500)
  (setq eldoc-box-max-pixel-height 700))

(use-package markdown-mode)

(use-package magit)

(use-package expand-region
  :bind
  (("C-*" . er/expand-region)))

(use-package multiple-cursors
  :bind
  (("C-S-c C-S-c" . mc/edit-lines)
   ("C-c C->" . mc/mark-next-like-this)
   ("C-c C-<" . mc/mark-previous-like-this)))
(put 'narrow-to-region 'disabled nil)
(setq custom-file "~/dotfiles/emacs/custom.el")
(load-file custom-file)
