require 'benchmark'
require 'prawn'

class PdfMailer < ApplicationMailer
  COLORS = %w(FF0000 FF7F00 FFFF00 00FF00 0000FF 4B0082 9400D3).freeze

  def benchmark
    Benchmark.bm(7) do |mark|
      mark.report('react:') do
        attachments['react.pdf'] = WickedPdf.new.pdf_from_string(render_to_string(pdf: 'react'))
      end
      mark.report('prawn:') do
        pdf = Prawn::Document.new
        pdf.stroke_axis
        pdf.text "This was generated @ #{Time.current}"
        10.times do |t|
          3.times do |offset|
            offset = offset * 10
            pdf.stroke_color COLORS[t % COLORS.size]
            pdf.stroke_circle [(offset + 40) * t, 2 ** (t)], 10
            pdf.stroke_color COLORS[COLORS.size - 1 - (t % COLORS.size)]
            pdf.stroke_circle [(offset + 50) * t, 2 ** (t)], 10
          end
        end
        attachments['prawn.pdf'] = pdf.render
      end
    end

    mail(to: 'human@example.com', subject: 'Important Item') do |format|
      format.html
    end
  end
end
