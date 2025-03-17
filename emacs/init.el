;;; init.el --- Emfy 0.4.0 <https://github.com/susam/emfy>

;;; Commentary:

;; A very basic dark and sleek Emacs setup for general purpose
;; editing and programming.

;;; Code:


(defvar elpaca-installer-version 0.8)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))
(elpaca elpaca-use-package
  ;; Enable :elpaca use-package keyword.
  (elpaca-use-package-mode)
  ;; Assume :elpaca t unless otherwise specified.
  (setq elpaca-use-package-by-default t))

(elpaca-wait)
(set-face-attribute 'default nil :height 110)

;;; Look and Feel ====================================================

;; Tweak UI.
(when (display-graphic-p)
  (tool-bar-mode 0)
  (scroll-bar-mode 0))
(setq inhibit-startup-screen t)
(column-number-mode)

;; Dark theme.
(load-theme 'wombat)
(with-eval-after-load 'wombat-theme
  (set-face-background 'default "#111")
  (set-face-background 'cursor "#c96")
  (set-face-foreground 'font-lock-comment-face "#fc0")
  (set-face-background 'isearch "#ff0")
  (set-face-foreground 'isearch "#000")
  (set-face-background 'lazy-highlight "#990")
  (set-face-foreground 'lazy-highlight "#000"))

;; Enable line numbers while writing config, code, or text.
(dolist (hook '(prog-mode-hook conf-mode-hook text-mode-hook))
  (add-hook hook 'display-line-numbers-mode))

;; Highlight matching pairs of parentheses.
(setq show-paren-delay 0)
(show-paren-mode)


;;; Whitespace =======================================================

;; Show trailing whitespace while writing config, code, or text.
(dolist (hook '(conf-mode-hook prog-mode-hook text-mode-hook))
  (add-hook hook (lambda () (setq show-trailing-whitespace t))))

;; Show stray blank lines.
(setq-default indicate-empty-lines t)
(setq-default indicate-buffer-boundaries 'left)


;; Use spaces, not tabs, for indentation.
(setq-default indent-tabs-mode nil)

;; Display the distance between two tab stops as 4 characters wide.
(setq-default tab-width 4)

;; Indentation setting for various languages.
;; (setq c-basic-offset 4)
;; (setq js-indent-level 2)
;; (setq css-indent-offset 2)


;;; Clean Working Directories ========================================

;; Write auto-saves and backups to separate directory.
(make-directory "~/.tmp/emacs/auto-save/" t)
(setq auto-save-file-name-transforms '((".*" "~/.tmp/emacs/auto-save/" t)))
(setq backup-directory-alist '(("." . "~/.tmp/emacs/backup/")))

;; Do not move the current file while creating backup.
(setq backup-by-copying t)

;; Disable lockfiles.
(setq create-lockfiles nil)

;; Write customizations to a separate file instead of this file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)


;;; Custom Command and Key Sequences =================================

;; Custom command.
(defun show-current-time ()
  "Show current time."
  (interactive)
  (message (current-time-string)))

;; Custom key sequences.
(global-set-key (kbd "C-c t") 'show-current-time)
(global-set-key (kbd "C-c d") 'delete-trailing-whitespace)


;;; Emacs Server =====================================================

(require 'server)
(unless (server-running-p)
  (server-start))

(use-package evil :ensure t :demand t)


(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package corfu
    :defer t
    :ensure t
    :bind (:map corfu-map
                ("M-j" . corfu-next)
                ("M-k" . corfu-previous))
    :custom
    (Corfu-preselect 'prompt)
    (corfu-auto t)
    (corfu-popupinfo-delay 0.5)
    (corfu-auto-delay 0.1)
    (corfu-auto-prefix 2)
    (corfu-count 16)
    (corfu-max-width 120)
    (corfu-scroll-margin 4)
    (corfu-on-exact-match nil)
    (tab-always-indent 'complete)
    :init
    (global-corfu-mode)
    (corfu-popupinfo-mode))

(add-hook 'god-mode-enabled-hook (lambda () (setq corfu-auto nil)))
(add-hook 'god-mode-disabled-hook (lambda () (setq corfu-auto t)))
(use-package eglot
  :ensure nil
  :bind (:map eglot-mode-map
	          ("C-c s a" . eglot-code-actions)
	          ("C-c s r" . eglot-rename)
	          ("C-c s h" . eldoc)
	          ("C-c s f" . eglot-format)
	          ("C-c s F" . eglot-format-buffer)
	          ("C-c s d" . xref-find-definitions-at-mouse)
	          ("C-c s R" . eglot-reconnect))
  :custom
  (completion-category-overrides '((eglot (styles prescient))
                                   (eglot-capf (styles prescient))))
  :config
  (advice-add 'eglot-completion-at-point :around #'cape-wrap-buster))

;;; The End ==========================================================

(provide 'init)

;;; init.el ends here
