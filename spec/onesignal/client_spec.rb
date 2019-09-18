# frozen_string_literal: true

require 'spec_helper'
include OneSignal

describe Client do
  subject { build :client }

  it 'creates a new client' do
    expect(subject).to be_instance_of Client
  end

  context 'error handling' do
    it 'does not raise an error if the response code is lesser than 400' do
      res = double :res, body: '{}', status: 200
      expect {
        subject.send :handle_errors, res
      }.not_to raise_error
    end

    it 'raises an error if the response code is greater than 399' do
      res = double :res, body: '{ "errors": ["Internal Server Error"] }', status: 500
      expect {
        subject.send :handle_errors, res
      }.to raise_error Client::ApiError, 'Internal Server Error'
    end

    it 'raises an error if the response code is greater than 399 with default error message' do
      res = double :res, body: '{}', status: 401
      expect {
        subject.send :handle_errors, res
      }.to raise_error Client::ApiError, 'Error code 401'
    end

    it 'raises an error if the body contains errors' do
      res = double :res, body: '{ "errors": ["Internal Server Error"] }', status: 200
      expect {
        subject.send :handle_errors, res
      }.to raise_error Client::ApiError, 'Internal Server Error'
    end
  end

  context 'fetch_notifications' do
    it 'appends kind if present' do
      expected_url = 'notifications?limit=50&offset=0&kind=1'
      expect(subject).to receive(:get).with(expected_url)
      subject.fetch_notifications(page_limit: 50, page_offset: 0, kind: 1)
    end

    it "doesn't append kind if absent" do
      expected_url = 'notifications?limit=50&offset=0'
      expect(subject).to receive(:get).with(expected_url)
      subject.fetch_notifications(page_limit: 50, page_offset: 0, kind: nil)
    end
  end
end
