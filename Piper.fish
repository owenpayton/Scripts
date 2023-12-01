echo "Clipboard content: "
xclip -o
echo " "\n
read -P "Enter title: " user_input
xclip -o | \
  piper --model ~/Scripts/en_US-arctic-medium.onnx --output_file ~/Audio/$user_input.mp3& wait $pid 

# Check if the piper command was successful
if test $status -eq 0
    kdialog --passivepopup "Successfully created $user_input.mp3 in ~/Audio/" 5
else
    kdialog --error "Audio file creation failed."
end
