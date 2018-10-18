function initialize() {
			var input = document.getElementById('searchTextField');
			var autocomplete = new google.maps.places.Autocomplete(input);
			autocomplete.setComponentRestrictions({
				'country' : [ 'ESP' ]
			});
			google.maps.event
					.addListener(
							autocomplete,
							'place_changed',
							function() {
								////////////cambios
								
								var latlng;
								var place = autocomplete.getPlace();
								
								
								latlng = new google.maps.LatLng(place.geometry.location.lat(), document.getElementById('longitud').value = place.geometry.location.lng()  ); // Madrid, ES
								document.getElementById('lugar').value = place.name;
								document.getElementById('latitud').value = place.geometry.location
										.lat();
								document.getElementById('longitud').value = place.geometry.location
										.lng();
								
						

								console.log(document.getElementById('latitud').value);
								console.log(document.getElementById('longitud').value);
								var photos = place.photos;
								var url = photos[1].getUrl({'maxWidth': 600, 'maxHeight': 600});
								document.getElementById('url').value =  photos[0].getUrl({'maxWidth': 600, 'maxHeight': 600});

								
								new google.maps.Geocoder().geocode({'latLng' : latlng}, function(results, status) {
								    if (status == google.maps.GeocoderStatus.OK) {
								        if (results[1]) {
								            var country = null, countryCode = null, city = null, cityAlt = null;
								            var c, lc, component;
								            for (var r = 0, rl = results.length; r < rl; r += 1) {
								                var result = results[r];

								                if (!city && result.types[0] === 'locality') {
								                    for (c = 0, lc = result.address_components.length; c < lc; c += 1) {
								                        component = result.address_components[c];

								                        if (component.types[0] === 'locality') {
								                            city = component.long_name;
								                            break;
								                        }
								                    }
								                }
								                else if (!city && !cityAlt && result.types[0] === 'administrative_area_level_1') {
								                    for (c = 0, lc = result.address_components.length; c < lc; c += 1) {
								                        component = result.address_components[c];

								                        if (component.types[0] === 'administrative_area_level_1') {
								                            cityAlt = component.long_name;
								                            break;
								                        }
								                    }
								                } else if (!country && result.types[0] === 'country') {
								                    country = result.address_components[0].long_name;
								                    countryCode = result.address_components[0].short_name;
								                }

								                if (city && country) {
								                    break;
								                }
								            }

								            console.log("City: " + city + ", City2: " + cityAlt + ", Country: " + country + ", Country Code: " + countryCode);
											document.getElementById('pais').value =country;
											document.getElementById('ciudad').value =city;
											var localizacion ={ciudad:city, pais:country}
											console.log(localizacion);
								        }
								    }
								});
								//alert("This function is working!");

								// alert(place.address_components[0].long_name);

							});
		}

		google.maps.event.addDomListener(window, 'load', initialize);
		
		
