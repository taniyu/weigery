$('.uk-modal').html('<%= escape_javascript(render partial: "physicals/form", locals: { physical: @physical }) %>')
UIkit.modal('.uk-modal').show()
