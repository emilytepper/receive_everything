class Gift < ActionMailer::Base
  default from: "Emily Tepper <mail@receiveeverything.com>"

  def initiate mystic
    attachments['ireceive.mp3'] = File.read(File.join(Rails.root, 'public', 'secretfolder', 'ireceive.mp3'))
    mail to: mystic.email
  end
end
