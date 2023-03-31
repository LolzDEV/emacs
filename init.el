(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq package-enable-at-startup nil)

(straight-use-package 'use-package)
(use-package straight
  :custom
  (straight-use-package-by-default t))

(use-package magit)

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(use-package projectile
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
	      ("C-c p" . 'projectile-command-map)))

(use-package yasnippet
  :init
  (yas-global-mode 1))

(use-package counsel
  :init (counsel-mode))

(use-package swiper)

(use-package ivy
  :init (ivy-mode)
  :custom
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :bind ("\C-s" . 'swiper)
  ("C-c C-r" . 'ivy-resume))

(use-package which-key
  :init (which-key-mode))

(use-package gruvbox-theme)

(use-package reformatter)

(use-package zig-mode)

(load-theme 'gruvbox-dark-hard t)

(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)

(use-package cargo)

(use-package rust-mode
  :custom
  (setq rust-format-on-save t)
  :init
  (add-hook 'rust-mode-hook
            (lambda () (setq indent-tabs-mode nil)))
  (add-hook 'rust-mode-hook 'cargo-minor-mode))

(use-package tree-sitter
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))
(use-package tree-sitter-langs)

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(setq c-default-style
      '((java-mode . "java") (other . "k&r")))

(use-package vterm
    :ensure t)

(use-package general)
(general-evil-setup t)
