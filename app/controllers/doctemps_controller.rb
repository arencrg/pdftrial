class DoctempsController < ApplicationController
  before_action :set_doctemp, only: [:show, :edit, :update, :destroy]

  # GET /doctemps
  # GET /doctemps.json
  def index
    @doctemps = Doctemp.all
  end

  # GET /doctemps/1
  # GET /doctemps/1.json
  def download
     @doctemp = Doctemp.find(params[:id])
     html = render_to_string(:action=>:show, :template=>"doctemps/show.html.haml", :handlers=>["haml"])
     pdf = WickedPdf.new.pdf_from_string(html)

     send_data(pdf,
       :filename => "legaldoc_result.pdf",
       :disposition => 'attachment')
   end

  def show
     @doctemp = Doctemp.find(params[:id])
     respond_to do |format|
       format.pdf do
         render :pdf => "legaldoc.pdf",
           :template => "doctemps/show.html.haml",
           :handlers=>["haml"]
       end
       format.html
     end
  end

  # GET /doctemps/new
  def new
    @doctemp = Doctemp.new
  end

  # GET /doctemps/1/edit
  def edit
  end

  # POST /doctemps
  # POST /doctemps.json
  def create
    @doctemp = Doctemp.new(doctemp_params)

    respond_to do |format|
      if @doctemp.save
        format.html { redirect_to @doctemp, notice: 'Doctemp was successfully created.' }
        format.json { render :show, status: :created, location: @doctemp }
      else
        format.html { render :new }
        format.json { render json: @doctemp.errors, status: :unprocessable_entity }
      end
    end
    redirect_to action: "index"
  end

  # PATCH/PUT /doctemps/1
  # PATCH/PUT /doctemps/1.json
  def update
    respond_to do |format|
      if @doctemp.update(doctemp_params)
        format.html { redirect_to @doctemp, notice: 'Doctemp was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctemp }
      else
        format.html { render :edit }
        format.json { render json: @doctemp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctemps/1
  # DELETE /doctemps/1.json
  def destroy
    @doctemp.destroy
    respond_to do |format|
      format.html { redirect_to doctemps_url, notice: 'Doctemp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctemp
      @doctemp = Doctemp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctemp_params
      params.require(:doctemp).permit(:dateofsigning, :placeofsigning, :nameofprincipal, :nationalityofprincipal, :businessofprincipal, :addressofprincipal, :nameofagent, :nationalityofagent, :businessofagent, :addressofagent, :nameofagencyoroffice, :transaction, :acts)
    end
end
