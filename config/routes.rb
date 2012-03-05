RockPaperScissors::Application.routes.draw do
  match 'throw/:type' => 'throw#my_throw'
  #this matches parameters after 'throw' and puts it in 'type':
  #parameters: {"type" => "paper" (or whatever you enter}
  #after the =>: will go to the 'throw' controller and whatever is after the  #'#' is the action it goes to within the throw controller.
  # so it's: ____ 'url_match' => 'controller#controller_action'

  match 'stats' => 'stats#index'

  match 'clear' => 'clear#index'

  match 'throw' => 'throw#instructions'
  #localhost:3000/throw will go to instructions
  #localhost:3000/throw/ will go to instructions

  root :to => 'throw#instructions'
  #root (localhost:3000/) will go to instructions

end
