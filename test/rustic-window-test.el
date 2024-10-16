;; -*- lexical-binding: t -*-
(require 'rustic)
(load (expand-file-name "test-helper.el"
                        (file-name-directory
                         (or load-file-name buffer-file-name))))

(ert-deftest rustic-test-window-count ()
  (should (= (length (window-list)) 1))
  (let* ((dir (rustic-babel-generate-project t)))
    (let* ((default-directory dir))
      (rustic-compile "cargo fmt")
      (rustic-test--wait-till-finished rustic-compilation-buffer-name)
      (should (= (length (window-list)) 2))
      (should (get-buffer-window rustic-compilation-buffer-name)))))

(ert-deftest rustic-test-window-count-format-proc ()
  (should (= (length (window-list)) 1))
  (let* ((string "ffn main()      {}")
         (formatted-string "fn main() {}\n")
         (buf (rustic-test-count-error-helper-new string))
         (default-directory (file-name-directory (buffer-file-name buf)))
         (buffer-read-only nil))
    (with-current-buffer buf
      (erase-buffer)
      (rustic-mode)
      (insert string)
      (rustic-format-buffer)
      (rustic-test--wait-till-finished rustic-format-buffer-name)
      (should (= (length (window-list)) 2))
      (should (get-buffer-window rustic-format-buffer-name)))
    (kill-buffer buf)))

(provide 'rustic-window-test)
