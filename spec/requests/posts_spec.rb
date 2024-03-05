# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    subject(:request) { get '/' }

    it 'returns 200' do
      request

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /posts/new' do
    subject(:request) { get '/posts/new' }

    it 'returns 200' do
      request

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /posts' do
    subject(:request) { post '/posts', params: { post: { body: body, title: title } } }

    let(:body) { 'This is the body from some post.' }
    let(:title) { 'Some post title' }

    it 'returns 302' do
      request

      expect(response).to have_http_status(:found)
    end

    it 'creates the Post successfully' do
      expect { request }.to change(Post, :count).from(0).to(1)
    end

    it 'redirects to post show' do
      request

      expect(response).to redirect_to(post_path(id: Post.last.id))
    end
  end

  describe 'GET /posts/:id' do
    subject(:request) { get "/posts/#{post.id}" }

    let(:post) { create(:post) }

    it 'returns 200' do
      request

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /posts/:id/edit' do
    subject(:request) { get "/posts/#{post.id}/edit" }

    let(:post) { create(:post) }

    it 'returns 200' do
      request

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT /posts/:id' do
    subject(:request) do
      put "/posts/#{post.id}", params: { post: { title: new_title } }
    end

    let(:post) { create(:post, title: old_title) }
    let(:old_title) { 'Post wront title' }
    let(:new_title) { 'Post new title' }

    it 'returns 303' do
      request

      expect(response).to have_http_status(:see_other)
    end

    it 'updates the Post successfully' do
      request

      expect(post.reload.title).to eq(new_title)
    end

    it 'redirects to post show' do
      request

      expect(response).to redirect_to(post_path(id: post.id))
    end
  end

  describe 'DELETE /posts/:id' do
    subject(:request) { delete "/posts/#{post.id}" }

    let!(:post) { create(:post) }

    it 'returns 303' do
      request

      expect(response).to have_http_status(:see_other)
    end

    it 'deletes the Post successfully' do
      expect { request }.to change(Post, :count).from(1).to(0)
    end

    it 'redirects to post show' do
      request

      expect(response).to redirect_to(posts_path)
    end
  end
end
