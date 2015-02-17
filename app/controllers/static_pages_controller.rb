class StaticPagesController < ApplicationController
  def home
  end

  def call_for_papers
  end

  def important_dates
  end

  def paper_ethics
  end

  def committee
  end

  def venue_and_contact
  end
  def selection
  end
  def download_doc
  send_file(
    "#{Rails.root}/public/ieee_format.doc",
    filename: "ieee_format.doc",
    type: "application/doc"
  )
  end
end
