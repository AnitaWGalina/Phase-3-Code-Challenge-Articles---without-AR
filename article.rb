class Article
  # ...

  def author
    self.author
  end

  def magazine
    self.magazine
  end
end

class Author
  # ...

  def articles
    Article.all.select { |article| article.author == self }
  end

  def magazines
    articles.map { |article| article.magazine }.uniq
  end
end

class Magazine
  # ...

  def contributors
    Article.all.select { |article| article.magazine == self }.map { |article| article.author }
  end
end


class Author
  # ...

  def add_article(magazine, title)
    Article.new(self, magazine, title)
  end

  def topic_areas
    magazines.map { |magazine| magazine.category }.uniq
  end
end

class Magazine
  # ...

  def self.find_by_name(name)
    all.find { |magazine| magazine.name == name }
  end

  def article_titles
    Article.all.select { |article| article.magazine == self }.map { |article| article.title }
  end

  def contributing_authors
    contributors.group_by { |author| author }.select { |_, articles| articles.size > 2 }.keys
  end
end
