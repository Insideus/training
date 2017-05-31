# -*- coding: utf-8 -*-
"""Builder for OTHERS.txt files

This module provides the builder function for all OTHERS.txt files.

"""

import cookielib
import string
import requests
from requests.adapters import HTTPAdapter


def build_others(target, source, env):
    """Fn to build OTHERS.txt. Fn makes a request to all URLs in the text file
       and gets the HTTP status code. It creates a new target file with all
       URLs and their respective HTTP status code. All status code 200 ok are
       valid.

    Args:
        target    (list): Path to target file.
        source    (list): Path to source file (OTHERS.txt containing URLs).
        env  (SCons.Env): SCons environment from SConstruct.

    Returns:
        Int: 1. For build error.
             0. For successfull build.

    """

    # Prep cookie
    cookiej = cookielib.CookieJar()
    # Get urls in OTHERS
    other_cont = env.File(source[0]).get_contents()
    cont_arr = string.split(other_cont, '\n')
    cont_arr = [x.strip() for x in cont_arr]
    # Prep directory location
    target_dir = str(target[0])[:-10]
    target_dir = env.Dir(target_dir)
    target_f = env.File(str(target[0]))
    # Make and open target file to write
    target_file = open(str(target_f), 'w')
    # Prep requests Session
    s = requests.Session()
    s.mount('http://', HTTPAdapter(max_retries = 3))
    s.mount('https://', HTTPAdapter(max_retries = 3))
	# Prep headers
    headers = {
        'Accept': 'text/html,application/xhtml+xml,'
                  'application/xml;q=0.9,*/*;q=0.8',
        'User-Agent': 'Mozilla/5.0 (Windows NT 5.1;rv:10.0.1)'
                      'Gecko/20100101 Firefox/10.0.1'
	}
    # Iterate through urls
    for url in cont_arr:
        stat_code = 0
        ur_len = len(url)
        if ur_len > 0:
            try:
                # Add headers / Cookie
                s.headers.update(headers)
                s.cookies.update(cookiej)
                # Make req and get HTTP status code
                stat_code = s.get(url, timeout = 10).status_code
            # Handle errors
            except (requests.ConnectionError, requests.Timeout) as e:
                print url + " -- Connection/Timeout ERROR --"
				print e
                return 1
            # Check for valid response
            if stat_code != 200:
                # Exit build with error 1
                print url + " - " + str(stat_code) + " Status Code not 200"
                return 1
            else:
                # 200 ok
                print url + " - " + str(stat_code)
                # Append result to target file
                target_file.write(url + " - " + str(stat_code) + "\n")
    # Close file
    target_file.close()
    target_f = env.File(target_file)
    return 0
