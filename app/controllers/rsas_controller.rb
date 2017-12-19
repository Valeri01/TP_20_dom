require "RSA"

class KeysController < ApplicationController
	before_action :set_rsas, only: [:show]

	def new
		rsas = Key.new()

		if(params.has_rsas?(:n) && params.has_rsas?(:e) && params.has_rsas?(:d))
			rsas.n = params[:n]
			rsas.e = params[:e]
			rsas.d = params[:d]
		else
			keyParams = RSA.new(0, 0, 0).new_rsas

			rsas.n = keyParams[0]
			rsas.e = keyParams[1]
			rsas.d = keyParams[2]
 		end

		respond_to do |format|
			if rsas.save
				format.json {
					render :json => {'id' => rsas.id}
				}
			end
		end
	end

	def show
		rsas = Key.find(params[:id])

		respond_to do |format|
			format.json {
				render :json => {'n' => rsas.n, 'e' => rsas.e, 'd' => rsas.d}
			}
		end
	end

private
	def set_key
		@key = Key.find(params[:id])
	end

	def key_params
		params.require(:key).permit(:n, :e, :d)
	end
