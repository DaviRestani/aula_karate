Feature: Testando Api de premio nobel

Background: api de premio nobel
    * def url_base = 'http://api.nobelprize.org/2.1'

Scenario: Mostrar premios nobel em ordem crescente
    Given url url_base
    And path '/nobelPrizes?sort=asc'
    When method get
    Then status 200

Scenario: Mostrar premio nobel de medicina 1999
    Given url url_base
    And path '/nobelPrize/med/1999'
    When method get
    Then status 200


Scenario: Mostrar premios nobels de medicina em ordem decrescente
    Given url url_base
    And path '/nobelPrizes?sort=desc&nobelPrizeCategory=med'
    When method get
    Then status 200


Scenario: Mostra laureados com nobel em ordem crescente
    Given url url_base
    And path '/laureates?sort=asc'
    When method get
    Then status 200

Scenario: Não funciona, pois infelizmte não existem premios nobel de futebol.
    Given url url_base
    And path '/nobelPrize/futebol/2001'
    When method get
    Then status 200


Scenario: Mostrar premios nobels de futbol em ordem decrescente. Não funciona, pois infelizmte não existem premios nobel de futebol.
    Given url url_base
    And path '/nobelPrizes?sort=desc&nobelPrizeCategory=fut'
    When method get
    Then status 200