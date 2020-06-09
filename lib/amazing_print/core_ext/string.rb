# frozen_string_literal: true
# Copyright (c) 2010-2016 Michael Dvorkin and contributors
#
# AmazingPrint is freely distributable under the terms of MIT license.
# See LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------

# frozen_string_literal: true

class String
  #
  # ANSI color codes:
  #   \e => escape
  #   30 => color base
  #    1 => bright
  #    0 => normal
  #
  # For HTML coloring we use <kbd> tag instead of <span> to require monospace
  # font. Note that beloved <tt> has been removed from HTML5.
  #
  %w[gray red green yellow blue purple cyan white].zip(
    %w[black darkred darkgreen brown navy darkmagenta darkcyan slategray]
  ).each_with_index do |(color, shade), i|
    # NOTE: Format strings are created once only, for performance, and remembered by closures.

    term_bright_seq = "\e[1;#{30 + i}m%s\e[0m"
    html_bright_seq = %(<kbd style="color:#{color}">%s</kbd>)

    define_method color do |html = false, *|
      (html ? html_bright_seq : term_bright_seq) % self
    end

    term_normal_seq = "\e[0;#{30 + i}m%s\e[0m"
    html_normal_seq = %(<kbd style="color:#{shade}">%s</kbd>)

    define_method "#{color}ish" do |html = false, *|
      (html ? html_normal_seq : term_normal_seq) % self
    end
  end

  # Remove ANSI color codes.
  def uncolor
    gsub(/\e\[[0-9;]*m/, '')
  end
end
