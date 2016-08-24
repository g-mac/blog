object @article

attributes :id, :title, :text, :created_at, :updated_at
child(:comments) { attributes :commenter, :body }