class Base
  include JSONAPI::Consumer::Resource

  self.host = 'http://localhost:3000/api/'
end


class BasicResource < Base

end


# BEGIN - Blog example
module Blog
  class Author < Base
    has_many :posts, class_name: 'Blog::Post'
  end

  class Post < Base
    has_one :author, class_name: 'Blog::Author'
    has_many :comments, class_name: 'Blog::Comment'
  end

  class Comment < Base
    # belongs_to :post, class_name: 'Blog::Post'
    # has_one :author, class_name: 'Blog::Author'
  end
end
# END - Blog example
