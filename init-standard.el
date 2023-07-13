(setq inhibit-startup-message t) ;; hide the startup message
(setq default-directory "C:/Users/juant/")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(with-eval-after-load 'package
  (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)

;; (set-face-attribute 'default nil :font "JetBrainsMonoNL NF" :height 120)
;; (set-face-attribute 'default nil :font "CozetteVector" :height 100)
;; (set-face-attribute 'default nil :font "Envy Code R" :height 130)
;; (set-face-attribute 'default nil :font "Ubuntu" :height 130)
;; (set-face-attribute 'default nil :font "Cascadia Code" :height 120)
(set-face-attribute 'default nil :font "IntelOne Mono" :height 120 :weight 'regular)
(load-theme 'adwaita t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(electric-pair-mode 1)

(unless (package-installed-p 'vertico)
  (package-install 'vertico))

(require 'vertico)
(vertico-mode t)
(unless (package-installed-p 'consult)
  (package-install 'consult))
(setq read-buffer-completion-ignore-case t
      read-file-name-completion-ignore-case t
      completion-ignore-case t)

;;; Pop-up completion
(unless (package-installed-p 'corfu)
  (package-install 'corfu))

;; Enable autocompletion by default in programming buffers
(add-hook 'prog-mode-hook #'corfu-mode)

;;; Git client
(unless (package-installed-p 'magit)
  (package-install 'magit))


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
