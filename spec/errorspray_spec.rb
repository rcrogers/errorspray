require 'bundler/setup'
Bundler.setup

require 'errorspray'

describe 'Kernel#raise_append' do

  SAFE_NUMBERS = [0, 1, 3]
  DANGEROUS_NUMBERS = [0, 1, 2, 3]

  def math(n)
    1 / (n - 2)
  end

  context 'when no exception is raised' do

    it 'returns the value of the block' do
      result = SAFE_NUMBERS.map do |n|
        raise_append "while mathing number: #{n}" do
          math(n)
        end
      end
      expect(result).to eql [-1, -1, 1]
    end

  end

  context 'when an exception is raised' do

    it 're-raises the exception with a String appended to the message' do
      expect do
        DANGEROUS_NUMBERS.map do |n|
          raise_append "while mathing number: #{n}" do
            math(n)
          end
        end
      end.to raise_error ZeroDivisionError, /while mathing number: 2/
    end

    it 're-raises the exception with a Proc\'s output appended to the message' do
      expect do
        DANGEROUS_NUMBERS.map do |n|
          raise_append lambda { "my least favorite number is: #{n}" } do
            math(n)
          end
        end
      end.to raise_error ZeroDivisionError, /my least favorite number is: 2/
    end

    it 're-raises the exception with several appenders' do
      expect do
        DANGEROUS_NUMBERS.map do |n|
          raise_append 'what a letdown', lambda { "this number held such promise: #{n}" } do
            math(n)
          end
        end
      end.to raise_error ZeroDivisionError, /what a letdown.*this number held such promise: 2/m
    end

  end

end
