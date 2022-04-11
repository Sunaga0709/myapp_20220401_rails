require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'イベント作成' do
    context '成功する' do
      it 'データがすべてあり、すべてのデータが適正値である' do
        # テストイベント作成
        event = Event.new(
          name: '予定1', 
          start: '2022-04-01 10:00', 
          end: '2022-04-01 11:00',
          memo: 'メモ',
          color: 'red'
        )
        # バリデーションチェック
        expect(event).to be_valid
        # テストイベント保存
        event.save

        # 保存したイベントを取得
        saved_event = Event.last

        # 各項目を上記のテストデータと合っているかテスト
        expect(saved_event.name).to eq('予定1')
        expect(saved_event.start).to eq('2022-04-01 10:00:00 +0900')
        expect(saved_event.end).to eq('2022-04-01 11:00:00 +0900')
        expect(saved_event.memo).to eq('メモ')
        expect(saved_event.color).to eq('red')
      end

      it '必須データがあり、すべてが適正値である' do 
        event = Event.new(
          name: '予定2', 
          start: '2022-04-01 11:00', 
          end: '2022-04-01 12:00',
          memo: nil,
          color: nil
        )
        # 成功しているか検証
        expect(event).to be_valid
        # テストイベント保存
        event.save

        # 保存したイベントを取得
        saved_event = Event.last

        # 各項目を上記のテストデータと合っているか検証
        expect(saved_event.name).to eq('予定2')
        expect(saved_event.start).to eq('2022-04-01 11:00:00 +0900')
        expect(saved_event.end).to eq('2022-04-01 12:00:00 +0900')
        expect(saved_event.memo).to eq(nil)
        expect(saved_event.color).to eq(nil)
      end
    end

    context '失敗する' do 
      it '必須データがすべてない' do 
        # テストデータ作成
        event = Event.new(
          name: nil, 
          start: nil, 
          end: nil
        )

        # 失敗することを検証
        expect(event).to_not be_valid
      end

      it '必須データが1つ以上ない' do 
        # テストデータ作成
        event = Event.new(
          name: nil,
          start: '2022-04-01 12:00', 
          end: '2022-04-01 13:00'
        )

        # 失敗することを検証
        expect(event).to_not be_valid
      end

      it '必須データがすべてあり、終了時間が開始時間以前である' do 
        # テストデータ作成
        event = Event.new(
          name: '予定6',
          start: '2022-04-01 20:00',
          end: '2022-04-01 10:00'
        )

        # 失敗することを検証
        expect(event).to_not be_valid
      end

      it '必須データがすべてあり、nameが21文字以上' do 
        # テストデータ作成
        event = Event.new(
          name: '予定012345678901234567890123',
          start: '2022-04-01 10:00',
          end: '2022-04-01 11:00'
        )

        # 失敗することを検証
        expect(event).to_not be_valid
      end
    end
  end
end
