+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2013-05-23T18:54:42"
draft = false
title = "Rescom 2013: Bruce Maggs"
+++
Bruce Maggs is the Vice President of Research for Akamai Technologies. As
such, he can share the exact point of view of a CDN operator. This is exactly
what he did, while giving probably the most interesting talk in RESCOM 2013
(well hidden in the morning of the 4th day, some people missed it). Here, I
share my notes.

[![CDN resolution for Akamai can be 16 steps!](http://pub.lrem.net/2013/05/aka
mai_mini.jpg)](http://pub.lrem.net/2013/05/akamai.jpg)

# Akamai

## Loose statements

  * Akamai is present inside a military network, completely isolated from the outside Internet.

  * Akamai could not get into AT&T network, even when AT&T's own CDN was serving almost no traffic, just because they didn't want to help competition.

  * Akamai is IBM WebSphere compliant, but very few clients use it to generate dynamic content in it.

  * Why build a fancy NOC? So you can show it off to customers and investors. And never let the folk in there touch anything important!

  * Observed Zipf parameters are around 1 (0.95-1.05)!

  * Common failure mode is that once there is congestion, you lose all the packets for over a second, but normally you don't lose random packets at all

## Akamai hierarchy of caches

  * longer tail in the popularity distribution

  * putting smaller and smaller (now 2-4 servers) caches closer and closer to the edge

  * used to be that a cache server would ask only the others in the same cluster, then directly to the cp for copy from the source

  * now they put big clusters in big interconnections

## Servers

  * Number of servers has been doubling every two years

  * Amount of traffic has been doubling every year

  * Commodity (off-the-shelf) servers

  * Now all disks in Akamai are SSD

  * Maxed out RAM

## Scale

  * About 30k domains (customers)

  * Peak bit rate: 13.1 Tbps on 3/13/2013

  * Peak HTTP daily requests: 2.59 trillion on 9/23/12

  * 560.1M unique IPv4 addresses connected to Akamai on 3/6/2012

  * 630M unique IPv4 addresses connected to Akamai in Q3 2012

## How big is the market?

Company | Revenues | Earnings  
---|---|---  
Akamai | 1.374b | 204M  
Chinanet | 46.6M | 3M  
Limelight | 180.2M | -30M  
Level3 | 6.376B | -422M  
Netflix | 3.6B | 17.2M  
  
Source: Bloomberg BusinessWeek

Conclusion: there is not much money to be had.

Bandwidth component of the cost varies a lot by the user's location. On
average, over lifetime of a server, 40% cost is the upfront investment, 40% is
bandwidth and 20% is power.

## CP Requirements

  * Control freaks

  * Access control, as most things are copyrighted

  * 10k servers just for logging accesses

  * Sometimes CP backs off from publishing something and orders it nuked from caches

## How it works

  * First layer of DNS just decides which cluster the user goes to

  * Second layer of DNS decides the exact server 
    * these servers are located within the cluster
  * Worst case of DNS lookup is 16 steps 
    * TTL for first layer is in the order of tens of minutes
    * TTL for the second layer is 30 seconds
    * But sometimes the users do not respect that
  * Normally there is no pre-fetching in the whole network 
    * If Microsoft wants to get a Windows Update into the caches before telling computers to download, they can just put it on own servers and request for it
    * There is a push system, but not for content (e.g. for purge commands)
  * Cache favors small objects, as this is where it is important to have small delay (nobody cares if movie starts downloading 1 second later, but the banner with company name should be there immediately)

  * When live streaming, regional caches pull multiple copies of streams, battling packet losses (they can reconstruct full stream this way)

  * Servers are paired, when one of them dies, the buddy is suspended so the traffic will not get stuck with two dead servers

## Where the money is

  * You don't make money on moving bits through Internet any more.

  * Level 3 set the price of bandwidth so low, that Akamai is looking for a way to back off from providing Netflix. Netflix is also building their own backbone and CDN.

  * People pay for website acceleration, it's hard to reduce latency without global deployment

  * "Intelligence" about end users, they have agreements that the customer owns the information collected about its users (so it's never sold to the competition)

  * Protection, although nobody cares about that until they get seriously attacked, "we never attacked anybody on purpose" ;)

  * Engineering expertise, rapid software changesm customer support

## CDN and CCN

  * CDN's business is more and more in application layer, does not care all that much about moving bytes anymore (low margin)

  * Used CDN traces to see what would be the improvement of CCN 
    * Observed Zipf parameters are around 1!
    * Over all parameters, ubiquitous caching brings little benefit over caching on the edges
    * Nearest replica routing doesn't improve much over shortest-path routing
  * Content providers are used to deal with CDN, so the easiest way to put CCN into network is to make it interface with CDN

