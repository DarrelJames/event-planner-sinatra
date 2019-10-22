class FaqController < ApplicationController

  get '/faqs/new' do
    redirect_if_not_logged_in
    erb :"faqs/new"
  end

  get '/faqs/:id/edit' do
    redirect_if_not_logged_in
    @faq = Faq.find_by(id: params[:slug])
    erb :"faqs/edit"
  end

  get '/faqs' do
    redirect_if_not_logged_in
    erb :"faqs/index"
  end

  post '/faqs' do
    faq = current_user.faqs.build(params[:faq])
    if faq.save
      redirect to("/faqs")
    end
  end

  get '/faqs/:id' do
    redirect_if_not_logged_in
    @faq = Faq.find_by(id: params[:slug])
    erb :"faqs/show"
  end

  delete '/faqs/:id' do
    faq = Faq.find_by(id: params[:slug])
    faq.destroy
    redirect to("/faqs")
  end
end
