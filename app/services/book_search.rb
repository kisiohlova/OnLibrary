class BookSearch
  def self.search(query)
    return Book.none if query.blank?

    search_results = BooksIndex.query(
      multi_match: {
        query: query,
        fields: search_fields,
        operator: "and"
      }
    ).load

    Book.where(id: search_results.map(&:id))
  end

  private

  def self.search_fields
    [:title, :author, :description]
  end
end
