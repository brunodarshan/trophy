# Trophy Goals :trophy:

Teste para a vaga de Back-end developer Ribon.

# Get Started

Este projeto foi desenvolvivo em um ambiente containerizado. Para utilizá-lo você pode seguir os seguinte passos. 

```$ make install``` 

```$ make run```

Se não:

```
    docker-compose down && 
    docker-compose run --rm app rails db:create db:migrate db:seed
```
seguido de:
```
    docker-compose up
```