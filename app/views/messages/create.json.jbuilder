json.name @message.user.name
json.text @message.text
json.time @message.created_at.to_s
json.image_url @message.image.to_s
