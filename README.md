# シェアコミ
​
## サイト概要
### サイトテーマ
分類：複合サイト<br>
目的：チームの共有漏れをなくす運用向けのチーム管理サイトです。
<!--何を『目的』とし、どのような『分類』なのかを簡潔に書く-->

### テーマを選んだ理由
前職での企画やキャンペーンの共有漏れで、実装ギリギリの制作などを体験したことがありました。<br>
共有漏れが発生する原因として、企画やキャンペーンの資料の散乱や、
それに加え、次の仕事に追われ共有を忘れてしまうのではないかと考えました。

自分のタスクやこれから制作する企画を簡単に管理できる運用向けの管理ツールがあれば
チームへの共有漏れが解決できるのではないかと考えました。

似ている管理ツールではBacklogやRedmineなどありますが、プロジェクト単位が多く、
既に運用が始まっているチームで活用するには、
一つ登録した企画枠の中で複数の担当に割り振りできないのが難点だと感じています。
また可能だとしても、担当者毎に新しく項目を登録する必要があります。

私が考えたのは、一つの登録（企画等）に対し、複数人に担当振り分けが簡単にでき、
また、各担当の進捗状況が見える運用向けの管理サービスです。
<!--なぜこのようなテーマにしたかを説明する-->

### ターゲットユーザ
- ビジネスなどにおいてアプリなど運用を開始しているチーム
- チームでの共有漏れが多いと感じている人
- 担当の割り振り、自分のタスクの管理に漏れが多いと感じている人
- 在宅ワークにて、チームの共有漏れが多くなってきた人

<!--誰に使ってもらうかを具体的に記載する-->

### 主な利用シーン
- 企画やキャンペーンの詳細が確定した時（チームに自動で共有）
- 企画に必要な素材が揃っているか確認する時（メイン画面で常に担当タスクの残数を表示）
- 制作を忘れていた担当者がいた時

<!--どのような時に使うのかの状況を記載すること-->

## 設計書
- アプリケーション詳細設計書：https://docs.google.com/spreadsheets/d/1qYKOdAsgnQTgdlWgKxfj_s7qxvDsh8yH/edit?gid=549108681#gid=549108681
- テーブル定義書：https://docs.google.com/spreadsheets/d/1tENCim0ezNmdF65forXJ7a1_HkOEPDOSa38mrJ1gvxw/edit?gid=1243549839#gid=1243549839
- https://app.diagrams.net/?src=about#G1R0FyUqn8tlkCV3Csaq2u2UUKVoOqZfKZ#%7B%22pageId%22%3A%2239JxW9BF5L5hqCkpsdiR%22%7D
- UI flow（ユーザー）：https://app.diagrams.net/?src=about#G1R0FyUqn8tlkCV3Csaq2u2UUKVoOqZfKZ#%7B%22pageId%22%3A%22C5RBs43oDa-KdzZeNtuy%22%7D
- UI flow（管理者）：hhttps://app.diagrams.net/?src=about#G1R0FyUqn8tlkCV3Csaq2u2UUKVoOqZfKZ#%7B%22pageId%22%3A%22IdAqZzrSLQAh3Ao71TNA%22%7D
- ER図：https://app.diagrams.net/?src=about#G1R0FyUqn8tlkCV3Csaq2u2UUKVoOqZfKZ#%7B%22pageId%22%3A%2239JxW9BF5L5hqCkpsdiR%22%7D

## 開発環境
- OS：MacOS Big Sur
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- IDE：Cloud9


## 使用予定素材
- フォント素材（フリー）：Font Free
- イラスト素材（フリー）：イラストAC
- ロゴ作成：designevo
- 実装機能リストのURL：https://docs.google.com/spreadsheets/d/1cuZQ8QPne-b8HXIF-dAIXnZGvZ1zgcf3-Ny5Agscr_o/edit#gid=885378170

<!--- 外部サービスの画像素材・音声素材を使用した場合は、必ずサービス名とURLを明記してください。-->
<!--- アプリケーションの実装に使用したgem/bootstrapのリファレンスなどの記載は不要です。-->
<!--- 使用しない場合は、使用素材の項目をREADMEから削除してください。-->