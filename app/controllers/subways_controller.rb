require 'open-uri'
require 'nokogiri'
class SubwaysController < ApplicationController
	def index

		
		url = 'http://mta.info/status/serviceStatus.txt'
		html = open(url)
		page = Nokogiri::HTML(html)

		#subways
		@subway_names = []
		@subway_status = []
		page.css('subway name').each do |line|
			@subway_names << line.text
		end
		page.css('subway status').each do |line|
			@subway_status << line.text
		end

		#buses
		@bus_names = []
		@bus_status = []
		page.css('bus name').each do |line|
			@bus_names << line.text
		end
		page.css('bus status').each do |line|
			@bus_status << line.text
		end

		#BT
		@bt_names = []
		@bt_status = []
		page.css('bt name').each do |line|
			@bt_names << line.text
		end
		page.css('bt status').each do |line|
			@bt_status << line.text
		end

		#LIRR
		@lirr_names = []
		@lirr_status = []
		page.css('lirr name').each do |line|
			@lirr_names << line.text
		end
		page.css('lirr status').each do |line|
			@lirr_status << line.text
		end

		#MetroNorth
		@mn_names = []
		@mn_status = []
		page.css('metronorth name').each do |line|
			@mn_names << line.text
		end
		page.css('metronorth status').each do |line|
			@mn_status << line.text
		end

	end #end index
end