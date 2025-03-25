(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(setq custom-file "~/dotfiles/emacs/custom.el")
(setq create-lockfiles nil)
(setq make-backup-files nil)
(setq backup-directory-alist '(("." . "/tmp")))
(setq package-archives '(("MELPA" . "https://melpa.org/packages/")))
(electric-pair-mode 1)



(set-face-attribute 'default nil :height 140)


(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))

(use-package ido-completing-read+
  :ensure t
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (ido-ubiquitous-mode 1))

(use-package eglot
  :ensure t
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
  :ensure t
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

(use-package poetry
  :ensure t)

(use-package eldoc-box
  :ensure t
  :bind
  (("C-c K" . eldoc-box-hover-mode))
  :config
  (setq eldoc-box-max-pixel-width 500)
  (setq eldoc-box-max-pixel-height 700))

(use-package markdown-mode
  :ensure t)

(use-package magit
  :ensure t)

(load-file custom-file)
