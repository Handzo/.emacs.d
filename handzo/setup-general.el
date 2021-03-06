;; Skip startup message
(setq inhibit-startup-message t)

(setq frame-title-format "emacs-Handzo")

(menu-bar-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(display-time-mode t)
(global-linum-mode 1)
(global-hl-line-mode 1)
(show-paren-mode 1)
(setq scroll-step 1)

;; Auto refresh buffers
(global-auto-revert-mode 1)

(global-set-key [?\C-q] 'ido-kill-buffer)

;; Shortcuts settings
(global-set-key [?\C-z] 'eshell)
(global-set-key [?\C-x ?\C-g] 'goto-line)
;;(global-set-key [?\C-x ?\C-b] 'ibuffer)
;;(global-set-key [f5] 'bookmark-set)
;;(global-set-key [f6] 'bookmark-jump)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
;;(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key (kbd "M-]") 'other-window) ; 【Alt+j】 move cursor to next pane
(global-set-key (kbd "M-0") 'delete-window)  ; remove current pane

(setq-local imenu-create-index-function #'ggtags-build-imenu-index)

(use-package magit)

;; autopair
(use-package autopair
  :init
  (autopair-global-mode))

;; smex
(use-package smex
  :init
  (global-set-key (kbd "M-x") 'smex))

;;(c-toggle-auto-newline t)
;;(c-toggle-electric-state t)
;;(c-toggle-hungry-state t)

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; Package: projejctile
;; (use-package projectile
;;   :init
;;   (projectile-global-mode)
;;   (setq projectile-enable-caching t))

;; Package zygospore
(use-package zygospore
  :init
  (global-set-key "\C-x1" 'zygospore-toggle-delete-other-windows)
  (global-set-key "\C-j" 'newline-and-indent))

  ; automatically indent when press "C-j"

;; Powerline
(use-package powerline
  :init
  (powerline-center-theme)
  (setq powerline-arrow-shape 'arrow)
  ;;(setq powerline-default-separator 'wave)
  )

(windmove-default-keybindings)

(use-package sr-speedbar
  :init
  (setq sr-speedbar-auto-refresh -1)
  (global-set-key (kbd "<f2>") 'sr-speedbar-toggle))

;; Dired mode
(require 'dired)
(defun dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 4))

(define-key dired-mode-map
  (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)

(defun dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))

(define-key dired-mode-map
  (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Make dired less verbose
(use-package dired-details
  :init
  (setq-default dired-details-hidden-string "--- ")
  )
(dired-details-install)

;; Web jump
(global-set-key (kbd "C-x g") 'webjump)
;; Add Vk to webjump
(eval-after-load "webjump"
  '(add-to-list 'webjump-sites
                '("vk" .
                  [simple-query
                   "vk.com"
                   "https://vk.com/handzohasashi"
                   ""])))
;; Add google translate to webjump
(eval-after-load "webjump"
  '(add-to-list 'webjump-sites
                '("Translate" .
                  [simple-query
                   "https://translate.google.ru"
                   "https://translate.google.ru/#en/ru/"
                   ""])))

;; Backup
;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)
(put 'upcase-region 'disabled nil)

(provide 'setup-general)

;; (require 'auto-complete)
;; (require 'auto-complete-config)
;; (ac-config-default)

;; (defun my:ac-c-header-init()
;;   (require 'auto-complete-c-headers)
;;   (add-to-list 'ac-sources 'ac-source-c-headers)
;;   (add-to-list 'achead:include-directories '"/usr/include/c++/5")
;;   (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/5/include")
;; )

;; (add-hook 'c++-mode-hook 'my:ac-c-header-init)
;; (add-hook 'c-mode-hook 'my:ac-c-header-init)

;; (semantic-mode 1)
;; (defun my:add-semantic-to-autocomplete()
;;   (add-to-list 'ac-sources 'ac-source-semantic))

;; (add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
;; (add-hook 'c++-mode-common-hook 'my:add-semantic-to-autocomplete)

;; (global-ede-mode 1)                      ; Enable the Project management system

;; (global-semantic-idle-scheduler-mode 1)




