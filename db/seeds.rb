
User.destroy_all
Project.destroy_all
UserProject.destroy_all
Board.destroy_all
Image.destroy_all
Comment.destroy_all

users = [{first_name: "Bob", last_name: "Smith", email: "bob@nouveauvetements.com", password: "bob", admin: true},
  {first_name: "Janice", last_name: "Noland", email: "janice@nouveauvetements.com", password: "janice", admin: true},
{first_name: "Kate", last_name: "Moss", email: "kate@fordmodels.com", password: "kate", admin: false},
{first_name: "Steven", last_name: "Miller", email: "steven@interiorstyle.com", password: "steven", admin: true},
{first_name: "James", last_name: "Jefferson", email: "james@interiorstyle.com", password: "james", admin: true},
{first_name: "Tilda", last_name: "Swenton", email: "Tilda@gmail.com", password: "Tilda", admin: false}]

some_users = users.each {|user| User.create(user)}

projects = [ {title: "Nouveau Vetements Eté 2020", status: "pending", description: "a collection inspired by various obscure and vague things"},
  {title: "Meditations on Vague Obscurity", status: "complete", description: "A lovely place to maybe live"}
]

some_projects = projects.each {|project| Project.create(project)}

user_projects = [lambda{Project.find_by(title: "Meditations on Vague Obscurity").users << User.find_by(first_name: "Steven")},
lambda{Project.find_by(title: "Meditations on Vague Obscurity").users << User.find_by(first_name: "James")},
lambda{Project.find_by(title: "Meditations on Vague Obscurity").users << User.find_by(first_name: "Tilda")},
lambda{Project.find_by(title: "Nouveau Vetements Eté 2020").users << User.find_by(first_name: "Bob")},
lambda{Project.find_by(title: "Nouveau Vetements Eté 2020").users << User.find_by(first_name: "Janice")},
lambda{Project.find_by(title: "Nouveau Vetements Eté 2020").users << User.find_by(first_name: "Kate")}
]

def make_projects(user_proj)
  user_proj.each{|up| up.call }
end

make_projects(user_projects)


boards = [{title: "Mood", project_id: Project.find_by(title: "Nouveau Vetements Eté 2020").id},
  {title: "Sketches" , project_id: Project.find_by(title: "Nouveau Vetements Eté 2020").id},
  {title: "Direction", project_id: Project.find_by(title: "Meditations on Vague Obscurity").id},
]

some_boards = boards.each {|board| Board.create(board)}

images = [{title: "image_3", board_id: Board.find_by(title: "Mood").id, user_id: User.find_by(first_name: "Janice").id, url: "stock_fashion/jap_vionnet.jpg"},
  {title: "image_1", board_id: Board.find_by(title: "Mood").id, user_id: User.find_by(first_name: "Bob").id , url: "stock_fashion/RobeSchiaparelli1932.jpg"},
  {title: "image_2", board_id: Board.find_by(title: "Mood").id, user_id: User.find_by(first_name: "Janice").id , url: "stock_fashion/schiaparelli.jpg"},
  {title: "image_1", board_id: Board.find_by(title: "Direction").id, user_id: User.find_by(first_name: "Steven").id, url: "tilda/San-Paolo-Church-Design-by-Studio-Fuksas-588x882.jpg"},
  {title: "image_2", board_id: Board.find_by(title: "Direction").id, user_id: User.find_by(first_name: "Steven").id, url: "tilda/pl_designarchitecture1_f2.jpg"},
  {title: "image_3", board_id: Board.find_by(title: "Direction").id, user_id: User.find_by(first_name: "Steven").id, url: "tilda/modernist-doll-houses-wolfgang-sirch-christoph-bitzer-design-childs-dream-t.jpeg"},
  {title: "image_4", board_id: Board.find_by(title: "Direction").id, user_id: User.find_by(first_name: "Steven").id, url: "tilda/interior-pf-Modern-Church-Design-in-Mexico.jpeg"},
  {title: "image_5", board_id: Board.find_by(title: "Direction").id, user_id: User.find_by(first_name: "James").id, url: "tilda/something-cool-is-here.jpg"},
  {title: "image_6", board_id: Board.find_by(title: "Direction").id, user_id: User.find_by(first_name: "James").id, url: "tilda/holy-rosary-church-trahan-600x600.jpg"},
  {title: "image_7", board_id: Board.find_by(title: "Direction").id, user_id: User.find_by(first_name: "James").id, url: "tilda/773085293_hisao-magma-7.jpg"}
]

some_images = images.each {|img| Image.create(img)}

comments = [{content: "nice image!", user_id: User.find_by(first_name: "James").id, project_id: Project.find_by(title: "Meditations on Vague Obscurity").id, image_id: Image.find_by(url: "tilda/pl_designarchitecture1_f2.jpg")},
{content: "Love love love the concrete", user_id: User.find_by(first_name: "Steven").id, project_id: Project.find_by(title: "Meditations on Vague Obscurity").id, board_id: Board.find_by(title: "Direction").id},
{content: "We should focus on concrete. Concrete is the essence of Rock", user_id: User.find_by(first_name: "Steven").id, project_id: Project.find_by(title: "Meditations on Vague Obscurity").id },
#{content: "lets photoshop a pic of her sleeping on this", user_id: User.find_by(first_name: "James").id, project_id: Board.find_by(title: "Direction").id, image_id: Image.find_by(url: "tilda/modernist-doll-houses-wolfgang-sirch-christoph-bitzer-design-childs-dream-t.jpeg").id }
]

some_comments = comments.each {|comment| Comment.create(comment)}
