class QrcodeController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def render_pdf
    # we convert the form parameters to an array of numbers (table numbers)
    if params[:numbers] != nil
      if params[:numbers] == ""
        redirect_to :back, alert: "Veuillez remplir le champ \"Numéros\"." and return
      end
      # we convert the string to an array of integers
      begin
        tables = params[:numbers].to_s.split(",")
        for table in tables
          table = Integer(table, 10)  # 10 because base 10
        end
      rescue
        redirect_to :back, alert: "Paramètres invalides." and return
      end
    elsif params[:number_from] != nil && params[:number_to] != nil
      if params[:number_from] == "" or params[:number_to] == ""
        redirect_to :back, alert: "Veuillez remplir les deux champs." and return
      end
      # we convert the strings to integers
      begin
        table_from = Integer(params[:number_from].to_s)
        table_to   = Integer(params[:number_to].to_s)
      rescue
        redirect_to :back, alert: "Paramètres invalides." and return
      end
      # we create an array
      if table_from > table_to
        redirect_to :back, alert: "Erreur: le n° de la table de départ est plus grand
                               que celui d'arrivée." and return
      end
      tables = table_from..table_to   # nb:  1..5 => [1,2,3,4,5]
    else
      redirect_to :back, alert: "Veuillez remplir les champs." and return
    end

    # we create a new PDF document (with gem Prawn)
    pdf = Prawn::Document.new(:page_size => "A4")

    column = 0
    row = 0

    # loop for each table number
    for table in tables
      pdf.bounding_box [190 * column, 750 - 200 * row], :width => 190 do
        # test displayed on PDF
        pdf.text "Table n°" + table.to_s

        # text inside the QR code
        qrcode = '{"table": ' + table.to_s + '}'

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
