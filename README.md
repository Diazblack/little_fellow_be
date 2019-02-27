# README
# Little Fellow

This application allow the user find information about pets of different breed in adoption.

This app consumes the the the [Petfinder API](https://www.petfinder.com/developers/api-docs), the API have a detail database of pet of different species, with images and information about shelter and locations to pick.



This app was built in Ruby on Rails as the Backend service endpoint.


## Setup

### Clone

```
$ git clone git@github.com:Diazblack/little_fellow_be/.git
$ cd little_fellow_be
```

### Bundle
After cd in the directory run bundler to install the gems

```
$ bundle
```

### Database setup

To create the production database and set the migrations

```
$ bundle exec rake db:{create,migrate}
```

__Note__: This application is built using Ruby 2.4.1, [here](https://github.com/rbenv/rbenv) is a link to the rbenv repo for more information

## Configuration

### API's

#### Petfinder API
You can apply for a free key here [Petfinder API](https://www.petfinder.com/developers/api-docs).


#### Gem: Figaro

[Figaro](https://github.com/laserlemon/figaro) is a Ruby gem that allows to hide sensitive information (API keys), figaro will create a file in the config folder call ``` config/application.yml```, and this file will be added to .gitignore file to prevent the information get push to the cloud.

Place your api's key in the application.yml

````yml
petfinder_api_key:: petfinder-api-key

````
## Test

To run the test suit type

```
bundle exec rspec
```

To run a particular test or folder

```
bundle exec rspec ./spec/path_to_file_or_directory
```

## Endpoints

### Random pet endpoint

Hitting the endpoint

```
https://little-fellow-be.herokuapp.com/api/v1
```
Will result with a response of a random pet information

```json
{
    "name": "Kira",
    "id": "43849808",
    "age": "Young",
    "size": "M",
    "sex": "F",
    "animal": "Cat",
    "img_url": "http://photos.petfinder.com/photos/pets/43849808/1/?bust=1549433381&width=500&-x.jpg",
    "phone": "(408) 641-8745",
    "email": "adoptions@svpetproject.org",
    "address_1": "PO Box #6145",
    "address_2": null,
    "city": "San Jose",
    "state": "CA",
    "zip_code": "95150",
    "last_update": "2019-01-24",
    "description": "You can fill out an adoption application online on our official website.Kira is a smart, sassy little girl who once was living off scraps behind a restaurant. This bright eye babe is sociable and constantly looking for her next adventures. She would like a home that will give her lots of attentions and toys to keep her active mind busy. Kira is loveable and cuddly so take this opportunity to make this purr-ball yours today!\n\nPrior to adoption, all kittens are spayed/neutered, tested for FIV/FELV, vaccinated and microchipped. All our kittens are litter box trained.\n\nAdoption fees for cats/kittens:\n\nhttp://www.svpetproject.org/info/adoption\n\nStay up-to-date on what our kittens are up to by following us on Facebook!\n\nhttps://www.facebook.com/svpetproject",
    "shelter_id": "13548514-Community",
    "breeds": "Domestic Short Hair"
}

```

### Find endpoint

Hitting the endpoint

```
https://little-fellow-be.herokuapp.com/api/v1/find
```

And passing in the params

```json
{
    "location": 'A valid location that could be "City, ST" or "Zipcode"',
    "size": 'S, M, L ,XL',
    "sex": "F=female" or "M= male",
    "animal": 'Dog, Cat, Bird, Horse, Reptile ',
    "age": 'Baby, Young, Adult, Senior',
    "breed": "this setup depend of the animal",
    "count": "How many records the search will return less then 20"
  }
```

The response will be

```json
[
    {
        "name": "Riddick",
        "id": "44107877",
        "age": "Baby",
        "size": "S",
        "sex": "M",
        "animal": "Dog",
        "img_url": "http://photos.petfinder.com/photos/pets/44107877/1/?bust=1551224315&width=500&-x.jpg",
        "phone": "(720) 939-7017",
        "email": "gwin5280@gmail.com",
        "address_1": "2405 Blake Street",
        "address_2": null,
        "city": "Denver",
        "state": "CO",
        "zip_code": "80205",
        "last_update": "2019-02-26",
        "description": "Riddick is available for adoption through My Fairy Dawg Mother Rescue. Please visit our website at www.dogrescuecolorado.org for more information about Riddick and how to adopt him.",
        "shelter_id": null,
        "breeds": [
            "Dachshund",
            "Jack Russell Terrier"
        ]
    },
    {
        "name": "C.J.",
        "id": "44050428",
        "age": "Baby",
        "size": "S",
        "sex": "F",
        "animal": "Dog",
        "img_url": "http://photos.petfinder.com/photos/pets/44050428/1/?bust=1551245694&width=500&-x.jpg",
        "phone": "(720) 619-5100",
        "email": "adopt@sloppykisses.org",
        "address_1": null,
        "address_2": null,
        "city": "Littleton",
        "state": "CO",
        "zip_code": "80130",
        "last_update": "2019-02-19",
        "description": "0119029 - Hi, I am CJ, I am about a 3 month old spayed puppy. We have no idea what I am mixed with. I currently weigh about 14 pounds. I get nervous if my humans try and pick me up. Once I am being held or lying next to them on the couch, I am not so nervous. I love playing and cuddling with my foster siblings. I have not had an accident in the house in over a week. I like going for walks and am learning how to walk on a leash. If you are willing to give me time to get comfortable around you, please fill out and application at www.SloppyKisses.org/adoptions",
        "shelter_id": "ps_91429341",
        "breeds": "Shepherd"
    },
    {
        "name": "Trina",
        "id": "44050431",
        "age": "Baby",
        "size": "S",
        "sex": "F",
        "animal": "Dog",
        "img_url": "http://photos.petfinder.com/photos/pets/44050431/1/?bust=1551245703&width=500&-x.jpg",
        "phone": "(720) 619-5100",
        "email": "adopt@sloppykisses.org",
        "address_1": null,
        "address_2": null,
        "city": "Littleton",
        "state": "CO",
        "zip_code": "80130",
        "last_update": "2019-02-19",
        "description": "0219059 Trina (red) and her sister Sheree (yellow) are ready for their forever homes! They will be on the smaller side for a lab mix. They can be a bit shy for the first minute or so but after a couple of treats they will be your best friend!",
        "shelter_id": "ps_66371136",
        "breeds": [
            "Labrador Retriever",
            "Terrier"
        ]
    }
]

```
## Future Iterations

* Create User and Session

* Add functionality to add, update, and delete favorite pets

* Add functionality find show shelter information

* Add functionality find find pets by shelter


## Deployment

The Deploy BE service can by found in [Little Fellow](https://little-fellow-be.herokuapp.com/)

## Front End

The FE repo can be found https://github.com/Diazblack/little_fellow_fe/

## If you wish to contribute:

Fork and clone and create a branch for a new feature. After the feature is complete you can submit a PR to litte_fellow_be master.

For any questions please contact DiazBlack in Github. Thanks

Cesar Jolibois.
