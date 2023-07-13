(setq inhibit-startup-message t) ;; hide the startup message
(when (eq system-type 'windows-nt)
  (setq default-directory "C:/Users/juant/"))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(with-eval-after-load 'package
  (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)


;; (set-face-attribute 'default nil :font "JetBrainsMonoNL NF" :height 120)
;; (set-face-attribute 'default nil :font "CozetteVector" :height 100)
;; (set-face-attribute 'default nil :font "Envy Code R" :height 130)
;; (set-face-attribute 'default nil :font "Ubuntu" :height 130)
;; (set-face-attribute 'default nil :font "Cascadia Code" :height 120)
(set-face-attribute 'default nil :font "IntelOne Mono" :height 120 :weight 'regular)
(when (eq system-type 'darwin)
  ;; (set-face-attribute 'default nil :font "IntelOne Mono" :height 160 :weight 'regular)
  (set-face-attribute 'default nil :font "JetBrainsMonoNL NF" :height 150)
  ;; (set-face-attribute 'default nil :font "CozetteVector" :height 150)
  ;; (set-face-attribute 'default nil :font "Envy Code R" :height 150)
  ;; (set-face-attribute 'default nil :font "Ubuntu" :height 150)
  )
(load-theme 'adwaita t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(electric-pair-mode t)
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(unless (package-installed-p 'vertico)
  (package-install 'vertico))
(use-package vertico
  :init
  (vertico-mode t)
  )

(unless (package-installed-p 'consult)
  (package-install 'consult))

(setq read-buffer-completion-ignore-case t
      read-file-name-completion-ignore-case t
      completion-ignore-case t)

;;; Pop-up completion
(unless (package-installed-p 'corfu)
  (package-install 'corfu))
(use-package corfu
  :custom
  (corfu-auto t)
  :init
  (global-corfu-mode))

;;; Git client
(unless (package-installed-p 'magit)
  (package-install 'magit))


(use-package treemacs
  :ensure t
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-c t 1"   . treemacs-delete-other-windows)
        ("C-c t t"   . treemacs)
        ("C-c t d"   . treemacs-select-directory)
        ("C-c t B"   . treemacs-bookmark)
        ("C-c t C-t" . treemacs-find-file)
        ("C-c t M-t" . treemacs-find-tag)))  
  )

(use-package which-key
  :ensure t
  :init
  (which-key-mode t))

(setq-default major-mode
              (lambda () ; guess major mode from file name
                (unless buffer-file-name
                  (let ((buffer-file-name (buffer-name)))
                    (set-auto-mode)))))
(setq confirm-kill-emacs #'yes-or-no-p)
(setq window-resize-pixelwise t)
(setq frame-resize-pixelwise t)
(save-place-mode t)
(savehist-mode t)
(recentf-mode t)
(defalias 'yes-or-no #'y-or-n-p)

(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))
