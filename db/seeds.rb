# create 3 users
user1 = User.create({email: "yodathemasta@lightforce.co", first_name: "Yoda", last_name: "Greeny",image_url:"/yoda/img.png"})
user2 = User.create({email: "luker@lightforce.co", first_name: "Luke", last_name: "Sky_walker",image_url:"/luke/img.png"})
user3 = User.create({email: "darkOG@darkforce.co", first_name: "Darth", last_name: "Vader",image_url:"darth/img/png"})

# add some pages to user1 (Yoda)
user1.pages.create({name: "hmmm", content: "you must unlearn what you have learned"});
user1.pages.create({name: "Oh wow", content: "jedi's rock"});
# add some pages to user2 (luke)
user2.pages.create({name: "LukeAboutMe", content: "i know the force"});
user2.pages.create({name: "LukeCOntact", content: "use the force to find me bro"})
# add a page to user3 (Darth)
user3.pages.create({name: "DeathStarResorts", content: "Please visit our family business!"});

#############################
# create 4 posts
post1 = Post.create({title: "the force using for dummies", body: "Coming soon by YODA"})
post2 = Post.create({title: "lightsaber color chart", body: "chopping off limbs with style"})
post3 = Post.create({title: "Help! My dad is missing", body: "Help me find my dad =("})
post4 = Post.create({title: "StromTrooper discipline pamphlet", body: "Pushup reps as a punishiment"})

# add 2 posts to user1 (yoda)
user1.posts << post1
user1.posts << post2
# add 1 post to user2 (luke)
user2.posts << post3
# add 1 post to user 3 (darth)
user3.posts << post4

############################
# create 3 tags
tag1 = Tag.create({name: "#Master"})
tag2 = Tag.create({name: "#Padavan"})
tag3 = Tag.create({name: "#DarkSide"})


############################
#create 4 comments
comment1 = Comment.create({content: "ty master, very helpful --the green girl from the front row"})
comment2 = Comment.create({content: "sorry to hear that, man =( --JawaTheRobotSteeler"})
comment3 = Comment.create({content: "I object! You could use some pushups yourself! --TrooperTheLazy"})
comment4 = Comment.create({content: "I luv pushups!!! Yeeeeeah!!! --TrooperTheLifter"})

#add comment1 to post1
post1.comments << comment1
#add comment2 to post2
post2.comments << comment2
#add comment3 and comment4 to post4
post4.comments << comment3
post4.comments << comment4

############################
# create 3 comments-on-comments
comment1ONE = Comment.create({content: "yeah i agree"})
comment1TWO = Comment.create({content: "the master should learn some grammar"})
comment4ONE = Comment.create({content: "Yeah man! That's the spirit! --Darth"})

#add comment1ONE and comment1TWO to comment1
comment1.comments << comment1ONE
comment1.comments << comment1TWO
#add comment4ONE to comment4
comment4.comments << comment4ONE







