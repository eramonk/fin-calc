class CalcsController < ApplicationController
  before_action :set_calc, only: [:show, :edit, :update, :destroy]

  # GET /calcs
  # GET /calcs.json
  def index
    @calcs = Calc.all
  end

  # GET /calcs/1
  # GET /calcs/1.json
  def show
  end

  # GET /calcs/new
  def new
    @calc = Calc.new
  end

  # GET /calcs/1/edit
  def edit
  end

  # POST /calcs
  # POST /calcs.json
  def create
    @calc = Calc.new(calc_params)

    respond_to do |format|
      if @calc.save
        calculate(@calc)

        format.html { redirect_to @calc, notice: "Calc was successfully created." }
        format.json { render :show, status: :created, location: @calc }
      else
        format.html { render :new }
        format.json { render json: @calc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calcs/1
  # PATCH/PUT /calcs/1.json
  def update
    respond_to do |format|
      if @calc.update(calc_params)
        format.html { redirect_to @calc, notice: "Calc was successfully updated." }
        format.json { render :show, status: :ok, location: @calc }
      else
        format.html { render :edit }
        format.json { render json: @calc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calcs/1
  # DELETE /calcs/1.json
  def destroy
    @calc.destroy
    respond_to do |format|
      format.html { redirect_to calcs_url, notice: "Calc was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_calc
    @calc = Calc.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def calc_params
    params.require(:calc).permit(:initial_deposit, :number_of_years, :profitability_per_year, :monthly_report, :risk_level)
  end

  def calculate(calc)
    pp "2222222222"
    pp calc.initial_deposit
    pp "2222222222"

    calc.number_of_years.times { |time|
      [time + 1, calc.initial_deposit]
    }

    def results_arr(count, times, calc, deposit, profit_akk, res_akk)
      # pp res_akk
      return res_akk if times == 0
      profit = (deposit + calc.monthly_report * 12) * calc.profitability_per_year / 100
      profit_amount = profit_akk + profit
      # pp "444444"
      # pp profit
      # pp "444444"

      results_arr(count + 1,
                  times - 1,
                  calc,
                  deposit + profit,
                  profit_amount,
                  res_akk.push([count, deposit, calc.profitability_per_year, profit, profit_amount, deposit + profit]))
    end

    res = results_arr(1, calc.number_of_years, calc, calc.initial_deposit, 0, [])

    pp "ressssssssssssssss"
    pp res
    pp "ressssssssssssssss"

    #  initial_deposit: 43,
    #  number_of_years: 23,
    #  profitability_per_year: 43,
    #  monthly_report: 23,
    #  risk_level: 43,
  end
end
