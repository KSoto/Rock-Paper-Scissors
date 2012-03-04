RockPaperScissors::Application.routes.draw do
  match 'throw/:type' => 'throw#my_throw'
  #this matches parameters after 'throw' and puts it in 'type':
  #parameters: {"type" => "paper" (or whatever you enter}
  #after the =>: will go to the 'throw' controller and whatever is after the  #'#' is the action it goes to within the throw controller.

  match 'stats' => 'stats#index'

  match 'clear' => 'clear#index'

end
