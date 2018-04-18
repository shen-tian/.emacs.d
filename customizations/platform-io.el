;; (require 'platformio-mode)

;; This not in Melpa stable...

(defun platformio-conditionally-enable ()
  "Enable `platformio-mode' only when a `platformio.ini' file is present in project root."
  (condition-case nil
      (when (projectile-verify-file "platformio.ini")
        (platformio-mode 1))
    (error nil)))

;; Enable irony for all c++ files, and platformio-mode only
;; when needed (platformio.ini present in project root).
(add-hook 'c++-mode-hook (lambda ()
                           (platformio-conditionally-enable)))
