# README
Api project allows you to store waypoints.

* for add waiypoints use endpoint /api/v1/gps
* format :
  ``` json
  {
    "latitude": 20.23,
    "longitude": -0.56,
    "sent_at": "2016-06-02 20:45:00",
    "vehicle_identifier": "HA-3452"
  }
  ```
## Features
- [x] Stored data
- [x] No authentication for api 
- [x] Testing (models)
- [x] Async process
- [ ] Show waypoint

## Configuration
* Ruby version: 2.7.2
* Rails version: 6.1.5
* Sidekiq & redis
* Postgresql
* Rspec
