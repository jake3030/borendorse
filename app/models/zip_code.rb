require "fileutils"

class ZipCode < ActiveRecord::Base
  attr_accessible :code, :endorsed_candidates
  serialize :endorsed_candidates

  after_save :remove_pdf

  def pdf_folder
    folder = Rails.root.join("public/pdfs")
    FileUtils.mkdir_p(folder) unless File.exists?(folder)
    folder
  end

  def pdf_path
    File.join(pdf_folder, code.to_s + ".pdf")
  end

  def remove_pdf
    FileUtils.rm(pdf_path) if File.exists?(pdf_path)
  end

  def generate_pdf
    filename = Rails.root.join("lib", "bor_template.pdf")
    zip = self
    Prawn::Document.generate(File.join(pdf_path), :template => filename) do
      go_to_page(page_count)
      move_down 30
      #start_new_page
      font_size 14
      bounding_box([220, 693], :width => 50, :height => 20) do
        # stroke_bounds
        text zip.code.to_s, :align => :left
      end

      font_size 11
      bounding_box([5, 649], :width => 240, :height => 310) do
        fill_color "ffffff"
        # stroke_bounds
        # fill_color ""
        text zip.formatted_candidates, :color => [100, 100, 100, 100], :leading => 5
      end

    end
  end

  def formatted_candidates
    self.endorsed_candidates.to_a.map {|arr| arr.join(": ")}.join("\n")
  end
end
