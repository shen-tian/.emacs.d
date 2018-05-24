;; javascript / html
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-hook 'js2-mode-hook 'prettier-js-mode)

(setq prettier-js-args '(
  "--single-quote" "true"))
