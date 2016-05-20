namespace :server do
  task :dev do
    `rails s thin -p 5005`
  end
end
