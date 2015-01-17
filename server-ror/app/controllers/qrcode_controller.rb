class QrcodeController < ApplicationController
	before_action :authenticate_user!

	def index
	end

	def render_pdf
		# we create a new PDF document (with gem Prawn)
		pdf = Prawn::Document.new(:page_size => "A4")

		tables = []
		for i in 1..15
			tables << i
		end

		column = 0
		row = 0

		# loop for each table number
		for table in tables
			pdf.bounding_box [190 * column, 750 - 200 * row], :width => 190 do
				# test displayed on PDF
				pdf.text "Table n°" + table.to_s

				# text inside the QR code
				qrcode = "Table n°" + table.to_s

				# we display the QR code inside the PDF
				pdf.print_qr_code(qrcode, :extent => 144, :level => :h)
			end

			# when we reach 3 qrcodes in a line, we jump to next line
			column += 1
			if column == 3
				pdf.move_down 20
				column = 0
				row += 1
			end

			# when we reach 4 lines, we create a new page
			if row == 4
				pdf.start_new_page
				column = 0
				row = 0
			end
		end

		# we display the PDF in a new tab
		send_data pdf.render, :filename => "bartendr-qrcodes.pdf", :type => "application/pdf", 
		                      :disposition => 'inline'

		# Prawn manual: http://prawnpdf.org/manual.pdf
		# exemple: http://runnable.com/Uo6gOJJv0NknAAB0/
	end
end
