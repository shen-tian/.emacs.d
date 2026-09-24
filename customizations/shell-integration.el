;;; -*- lexical-binding: t -*-
;; On macOS, an Emacs started from the GUI doesn't inherit the shell's
;; environment. Copy PATH etc. from the login shell.
;; https://github.com/purcell/exec-path-from-shell
(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns))
  :config
  (exec-path-from-shell-initialize))
