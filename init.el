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

;;PACKAGES+++++++++++++++++++++++++++++++++

;;minor customize-----
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)
(setq scroll-conservatively 100)
(setq ring-bell-function 'ignore)
;;(global-hl-line-mode nil)
;;minor customize-----

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
;;buffers------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(base16-default-dark))
 '(custom-safe-themes
   '("f700bc979515153bef7a52ca46a62c0aa519950cc06d539df4f3d38828944a2c" default))
 '(package-selected-packages '(smex smes ido-vertical-mode base16-theme which-key)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
