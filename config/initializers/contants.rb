# frozen_string_literal: true

module REGEXP
  EMAIL = /\A[\w.-]+@[a-zA-Z\d.-]+\.[a-zA-Z]{2,}/

  PASSWORD = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%\^&*])/
  module BRAZIL
    CPF = /\A\d{3}\.\d{3}\.\d{3}-\d{2}/
    CNPJ = %r{\A\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}}
    CPF_OR_CNPJ = %r{(\A\d{3}\.\d{3}\.\d{3}-\d{2})||(\A\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2})}
    PHONE_NUMBER = /\A(\(\d{2}\)\s?)?(\d{4,5}-\d{4})/
  end

  module HTML
    EMAIL = '^[\w.-]+@[a-zA-Z\d.-]+\.[a-zA-Z]{2,}$'
    PASSWORD = '^((?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%\^&*])){8,}'

    module BRAZIL
      CPF = '^\d{3}\.\d{3}\.\d{3}-\d{2}$'
      CNPJ = '^\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}$'
      CPF_OR_CNPJ = '^\d{3}\.\d{3}\.\d{3}-\d{2}$|^\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}$'
      PHONE_NUMBER = '^(\(\d{2}\)\s?)?(\d{4,5}-\d{4})$'
    end
  end
end
