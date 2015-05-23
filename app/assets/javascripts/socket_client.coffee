$ ->
  socket = io.connect('ws://127.0.0.1:5001/');
  $(document).ready ->
    #以下でroomに所属する
    #socket.emit('join_to_room', room_name);

  socket.on 'create', (data) ->
    console.log data
    book_json  = JSON.parse(data)
    tr_element = '<tr><td>'
    tr_element = tr_element + book_json.title
    tr_element = tr_element + '</td><td>'
    tr_element = tr_element + book_json.author
    tr_element = tr_element + '</td><td></td><td></td><td></td></tr>'

    $('tbody').append tr_element

