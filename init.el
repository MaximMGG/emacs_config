
;;startup
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;;startup
;;PACKAGES+++++++++++++++++++++++++++++++++

;;lsp-mode----------
(use-package lsp-mode
  :ensure t
  :hook
  ((c-mode . lsp)
   (c++mode . lsp)
   (zig-mode . lsp)
   (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :config
  (setq lsp-keymap "C-c l")
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
  (setq lsp-file-watch-threshold 15000))

(use-package lsp-ui
  :ensure t
  :commands (lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-doc-delay 0.5)
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peed-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peed-find-references))
;;lsp-mode----------
;;compaby------------
(use-package company
  :ensure t
  :bind("M-/" . company-complete-common-or-cycle)
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-show-numbers t
	company-minimum-prefix-length 1
	company-idle-delay 0.5
	company-backends
	'((company-files
	   company-keywords
	   company-capf
	   company-yasnippet)
	   (company-abbrev company-dabbrev))))

;;compaby------------
;;which key----------
(use-package which-key
  :ensure t
  :init
  (which-key-mode))
;;which key----------
;;ido-vertical------
(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-vertical-mode 1))
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
;;ido-vertical------
;;semx--------------
(use-package smex
  :ensure t
  :init
  (smex-initialize)
  :bind
  ("M-x" . smex))
;;semx--------------
;;avy--------------
(use-package avy
  :ensure t
  :bind
  ("M-s" . avy-goto-char))
;;avy--------------
;;PACKAGES+++++++++++++++++++++++++++++++++

;;terminal-----------
(defvar myTerm "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list myTerm)))
(ad-activate 'ansi-term)
(global-set-key (kbd "s-<return>") 'ansi-term)
;;terminal-----------
;;minor customize-----
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)
(setq scroll-conservatively 100)
(setq ring-bell-function 'ignore)
;;(global-hl-line-mode nil)
;;minor customize-----
;;electric------------
(setq electric-pair-pairs '(
			    (?\( . ?\))
			    (?\[ . ?\])
			    (?\{ . ?\})
			    (?\" . ?\")
			    (?\' . ?\')))
(electric-pair-mode t)
;;electric------------
;;autosave------------
(setq make-backup-file nil)
(setq auto-save-default nil)
;;autosave------------
;;IDO-----------------
(setq ido-enable-flex-matching nil)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode 1)
;;IDO-----------------
;;buffers------------
(global-set-key (kbd "C-x b") 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)

(defun killCurrentBuffer ()
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'killCurrentBuffer)


;;buffers------------
;;FUNCTIONS----------
(defun copyWholeLine ()
  (interactive)
  (save-excursion
    (kill-new
     (buffer-substring
     (point-at-bol)
     (point-at-eol)))))
(global-set-key (kbd "C-c b l") 'copyWholeLine)

(defun copyYankWholeLine ()
  (interactive)
  (save-excursion
    (kill-new
     (buffer-substring
      (point-at-bol)
      (point-at-eol)))
      (newline)
      (yank)))
(global-set-key (kbd "C-c c l") 'copyYankWholeLine)

(global-set-key (kbd "C-c f") 'fiplr-find-file)
;;FUNCTIONS----------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(base16-default-dark))
 '(custom-safe-themes
   '("f700bc979515153bef7a52ca46a62c0aa519950cc06d539df4f3d38828944a2c" default))
 '(package-selected-packages
   '(fiplr clangd lsp-ui lsp-mode company avy smex smes ido-vertical-mode base16-theme which-key)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
