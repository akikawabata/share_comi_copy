# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  admin1=Admin.create(
    email: "admin@email",
    password: "adminadmin",
    company: "株式会社シェアコミ",
    company_address: "admin1-1",
    administrator_name: "admin管理者"
  )

  team1=Team.create!(
    admin_id: 1,
    team_name: "シェアコミ企画制作"
    )

  member1 = Member.create!(
    screen_name: "佐藤春樹",
    email: "member2@email",
    password: "member",
    team_id: 1
  )
  
  member2 = Member.create!(
    screen_name: "川畠有貴",
    email: "member@email",
    password: "member",
    team_id: 1
  )
  
  pp member1
  pp member2
  
  project_names = ["新規プレゼント企画", "夏休みスタンプラリー", "第３回秋の川柳大会", "お月見ログインスタンプ", "youtube動画「●●●紹介動画」制作","新規プレゼント企画", "夏休みスタンプラリー", "第３回秋の川柳大会", "お月見ログインスタンプ", "youtube動画「●●●紹介動画」制作"]
  project_details = [
    "新規登録者にギフトカードをプレゼントをします・・・・・・・・・・・・・・・・・・・・",
    "期間中にスタンプを集めた人に・・・・・・・・・・・・・・・・・・・",
    "川柳を投稿した方で入賞した方に・・・・・・・・・・・・・・・・・・・",
    "期間中毎日ログインで・・・・・・・・・・・・・・・・・・・",
    "●●と●●と●●のメンバーで●●の企画をするので以下準備を・・・",
    "新規登録者にギフトカードをプレゼントをします・・・・・・・・・・・・・・・・・・・・",
    "期間中にスタンプを集めた人に・・・・・・・・・・・・・・・・・・・",
    "川柳を投稿した方で入賞した方に・・・・・・・・・・・・・・・・・・・",
    "期間中毎日ログインで・・・・・・・・・・・・・・・・・・・",
    "●●と●●と●●のメンバーで●●の企画をするので以下準備を・・・"
  ]
  10.times do |i|
    start_date_time = Time.zone.now + (i * 7).days
    end_date_time = start_date_time + 5.days
    project = Project.create!(
      member_id: member1.id,
      team_id: 1,
      project_name: project_names[i],
      project_details: project_details[i],
      start_date_time: start_date_time,
      end_date_time: end_date_time
    )
    pp project
  
    task = ["フレームワーク制作", "メインビジュアル3種"]
  
    2.times do |j|
      member_task = MemberTask.create!(
        project_id: project.id,
        member_id: (j == 0) ? member1.id : member2.id,
        task: task[j],
        making_status: 1
      )
      pp member_task
    end
  end