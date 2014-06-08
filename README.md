DDNS for DNS Made Easy
======================

To be used in a Docker container with the following ENV variables:

```
DNS_RECORD - the record to check.
DNS_SERVER - the server to check against.
DME_USER - your username at DNS Made Easy.
DME_PASS - the password for that dns record.
DME_ID - the ID for that dns record.
INTERVAL - seconds between checks
HIPCHAT_API_TOKEN - API token to notify Hipchat.
HIPCHAT_ROOM_ID - room id to post the message in Hipchat.
```

To pull an already existing container: `docker pull darron/ddns`
