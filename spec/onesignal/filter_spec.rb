# frozen_string_literal: true

require 'spec_helper'
include OneSignal

describe Filter do
  context 'builder' do
    it 'builds a last session filter with lesser_than' do
      filter = described_class.last_session.lesser_than(1.1).hours_ago!
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'last_session'
      expect(filter.relation).to eq '<'
      expect(filter.hours_ago).to eq '1.1'
    end

    it 'builds a last session filter with greater_than' do
      filter = described_class.last_session.greater_than(1.1).hours_ago!
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'last_session'
      expect(filter.relation).to eq '>'
      expect(filter.hours_ago).to eq '1.1'
    end

    it 'builds a first session filter with lesser_than' do
      filter = described_class.first_session.lesser_than(1.1).hours_ago!
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'first_session'
      expect(filter.relation).to eq '<'
      expect(filter.hours_ago).to eq '1.1'
    end

    it 'builds a first session filter with greater_than' do
      filter = described_class.first_session.greater_than(1.1).hours_ago!
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'first_session'
      expect(filter.relation).to eq '>'
      expect(filter.hours_ago).to eq '1.1'
    end

    it 'builds a session count filter with lesser_than' do
      filter = described_class.session_count.lesser_than(1)
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'session_count'
      expect(filter.relation).to eq '<'
      expect(filter.value).to eq '1'
    end

    it 'builds a session count filter with greater_than' do
      filter = described_class.session_count.greater_than(1)
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'session_count'
      expect(filter.relation).to eq '>'
      expect(filter.value).to eq '1'
    end

    it 'builds a session count filter with equals' do
      filter = described_class.session_count.equals(1)
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'session_count'
      expect(filter.relation).to eq '='
      expect(filter.value).to eq '1'
    end

    it 'builds a session count filter with not_equals' do
      filter = described_class.session_count.not_equals(1)
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'session_count'
      expect(filter.relation).to eq '!='
      expect(filter.value).to eq '1'
    end

    it 'builds a session time filter with lesser_than' do
      filter = described_class.session_time.lesser_than(1600)
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'session_time'
      expect(filter.relation).to eq '<'
      expect(filter.value).to eq '1600'
    end

    it 'builds a session time filter with greater_than' do
      filter = described_class.session_time.greater_than(1600)
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'session_time'
      expect(filter.relation).to eq '>'
      expect(filter.value).to eq '1600'
    end

    it 'builds an amount spent filter with lesser_than' do
      filter = described_class.amount_spent.lesser_than(1600)
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'amount_spent'
      expect(filter.relation).to eq '<'
      expect(filter.value).to eq '1600'
    end

    it 'builds an amount spent filter with greater_than' do
      filter = described_class.amount_spent.greater_than(1600)
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'amount_spent'
      expect(filter.relation).to eq '>'
      expect(filter.value).to eq '1600'
    end

    it 'builds an amount spent filter with equals' do
      filter = described_class.amount_spent.equals(1600)
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'amount_spent'
      expect(filter.relation).to eq '='
      expect(filter.value).to eq '1600'
    end

    it 'builds a bought sku filter with lesser_than' do
      filter = described_class.bought_sku('test').lesser_than(0.99)
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'bought_sku'
      expect(filter.key).to eq 'test'
      expect(filter.relation).to eq '<'
      expect(filter.value).to eq '0.99'
    end

    it 'builds a bought sku filter with greater_than' do
      filter = described_class.bought_sku('test').greater_than(0.99)
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'bought_sku'
      expect(filter.key).to eq 'test'
      expect(filter.relation).to eq '>'
      expect(filter.value).to eq '0.99'
    end

    it 'builds a bought sku filter with equals' do
      filter = described_class.bought_sku('test').equals(0.99)
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'bought_sku'
      expect(filter.key).to eq 'test'
      expect(filter.relation).to eq '='
      expect(filter.value).to eq '0.99'
    end

    it 'builds a tag filter with lesser_than' do
      filter = described_class.tag('test').lesser_than('t')
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'tag'
      expect(filter.key).to eq 'test'
      expect(filter.relation).to eq '<'
      expect(filter.value).to eq 't'
    end

    it 'builds a tag filter with greater_than' do
      filter = described_class.tag('test').greater_than('t')
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'tag'
      expect(filter.key).to eq 'test'
      expect(filter.relation).to eq '>'
      expect(filter.value).to eq 't'
    end

    it 'builds a tag filter with equals' do
      filter = described_class.tag('test').equals('t')
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'tag'
      expect(filter.key).to eq 'test'
      expect(filter.relation).to eq '='
      expect(filter.value).to eq 't'
    end

    it 'builds a tag filter with not_equals' do
      filter = described_class.tag('test').not_equals('t')
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'tag'
      expect(filter.key).to eq 'test'
      expect(filter.relation).to eq '!='
      expect(filter.value).to eq 't'
    end

    it 'builds a tag filter with exists' do
      filter = described_class.tag('test').exists
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'tag'
      expect(filter.key).to eq 'test'
      expect(filter.relation).to eq 'exists'
    end

    it 'builds a tag filter with not_exists' do
      filter = described_class.tag('test').not_exists
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'tag'
      expect(filter.key).to eq 'test'
      expect(filter.relation).to eq 'not_exists'
    end

    it 'builds a language filter with equals' do
      filter = described_class.language.equals(:en)
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'language'
      expect(filter.relation).to eq '='
      expect(filter.value).to eq 'en'
    end

    it 'builds a language filter with not_equals' do
      filter = described_class.language.not_equals(:en)
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'language'
      expect(filter.relation).to eq '!='
      expect(filter.value).to eq 'en'
    end

    it 'builds an app version filter with lesser_than' do
      filter = described_class.app_version.lesser_than('t')
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'app_version'
      expect(filter.relation).to eq '<'
      expect(filter.value).to eq 't'
    end

    it 'builds an app version filter with greater_than' do
      filter = described_class.app_version.greater_than('t')
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'app_version'
      expect(filter.relation).to eq '>'
      expect(filter.value).to eq 't'
    end

    it 'builds an app version filter with equals' do
      filter = described_class.app_version.equals('t')
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'app_version'
      expect(filter.relation).to eq '='
      expect(filter.value).to eq 't'
    end

    it 'builds an app version filter with not_equals' do
      filter = described_class.app_version.not_equals('t')
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'app_version'
      expect(filter.relation).to eq '!='
      expect(filter.value).to eq 't'
    end

    it 'builds an location filter' do
      filter = described_class.location(radius: 15, lat: '1243434', long: '12314325')
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'location'
      expect(filter.location.radius).to eq 15
      expect(filter.location.latitude).to eq '1243434'
      expect(filter.location.longitude).to eq '12314325'
    end

    it 'builds an email filter' do
      filter = described_class.email('test@example.com')
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'email'
      expect(filter.value).to eq 'test@example.com'
    end

    it 'builds a country filter' do
      filter = described_class.country.equals('US')
      expect(filter).to be_instance_of described_class
      expect(filter.field).to eq 'country'
      expect(filter.relation).to eq '='
      expect(filter.value).to eq 'US'
    end
  end

  context 'validations' do
    skip('TODO') # TODO: implement validations
  end

  context 'json' do
    it 'serializes OR operator correctly' do
      expect(described_class::OR.to_json).to eq '{"operator":"OR"}'
    end

    it 'serializes a chain of filters correctly' do
      filters = [described_class.last_session.lesser_than(2).hours_ago!,
                 described_class.session_count.equals(5),
                 described_class::OR,
                 described_class.country.equals('IT')]
      json = '[{"field":"last_session","relation":"<","hours_ago":"2"},'\
'{"field":"session_count","relation":"=","value":"5"},{"operator":"OR"},'\
'{"field":"country","relation":"=","value":"IT"}]'

      expect(filters.to_json).to eq json
    end
  end

  context Filter::FilterBuilder do
    subject { described_class.new 'test' }
    context 'aliases' do
      it 'has all builder method aliased' do
        [
          %i[lesser_than <],
          %i[greater_than >],
          %i[equals ==],
          %i[not_equals !=]
        ].each do |method_name|
          name, al = method_name
          expect(subject.method(name)).to eq subject.method(al)
        end
      end
    end
  end
end
