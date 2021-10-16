# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Genre, 'Genreモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { genre.valid? }
    let(:genre) { create(:genre) }

    context 'nameカラム' do
      it '空欄でないこと' do
        genre.name = ''
        is_expected.to eq false
      end

      it '15文字以下 ○' do
        genre.name = Faker::Lorem.characters(number: 15)
        is_expected.to eq true
      end

      it '15文字以上 X' do
        genre.name = Faker::Lorem.characters(number: 16)
        is_expected.to eq false
      end

    end
  end

  describe 'アソシエーションのテスト' do
    context 'Itemモデルとの関係' do
      it '1:Nとなっている' do
        expect(Genre.reflect_on_association(:items).macro).to eq :has_many
      end
    end
  end
end