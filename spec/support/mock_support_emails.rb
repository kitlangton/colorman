class SupportEmailFactory
  def initialize(mailer:Gmail)
    @mailer = mailer
  end

  def all
    [
      SupportEmail.new(
        name: "Steven Fraser",
        email: "kit.langton+steven@gmail.com",
        phone: "5626776786",
        body: "phone: 5626776786\nusername: s1frast\nCannot login  ",
        subject: "Request support from Steven Fraser (steven.fraser@gowrieless.com)  on login issues"),
      SupportEmail.new(
        name: "Brittney",
        email: "kit.langton+britney@gmail.com",
        phone: "5626776786",
        body: "Can we please get an accessory COC that has the jbl flip 2 with the new price (99.99) and the clip and pulse still on it?",
        subject: "Request support from Brittney (Brittney.stapleton@vzw.com)  user 'D32109' from the West area on general feedback")
    ]
  end
end
