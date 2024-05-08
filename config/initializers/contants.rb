# frozen_string_literal: true

module REGEXP
  EMAIL = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%\^&*])/
  module BRAZIL
    CPF = /^\d{3}\.\d{3}\.\d{3}-\d{2}/
    CNPJ = %r{^\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}}
    CPF_OR_CNPJ = %r{(^\d{3}\.\d{3}\.\d{3}-\d{2})||(^\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2})}
    PHONE_NUMBER = /^(\(\d{2}\)\s?)?(\d{4,5}-\d{4})/
  end
end
