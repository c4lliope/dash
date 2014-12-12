sf_thoughtbotters = [
  { basecamp_name:"Bernerd Schaefer", thoughtbot_email_name:"b" },
  { basecamp_name:"Adarsh Pandit" },
  { basecamp_name:"Carolann Bonner" },
  { basecamp_name:"Dan Croak" },
  { basecamp_name:"Galen Frechette" },
  { basecamp_name:"Carlo Iyog" },
  { basecamp_name:"Devon St.Clair" },
  { basecamp_name:"Don Okuda" },
  { basecamp_name:"Grayson Wright" },
  { basecamp_name:"Greg Lazarev" },
  { basecamp_name:"Jeff Smith" },
  { basecamp_name:"Jessie Young" },
  { basecamp_name:"Keith Smiley" },
  { basecamp_name:"Laila Winner" },
  { basecamp_name:"Mark Adams" },
  { basecamp_name:"Michelle Venetucci Harvey" },
  { basecamp_name:"Rich Rines" },
  { basecamp_name:"Simon Taranto" },
  { basecamp_name:"Steven Harley" },
]

sf_thoughtbotters.each do |attrs|
  User.create(attrs)
end
