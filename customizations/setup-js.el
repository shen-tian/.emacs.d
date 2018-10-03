;; javascript / html
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;; Tab size of 2, to align with Prettier
(add-hook 'js2-mode-hook (lambda () (setq js2-basic-offset 2)))

;;; Enable Prettier minor mode
(add-hook 'js2-mode-hook 'prettier-js-mode)

(setq prettier-js-args '(
  "--single-quote" "true"))
