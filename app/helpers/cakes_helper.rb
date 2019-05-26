module CakesHelper

  def manage_cake_abilities(cake)
    if user_signed_in?
      render('cakes/manage_cakes/edit_destroy_cakes', cake: cake)
    else
      return
    end
  end
end
