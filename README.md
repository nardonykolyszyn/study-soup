
# Brief
[![Maintainability](https://api.codeclimate.com/v1/badges/b1d3fb70e442004d49ed/maintainability)](https://codeclimate.com/github/devpolish/study-soup/maintainability)
  

Build an application that allows an authenticated user to add URLs and assign tags to them.

  

## Tasks

  

1. (10 points) Implement a user registration form with some basic info, including:

a) Username

b) Password

c) Email

d) First name and

e) Last name.

  

>  *Registered users are allowed to log in to their userspace.*

  

2. (10 points) After logging in, a user can add links to their space. Each link must have at least one tag (i.e. news, but not HTML tag) associated with it. Multiple users can add the same link independently multiple times.

3. (18 points) The system should handle the following links, as they are the same:

- www.example.com/?foo=bar&hello=world

- <http://www.example.com/?foo=bar&hello=world>

- <http://www.example.com/?hello=world&foo=bar>

4. (22 points) If a user adds an existing link then the system should provide suggested tags by other users sorted by the number of occurrences.

5. (10 points) When a user adds a link the system should parse the content of the provided link and do the content (text) analysis.

6. (30 points) Text analysis would basically go through the text and identify keywords that repeat more than two times. Keywords are all words mentioned in the HTML document with the remark that html tags are stripped (don’t confuse it with meta keywords).


> For example, if the system was parsing the sports page <http://klix.ba/sport/1234/real-barsa-el-clasico> where a match between Barcelona and Real Madrid was being reviewed then words like ‘soccer’, ‘referee’, ‘Barcelona’, ‘Real Madrid’ would be the keywords that repeat more than twice in the text. The system should suggest a maximum of 10 and a minimum of 1 top keywords sorted from those with the highest number of occurrences to the lowest. These keywords would then be suggestions for new tags for this specific URL. While doing text analysis, the system should ignore stop words, short words and irrelevant content.

  

**Note**

Please give careful consideration to the following:
	- All tasks can be implemented independently and therefore it is advisable to start first tasks you know the best
- Frontend design is not relevant and default HTML/CSS (i.e Bootstrap 3) template can be used

- Properly structured code with code layer separation is a plus

- Advanced JavaScript knowledge is a plus

- Paying attention to security (registration, login, authentication) is a plus

- Implementation of Software Design Principles and Design patterns is also a plus


# Brakeman report (Vulnerabilities report)

 ```bash

== Brakeman Report ==

Application Path: /home/devpolish/Desktop/StudySoup
Rails Version: 5.1.7
Brakeman Version: 4.5.1
Scan Date: 2019-06-18 14:24:38 -0500
Duration: 0.301599779 seconds
Checks Run: BasicAuth, BasicAuthTimingAttack, ContentTag, CreateWith, CrossSiteScripting, DefaultRoutes, Deserialize, DetailedExceptions, DigestDoS, DynamicFinders, EscapeFunction, Evaluation, Execute, FileAccess, FileDisclosure, FilterSkipping, ForgerySetting, HeaderDoS, I18nXSS, JRubyXML, JSONEncoding, JSONParsing, LinkTo, LinkToHref, MailTo, MassAssignment, MimeTypeDoS, ModelAttrAccessible, ModelAttributes, ModelSerialize, NestedAttributes, NestedAttributesBypass, NumberToCurrency, PermitAttributes, QuoteTableName, Redirect, RegexDoS, Render, RenderDoS, RenderInline, ResponseSplitting, RouteDoS, SQL, SQLCVEs, SSLVerify, SafeBufferManipulation, SanitizeMethods, SelectTag, SelectVulnerability, Send, SendFile, SessionManipulation, SessionSettings, SimpleFormat, SingleQuotes, SkipBeforeFilter, SprocketsPathTraversal, StripTags, SymbolDoSCVE, TranslateBug, UnsafeReflection, ValidationRegex, WithoutProtection, XMLDoS, YAMLParsing

== Overview ==

Controllers: 10
Models: 5
Templates: 22
Errors: 0
Security Warnings: 0

== Warning Types ==


No warnings found

 ``` 
