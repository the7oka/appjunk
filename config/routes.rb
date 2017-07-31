Rails.application.routes.draw do
	get 'celebrate' => 'celebration#index'

	get 'garagak' => 'garagak#index'
	get 'garagak/new' => 'garagak#new', as: 'user_carlistings'
	post 'garagak/new' => 'garagak#create'
	get 'garagak/edit/:id' => 'garagak#edit', as: 'carlisting'
	patch 'garagak/edit/:id' => 'garagak#update'
	get 'garagak/search' => 'garagak#search', as: 'carlistings'
	get 'garagak/constants' => 'garagak#constants', as: 'carbrands'
	post 'garagak/constants' => 'garagak#create_carbrand'
	post 'garagak/constants/carmodels' => 'garagak#create_carmodel', as: 'carmodels'
	post 'garagak/constants/cities' => 'garagak#create_city', as: 'cities'
	post 'garagak/constants/areas' => 'garagak#create_area', as: 'areas'
	get 'garagak/constants/edit_carbrands/:id' => 'garagak#edit_carbrands'
	patch 'garagak/constants/edit_carbrands/:id' => 'garagak#update_carbrand', as: 'carbrand'
	
	get 'offers/approve/:id' => 'offers#approve'
	get 'offers/request_offer' => 'offers#offerrequest',as:'offerrequests'
	post 'offers/request_offer' => 'offers#create_offerrequest'
	get 'offers/like/:id' => 'offers#like'
	get 'offers/unlike/:id' => 'offers#unlike'
	get 'offers/dislike/:id' => 'offers#dislike'
	get 'offers/undislike/:id' => 'offers#undislike'
	get 'offers' => 'offers#index'
	get 'offers/constants' => 'offers#constants'
	post 'offers/constants' => 'offers#create_offercategory',as: "offercategories"
	get 'offers/new' => 'offers#new'
	post 'offers' => 'offers#create'
	get 'offers/show/:id' => 'offers#show',as: "offer"
	get 'offers/search' => 'offers#search'

	get 'inbox/:id' => 'messages#show', as: 'messaging'
	get 'inbox' => 'messages#index'
	post 'inbox' => 'messages#create', as: 'messages'

	get 'amioldyet' => 'amioldyet#index'

	get 'comicshop/trendit/:id' => 'comicshop#trendit'
	get 'comicshop/hotit/:id' => 'comicshop#hotit'
	get 'comicshop/deleteit/:id' => 'comicshop#delete'
	get 'currency_converter' => 'currency_converter#index'
	get 'comicshop' => 'comicshop#index'
	get 'comicshop/trending' => 'comicshop#trending'
	get 'comicshop/new' => 'comicshop#new'
	get 'comicshop/show/:id' => 'comicshop#show', as: 'meme'
	get 'comicshop/make' => 'comicshop#make_a_comic', as: 'memes'
	post 'comicshop/make' => 'comicshop#create'
	post 'comicshop/:meme_id/memecomments/' => 'memecomment#create', as: "meme_memecomments"
	get 'comicshop/:meme_id/memecomments/new' => 'memecomment#new', as: "new_meme_memecomments"
	get 'comicshop/like/:id' => 'comicshop#like'
	get 'comicshop/unlike/:id' => 'comicshop#unlike'
	get 'comicshop/dislike/:id' => 'comicshop#dislike'
	get 'comicshop/undislike/:id' => 'comicshop#undislike'

	get 'comicshop/cclike/:id' => 'memecomment#like'
	get 'comicshop/ccunlike/:id' => 'memecomment#unlike'
	get 'comicshop/ccdislike/:id' => 'memecomment#dislike'
	get 'comicshop/ccundislike/:id' => 'memecomment#undislike'

	get 'explain' => 'explain#index'
	post 'explain' => 'explain#createquery', as: 'queries'
	get 'explain/show/:id' => 'explain#show'
	post 'explain/show/:id' => 'explain#createexplanation', as: 'explanations'
	get 'explain/like/:id' => 'explain#like'
	get 'explain/unlike/:id' => 'explain#unlike'
	get 'explain/dislike/:id' => 'explain#dislike'
	get 'explain/undislike/:id' => 'explain#undislike'

	get'todo' => 'todo#index', as: 'tasks'
	get'todo/alltasks' => 'todo#alltasks'
	get'todo/donebox' => 'todo#donebox'
	get'todo/deletedbox' => 'todo#deletedbox'
	post'todo' => 'todo#create'
	get'todo/delete_task/:id' => 'todo#delete'
	get'todo/done_task/:id' => 'todo#done'
	get'todo/undone_task/:id' => 'todo#undone'
	get'todo/undelete_task/:id' => 'todo#undelete'
	
	get 'dictionary' => 'dictionary#new', as: 'words'
	post 'dictionary' => 'dictionary#create'
	get 'dictionary/random' => 'dictionary#random'
	get 'dictionary/word/:id' => 'dictionary#show'
	get 'dictionary/search' => 'dictionary#search'
	get 'definition/like/:id' => 'dictionary#like'
	get 'definition/unlike/:id' => 'dictionary#unlike'
	get 'definition/dislike/:id' => 'dictionary#dislike'
	get 'definition/undislike/:id' => 'dictionary#undislike'

	get 'secrets' => 'secrets#index', as: 'user_secrets'
	post 'secrets' => 'secrets#create'
	get 'secrets/all' => 'secrets#all' 
	get 'secrets/delete/:id' => 'secrets#delete'

	get 'currency_converter' => 'currency_converter#index'

	get 'locationer' => 'locationer#index'

	resources :videos
	post 'videos/:video_id/videocomments/' => 'videocomment#create', as: "video_videocomments"
	get 'videos/:video_id/videocomments/new' => 'videocomment#new', as: "new_video_videocomments"
	get 'videos/cat/:videocat_id' => 'videos#cat'
	get 'videos/like/:id' => 'videos#like'
	get 'videos/unlike/:id' => 'videos#unlike'
	get 'videos/dislike/:id' => 'videos#dislike'
	get 'videos/undislike/:id' => 'videos#undislike'

	get 'videos/cclike/:id' => 'videocomment#like'
	get 'videos/ccunlike/:id' => 'videocomment#unlike'
	get 'videos/ccdislike/:id' => 'videocomment#dislike'
	get 'videos/ccundislike/:id' => 'videocomment#undislike'

	get 'blacklist/cclike/:id' => 'complaintcomment#like'
	get 'blacklist/ccunlike/:id' => 'complaintcomment#unlike'
	get 'blacklist/ccdislike/:id' => 'complaintcomment#dislike'
	get 'blacklist/ccundislike/:id' => 'complaintcomment#undislike'
	
	get 'blacklist' => "blacklist#index"
	get 'blacklist/new' => "blacklist#new", as: 'complaints'
	post 'blacklist/new' => 'blacklist#create'
	get 'blacklist/show/:id' => 'blacklist#show', as: 'complaint'
	get 'blacklist/edit/:id' => 'blacklist#edit'
	patch 'blacklist/show/:id' => 'blacklist#update'
	get 'blacklist/constants' => 'blacklist#constants'
	post'blacklist/new_company' => 'blacklist#create_company', as: 'companies'
	post'blacklist/new_category' => 'blacklist#create_category', as: 'categories'
	get 'blacklist/index/:id' => 'blacklist#show_company'
	get 'blacklist/index/cat/:id' => 'blacklist#show_category'
	get 'blacklist/approve/:id' => 'blacklist#approve'
	post 'blacklist/:complaint_id/complaintcomments/' => 'complaintcomment#create', as: "complaint_complaintcomments"
	get 'blacklist/:complaint_id/complaintcomments/new' => 'complaintcomment#new', as: "new_complaint_complaintcomments"

	get 'blacklist/cclike/:id' => 'complaintcomment#like'
	get 'blacklist/ccunlike/:id' => 'complaintcomment#unlike'
	get 'blacklist/ccdislike/:id' => 'complaintcomment#dislike'
	get 'blacklist/ccundislike/:id' => 'complaintcomment#undislike'

	get 'blacklist/validcomplaint/:id' => 'blacklist#valid'
	get 'blacklist/unvalidcomplaint/:id' => 'blacklist#unvalid'
	get 'blacklist/invalidcomplaint/:id' => 'blacklist#invalid'
	get 'blacklist/uninvalidcomplaint/:id' => 'blacklist#uninvalid'
  

	get 'contact_us/index' => 'contact_us#index'
	get 'contact_us' => 'contact_us#new',as: 'contactmes'
	post 'contact_us' => 'contact_us#create'

	get 'tweetamela5er' => 'tweetamela5er#index'
	get 'tweetamela5er/unapproved' => 'tweetamela5er#unapproved'
	post 'tweetamela5er' => 'tweetamela5er#create',as: 'tweetamela5ers'
	get 'tweetamela5er/like/:id' => 'tweetamela5er#like'
	get 'tweetamela5er/unlike/:id' => 'tweetamela5er#unlike'
	get 'tweetamela5er/dislike/:id' => 'tweetamela5er#dislike'
	get 'tweetamela5er/undislike/:id' => 'tweetamela5er#undislike'
	get 'tweetamela5er/approve/:id' => 'tweetamela5er#approve'
	get 'tweetamela5er/delete/:id' => 'tweetamela5er#delete'


	get 'tweetamela5er/cclike/:id' => 'tweetacomment#like'
	get 'tweetamela5er/ccunlike/:id' => 'tweetacomment#unlike'
	get 'tweetamela5er/ccdislike/:id' => 'tweetacomment#dislike'
	get 'tweetamela5er/ccundislike/:id' => 'tweetacomment#undislike'
	post 'tweetamela5er/:tweetamela5er_id/tweetacomments/' => 'tweetacomment#create', as: "tweetamela5er_tweetacomments"
	get 'tweetamela5er/:tweetamela5er_id/tweetacomments/new' => 'tweetacomment#new', as: "new_tweetamela5er_tweetacomments"

	get 'wallmessages' => 'wallmessages#index', as: 'wallmessages'
  	post'/wallmessages' => 'wallmessages#create'

	get 'stopwatch' => 'stopwatch#index'

	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations"}
  	devise_scope :user do
  		get "/users/sign_out" => "devise/sessions#destroy"
  	end
	get 'profile/mine' => 'profile#mine'
	get'profile/all' => 'profile#index'
  	get'profile/edit' => 'profile#edit'
  	get'profile/:id' => 'profile#show', as: 'profile'
  	patch'profile/edit' => 'profile#update'

  	get 'profile/addfriend/:id' => 'profile#requestfriendship'
    get 'profile/acceptfriend/:id' => 'profile#acceptfriendship'
    get 'profile/declinefriend/:id' => 'profile#declinefriendship'
    get 'profile/unfriend/:id' => 'profile#unfriend'

    post 'profile/show/:id' => 'profile#createpost', as: 'posts'
    post 'profile/:post_id/postcomments/' => 'postcomment#create', as: "post_postcomments"
	get 'profile/:post_id/postcomments/new' => 'postcomment#new', as: "new_post_postcomments"

	get 'profile/cclike/:id' => 'postcomment#like'
	get 'profile/ccunlike/:id' => 'postcomment#unlike'
	get 'profile/ccdislike/:id' => 'postcomment#dislike'
	get 'profile/ccundislike/:id' => 'postcomment#undislike'

	get 'profile/validpost/:id' => 'profile#valid'
	get 'profile/unvalidpost/:id' => 'profile#unvalid'
	get 'profile/invalidpost/:id' => 'profile#invalid'
	get 'profile/uninvalidpost/:id' => 'profile#uninvalid'
	get 'profile/deletepost/:id' => 'profile#deletepost'

	get 'profile/:id/friends' => 'profile#friends'
    get 'profile/:id/wall' => 'profile#wall'
    get 'profile/:id/photos' => 'profile#photos'
    get 'profile/:id/failure' => 'profile#failure'

    get 'timeline' => 'timeline#index'
    post 'timeline' =>  'timeline#create', as: 'user_posts'

	get 'rockpaperscissors' => 'rockpaperscissors#index'
	get 'rockpaperscissors/advanced' => 'rockpaperscissors#advanced'
	get 'rpsls/click' => 'rockpaperscissors#click'

	get 'hexme' => 'hexme#index'

  	get 'testme' => 'editor#index'
  	get 'editor/click' => 'editor#index'

	get 'password_generator' => 'password_generator#index'
	get 'password_generator/click' => 'password_generator#click'

	get 'geometry_swiss_army_knife' => 'geometry_swiss_army_knife#index'
	get 'geometry_swiss_army_knife/click' => 'geometry_swiss_army_knife#click'

	get 'conjuring' => 'conjuring#index'
	get 'conjuring/click' => 'conjuring#click'

	get 'random_number' => 'random_number#index'
	get 'random_number/click' => 'random_number#click'

	get 'coinflip' => 'coinflip#index'
	get 'coinflip/click' => 'coinflip#click'

 	get 'home/new' => 'home#new', as: 'projects'
	post 'home/new' => 'home#create'
	post 'home' => 'countdown#create'
	get 'makesuper/:id' => 'home#makesuper'
	get 'unmakesuper/:id' => 'home#unmakesuper'

	get 'mailinglist' => 'mailinglist#index'

	get 'countdown' => 'countdown#index',as: 'visitoremails'
	post 'countdown' => 'countdown#create'

	root 'home#indexii'
	get 'home' => 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
