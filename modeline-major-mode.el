;;; modeline-major-mode.el --- Display major-mode icon with optional text fallback for doom-modeline -*- lexical-binding:t; coding:utf-8 -*-

;; Copyright (C) 2025 Richie Kirchofer

;; Author: Richie Kirchofer
;; Maintainer: Richie Kirchofer

;; Homepage: https://github.com/rgkirch/modeline-major-mode
;; Keywords: modeline, doom-modeline, faces, icons

;; Package-Version: 0.1
;; Package-Requires: ((emacs "26.1"))

;; SPDX-License-Identifier: GPL-3.0-or-later
;;
;; This program is free software: you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free Software
;; Foundation, either version 3 of the License, or (at your option) any later
;; version.
;;
;; This program is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
;; FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
;; details.
;;
;; You should have received a copy of the GNU General Public License along with
;; this program. If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; This package provides a doom modeline segment `modeline-major-mode-icon`
;; allowing for a more minimal, icon-focused setup.
;;
;; You can use this segment when defining your own custom `doom-modeline`
;; layout. See README.org for an example of how to do that.

;;; Code:

(require 'doom-modeline)

(doom-modeline-def-segment modeline-major-mode-icon
  "A pure segment that displays ONLY the major-mode icon, or nothing."
  (let ((doom-modeline-icon t)
        (doom-modeline-major-mode-icon t))
    (let ((icon (doom-modeline--buffer-mode-icon)))
      (concat
       (doom-modeline-vspc)
       (propertize icon
                   'help-echo "Major mode\n\
mouse-1: Display major mode menu\n\
mouse-2: Show help for major mode\n\
mouse-3: Toggle minor modes"
                   'mouse-face 'doom-modeline-highlight
                   'local-map mode-line-major-mode-keymap)
       (doom-modeline-vspc)))))

(provide 'modeline-major-mode)

;;; modeline-major-mode.el ends here
