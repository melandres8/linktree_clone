module ApplicationHelper
  def link_to_add_socials(name, f, association)
    ## Create a new object from the association (:socials)
    new_object = f.object.send(association).klass.new
    ## Create or take the id from the new created object
    id = new_object.object_id
    ## Create the fields form
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    ## Pass down the link to the fields form
    link_to(name, "#", class: 'add_socials', data: {id: id, fields: fields.gsub("\n", "")})
  end
end
