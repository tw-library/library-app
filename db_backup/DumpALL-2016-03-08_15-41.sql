--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE libraryadmin;
ALTER ROLE libraryadmin WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION PASSWORD 'md513ff660a95e09cbe009a268a125b32a2';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION;






--
-- Database creation
--

CREATE DATABASE librarydb WITH TEMPLATE = template0 OWNER = postgres;
REVOKE ALL ON DATABASE librarydb FROM PUBLIC;
REVOKE ALL ON DATABASE librarydb FROM postgres;
GRANT ALL ON DATABASE librarydb TO postgres;
GRANT CONNECT,TEMPORARY ON DATABASE librarydb TO PUBLIC;
GRANT ALL ON DATABASE librarydb TO libraryadmin;
REVOKE ALL ON DATABASE template1 FROM PUBLIC;
REVOKE ALL ON DATABASE template1 FROM postgres;
GRANT ALL ON DATABASE template1 TO postgres;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect librarydb

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: book; Type: TABLE; Schema: public; Owner: libraryadmin; Tablespace: 
--

CREATE TABLE book (
    id integer NOT NULL,
    author character varying(255) NOT NULL,
    description text,
    imageurl text,
    isbn bigint,
    numberofpages integer,
    publicationdate character varying(255),
    publisher character varying(255),
    subtitle character varying(255),
    title character varying(255) NOT NULL
);


ALTER TABLE public.book OWNER TO libraryadmin;

--
-- Name: book_gen; Type: SEQUENCE; Schema: public; Owner: libraryadmin
--

CREATE SEQUENCE book_gen
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_gen OWNER TO libraryadmin;

--
-- Name: copy; Type: TABLE; Schema: public; Owner: libraryadmin; Tablespace: 
--

CREATE TABLE copy (
    id integer NOT NULL,
    status integer DEFAULT 0,
    book_id integer NOT NULL,
    library_id integer NOT NULL
);


ALTER TABLE public.copy OWNER TO libraryadmin;

--
-- Name: copy_gen; Type: SEQUENCE; Schema: public; Owner: libraryadmin
--

CREATE SEQUENCE copy_gen
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.copy_gen OWNER TO libraryadmin;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: libraryadmin; Tablespace: 
--

CREATE TABLE databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255)
);


ALTER TABLE public.databasechangelog OWNER TO libraryadmin;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: libraryadmin; Tablespace: 
--

CREATE TABLE databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO libraryadmin;

--
-- Name: library; Type: TABLE; Schema: public; Owner: libraryadmin; Tablespace: 
--

CREATE TABLE library (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL
);


ALTER TABLE public.library OWNER TO libraryadmin;

--
-- Name: library_gen; Type: SEQUENCE; Schema: public; Owner: libraryadmin
--

CREATE SEQUENCE library_gen
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_gen OWNER TO libraryadmin;

--
-- Name: loan; Type: TABLE; Schema: public; Owner: libraryadmin; Tablespace: 
--

CREATE TABLE loan (
    id integer NOT NULL,
    end_date date,
    start_date date NOT NULL,
    copy_id integer,
    user_id integer
);


ALTER TABLE public.loan OWNER TO libraryadmin;

--
-- Name: loan_gen; Type: SEQUENCE; Schema: public; Owner: libraryadmin
--

CREATE SEQUENCE loan_gen
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.loan_gen OWNER TO libraryadmin;

--
-- Name: users; Type: TABLE; Schema: public; Owner: libraryadmin; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO libraryadmin;

--
-- Name: users_gen; Type: SEQUENCE; Schema: public; Owner: libraryadmin
--

CREATE SEQUENCE users_gen
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_gen OWNER TO libraryadmin;

--
-- Name: waitinglist; Type: TABLE; Schema: public; Owner: libraryadmin; Tablespace: 
--

CREATE TABLE waitinglist (
    id integer NOT NULL,
    end_date character varying(255) NOT NULL,
    start_date character varying(255) NOT NULL,
    book_id integer,
    library_id integer,
    user_id integer
);


ALTER TABLE public.waitinglist OWNER TO libraryadmin;

--
-- Name: waitinglist_gen; Type: SEQUENCE; Schema: public; Owner: libraryadmin
--

CREATE SEQUENCE waitinglist_gen
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.waitinglist_gen OWNER TO libraryadmin;

--
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: libraryadmin
--

COPY book (id, author, description, imageurl, isbn, numberofpages, publicationdate, publisher, subtitle, title) FROM stdin;
1	Peter Thiel,Blake Masters	WHAT VALUABLE COMPANY IS NOBODY BUILDING? The next Bill Gates will not build an operating system. The next Larry Page or Sergey Brin won't make a search engine. If you are copying these guys, you aren't learning from them. It's easier to copy a model than to make something new: doing what we already know how to do takes the world from 1 to n, adding more of something familiar. Every new creation goes from 0 to 1. This book is about how to get there. 'Peter Thiel has built multiple breakthrough companies, and Zero to One shows how.' ELON MUSK, CEO of SpaceX and Tesla 'This book delivers completely new and refreshing ideas on how to create value in the world.' MARK ZUCKERBERG, CEO of Facebook 'When a risk taker writes a book, read it. In the case of Peter Thiel, read it twice. Or, to be safe, three times. This is a classic.' NASSIM NICHOLAS TALEB, author of The Black Swan	http://books.google.com.br/books/content?id=rMFtnQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780753555194	224	2014-09-15	Virgin Books	Notes on Start Ups, Or How to Build the Future	Zero to One
2	Pramod J. Sadalage,Martin Fowler	The definitive introduction to NoSQL, the breakthrough performance and scalability solution for cloud-based database applications * *Co-authored by the legendary Martin Fowler: does for NoSQL what he did for UML in his classic UML Distilled *Presents realistic use cases and clear explanations of frequently misunderstood concepts, so developers and architects can make the most of NoSQL *Shows how NoSQL can be integrated with existing infrastructure and used to enable the cloud transition. NoSQL technologies are well-suited for many new applications where traditional RDBMSes often don't perform or scale well - including systems requiring large-scale indexing, serving pages on high-traffic websites, and heavy-duty streaming media delivery. In NoSQL Distilled, renowned software expert Martin Fowler and Thoughtworks database consultant Pramod J. Sadalage demystify NoSQL, succinctly explore the architectural and design issues associated with implementing it, and offer realistic use cases. Modeled after UML Distilled Fowler's international best-seller, NoSQL Distilled, covers all this and more: * *Evaluating which enterprise applications NoSQL is (and isn't) appropriate for. *Understanding the architectural tradeoffs associated with deploying NoSQL. *Comparing leading NoSQL offerings such as MongoDB, CouchDB, Cassandra, Riak, and Neo4J. *Integrating NoSQL with legacy systems. *Managing performance, reliability, availability, and recoverability. *Overcoming widespread misconceptions about NoSQL and its tradeoffs. *Understanding how NoSQL can support the transition to cloud-based systems. *Using NoSQL in agile development environments. *Applying NoSQL in search/retrieval, metadata management, text analysis, social networking, business intelligence, and financial services applications. *Understanding NoSQL query languages, including Object Query MDX, and XQuery and more	http://books.google.com.br/books/content?id=tYhsAQAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780321826626	164	2012	Pearson Education	A Brief Guide to the Emerging World of Polyglot Persistence	NoSQL Distilled
3	Matt Wynne,Aslak Hellesoy	Written by the creator of Cucumber and one of its most experienced users and contributors, "The Cucumber Book" is an authoritative guide that will give readers all the knowledge they need to start using Cucumber with confidence.	http://books.google.com.br/books/content?id=oMswygAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781934356807	313	2012	\N	Behaviour-Driven Development for Testers and Developers	The Cucumber Book
4	Jeff Gothelf,Josh Seiden	User experience (UX) design has traditionally been a deliverables-based practice, with wireframes, site maps, flow diagrams, and mockups. But in today’s web-driven reality, orchestrating the entire design from the get-go no longer works. This hands-on book demonstrates Lean UX, a deeply collaborative and cross-functional process that lets you strip away heavy deliverables in favor of building shared understanding with the rest of the product team. Lean UX is the evolution of product design; refined through the real-world experiences of companies large and small, these practices and principles help you maintain daily, continuous engagement with your teammates, rather than work in isolation. This book shows you how to use Lean UX on your own projects. Get a tactical understanding of Lean UX—and how it changes the way teams work together Frame a vision of the problem you’re solving and focus your team on the right outcomes Bring the designer’s tool kit to the rest of your product team Break down the silos created by job titles and learn to trust your teammates Improve the quality and productivity of your teams, and focus on validated experiences as opposed to deliverables/documents Learn how Lean UX integrates with Agile UX	http://books.google.com.br/books/content?id=7TDQ4WZ1BHoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9781449311650	130	2013-03-15	"O'Reilly Media, Inc."	Applying Lean Principles to Improve User Experience	Lean UX
5	Jeff Patton,Peter Economy	User story mapping is a valuable tool for software development, once you understand why and how to use it. This insightful book examines how this often misunderstood technique can help your team stay focused on users and their needs without getting lost in the enthusiasm for individual product features. Author Jeff Patton shows you how changeable story maps enable your team to hold better conversations about the project throughout the development process. Your team will learn to come away with a shared understanding of what you’re attempting to build and why. Get a high-level view of story mapping, with an exercise to learn key concepts quickly Understand how stories really work, and how they come to life in Agile and Lean projects Dive into a story’s lifecycle, starting with opportunities and moving deeper into discovery Prepare your stories, pay attention while they’re built, and learn from those you convert to working software	http://books.google.com.br/books/content?id=W8b-oAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781491904909	276	2014-09-15	Oreilly & Associates Incorporated	Discover the Whole Story, Build the Right Product	User Story Mapping
6	Adam Shostack	The only security book to be chosen as a Dr. Dobbs Jolt Award Finalist since Bruce Schneier's Secrets and Lies and Applied Cryptography! Adam Shostack is responsible for security development lifecycle threat modeling at Microsoft and is one of a handful of threat modeling experts in the world. Now, he is sharing his considerable expertise into this unique book. With pages of specific actionable advice, he details how to build better security into the design of systems, software, or services from the outset. You'll explore various threat modeling approaches, find out how to test your designs against threats, and learn effective ways to address threats that have been validated at Microsoft and other top companies. Systems security managers, you'll find tools and a framework for structured thinking about what can go wrong. Software developers, you'll appreciate the jargon-free and accessible introduction to this essential skill. Security professionals, you'll learn to discern changing threats and discover the easiest ways to adopt a structured approach to threat modeling. Provides a unique how-to for security and software developers who need to design secure products and systems and test their designs Explains how to threat model and explores various threat modeling approaches, such as asset-centric, attacker-centric and software-centric Provides effective approaches and techniques that have been proven at Microsoft and elsewhere Offers actionable how-to advice not tied to any specific software, operating system, or programming language Authored by a Microsoft professional who is one of the most prominent threat modeling experts in the world As more software is delivered on the Internet or operates on Internet-connected devices, the design of secure software is absolutely critical. Make sure you're ready with Threat Modeling: Designing for Security.	http://books.google.com.br/books/content?id=asPDAgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9781118809990	624	2014-02-17	John Wiley & Sons	Designing for Security	Threat Modeling
7	Eric Freeman,Elisabeth Freeman,Kathy Sierra,Bert Bates	Provides design patterns to help with software development using the Java programming language.	http://books.google.com.br/books/content?id=LjJcCnNf92kC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780596007126	638	2004-10-25	"O'Reilly Media, Inc."	\N	Head First Design Patterns
8	Guy Kawasaki,Peg Fitzpatrick	"A bottom-up strategy [intended] to produce a focused, thorough, and compelling presence on the most popular social-media platforms ... [guiding] you through steps to build your foundation, amass your digital assets, optimize your profile, attract more followers, and effectively integrate social media and blogging"--Amazon.com.	http://books.google.com.br/books/content?id=SbHFoQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781591848073	208	2014-12-04	Portfolio	Power Tips for Power Users	The Art of Social Media
9	Jez Humble,Joanne Molesky,Barry O'Reilly	How well does your organization respond to changing market conditions, customer needs, and emerging technologies when building software-based products? This practical guide presents Lean and Agile principles and patterns to help you move fast at scale—and demonstrates why and how to apply these methodologies throughout your organization, rather than with just one department or team. Through case studies, you’ll learn how successful enterprises have rethought everything from governance and financial management to systems architecture and organizational culture in the pursuit of radically improved performance. Adopting Lean will take time and commitment, but it’s vital for harnessing the cultural and technical forces that are accelerating the rate of innovation. Discover how Lean focuses on people and teamwork at every level, in contrast to traditional management practices Approach problem-solving experimentally, by exploring solutions, testing assumptions, and getting feedback from real users Lead and manage large-scale programs in a way that empowers employees, increases the speed and quality of delivery, and lowers costs Learn how to implement ideas from the DevOps and Lean Startup movements even in complex, regulated environments	http://books.google.com.br/books/content?id=ZGNLngEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781449368425	317	2015-01-03	Oreilly & Associates Incorporated	Adopting Continuous Delivery, DevOps, and Lean Startup at Scale	Lean Enterprise
10	Paul Scherz,Simon Monk	The revised, corrected, and up-to-date reboot of a comprehensive classic!	http://books.google.com.br/books/content?id=bU0OkMwFeWIC&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780071771337	1014	2013-01-31	McGraw Hill Professional	\N	Practical Electronics for Inventors, Third Edition
11	Alicia Gibb	A guide to designing and manufacturing open source hardware covers such topics as creating derivatives of existing projects, using source files, moving from prototype to commercial production, and writing documentation for other hardware hackers.	http://books.google.com.br/books/content?id=vTPBnAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780321906045	368	2014-12-07	Pearson Education	DIY Manufacturing for Hackers and Makers	Building Open Source Hardware
12	Drew Neil	Vim is a fast and efficient text editor that will make you a faster and more efficient developer. It's available on almost every OS--if you master the techniques in this book, you'll never need another text editor. Practical Vim shows you 120 vim recipes so you can quickly learn the editor's core functionality and tackle your trickiest editing and writing tasks. Vim, like its classic ancestor vi, is a serious tool for programmers, web developers, and sysadmins. No other text editor comes close to Vim for speed and efficiency; it runs on almost every system imaginable and supports most coding and markup languages. Learn how to edit text the "Vim way:" complete a series of repetitive changes with The Dot Formula, using one keystroke to strike the target, followed by one keystroke to execute the change. Automate complex tasks by recording your keystrokes as a macro. Run the same command on a selection of lines, or a set of files. Discover the "very magic" switch, which makes Vim's regular expression syntax more like Perl's. Build complex patterns by iterating on your search history. Search inside multiple files, then run Vim's substitute command on the result set for a project-wide search and replace. All without installing a single plugin! You'll learn how to navigate text documents as fast as the eye moves--with only a few keystrokes. Jump from a method call to its definition with a single command. Use Vim's jumplist, so that you can always follow the breadcrumb trail back to the file you were working on before. Discover a multilingual spell-checker that does what it's told. Practical Vim will show you new ways to work with Vim more efficiently, whether you're a beginner or an intermediate Vim user. All this, without having to touch the mouse. What You Need: Vim version 7	http://books.google.com.br/books/content?id=DlTYuQAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781934356982	311	2012	\N	Edit Text at the Speed of Thought	Practical Vim
13	Shyam Seshadri,Brad Green	A step-by-step guide to the AngularJS meta-framework covers from the basics to advanced concepts, including directives and controllers, form validation and stats, working with filters, unit testing, and guidelines and best practices.	http://books.google.com.br/books/content?id=2BqloAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781491901946	282	2014-09-26	Oreilly & Associates Incorporated	Enhanced Productivity with Structured Web Apps	AngularJS: Up and Running
14	Allen Downey	"How to think like a computer scientist"--Cover.	http://books.google.com.br/books/content?id=1mZtP9H6OMQC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9781449330729	277	2012-08-13	"O'Reilly Media, Inc."	\N	Think Python
15	Adam Freeman	AngularJS is the leading framework for building dynamic JavaScript applications that take advantage of the capabilities of modern browsers and devices. AngularJS, which is maintained by Google, brings the power of the Model-View-Controller (MVC) pattern to the client, providing the foundation for complex and rich web apps. It allows you to build applications that are smaller, faster, and with a lighter resource footprint than ever before. Best-selling author Adam Freeman explains how to get the most from AngularJS. He begins by describing the MVC pattern and the many benefits that can be gained from separating your logic and presentation code. He then shows how you can use AngularJS's features within in your projects to produce professional-quality results. Starting from the nuts-and-bolts and building up to the most advanced and sophisticated features AngularJS is carefully unwrapped, going in-depth to give you the knowledge you need. Each topic is covered clearly and concisely and is packed with the details you need to learn to be truly effective. The most important features are given a no-nonsense in-depth treatment and chapters include common problems and details of how to avoid them. What you’ll learn Gain a solid architectural understanding of the MVC Pattern to separate logic, data and presentation code. Learn how to create rich and dynamic web apps using AngularJS Understand how each feature works and why it is important Understand how to extend HTML with declarative syntax Learn how to extend and customize AngularJS Learn how to test, refine, and deploy your AngularJS projects Who this book is for This book is ideal for web developers who have a working knowledge of JavaScript, HTML and CSS. The book is platform agnostic and a range of browsers will be presented and discussed throughout the examples. Table of ContentsPart 1 - Getting Started 1. Getting Ready 2. Your First AngularJS App 3. Putting AngularJS in Context 4. HTML and CSS Primer 5. Javascript Primer 6. SportsStore: A Real Application 7. SportsStore: Navigation and Checkout 8. SportsStore: Administration Part 2 - Working with AngularJS 9. The Anatomy of an AngularJS App 10. Using Binding and Template Directives 11. Using Element and Event Directives 12. Working with Forms 13. Using Controllers and Scopes 14. Using Filters 15. Creating Custom Directives 16. Creating Complex Directives 17. Advanced Custom Directive Features Part 3 - AngularJS Modules and Services 18. Working with Modules and Services 19. Services for Global Objects, Errors and Expressions 20. Services for Ajax and Promises 21. Services for REST 22. Services for Views 23. Services for Animation and Touch 24. Services for Provision and Injection 25. Services for Testing	http://books.google.com.br/books/content?id=g1bKngEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781430264484	688	2014-03-26	Apress	\N	Pro AngularJS
235	Lucas Krause	This book goes into great detail on all of the Microservice Architecture patterns including\n\n\n    Monolithic Architecture\n\n    Microservice Architecture\n\n    Service Discovery\n\n    Gateway / Proxy API\n\n    Orchestrated API\n\n    Service Registration\n\n    CQRS and Event Sourcing\n\n    Bulk Heads\n\n    Circuit Breaker\n\n    Message Broker\n\n\n\nThe most important thing about Microservices is when and how to apply a pattern, along with explaining what choices you must make and why. Every system is different so it is vital to understand a lot of basics before designing and developing your own Microservices.\n\n\n\nFrom Monolithic to Microservice\n\n\nThe basics here are how to decompose a Monolithic system into a Microservice and this book shows exactly how this process is completed.\n\nService Oriented Architecture to Microservice\n\n\nA more common need is to migrate your system from a SOA based architecture to Microservices, there are many advantages and the process is not as straightforward as you would expect.\n\n\nNew Microservices\n\n\nIf you want to build a brand-new system and leverage the power of Microservices this book outlines the pitfalls, strategies and tactics needs to make this work for you. It is not as easy as it would seem and you will understand why after reading this book.\n\n\n\nMicroservice Technologies\n\n\nYou'll learn about what technologies you need to use and understand for successful Microservices.\n\n\n    Virtualization\n\n    Containers (Docker and Rocket)\n\n    Databases\n\n    Security (JSON Web Tokens)\n\n    Logging\n\n    Exceptions\n\n    Caching\n\n    Timeouts\n\n    Scalability (CAP, Cube)\n\n    Platform as a Service (PaaS)\n\n    Cloud architecture\n\n    Technology agnostic\n\n\n\nWhy Microservices? Isn't this just the latest buzz word?\n\n\nWhile Microservices may be a recent trend and is gaining traction across the industry as a silver-bullet. It is not a silver-bullet.\nIn this book you will learn important reasons why you cannot treat Microservices or any technology or technique as a silver-bullet. There are\ntradeoffs and advnatages to every architectural decision, you will understand the details by reading this book. Most importantly you will understand\nhow Microservices is what SOA had promised and never delivered.\n\n\n\nAuthor: Lucas Krause\n\n\nLucas has been in the technology industry as a consultant, contractor, architect, engineer, and manager and understands and has used Microservices successfully to solve his client problems.\n\n\n\nPhilosophy of Microservices\n\n\nYou'll learn about what the philosophy of Microservices is and why this is important. It is critical to understand the philosophy as that is what makes Microservices work at so many other companies and solutions.\n\n\nIf you are looking to gain an understanding of Microservices along with the patterns and application around the process to implementing them than, this is the book for you!\n\n\n\nReady to learn about Microservices? Let's go!\n\n\n\nWant To Be brought up to speed on the latest innovations and techniques with Microservices?\n\nWant to Understand Why Microservices?\n\nWhat Makes Microservices so Special?\n\nWhat are the potential pitfalls?\n\nWhy Are Microservices so popular?\n\nHow do I make my projects successful?	http://ecx.images-amazon.com/images/I/51-fG8s6NJL._SX331_BO1,204,203,200_.jpg	\N	126	04/07/2015	\N	Patterns and Applications	Microservices
16	Kathy Sierra,Bert Bates	An interactive guide to the fundamentals of the Java programming language utilizes icons, cartoons, and numerous other visual aids to introduce the features and functions of Java and to teach the principles of designing and writing Java programs.	http://books.google.com.br/books/content?id=uIVJiAPlBq0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780596009205	688	2005-02-09	"O'Reilly Media, Inc."		Head First Java
17	Kent Beck	Write clean code that works with the help of this groundbreaking software method. Example-driven teaching is the basis of Beck's step-by-step instruction that will have readers using TDD to further their projects.	http://books.google.com.br/books/content?id=gFgnde_vwMAC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780321146533	220	2003	Addison-Wesley Professional	By Example	Test-driven Development
18	Alan Shalloway,Scott L. Bain,Amir Kolsky	Agile has become today's dominant software development paradigm, but agile methods remain difficult to measure and improve. Essential Skills for the Agile Developer fills this gap from the bottom up, teaching proven techniques for assessing and optimizing both individual and team agile practices. Written by four principals of Net Objectives--one of the world's leading agile training and consulting firms--this book reflects their unsurpassed experience helping organizations transition to agile. It focuses on the specific actions and insights that can deliver the greatest design and programming improvements with economical investment. The authors reveal key factors associated with successful agile projects and offer practical ways to measure them. Through actual examples, they address principles, attitudes, habits, technical practices, and design considerations--and above all, show how to bring all these together to deliver higher-value software. Using the authors' techniques, managers and teams can optimize the whole organization and the whole product across its entire lifecycle. Essential Skills for the Agile Developer shows how to Perform programming by intention Separate use from construction Consider testability before writing code Avoid over- and under-design Succeed with Acceptance Test Driven Development (ATDD) Minimize complexity and rework Use encapsulation more effectively and systematically Know when and how to use inheritance Prepare for change more successfully Perform continuous integration more successfully Master powerful best practices for design and refactoring	http://books.google.com.br/books/content?id=pUhsAQAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780321543738	234	2010-12-15	Pearson Education	A Guide to Better Programming and Design	Essential Skills for the Agile Developer
19	Dave Logan,John King,Halee Fischer-Wright	It's a fact of life: birds flock, fish school, people "tribe." Every company, indeed every organization, is a tribe, or if it's large enough, a network of tribes—groups of 20 to 150 people in which everyone knows everyone else, or at least knows of everyone else. Tribes are more powerful than teams, companies, or even CEOs, and yet their key leverage points have not been mapped—until now. In Tribal Leadership, Dave Logan, John King, and Halee Fischer-Wright show leaders how to assess their organization's tribal culture on a scale from one to five and then implement specific tools to elevate the stage to the next. The result is unprecedented success. In a rigorous eight-year study of approximately 24,000 people in over two dozen corporations, Logan, King, and Fischer-Wright refine and define a common theme: the success of a company depends on its tribes, the strength of its tribes is determined by the tribal culture, and a thriving corporate culture can be established by an effective tribal leader. Tribal Leadership will show leaders how to employ their companies' tribes to maximize productivity and profit: the authors' research, backed up with interviews ranging from Brian France (CEO of NASCAR) to "Dilbert" creator Scott Adams, shows that over three quarters of the organizations they've studied have tribal cultures that are merely adequate, no better than the third of five tribal stages. Leaders, managers, and organizations that fail to understand, motivate, and grow their tribes will find it impossible to succeed in an increasingly fragmented world of business. The often counterintuitive findings of Tribal Leadership will help leaders at today's major corporations, small businesses, and nonprofits learn how to take the people in their organization from adequate to outstanding, to discover the secrets that have led the highest-level tribes (like the team at Apple that designed the iPod) to remarkable heights, and to find new ways to succeed where others have failed.	http://books.google.com.br/books/content?id=pwP3lgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780061251306	320	2008-01-22	HarperBusiness	Leveraging Natural Groups to Build a Thriving Organization	Tribal Leadership
20	Robert C. Martin,Micah Martin	Comprehensive, pragmatic tutorial on Agile development for C# programmers from one of the founding fathers of Agile programming.	http://books.google.com.br/books/content?id=x4tQAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780131857254	732	2007	Prentice-Hall PTR	\N	Agile Principles, Patterns, and Practices in C#
21	Jon Skeet	A guide to the key topics of C# covers lambda expressions, LINQ, generics, nullable types, iterators, and extension methods.	http://books.google.com.br/books/content?id=PfyHkQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781617291340	582	2013-08-28	Manning Publications	\N	C# in Depth
22	Rachel Davies,Liz Sedley	"Agile Coaching" is all about working with people to create great teams. Readers learn how to build a team that produces great software and has fun doing it. The authors share their personal coaching stories, giving insights into what works and what to avoid.	http://books.google.com.br/books/content?id=1JVWPgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781934356432	221	2009	\N	\N	Agile Coaching
23	Gojko Adzic	Describes a method of effectively specifying, testing, and delivering software, covering such topics as documentation, process patterns, and automation, along with case studies from a variety of firms.	http://books.google.com.br/books/content?id=5F5PYgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781617290084	270	2011	Manning Publications	How Successful Teams Deliver the Right Software	Specification by Example
24	Jim Webber,Savas Parastatidis,Ian Robinson	REST continues to gain momentum as the best method for building web services, leaving many web architects to consider whether and how to include this approach in their SOA and SOAP-dominated world. This book offers a down-to-earth explanation of REST, with techniques and examples that show you how to design and implement integration solutions using the REST architectural style. Explore several web communications approaches, and discover what makes REST different Walk through the pros and cons of the RESTful approach Learn how the underlying architecture of the Web can drastically simplify programming built on top of it View REST in the context of cloud computing and the Semantic Web Understand how hypermedia serves as a model for computers to process data	http://books.google.com.br/books/content?id=5CjJcil4UfMC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780596805821	428	2010-09-17	"O'Reilly Media, Inc."	Hypermedia and Systems Architecture	REST in Practice
77	Roberto Bolaño	La novela narra la busqueda de la poetisa mexicana Cesarea Tinajero, por parte de dos jovenes poetas fundadores de un movimiento de poesia llamado los real visceralistas, el chileno Arturo Belano y el mexicano Ulises Lima.	http://books.google.com.ec/books/content?id=r60fmAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780307476111	609	2010	Vintage Books	\N	Los detectives salvajes
25	Roman Pichler	A comprehensive, expert guide to Scrum-based agile project ownership and management: roles, techniques, practices, and intangibles * *An indispensable resource for Scrum 'product owners,' the pivotal players in Scrum projects - and for all stakeholders who interact with them. *Covers product vision, exploration, user stories, use cases, planning poker, release planning, and much more. *Responds to one of the most crucial challenges in making agile work in the enterprise: finding and training the right product owner. In Scrum projects, the product owner plays a pivotal role, but until recently, few have been trained in the unique skills, techniques, and attitudes they need to succeed in this role. That's why courses on Scrum product ownership are soaring in popularity - and it's why this book is so important. Agile Product Management with Scrum is the first book to define and describe the role of agile product ownership in a systematic and comprehensive way. It covers a broad range of agile practices from the product owner's perspective, including product vision, exploration, user stories, use cases, 'planning poker,' sprints, release planning, portfolio management, and more. Drawing on extensive experience helping organizations succeed with Scrum, top agile consultant Roman Pichler gets down to the brass tacks: saving time and money while improving both quality and agility. He also addresses critical upstream processes and 'fuzzy front end' that organizations must get right if they are to adopt Scrum across the enterprise. This practical book is an indispensable resource for everyone who plays the role of product owner, or anticipates doing so. It will also be extremely useful to all stakeholders who interact with product owners - which is to say, the entire Scrum project team.	http://books.google.com.br/books/content?id=QZDNPwAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780321605788	133	2010	Addison-Wesley Professional	Creating Products that Customers Love	Agile Product Management with Scrum
26	Brett King	\N	http://books.google.com.br/books/content?id=qW2IkgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781118632499	400	2013-02-11	Wiley	\N	Bank 3.0: Why Banking Is No Longer Somewhere You Go But Something You Do (Custom Edition)
27	Saul Greenberg,Sheelagh Carpendale,Bill Buxton,Nicolai Marquardt	In Sketching User Experiences: The Workbook, you will learn, through step-by-step instructions and exercises, various sketching methods that will let you express your design ideas about user experiences across time. Collectively, these methods will be your sketching repertoire: a toolkit where you can choose the method most appropriate for developing your ideas, which will help you cultivate a culture of experience-based design and critique in your workplace. Features standalone modules detailing methods and exercises for practitioners who want to learn and develop their sketching skills Extremely practical, with illustrated examples detailing all steps on how to do a method Excellent for individual learning, for classrooms, and for a team that wants to develop a culture of design practice Perfect complement to Buxton's Sketching User Experience or any UX text	http://books.google.com.br/books/content?id=c-RAUXk3gbkC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780123819598	262	2012-01	Elsevier	\N	Sketching User Experiences
28	Steve Krug	Offers observations and solutions to fundamental Web design problems, as well as a new chapter about mobile Web design.	http://books.google.com.br/books/content?id=qahpAgAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780321965516	200	2014	Pearson Education	A Common Sense Approach to Web Usability	Don't Make Me Think, Revisited
29	Douglas Crockford	Most programming languages contain good and bad parts, but JavaScript has more than its share of the bad, having been developed and released in a hurry before it could be refined. This authoritative book scrapes away these bad features to reveal a subset of JavaScript that's more reliable, readable, and maintainable than the language as a whole—a subset you can use to create truly extensible and efficient code.	http://ecx.images-amazon.com/images/I/518QVtPWA7L._SX379_BO1,204,203,200_.jpg	\N	176	05/2008	O'Reilly Media	\N	JavaScript - The Good Parts
30	Edward de Bono	Six Thinking Hats is a self-help book by Edward de Bono which describes a tool for group discussion and individual thinking involving six colored hats. "Six Thinking Hats" and the associated idea parallel thinking provide a means for groups to plan thinking processes in a detailed and cohesive way, and in doing so to think together more effectively.	http://t2.gstatic.com/images?q=tbn:ANd9GcRYmSOxKfpgKMENbGGUcKR0hadjXq5eChejm0aA3Ubdxcq0HmJa	\N	207	1985	Little, Brown and Company	\N	Six Thinking Hats
31	Jeff Knupp	The "Writing Idiomatic Python" book is finally here! Chock full of code samples, you'll learn the "Pythonic" way to accomplish common tasks. Each idiom comes with a detailed description, example code showing the "wrong" way to do it, and code for the idiomatic, "Pythonic" alternative. *This version of the book is for Python 2.7.3+. There is also a Python 3.3+ version available.* "Writing Idiomatic Python" contains the most common and important Python idioms in a format that maximizes identification and understanding. Each idiom is presented as a recommendation to write some commonly used piece of code. It is followed by an explanation of why the idiom is important. It also contains two code samples: the "Harmful" way to write it and the "Idiomatic" way. * The "Harmful" way helps you identify the idiom in your own code. * The "Idiomatic" way shows you how to easily translate that code into idiomatic Python. This book is perfect for you: * If you're coming to Python from another programming language * If you're learning Python as a first programming language * If you're looking to increase the readability, maintainability, and correctness of your Python code What is "Idiomatic" Python? Every programming language has its own idioms. Programming language idioms are nothing more than the generally accepted way of writing a certain piece of code. Consistently writing idiomatic code has a number of important benefits: * Others can read and understand your code easily * Others can maintain and enhance your code with minimal effort * Your code will contain fewer bugs * Your code will teach others to write correct code without any effort on your part	data:image/webp;base64,UklGRvggAABXRUJQVlA4IOwgAABQvACdASpWAb0BPrFWokkmJKKS6p1IZAsE8jdwuPB87A/zn5gd//JPjf8b/dP3M/vvvA8e9eHpr7z+x/737p+z/rXy4OZf/B/iPaR/ov2P92H9e/zPsF/sT57v7Ae8f94/Uh+5/qcf8/1zf0X/aexZ/Veqr9Gnzcv/d7TX7nemdqnbVeU8mY0x/oH25/0ngr+3+Ic8P5c+gR7c/cvMv+y84vsf0i+G3QR8oD/a80ap8yp5SR+R7K371wzWqUZ0uTEfvXDNapRnPJ1hagfhrUugdeo4Zz0XJhl5mBc+l/NXJ1lj2MKgsMlIlZoZkGTk/Y3Rwdn1S0rvefwM+fo971bghp/Id10TWIvXXSOG1mxNfs6YwXbMJS5H1g5BaPNZL1652iIG6LNm6jgVJRfp3Q7FmfHDnUd7fBgzxZcukYO5mAfgZoqz+bWigkC3Y9HsildLU8CIin9xx2ZgFy3DihVWuwiNLcN7jqpT5+sfOPr187lX8nAV38L1Oz+8+ZJhxrFyoM9DuvA7OhWImo8B5FKpqn5XB4dL+V/i2Hmj6mUCZZE2T/R38gntTXG/SbrqthvRnYkSAcGsYc9eD5lnJMFZAVL/N7t7aKzdV9zyUarVRxxMfzXA2RFGlJl3ZKEWD4RYIBK6Wize1N1W62g1sgB5tolNApl9vEfEfA0zzM89qMphdAyCjgSu5LX+XWOg98P0RmvaOadLoDWiMBmkZbWeqjHu11jDgUEjapW2nZaVum5/pFTFOB4z16wFq/vJoy+ORc8cJDAscmEYMSlCLcszS5lbbdt8LFhpgHmf2vLXzCdAqm11SnwM0ykfEX1DJ6Ekwu7gGYh0YxL6JlyhnO2eRuG5luVdpDE6yURN8je9YWQMEwdA73X9DP9puRQO+qqrX7JWvLGo/wiLPgrjttz1SifQ6xEIIjBJaZx/kzVB1S6hwuHHEiZBbKnMVVsri10W8SD6k94ZA3H1gifXWk+XN20XBx/aSuZXfTs/LT1o9xzOq2Ia244f772re26ufi5bU3IITdd39j/0Z6cOM8UZTJOS9WQ6EC661D9ZZtVNPmFhYWE/gH+iN1OflHJA5S/N8A3annNKS2BWFX7q+0RSeVandVXxhiEt7CkVq+cU/aabEfttu+PUVFRUVFRVverditNU/5Y62mxHJ6tKfNkxUdgSSb6fsDEENDwHXFioBT0jwEnizD+wYGBoUuE5ggWP+5MVpjr8QXHuwh1d9rSURX8bEhvs6UG1+ONv1sl+oQh2PGSpXXIv1R8sPuK/aU0awLDsXMEhSqDi/Kjh6xKMxFwlmVYguhMIRGylnRar9yO9df/BjQcdzY9T8IKUIPmG7lQZRo9Y7hSLNqGVaWHgOiQShE3v9PsBC5kI/q7kwg4s+f7TuZIt7I0ptCEBfjpA1S0pJVZIfk8AxuoCVqfrLHzCxQEsL53+3VvUuhPKzuan4U4+Dh+cU0XGkj3QpTFkt/3J0S8fw1ra6RyzxSM07jkI6gPUiD1co5CrOJSZIqFI7zFwwjMArUncuipKYpX680VlpDfB4DkLsSFi99V4tm8nCWmwxSrVkEG1msSU+FzKV+af1KC6i96WPOWSMGpu08Lk/KJNrCGjBkCK6OI1SowKkOzCEtFXS7lxcDsi9Fmq27BUo382U40so3evgE8KIYf9X8yelhEcVNgQGTda/GuRDjUy5jzPCHA8XlZo+tCuclGlP0/JOnt3cBm8gUO+c8V1trS+aAEynZHQAyTLstAqOEmXZaBUcJMuy0Co4SZdloFRwky7LQKjhJl2WgVHCTLstAqOEmXZaBUcJMuy0Co4SZdloFRw0I6zRn3cPA/h4H8PA/Vj4Vd3WKioqKinWCptZd881w5lAjolSt999GsyB4/40kcwssw1e0WNiSjIyMjIyNGf7bsVqNyy/ChB8XTs131OajK/CvCVS3str5rm0o7U8nG003pjaNZIRwFnwMoDy0r7KCI+O3qaG/euGSJgG0cHBwcHBnJycnJycnJzBwcHBwcG+4AA/u3Huzo4FhOBSnfveH94xnb6o05O+bLRLmt9foMZBzg0SkT/8TIU15x71s7SmAAvGusksy253sAdkLRm2elZ12SSCnCc8Zlyo6U8TCNfmoaHM+e7eCexoXBcSLHH1hZlAoFI2Skpj6z7mkP8BXJwEU9r3O3PciL4CGHrqomf6ovqsXe3dG9gQmha7G+Ydm7bnoS8V1AwGayVP/yMXPrDIeQ5u+Xk5MXveXXdBCNbAfic6+qeu5Yze5/GYZ3+yiLjsFnd46h7mRyMSWMrnm4IC/152nAUFK2gVUKzN4189rt08QtXS9ErXJWPpJ86oxmBkZrIYt6e1NNgwwE1Seyso66qErbIaXnoQjLCPFdLFfwOKf0714ozNLFNZ0uQNPu6fTD1lheEr5uV4l4qVRrnqxOTkqrfyflzFoVzKGPLL3ZvSCVRHW3WpWvUnMnLOTOLw6021rzN2Chl+xLrxIUEo/i3zpxzeCOnYu2sspAPUir3xL39wEqEliJyr+BogCCvA9BGHIkE/J0+sADeq679ittq8wVIrenwkOK7TjLegHSYHhEngXgAfp/PoYSwYmP72TgilR2d//qk0tv97ixbKw6WUvKI2rXtOOR4R7z33EfvQa0oNb2jdcgeJ3j/ioa/gpxKR3AwTOFRlchlSuuiM54f1bZrxHE5kYvsgRM+101KSb1GtNlumBoR5phuAAqe23f9IcSlbK8dhNLvJCMQKTidoQsUsN8nMN7aUcB9N3t3a1hlv4kXL4Cqq76abTfWOhlLG++B11VmDkSOAxk45tQK9dcxLvmGn+mUjZuGkt69Eoz+O8wjiKN77SgEYzUl8EY1CkUidfIPhcHvjvMdJ0Fu2H8XSKToKv1LtNFAYo1v2rJ7ADvvYCOyPiXDkSiCAuYUrSQoOdj3ZF82CZb+XGmp7NEDYbFq+Qheju+EcZgxH3H853l3n/GKwcMHGc7UkEaF/+0zFCn4h511B7UhZJRYrIDlvBm/HGUDn2V1VK/FXa+PAtwaZ/XqQlJXj2tAMO/X26S/rRutuQALFAr9DQURsbdDGsiLWe9T5OCqfYS5iG9Nekj81mbbBq12qJPlQUXRtF/8mzss77mQQF9I2zFBbZj0LYsunPbZ7IX825zozQRgVsjDGBmcgi0/lvupwxnCqtwrN2+D84SKxcFQVT9UXNRwO8JcacXv/30+TpUM2vz6NpfqhXD6DqLikrS0Tr5oH5eEHYmNo5wb/u35PR/VIM9DDSL037iQjpS1iVs6GGL1XIbMiqpmcE7zLJTjQsubpM3dTU47oNszRsxipEVAsSz2NhJTyyQw6FWTtlRJMZJEyAMQBIw0/mtJDn201Jw/ATuXvMspDKLDfLniN8a4IgxVOni2cozcVOm35Imvn5YqP1M06kbj29zD9QXNNWVv2HmcZ2NaRxJX9mh1lfsPV7Prgv+oTXopbrSxXQ7mRrTCUiGbpZSSKxiYG/SkydHYRV8hfCACgYB1vYkPRkIPUW3+6aVzA6oKVCPX8H5lzLcFBG1i61sRsuATIVPDLv4WPet4poMt+Yn9JQayqbFLmB+0Arux59MNW/P+vzZv+HAwmoeeW0m8472xWEq/xeNQiMMyLhDEGBwnkKGHVT0YsA4GUtpiUGgo43Xr4zfdFIax42fhtNaJf5mzu+fjZmAFWYs2cq40sseNjEyPTe+ZEMvcoOuv/bcTb5HdDB9r/oiR2LcIxw2JCafxmh2QLuHoyYUyu0J01ecL/K1jYgMEmJP9YefT3fuCfu5rPZu0J2rd0fv8Am154qF0dX8FGQr4UgExgI7qEyk1EPI9716FNHofufYa6ZgRUohQ8hFj0U+6AtFGScl2Fdaq+rhkjYlJXOppOY50wx5AgKWyiXTki4Xn/thsA7wKvW+CQ5/dSbHs7An5Ap6Ga62jMsnoqeJLGDB80tCWfm1I13tlPRV4d9SdLATzeb4BgIR2DtF1BIqOGApPJ2c+tV4FSy3Og8fJEmpkHu464+TvqaVnkJSnH8XmSQ/hRyWYl0fhbs/z14LHtXVdly4KfkkrUAj9NKVuEwNjYf9ZAmZLciHamQl7iTdWZMWaW5kn/OpexYOikQ8uKF4+RJb5K7gCTKmvwPaOmi/T+wLaPSmJNH3KbYVqnToEhM0hnlD2yas8oTi8UwC0S8Iqnw1LEn1dcU+vvWmTp87mE4gx6/0t2ttOujp0sUIZsPezucF5kToMKvnAVoASoX0z6BWLqakcnrh/audJiPItDABaAiBFoX1moY+Bb4aduX5ODxThQ+Z618mmOIfScxnTlezZdjRelbyvG9klue/K09akF3PenZwzRMymI/XQqPcJ1wkz/K9xhHA0i4tjLow+jgHJf6p6/bnisbjAkxrfxzs79/eSjDwh3OBU6yZZ5wGBltgT/dKywmofeSayLD6k7TrdhHm+ee3Hy5W7fz6YgT/qvFHHUm0XE6zg5IEMUYvQrAecNtXw6/AU45pt5ujEg2NKXV2m9ESvH/HQMzrhcvagmTZB4+ZFjCfYm3OvyuvsSOxBKDDR98lRI8ahdCYCdCC8ZfkHpydD5c2dQ8DNOaw+l7aWygseAbm4MiguW+l3yTYZFLUdMeJ4T350E5ZdYjrJjJN2Q+d9KvjcNdVVkI/nrbjRXt340wrLXQmA2rlDh3+idynQWB0OEEc7iN6PljiIhHtfBhpw1HYfH6a2URh/d08Doaf4UTIJ6fry/YixGwvSU9FxIDVuyjjzFZTTmIAba/3awc4ceuHERUnBx2X7nV5oAORMIPaQ5Eg4qrVMHz795L0X2s4RBa76Cx37e5WeTcgGygPyLlCujBeydjDpN2A8hThBeoWB+t8DJM9rSRfCx+kwrYJZsnRxMq8UoXBphJLhCNUN+X6GgBbtg4UKPV4TOLlSEImYmMlo6HyIQOKjmJ1lJ4MYib7BmeTFgoDjXiGwz4TICtzBUJB7k49KWlgVjFKEDuXs2g0HdIxFh/Si+jedeKM3DTQP7Hg2B7StW5oqRMqcf/M2Oj0/DB9V5HuykGio8V7jwIGn+fLI4LKLKaYIzn0sh0tcyULsyoIvqHF0G9BQtpHzFmalkQ9UjMVopedcwqjSNkZh4Q4nNEtid7N1ymW1Y7yEH3+hblBd1zbwhIhfADcnNGEqrVZFi6G1ec5ZmfkuS1qlsE2wcFhh98i0tXS07X3eOeYhs9+SLMd3B4Rt4bIQm3wVRDagevVVfBXIeCF8Tym45Ns2j47AU6cYJRYWxr6Hhqtd4KV20+nCXHnXr1OJD7OM6Tdefv2M87b8GhD+gd0NX5qTDhy8BLD8RsfuYnI1HBE27BGuWzByHUAb6+df75P/viaxx5H8ieeYNv4o2m65/SsmMGPLPilCAGVmhKYTdDtB891mYH5qK45K+Dr7Yf3tanRzmFKJHM+Iq4YE65jm8/kpKZN2EwxUyXwnr47h9B+M3WwJUGZn60VJpCAuL3EnoAgBnwnFXjxL1mIhXe375+jR02jeIj9fLXsv4h2geQQv3HOdicHaLLlp/8FO0pQruM6bIk44FP9VgiOF+Jfny7+rPZxeCFTDOO3tCTzzUsrAuGZqaYF0qYgG+fW1w7uAH1kL2miyF1piK5sHAMR9wAw9EY/HV0I/riBQ5dQ5+GARt4bVSe/zo6Gs0JNKhhM0cHouVKlXKQYk2PEELA0fsiMQ2frNvhoHx5f6BRNvtqO2GuIIOTTjJeWqmc03aS5xUBpGsrwdRwfaTgyT4NiUvWy2ChbMtobHEdKomsUPkp9wDnW109r/ewxRXLEdn9kLnq2/pexImySmEAoadiQoi+c/pBkaOhx4AbiVs5eaIQdInT2ahxTibp7VL0s9sSKgVp1q6ndU4YYveYGK2x7BgQkBODiDPpIKDEDn4xZ6pGcvLTSNilq0+SlW8JQt3Quf1n9idrE0Dx1qHggsWe4vcW5Idk2DnV5Fa6ZLUXt2EfItW68hLS7MnTjAjkiJANNe9jTbnzpPUb52a+JcOdjPHxTmPFBRQKmzTbQb2RF6tIFvPmdbbdHedNRQ+QWSLDRluhz6x9rWRyY4PPMzGjIKKPgQ/RIxKlYyCg0Xlp99ezBji6p+OBBUSpJQj3jsKEc9NRRafDF7f3zyLUw3UHOOR+gZNxcdZqs4EfsgCwRIjhdxGWlS1jKEnXyTJrYYHonifEKiv7ny5IErVmPtv0Gf819sC8PKCdWF8WSDUU9nl2y5aoyQtRkrtLhToKop0pOlo6/zwtAEa+JWOLPPk0eJ5mn+kSZNklDDYfSyx+cpw74hKsgkB2MlKHpRVkNaYSLjwArHP7fRcKQBtDpiCwloSmCMLoV7T8nX5AkcEIJ2FXZIKB0TIvcQ2WT1xI4Qk9YT7XVir8EVirEVNK2x4Op1d8/s5OQSOBYGsaxSemGJqYNuA97Gy0JNWT8Sj+WcjmfOUa5WXe7S5wzdLI8o7PF5Qz4QXh2DrlXqqyVx/UTtO0Ym/zK8dfKHbniOKW1Fk17Z9x1SZJQIkTQfNokS3uTAvP5hSMKOi07NKeRLjfL09NH0mbKsGp4ZxCCorI8/BYVIlYHXilVU6butJnweCsBmFH5DJKxmnuqKE/JD7rPWVbEsDl6bT8S6VF95hZ5gx1Fy88LpNRj+7jqzHVWRO7imCqO4/GV8k0cD2YMhR5qq76/Xaqkplw1eFHWqNqm6nkADBVDMPu6XKz7iJl1fIHw1QilgA2q3L+6+mdkqE9gaUF4Fha5aHqiwPZJ/AusYJBP5WuXb9P4GLVPzUr1r263s7aIFKsOmBtoScnSy8TL6xtxAaGwdtkD5d86Bxkg+6qPp4c7VYJ3TdhE+S8a8Im9LNMO1VUiVcR14teeAcfAPdH30iXUwUL4010zJNKUvGNnAjUwGqgkmfGnx1ZVtFR0ZK6Unxx4bdFfo9uuXlxIeGMXzHlqaOH92V7HxJw/c336cyzAddoiadlRpe6rqwHwR2HYtyRjXyEMoMZa08ZyouSqawspHGytOQiQApWko4/Yja+XwsNB3pYYcUJOoDlcCKvFX1Wa9jpUgPq/6OVDay3cNFeoV+BrnfQrRO8bx/bcBltnxCLLXA8knCNZPeWm5qu4LVfeaCqUA7FP7myiZSq4V6YXj+sspLhpNAYzy9W93wpnFep2t+9a2Hfo8nuewCnoinOgzyGTouLmV/a42vU0SI+k6u2wp29VzbVWnSm3+RA05CH3R15epuyy62fynxwL6Gcpo16xDUwPCmDg21wZmMAvsKXNfhPII45Chbxz4y9CkMwp+bE8oHE0AeOP14itovYtiXjP0ZI2vw/KJwyedAA8HmCvW5iDIZqTMop6tLMxAkWelPe6T/rAAAAt9z1BJ48PujDzTnUD6pgceJ+AzOyrPPA8rcXdn4rPfFUiYKwOLl53bz+kKtqB/WkS9RpBYNC6aH1pISNYbdD6KHLcnZ0ZLd+/NUbxAZ9paer2dz67d8d0RwXjALkDN3CY9URZVby8p9qAXGdBIeSZw+AEGSxUoySoDoxFysnuGs0/Mbefjdy5A0tLAXxjQ54OBVClAA5yy0FIpj7ZjeCGyAXqyy9vx82G007zJn/vdKRj9mfWbWS3k7h0c2ej/OOmgX81n/N6ny5KdAw7SrA3PNQcRpfcH6YkmBTZvDSmyK1orN2cvHMqPP4YTKlw6WyKDmhffR6+e8ncxwhVsrxJXntAyyj5TCA8u3+OvYkjfrlddr8/orIaSGtRNIoEZGmM3LbEAeBreuyc7BaOHqIlrDP+JnOyIweyq5jmrKsgDbKK3iyAUkai4yS26MwrQuNqboAmWtn8nzNeQrToOEMGPXm9Gw7mVaLj335Xe8xW3k3A8sNHCq90a440NHir8AAAAALgJMhtQ4+hslnyBDBLiEjo+scCgLOu6yJ3RdtlXld/XAWg4tx6ezvkbmOhLxrVDu+1KSMAdAlBNJv84WE94tF4q7fxA8G1XLJzZkcaDPX+UTmDPp8OywFJHlxjKkjHDD24ry0fJfmkdzismZzaKhT+j1BHzIKZ9gMu8Jl29yjc5GN41erUHlOg4h8zDQ3oOU6wfKOU3Ft4aio4UT/B8rPlgxH9aZ3hl/gkENtqm/MQYYsFuX+WTCldbPOiRRAQwHvMEwc4jXcffDvqdQ/kCgiPjySFLnjgTW/UBO8QJowVeZOV+8oLyy/29s+PZjToDk4CTcOU/WZsnxNV1S/+VIG54yhxmTH5aqgUseKHKJd7Z42/KjA3porSydmu40G1cGXpQxGFMEFsfXFnplmFePx2SslA5l4JxS7tMxGxtguNuvCrGDLHZOSHLn0U+znRcLGj2Nj09UiBL/v1gzqGIRAd59Pf+eGgnGm87/cm1ADmxOEyAEF2aQAAAwK/acAqmAVSaZPfxY9Poaz83PNmDMhRzU04XbrM+42v2xYECDM9bTGYLWgAAAPvSDC0qi27JFbbTo0RQAAAwdWXvmYrVL3oy1W4B1vCglfi6VX7rQ6+9ElPvk9hw0QqI0K4PnZIxFy+zTOKGcIwFgDs1+w4jV9BZfUGvD+gHIWUPfDgnnXS4Pyoi/GHrizOfJQUXz8Xzww2xZnI6TUqgzCY0zYnKVxmURos+i7kNmCahBcKGzlt7kEenAnt3fFLlcIXjKrXcYdSS3kelfM074P0a8KAsDA1zjOY1hc7igPYBSYkvGQkYwnp/tgcf4X80GbkygYU308tFVoTCiA7OOyiCaityh3rZISVDBwIveNnXuoP9xV693NProX6fAMyKCZI1O3KRUssWSzWkm9YewwIkZlIn2btNGx/tzc6pJ87KChWdNdSKyL2nNnK2LsRpgvhMnbUQNnjXi+xH+dNZLtj9a+GG9AiZrEmeGLoySoPpb6QnKIsYCWgEEmVrYI/U6NTytXRmVU+9/6XdCb67qFW4E4qgph1UdvA2G7Cu7Cfx9qVWpaeAoUj7Br2BlRQUCPWsn20IAEr3fVRHxGjS5kh8YKfLeouh7wV8whhDg1kt5aktRHA26a/i+yBMlbouxdHLLwbQQYa6cnoC22Dt+P3b/KedMY6BjNghq4zKAwz+bNyAZy4Xo/5dOqXZ9y8pbdEUndTRZYreX60IP7FXQRaIxWlaFxrHvZc6uD1TJOG62nKvaR8Aek5nciQc2r2z1xim82ICpCsoHOd1qyJsplnipsCac63k8/UCe9TfL2wKlFPTED9uoCIiAhGdtd4disobwSVwJj55uc1tTjfinecytCOYT5h5GQGcOzfoBhM2UvZdNIWAvymQgaBlq2glttXEeSUWHrrNrMntF5v2BzmKGGwcOQdURiMidsuGR3Dfsx3yLKF44ZJzFB81zXFqTeR6p132zlv/i93niR2NDHgttQT8NJM6cX8VzUoOM5OLuVV8Bv+TOqTL9H5oKiWquKUWEoCjFmPq1srfgDzwerWHpL8AjLR5xvSm0VzCzI9vmQCxB+d+LBuLQ+1/Fy2LjkuGkltIeRsZeQ09qvllr6M4PjrHK3newJDHbMuZeRNmWvOFtckKuMYWNMBTC5ZVSuu6ev0Fdl6khbomiNV9HFbeH187TilJtp5C/d1IEMliaKuopyE4ViNVfkQ5+Lvp3ElsCMZ8zL8q2z0Kh+Ob2mnbRId2n5Gvp27v5oge7Wcb5AipJOLkETs3w81umTJYHrYjZWZ7qVkYZ7Awh+tTARU6y2tYECDhodUfgEuddRhee9N5LPhFY6Se6R4Yx3s6vuCqAcqh/JHhqTIqOPD3bfJaQrf+bcjTshc+jP9Dt7RvQZUPMvoRJSsSYXRjheuXWuThHHM7FEuxmB3t5mIsfMwFjwF8BBpnMuOpjTtl6a1SJkKr+iYRihsSrphPMlFDQUUt7Og/JFOAuNQKVE0uZf47aZnSHFtIkkKwTv3kN8c31vw0jdeesEtzUMWH8B557iGz3m3towWUBzPwsr+yN8kqKJ93mzdiIc8dH2Xh1HfVD+hxDmHkfZ2sNqxuALG/9RvUk8eNIc5B01b19CCs+0qUaOn4amoAlwbepv07wXn61ZbzbtIm52bZNAVI+f/mwDd0KlRwdRh1IMsw27vT4xwriYXRZvWqqg/dUWvocgO1F0lQwPLNztiEjNPUrLUSzClcSfWmLxW9WvqLHc/RU3rb2jsAAANnREl3My9b+iU630GgMLAzNvtBsUAsR4X4l1aWnbXzfHSIE/fEc8AgnC3eLS6QkGl7bxxaVYyW7hR8DFNoAAAAAAAAAAAAAAAAAAFf8Ad+gAirtxpGBHZBKKTwpkavOacDXYlryovrfEOTUKVDsA3gve+uT0nzTtb23lBIzl1jk4hkWzt5d+OPIvwHLNaqsa/OXqPsK8OQO/uPUbtcBBdnqMQPLelJI5gDSu4hPSADMh64nL3sjo8jvVvvSLkmfcmuJIAS4ZyIqm4QyECe0tnLE+1u2DVjED8ZUyByWCA1IOPlYkjPCCTU0ywUT8NTnfi5WU0gOWLZ+zgdUr7TWE5Wn3xHid9MdxNW7A0WBBjsuuzI6eZVsjTEmQrFh7R70a+276dEmpu4vVgT8zTFRovBewy6V0UP6XB3Q1H0ZdkRDAWQdIsRiTznHSm5wbKbhTj2mcNFDWTwxqu/BTJjLkSR14b+ICm1pybynrvBPcOsHz7axqJfcyY3ZiyalNjOPkwQnBK8N6PmOB5h61+2PwUD60Flx86Z4003YspDYq/22PylTcOsGJCmEf4Ktx1uWA1HyeTsHWbis1Wxxdnoiq6azXh4Ry1zCaNBMaJX3p3R7oZ/C3brmzuyjg9iMT3tZKjbkbDJ31J0oCrgKBe5fIWkPmlzWU+UYOPbn7UA88z2HhsnEabuusI0nRkwrS972k+D/Nabd0sFkuC/48oc0eBpjgUvD+a/kaeK3V37YhUeif/4zByXK2xZqN2gOcTsuMKyPU7at+Gq5kpUcs/px01fKPuWiVgxGQzGl1N5BPoOPrmN844iM6WuuqGCJLa2tqVRtlCdycpe0fJ6NHCxUDiFOJZF7fGtRxDS3lLb12eGEzj47xzphDa6ZIFjMvkcgXqbBc16E4RYl7za64dgkpg3HeSCH4Fy5OwiQZCgW7z3Gp0gH/XNfwzCTlHbAODmFEHlOh2ZWWOFyLqrT94JQPacoUTp+fd1FUm6buQBfVHI+jhyLdq5pMhg94xwd8sUippbZtXrOtajGktDd2JHusAIJVKky/plyAUaaXB1WD1qNJ0HwAfSsaP8Q6OU6q106urwAAAAAAAAAAAA	\N	88	February 6, 2013	CreateSpace Independent Publishing Platform	\N	Writting Idiomatic Python
32	Frederick P. Brooks Jr.	Few books on software project management have been as influential and timeless as The Mythical Man-Month. With a blend of software engineering facts and thought-provoking opinions, Fred Brooks offers insight for anyone managing complex projects. These essays draw from his experience as project manager for the IBM System/360 computer family and then for OS/360, its massive software system. Now, 20 years after the initial publication of his book, Brooks has revisited his original ideas and added new thoughts and advice, both for readers already familiar with his work and for readers discovering it for the first time.	http://ecx.images-amazon.com/images/I/51XnDL5KC%2BL._SX334_BO1,204,203,200_.jpg	\N	336	08/1995	Addison-Wesley Professional	Essays on Software Engineering	The Mythical Man-Month
58	Jonathan Fetter-Vorm	Em 1942, temendo que os nazistas estivessem perto de construir uma bomba atômica, os Estados Unidos iniciaram o ultrassecreto Projeto Manhattan, que reuniria militares e cientistas para a criação da arma mais letal de todos os tempos. É esse episódio que o ilustrador e escritor americano Jonathan Fetter-Vorm narra em Trinity, livro em quadrinhos dirigido a jovens e adultos. De maneira informativa, interessante e dramática, ele apresenta desde as pesquisas científicas com o átomo no século XIX até as trágicas destruições de Hiroshima e Nagasaki, em 1945. Trinity é uma introdução fundamental a um dos eventos centrais da história e também às questões políticas, éticas e ecológicas provocadas pela corrida nuclear.	http://ecx.images-amazon.com/images/I/A1YRSWOt3uL.jpg	\N	\N	01/01/2014	Três Estrelas	A História da Primeira Bomba Atômica	Trinity
33	Gerald M. Weinberg	If you are a consultant, ever use one, or want to be one, this book will show you how to succeed. With wit, charm, humor, and wisdom, Gerald M. Weinberg shows you exactly how to become a more effective consultant. He reveals specific techniques and strategies that really work. Through the use of vividly memorable rules, laws, and principles -- such as The Law of Raspberry Jam, The Potato Chip Principle, and Lessons from the Farm -- the author shows you how to -- price and market your services -- avoid traps and find alternative approaches -- keep ahead of your clients -- create a special "consultant's survival kit" -- trade improvement for perfection -- negotiate in difficult situations -- measure your effectiveness -- be yourself You will also find straightforward advice on marketing your services, including how to -- find clients -- get needed exposure -- set just-right fees -- gain trust The Secrets of Consulting -- techniques, strategies, and first-hand experiences -- all that you'll need to set up, run, and be successful at your own consulting business.	http://books.google.com.br/books/content?id=dse2q-xhTLIC&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780932633019	228	1985-01-01	Dorset House	A Guide to Giving & Getting Advice Successfully	The Secrets of Consulting
34	Kerry Patterson,Joseph Grenny,Ron McMillan,Al Switzler,David Maxfield	Hold anyone accountable. Master performance discussions. Get RESULTS. Broken promises, missed deadlines, poor behavior--they don't just make others' lives miserable; they can sap up to 50 percent of organizational performance and account for the vast majority of divorces. Crucial Accountability offers the tools for improving relationships in the workplace and in life and for resolving all these problems--permanently. PRAISE FOR CRUCIAL ACCOUNTABILITY: "Revolutionary ideas ... opportunities for breakthrough ..." -- Stephen R. Covey, author of The 7 Habits of Highly Effective People "Unleash the true potential of a relationship or organization and move it to the next level." -- Ken Blanchard, coauthor of The One Minute Manager "The most recommended and most effective resource in my library." -- Stacey Allerton Firth, Vice President, Human Resources, Ford of Canada "Brilliant strategies for those difficult discussions at home and in the workplace." -- Soledad O’Brien, CNN news anchor and producer "This book is the real deal.... Read it, underline it, learn from it. It's a gem." -- Mike Murray, VP Human Resources and Administration (retired), Microsoft	http://books.google.com.br/books/content?id=bQhSkDdQ_AMC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780071829311	336	2013-05-24	McGraw-Hill Professional	\N	Crucial Accountability: Tools for Resolving Violated Expectations, Broken Commitments, and Bad Behavior, Second Edition ( Paperback)
35	Kerry Patterson,Joseph Grenny,Ron McMillan,Al Switzler	The New York Times and Washington Post bestseller that changed the way millions communicate “[Crucial Conversations] draws our attention to those defining moments that literally shape our lives, our relationships, and our world. . . . This book deserves to take its place as one of the key thought leadership contributions of our time.” —from the Foreword by Stephen R. Covey, author of The 7 Habits of Highly Effective People “The quality of your life comes out of the quality of your dialogues and conversations. Here’s how to instantly uplift your crucial conversations.” —Mark Victor Hansen, cocreator of the #1 New York Times bestselling series Chicken Soup for the Soul® The first edition of Crucial Conversations exploded onto the scene and revolutionized the way millions of people communicate when stakes are high. This new edition gives you the tools to: Prepare for high-stakes situations Transform anger and hurt feelings into powerful dialogue Make it safe to talk about almost anything Be persuasive, not abrasive	http://books.google.com.br/books/content?id=VhkQpRH9D9gC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780071772204	288	2011-09-16	McGraw Hill Professional	\N	Crucial Conversations Tools for Talking When Stakes Are High, Second Edition
36	David Sherwin	Have you ever struggled to complete a design project on time? Or felt that having a tight deadline stifled your capacity for maximum creativity? If so, then this book is for you. Within these pages, you'll find 80 creative challenges that will help you achieve a breadth of stronger design solutions, in various media, within any set time period. Exercises range from creating a typeface in an hour to designing a paper robot in an afternoon to designing web pages and other interactive experiences. Each exercise includes compelling visual solutions from other designers and background stories to help you increase your capacity to innovate. Creative Workshop also includes useful brainstorming techniques and wisdom from some of today's top designers. By road-testing these techniques as you attempt each challenge, you'll find new and more effective ways to solve tough design problems and bring your solutions to vibrant life.	http://books.google.com.br/books/content?id=mTSNYmfEIykC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9781600617973	231	2010-11-24	HOW Books	80 Challenges to Sharpen Your Design Skills	Creative Workshop
37	Steve Krug	Spells out an approach to usability testing that anyone can easily apply to his or her own website, application or other product, in a book that explains how to test any design, keep one's focus on finding the most important problems and fix the problems one finds using the author's "the least you can do" approach. Original.	http://books.google.com.br/books/content?id=VzbimAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780321657299	161	2010-01	New Riders Pub	The Do-it-yourself Guide to Finding and Fixing Usability Problems	Rocket Surgery Made Easy
38	Tim Brown	The myth of innovation is that brilliant ideas leap fully formed from the minds of geniuses. The reality is that most innovations come from a process of rigorous examination through which great ideas are identified and developed before being realized as new offerings and capabilities. This book introduces the idea of design thinking‚ the collaborative process by which the designer′s sensibilities and methods are employed to match people′s needs not only with what is technically feasible and a viable business strategy. In short‚ design thinking converts need into demand. It′s a human−centered approach to problem solving that helps people and organizations become more innovative and more creative. Design thinking is not just applicable to so−called creative industries or people who work in the design field. It′s a methodology that has been used by organizations such as Kaiser Permanente to icnrease the quality of patient care by re−examining the ways that their nurses manage shift change‚ or Kraft to rethink supply chain management. This is not a book by designers for designers; this is a book for creative leaders seeking to infuse design thinking into every level of an organization‚ product‚ or service to drive new alternatives for business and society.	http://books.google.com.br/books/content?id=FGfglgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780061766084	272	2009-09-29	HarperBusiness	How Design Thinking Transforms Organizations and Inspires Innovation	Change by Design
39	Addy Osmani	An introduction to writing code with JavaScript using classical and modern design patterns, including modules, observers, facades, and mediators.	http://books.google.com.br/books/content?id=JYPEgK-1bZoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9781449331818	235	2012-08-20	"O'Reilly Media, Inc."	\N	Learning JavaScript Design Patterns
40	Paola Prandini	A biografia do poeta simbolista negro Cruz e Sousa, conhecido como o “Cisne Negro”, retrata a trajetória de um dos mais importantes escritores brasileiros. Resgatando momentos como a infância em Santa Catarina, a dedicação à literatura e a luta pela abolição da escravatura, o livro destaca sua produção como poeta vanguardista e traz dados sobre peças e filmes inspirados no autor. Esta obra faz parte da Coleção Retratos do Brasil Negro, coordenada por Vera Lúcia Benedito, mestre e doutora em Sociologia/Estudos Urbanos pela Michigan State University (EUA) e pesquisadora e consultora da Secretaria de Estado da Cultura de São Paulo. O objetivo da Coleção é abordar a vida e a obra de figuras fundamentais da cultura, da política e da militância negra.	http://books.google.com.br/books/content?id=6w6exscAmrEC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9788587478658	\N	2011-11-07	Selo Negro	Retratos do Brasil Negro	CRUZ E SOUSA
41	Cidinha da Silva	\N	http://images.livrariasaraiva.com.br/imagemnet/imagem.aspx/?pro_id=8871656&qld=90&l=370&a=-1	9788567544007	162	2013	\N	\N	Racismo no Brasil e afetos correlatos
42	ANIL HEMRAJANI	'Desenvolvimento ágil em Java com Spring, Hibermate e Eclipse' é um livro sobre tecnologias robustas e métodos eficientes que ajudará o programador a trazer simplicidade de volta ao mundo do desenvolvimento corporativo em Java. As três tecnologias abordadas, Spring Framework, Hibernate e Eclipse, permitem reduzir significativamente a complexidade desse tipo de desenvolvimento. Além disso, são compatíveis com os POJOs (Plain Old Java Objects - 'velhos e simples' objetos Java) em contêineres, em vez dos pesados objetos remotos que os contêineres EJB exigem. Este livro também aborda o uso de ferramentas como Ant, Junit e a biblioteca de tags JSP, além de introduzir outros assuntos, como depuração baseada em GUI, monitoramento usando o JMX, agendamento de tarefas, envio de e-mail e muito mais. E, finalmente, a Extreme Programming (XP), o Agile Model Driven Development (AMDD) e a refatoração são métodos que podem acelerar os projetos de desenvolvimento de software ao mesmo tempo em que reduzem a quantidade de requisitos de programação e de design; portanto, esses assuntos também são discutidos no livro.	http://isuba.s8.com.br/produtos/01/00/item/6827/4/6827405G1.jpg	9788576051275	320	\N	\N	E ECLIPSE	DESENVOLVIMENTO AGIL EM JAVA COM SPRING, HIBERNAT
43	Paulo Caroli (Edição)	\N	http://cdn.shopify.com/s/files/1/0155/7645/products/thoughtworks-antologia-featured_large.png?v=1416319002	\N	292	11/2014	Casa do Código	Histórias de aprendizado e inovação	Thoughtworks Antologia Brasil
44	Aurelio Marinho Jargas	As Expressões Regulares podem ser utilizadas em diversos aplicativos, como editores de textos, leitores de e-mail e linguagens de programação, no UNIX, Linux, Windows e Mac. Qualquer usuário de computador pode usufruir dos seus benefícios. Profissionais que manipulam texto e dados economizarão horas de serviço braçal: escritores, revisores, tradutores, programadores e administradores de sistema.	http://www.piazinho.com.br/ed3/capa-300.jpg	\N	208	2009	Novatec	Uma Abordagem Divertida	Expressões Regulares
45	Martin Fowler	Refactoring is about improving the design of existing code. It is the process of changing a software system in such a way that it does not alter the external behavior of the code, yet improves its internal structure. With refactoring you can even take a bad design and rework it into a good one. This book offers a thorough discussion of the principles of refactoring, including where to spot opportunities for refactoring, and how to set up the required tests. There is also a catalog of more than 40 proven refactorings with details as to when and why to use the refactoring, step by step instructions for implementing it, and an example illustrating how it works The book is written using Java as its principle language, but the ideas are applicable to any OO language.	http://ecx.images-amazon.com/images/I/512-aYxS4ML._SX385_.jpg	\N	464	28 de junho de 1999	Addison-Wesley Professional	Improving the Design of Existing Code	Refactoring
46	Danilo Sato	Entregar software em produção é um processo que tem se tornado cada vez mais difícil no departamento de TI de diversas empresas. Ciclos longos de teste e divisões entre as equipes de desenvolvimento e de operações são alguns dos fatores que contribuem para este problema. Mesmo equipes ágeis que produzem software entregável ao final de cada iteração sofrem para chegar em produção quando encontram estas barreiras.	http://cdn.shopify.com/s/files/1/0155/7645/products/devops-featured_large.png?v=1411489207	\N	248	10/2013	Casa do Código	Entrega de software confiável e automatizada	DevOps na prática
47	Marc Lamont Hill	Este livro vem preencher uma lacuna no debate teórico sobre duas questões primordiais envolvendo a temática da identidade cultural. A primeira, que se refere ao multiculturalismo crítico, ao qual o autor articula uma proposta de pedagogia crítica inspirada no hip-hop. A segunda, que remete a identidade cultural à luta pelo reconhecimento das culturas dos povos historicamente prejudicados, como tem sustentado o filósofo frankfurtiano, Axel Honneth. A ideia central de Hill é conhecer a cultura e os problemas da comunidade trazidos pelos alunos em sala de aula e com eles compartilhar suas angústias, respeitando os seus modos de ser e de se expressar.	http://images.livrariasaraiva.com.br/imagemnet/imagem.aspx/?pro_id=8258565&qld=90&l=370&a=-1	\N	272	2014	Vozes	Pedagogia Hip-Hop e As Políticas de Identidade	Batidas, Rimas e Vida Escolar
48	Diego Balbino, Paola Prandini	\N	http://2.bp.blogspot.com/-V5KWlBCHNHE/VWyOYSAVGgI/AAAAAAAAAnw/7_ll2bN4E48/s1600/carolinas.jpg	\N	\N	\N	\N	Retratos inspirados em Carolina Maria de Jesus	Carolinas
49	Andrew Hunt,David Thomas	What others in the trenches say about The Pragmatic Programmer... “The cool thing about this book is that it’s great for keeping the programming process fresh. The book helps you to continue to grow and clearly comes from people who have been there.” —Kent Beck, author of Extreme Programming Explained: Embrace Change “I found this book to be a great mix of solid advice and wonderful analogies!” —Martin Fowler, author of Refactoring and UML Distilled “I would buy a copy, read it twice, then tell all my colleagues to run out and grab a copy. This is a book I would never loan because I would worry about it being lost.” —Kevin Ruland, Management Science, MSG-Logistics “The wisdom and practical experience of the authors is obvious. The topics presented are relevant and useful.... By far its greatest strength for me has been the outstanding analogies—tracer bullets, broken windows, and the fabulous helicopter-based explanation of the need for orthogonality, especially in a crisis situation. I have little doubt that this book will eventually become an excellent source of useful information for journeymen programmers and expert mentors alike.” —John Lakos, author of Large-Scale C++ Software Design “This is the sort of book I will buy a dozen copies of when it comes out so I can give it to my clients.” —Eric Vought, Software Engineer “Most modern books on software development fail to cover the basics of what makes a great software developer, instead spending their time on syntax or technology where in reality the greatest leverage possible for any software team is in having talented developers who really know their craft well. An excellent book.” —Pete McBreen, Independent Consultant “Since reading this book, I have implemented many of the practical suggestions and tips it contains. Across the board, they have saved my company time and money while helping me get my job done quicker! This should be a desktop reference for everyone who works with code for a living.” —Jared Richardson, Senior Software Developer, iRenaissance, Inc. “I would like to see this issued to every new employee at my company....” —Chris Cleeland, Senior Software Engineer, Object Computing, Inc. “If I’m putting together a project, it’s the authors of this book that I want. . . . And failing that I’d settle for people who’ve read their book.” —Ward Cunningham Straight from the programming trenches, The Pragmatic Programmer cuts through the increasing specialization and technicalities of modern software development to examine the core process--taking a requirement and producing working, maintainable code that delights its users. It covers topics ranging from personal responsibility and career development to architectural techniques for keeping your code flexible and easy to adapt and reuse. Read this book, and you'll learn how to Fight software rot; Avoid the trap of duplicating knowledge; Write flexible, dynamic, and adaptable code; Avoid programming by coincidence; Bullet-proof your code with contracts, assertions, and exceptions; Capture real requirements; Test ruthlessly and effectively; Delight your users; Build teams of pragmatic programmers; and Make your developments more precise with automation. Written as a series of self-contained sections and filled with entertaining anecdotes, thoughtful examples, and interesting analogies, The Pragmatic Programmer illustrates the best practices and major pitfalls of many different aspects of software development. Whether you're a new coder, an experienced programmer, or a manager responsible for software projects, use these lessons daily, and you'll quickly see improvements in personal productivity, accuracy, and job satisfaction. You'll learn skills and develop habits and attitudes that form the foundation for long-term success in your career. You'll become a Pragmatic Programmer.	http://books.google.com.br/books/content?id=5wBQEp6ruIAC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780132119177	352	1999-10-20	Addison-Wesley Professional	From Journeyman to Master	The Pragmatic Programmer
59	Martin Fowler,Rebecca Parsons	Martin Fowler's breakthrough practitioner-oriented book on Domain Specific Languages - will do for DSLs what Fowler did for refactoring! * *Fowler's highly anticipated introduction to DSLs: a category-defining book by one of the software world's most influential authors. *Two books in one: a concise narrative that introduces DSLs, and a larger reference that shows how to plan and develop them. *Helps software professionals reduce the cost and complexity of building DSLs - so they can take full advantage of them. Domain Specific Languages (DSLs) offer immense promise for software engineers who need better, faster ways to solve problems of specific types, or in specific areas or industries. DSLs have been around for several years, and have begun to grow in popularity. Now, Martin Fowler - one of the world's most influential software engineering authors - has written the first practitioner-oriented book about them. Fowler's legendary book, Refactoring, made software refactoring a crucial tool for software engineers worldwide; this book will do the same for DSLs. Fowler has designed Domain Specific Languages as two books in one. The first --a narrative designed to be read from 'cover to cover' - offers a concise introduction to DSLs, how they are implemented, and what are useful for. Next, Fowler thoroughly introduces today's most effective techniques for building DSLs. Fowler covers both 'external' and 'internal' DSLs, a well as alternative computational models, code generation, common parser topics, and much more. He provides extensive Java and C# examples throughout, as well as selected Ruby examples for concepts that can best be explained using a dynamic language. Together, both sections enable readers to make wellinformed choices about whether to use a DSL in their work, and which techniques to employ in order to build DSLs more quickly and cost-effectively.	http://books.google.com.ec/books/content?id=7lLHmAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780321712943	597	2011	Addison-Wesley Professional	\N	Domain-specific Languages
50	Steve Freeman,Nat Pryce	Foreword by Kent Beck "The authors of this book have led a revolution in the craft of programming by controlling the environment in which software grows." --Ward Cunningham "At last, a book suffused with code that exposes the deep symbiosis between TDD and OOD. This one's a keeper." --Robert C. Martin "If you want to be an expert in the state of the art in TDD, you need to understand the ideas in this book."--Michael Feathers Test-Driven Development (TDD) is now an established technique for delivering better software faster. TDD is based on a simple idea: Write tests for your code before you write the code itself. However, this "simple" idea takes skill and judgment to do well. Now there's a practical guide to TDD that takes you beyond the basic concepts. Drawing on a decade of experience building real-world systems, two TDD pioneers show how to let tests guide your development and "grow" software that is coherent, reliable, and maintainable. Steve Freeman and Nat Pryce describe the processes they use, the design principles they strive to achieve, and some of the tools that help them get the job done. Through an extended worked example, you'll learn how TDD works at multiple levels, using tests to drive the features and the object-oriented structure of the code, and using Mock Objects to discover and then describe relationships between objects. Along the way, the book systematically addresses challenges that development teams encounter with TDD--from integrating TDD into your processes to testing your most difficult features. Coverage includes * Implementing TDD effectively: getting started, and maintaining your momentum throughout the project * Creating cleaner, more expressive, more sustainable code * Using tests to stay relentlessly focused on sustaining quality * Understanding how TDD, Mock Objects, and Object-Oriented Design come together in the context of a real software development project * Using Mock Objects to guide object-oriented designs * Succeeding where TDD is difficult: managing complex test data, and testing persistence and concurrency	http://books.google.com.br/books/content?id=vkb7mAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780321503626	358	2010	Addison-Wesley Professional	\N	Growing Object-oriented Software, Guided by Tests
51	fes	\N	\N	\N	\N	\N	\N	\N	JES
52	Adam Tornhill	Inspired by forensic psychology methods, this book teaches strategies to predict the future of your codebase, assess refactoring direction, and understand how your team influences the design. With its unique blend of forensic psychology and code analysis, it arms you with the strategies you need, no matter what programming language you use.	http://books.google.com.br/books/content?id=vFjRrQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781680500387	190	2015-02-25	\N	Use Forensic Techniques to Arrest Defects, Bottlenecks, and Bad Design in Your Programs	Your Code As a Crime Scene
53	Thomas Piketty	The main driver of inequality--returns on capital that exceed the rate of economic growth--is again threatening to generate extreme discontent and undermine democratic values. Thomas Piketty's findings in this ambitious, original, rigorous work will transform debate and set the agenda for the next generation of thought about wealth and inequality.	http://books.google.com.br/books/content?id=iv0HngEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780674430006	695	2014-04-15	Harvard University Press	\N	Capital in the Twenty-First Century
54	Aurelio Marinho Jargas	As Expressões Regulares podem ser utilizadas em diversos aplicativos, como editores de textos, leitores de e-mail e linguagens de programação, no UNIX, Linux, Windows e Mac. Qualquer usuário de computador pode usufruir dos seus benefícios. Profissionais que manipulam texto e dados economizarão horas de serviço braçal: escritores, revisores, tradutores, programadores e administradores de sistema.	http://www.piazinho.com.br/ed3/capa-300.jpg	\N	208	Dec 31, 1969	Novatec	Uma Abordagem Divertida	Expressões Regulares
55	Vinícius Manhães Teles	Extreme Programming (XP) é um processo de desenvolvimento que possibilita a criação de software de alta qualidade, de maneira ágil, econômica e flexível. Vem sendo adotado com enorme sucesso na Europa, nos Estados Unidos e, mais recentemente, no Brasil. Cada vez mais as empresas convivem com ambientes de negócios que requerem mudanças frequentes em seus processos, as quais afetam os projetos de software. Os processos de desenvolvimento tradicionais são caracterizados por uma grande quantidade de atividades e artefatos que buscam proteger o software contra mudanças, o que faz pouco ou nenhum sentido, visto que os projetos devem se adaptar a tais mudanças, em vez de evitá-las. O XP concentra os esforços da equipe de desenvolvimento em atividades que geram resultados rapidamente na forma de software intensamente testado e alinhado às necessidades de seus usuários. Além disso, simplifica e organiza o trabalho combinando técnicas comprovadamente eficazes e eliminando atividades redundantes. Por fim, reduz o risco dos projetos, desenvolvendo software de forma iterativa e reavaliando permanentemente as prioridades dos usuários. Este livro apresenta o XP de forma didática e prática, com base na experiência do autor que o utilizou em projetos reais. As explicações combinam teoria, exemplos, ilustrações e metáforas que facilitam a compreensão dos conceitos e fornecem um caminho seguro para que o leitor incorpore o XP ao seu dia a dia. Destina-se a profissionais da área de informática, gerentes e diretores de tecnologia da informação, bem como a estudantes e professores universitários.	http://books.google.com.br/books/content?id=s7i1BAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9788575224007	328	2014-10-07	Novatec Editora	Aprenda como encantar seus usuários desenvolvendo software com agilidade e alta qualidade	Extreme Programming - 2ª Edição
56	Michael Margolis	Want to create devices that interact with the physical world? This cookbook is perfect for anyone who wants to experiment with the popular Arduino microcontroller and programming environment. You’ll find more than 200 tips and techniques for building a variety of objects and prototypes such as toys, detectors, robots, and interactive clothing that can sense and respond to touch, sound, position, heat, and light. You don’t need to have mastered Arduino or programming to get started. Updated for the Arduino 1.0 release, the recipes in this second edition include practical examples and guidance to help you begin, expand, and enhance your projects right away—whether you’re an artist, designer, hobbyist, student, or engineer. Get up to speed on the Arduino board and essential software concepts quickly Learn basic techniques for reading digital and analog signals Use Arduino with a variety of popular input devices and sensors Drive visual displays, generate sound, and control several types of motors Interact with devices that use remote controls, including TVs and appliances Learn techniques for handling time delays and time measurement Apply advanced coding and memory handling techniques	http://books.google.com.br/books/content?id=nxE245VgtsUC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9781449321208	724	2011-12-12	"O'Reilly Media, Inc."	\N	Arduino Cookbook
57	Jez Humble, David Farley	Entregar uma nova versão de software para usuários costuma ser um processo cansativo, arriscado e demorado. Mas por meio da automação dos processos de compilação, implantação e teste, e da colaboração otimizada entre desenvolvedores, testadores e a equipe de operações, times de entrega podem lançar mudanças em questão de horas - algumas vezes, em minutos. \n\nNeste livro, Jez Humble e David Farley apresentam os princípios, as práticas e as técnicas de ponta que tornam possível uma entrega rápida e de alta qualidade, independentemente do tamanho do projeto ou da complexidade de seu código.	http://www.grupoa.com.br/uploads/imagensTitulo/20130814120536_HUMBLE_Entrega_Continua_M.jpg	\N	496	2014	Grupo A	Como Entregar Software De Forma Rápida e Confiável	Entrega Contínua
60	Gregor Hohpe,Bobby Woolf	Utilizing years of practical experience, seasoned experts Gregor Hohpe and Bobby Woolf show how asynchronous messaging has proven to be the best strategy for enterprise integration success. However, building and deploying messaging solutions presents a number of problems for developers. 'Enterprise Integration Patterns' provides an invaluable catalog of sixty-five patterns, with real-world solutions that demonstrate the formidable of messaging and help you to design effective messaging solutions for your enterprise. The authors also include examples covering a variety of different integration technologies, such as JMS, MSMQ, TIBCO ActiveEnterprise, Microsoft BizTalk, SOAP, and XSL. A case study describing a bond trading system illustrates the patterns in practice, and the book offers a look at emerging standards, as well as insights into what the future of enterprise integration might hold.	http://books.google.com.ec/books/content?id=bUlsAQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780321200686	683	2004-01	Addison-Wesley Professional	Designing, Building, and Deploying Messaging Solutions	Enterprise Integration Patterns
61	Jez Humble,David Farley	The step-by-step guide to going live with new software releases faster - reducing risk and delivering more value sooner! * *Fast, simple, repeatable techniques for deploying working code to production in hours or days, not months! *Crafting custom processes that get developers from idea to value faster than ever. *Best practices for everything from source code control to dependency management and in-production tracing. *Common obstacles to rapid release - and pragmatic solutions. In too many organizations, build, testing, and deployment processes can take six months or more. That's simply far too long for today's businesses. But it doesn't have to be that way. It's possible to deploy working code to production in hours or days after development work is complete - and Go Live presents comprehensive processes and techniques for doing so. Written by two of the world's most experienced software project leaders, this book demonstrates how to dramatically increase speed while reducing risk and improving code quality at the same time. The authors cover all facets of build, testing, and deployment, including: configuration management, source code control, release planning, auditing, compliance, integration, build automation, and more. They introduce a wide range of advanced techniques, including inproduction monitoring and tracing, dependency management, and the effective use of virtualization. For each area, they explain the issues, show how to mitigate the risks, and present best practices. Throughout, Go Live focuses on powerful opportunities for individual improvement, clearly and simply explaining skills and techniques so they can be used every day on real projects. With this book's help, any development organization can move from idea to release faster -- and deliver far more value, far more rapidly.	http://books.google.com.ec/books/content?id=9CAxmQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780321601919	463	2010	Addison-Wesley Professional	Reliable Software Releases Through Build, Test, and Deployment Automation	Continuous Delivery
62	William Faulkner	Returning home to Jefferson, Mississippi, at the end of the First World War, young Bayard Sartoris grieves the loss of his twin brother, John. Despite the stabilizing influence of his marriage to the lovely Narcissa Benbow, young Bayard’s recklessness grows as the days pass, and hastens the destruction of the Sartoris family, who are still living under the shadow of Bayard’s deceased, heroic great-grandfather. A story of a decaying family confronting the debilitating effects of war, Sartoris is a commentary on social class and family conditions in the post-war world of the American South. William Faulkner’s third novel, Sartoris was published in 1929 and was the first novel he set in fictitious Yoknapatawpha County. It introduces many of the memorable characters found in his later books The Hamlet, The Town and The Mansion, including the Snopes family. HarperPerennial Classics brings great works of literature to life in digital form, upholding the highest standards in ebook production and celebrating reading in all its forms. Look for more titles in the HarperPerennial Classics collection to build your digital library.	http://books.google.com.ec/books/content?id=QBQOqGkW6Y4C&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781443421164	320	2013-01-01	Harper Collins	\N	Sartoris
63	Marijn Haverbeke	Provides information and examples on writing JavaScript code, covering such topics as syntax, control, data, regular expressions, and scripting.	http://books.google.com.ec/books/content?id=9U5I_tskq9MC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9781593272821	224	2011	No Starch Press	A Modern Introduction to Programming	Eloquent JavaScript
64	Tom DeMarco,Timothy R. Lister	The legendary 'anti-Dilbert' book on managing software projects by focusing on people - now fully updated for today's projects and methodologies * *Combines humor and wisdom to deliver timeless, practical advice every software manager and developer can use *Updated and reorganized, with seven brand-new chapters *Now addresses leadership, generational differences, distributed and diverse teams, managing risk, holding effective meetings, and using email the right way For this third edition, the authors have added six new chapters and updated the text throughout, bringing it in line with today's development environments and challenges. For example, the book now discusses pathologies of leadership that hadn't previously been judged to be pathological; an evolving culture of meetings; hybrid teams made up of people from seemingly incompatible generations; and a growing awareness that some of our most common tools are more like anchors than propellers. Anyone who needs to manage a software project or software organization will find invaluable advice throughout the book.	http://books.google.com.ec/books/content?id=DVlsAQAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780321934116	249	2013	Pearson Education	Productive Projects and Teams	Peopleware
65	Kent Beck,Cynthia Andres	An updated look at the roots, philosophies, stories, and myths associated with Extreme Programming (XP).	http://books.google.com.ec/books/content?id=32RGBAAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780321278654	189	2005	Pearson Education	Embrace Change	Extreme Programming Explained
66	Edward De Bono	A leading authority on lateral thinking streamlines the decision-making process by identifying the central aspects of problem-solving and, by using real-life scenarios, describes how to focus thinking on each aspect individually, then link them into a productive progression.	http://books.google.com.ec/books/content?id=0lNmQgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780316177917	207	1985	Back Bay Books	\N	Six Thinking Hats
67	Robert B. Cialdini, PhD	Influence, the classic book on persuasion, explains the psychology of why people say "yes"—and how to apply these understandings. Dr. Robert Cialdini is the seminal expert in the rapidly expanding field of influence and persuasion. His thirty-five years of rigorous, evidence-based research along with a three-year program of study on what moves people to change behavior has resulted in this highly acclaimed book. You'll learn the six universal principles, how to use them to become a skilled persuader—and how to defend yourself against them. Perfect for people in all walks of life, the principles of Influence will move you toward profound personal change and act as a driving force for your success. Some images that appeared in the print edition of this book are unavailable in the electronic edition due to rights reasons.	http://books.google.com.ec/books/content?id=5dfv0HJ1TEoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780061899874	336	2009-06-02	Harper Collins	\N	Influence
68	Carlos de la Torre,Steve Striffler	Encompassing Amazonian rainforests, Andean peaks, coastal lowlands, and the Galápagos Islands, Ecuador’s geography is notably diverse. So too are its history, culture, and politics, all of which are examined from many perspectives in The Ecuador Reader. Spanning the years before the arrival of the Spanish in the early 1500s to the present, this rich anthology addresses colonialism, independence, the nation’s integration into the world economy, and its tumultuous twentieth century. Interspersed among forty-eight written selections are more than three dozen images. The voices and creations of Ecuadorian politicians, writers, artists, scholars, activists, and journalists fill the Reader, from José María Velasco Ibarra, the nation’s ultimate populist and five-time president, to Pancho Jaime, a political satirist; from Julio Jaramillo, a popular twentieth-century singer, to anonymous indigenous women artists who produced ceramics in the 1500s; and from the poems of Afro-Ecuadorians, to the fiction of the vanguardist Pablo Palacio, to a recipe for traditional Quiteño-style shrimp. The Reader includes an interview with Nina Pacari, the first indigenous woman elected to Ecuador’s national assembly, and a reflection on how to balance tourism with the protection of the Galápagos Islands’ magnificent ecosystem. Complementing selections by Ecuadorians, many never published in English, are samples of some of the best writing on Ecuador by outsiders, including an account of how an indigenous group with non-Inca origins came to see themselves as definitively Incan, an exploration of the fascination with the Andes from the 1700s to the present, chronicles of the less-than-exemplary behavior of U.S. corporations in Ecuador, an examination of Ecuadorians’ overseas migration, and a look at the controversy surrounding the selection of the first black Miss Ecuador.	http://books.google.com.ec/books/content?id=exgotgc72V0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780822390114	450	2009-01-01	Duke University Press	History, Culture, Politics	The Ecuador Reader
69	Alan Shalloway,Scott Bain,Ken Pugh,Amir Kolsky	Agile has become today’s dominant software development paradigm, but agile methods remain difficult to measure and improve. Essential Skills for the Agile Developer fills this gap from the bottom up, teaching proven techniques for assessing and optimizing both individual and team agile practices. Written by four principals of Net Objectives—one of the world’s leading agile training and consulting firms—this book reflects their unsurpassed experience helping organizations transition to agile. It focuses on the specific actions and insights that can deliver the greatest design and programming improvements with economical investment. The authors reveal key factors associated with successful agile projects and offer practical ways to measure them. Through actual examples, they address principles, attitudes, habits, technical practices, and design considerations—and above all, show how to bring all these together to deliver higher-value software. Using the authors’ techniques, managers and teams can optimize the whole organization and the whole product across its entire lifecycle. Essential Skills for the Agile Developer shows how to Perform programming by intention Separate use from construction Consider testability before writing code Avoid over- and under-design Succeed with Acceptance Test Driven Development (ATDD) Minimize complexity and rework Use encapsulation more effectively and systematically Know when and how to use inheritance Prepare for change more successfully Perform continuous integration more successfully Master powerful best practices for design and refactoring	http://books.google.com.ec/books/content?id=8l2MkoHr_nYC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780321700438	272	2011-08-18	Addison-Wesley Professional	A Guide to Better Programming and Design	Essential Skills for the Agile Developer
70	Michael T. Nygard	Provides information on ways to effectively design and release an application.	http://books.google.com.ec/books/content?id=md4uNwAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780978739218	350	2007	\N	Design and Deploy Production-ready Software	Release It!
71	Carlos Blé Jurado	"TDD es una técnica de desarrollo que se lleva aplicando durante años con gran éxito en lugares como EEUU y Reino Unido, sin embargo, la ausencia de información en español sobre la misma ha supuesto un freno para su difusión en los países hispano-parlantes... Diseño Ágil con TDD nos enseñará a: Escribir tests que aumenten la fiabilidad del código. Escribir tests de aceptación que nos ayudarán a centrarnos, específicamente, en el problema a resolver. Mejorar nuestros diseños para hacerlos más simples y flexibles. Escribir código fácil de mantener. Con TDD, los test son documentación viva y actualizada de nuestro código, la mejor documentación posible. Encajar TDD dentro del paradigma ágil y relacionarlo con otras técnicas como la integración continua" -- Contracubierta.	http://books.google.com.ec/books/content?id=iuoGAwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781445264714	296	2010	Lulu.com	\N	Diseño Ágil con TDD
72	Jhumpa Lahiri	SHORTLISTED FOR THE MAN BOOKER PRIZE 2013. From Subhash's earliest memories, at every point, his brother was there. In the suburban streets of Calcutta where they wandered before dusk and in the hyacinth-strewn ponds where they played for hours on end, Udayan was always in his older brother's sight. So close in age, they were inseparable in childhood and yet, as the years pass - as U.S tanks roll into Vietnam and riots sweep across India - their brotherly bond can do nothing to forestall the tragedy that will upend their lives. Udayan - charismatic and impulsive - finds himself drawn to the Naxalite movement, a rebellion waged to eradicate inequity and poverty. He will give everything, risk all, for what he believes, and in doing so will transform the futures of those dearest to him: his newly married, pregnant wife, his brother and their parents. For all of them, the repercussions of his actions will reverberate across continents and seep through the generations that follow. Epic in its canvas and intimate in its portrayal of lives undone and forged anew, The Lowland is a deeply felt novel of family ties that entangle and fray in ways unforeseen and unrevealed, of ties that ineluctably define who we are. With all the hallmarks of Jhumpa Lahiri's achingly poignant, exquisitely empathetic story-telling, this is her most devastating work of fiction to date.	http://ecx.images-amazon.com/images/I/81MPOK4ypgL.jpg	9781408828113	339	2013	A&C Black	\N	The Lowland
73	Laura Lemay,Charles L. Perkins,Michael Morrison	Presents the basics of object-oriented programming, provides tutorials for Java applets and applications, and details the Java API	images\\no-image.png	9781575211831	1247	1996	Sams	\N	Teach yourself Java in 21 days
74	Noam Chomsky	On Anarchism provides the reasoning behind Noam Chomsky's fearless lifelong questioning of the legitimacy of entrenched power. In these essays, Chomsky redeems one of the most maligned ideologies, anarchism, and places it at the foundation of his political thinking. Chomsky's anarchism is distinctly optimistic and egalitarian. Moreover, it is a living, evolving tradition that is situated in a historical lineage; Chomsky's anarchism emphasizes the power of collective, rather than individualist, action. The collection includes a revealing new introduction by journalist Nathan Schneider, who documented the Occupy movement for Harper's and The Nation, and who places Chomsky's ideas in the contemporary political moment. On Anarchism will be essential reading for a new generation of activists who are at the forefront of a resurgence of interest in anarchism—and for anyone who struggles with what can be done to create a more just world.	http://books.google.com.ec/books/content?id=T3MRBAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9781595589101	128	2013-11-05	New Press, The	\N	On Anarchism
75	James Dashner	"Thomas y sus amigos descansan después de escapar del Laberinto. Por fin sienten que están a salvo. Pero unos gritos desquiciados los despiertan y los enfrentan a una realidad aún más aterradora que la anterior. Para sobrevivir, deberán emprender una travesía en la que cada desafío los enfrentará a nuevos peligros: calor ardiente, destrucción, un aire irrespirable. Cada paso es una sorpresa en una caminata casi apocalíptica. Lo que quedó del mundo es un páramo, a través del cual deberán peregrinar hacia la esperanza (o quién sabe-- ). Emplazados, perseguidos, rodeados de locura, enfermedad y muerte; amenazados por cuerpos con llagas, devastados por la Llamarada; sin poder confiar en los adultos delirantes, hambrientos y violentos, que los acechan a cada paso. Pero para Thomás lo peor será descubrir que lo poco que él creía auténtico en su nueva vida podría ser también la trampa."-- Back cover.	http://books.google.com.ec/books/content?id=qFoHngEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9789876123549	391	2011	Vergara & Riba	prueba de fuego	Maze runner
76	James Dashner	Read the first book in the #1 New York Times bestselling Maze Runner series, perfect for fans of The Hunger Games and Divergent. The Maze Runner, and its sequel The Maze Runner: The Scorch Trials, are now major motion pictures featuring the star of MTV's Teen Wolf, Dylan O’Brien; Kaya Scodelario; Aml Ameen; Will Poulter; and Thomas Brodie-Sangster! Also look for James Dashner’s newest novels, The Eye of Minds and The Rule of Thoughts, the first two books in the Mortality Doctrine series. If you ain’t scared, you ain’t human. When Thomas wakes up in the lift, the only thing he can remember is his name. He’s surrounded by strangers—boys whose memories are also gone. Nice to meet ya, shank. Welcome to the Glade. Outside the towering stone walls that surround the Glade is a limitless, ever-changing maze. It’s the only way out—and no one’s ever made it through alive. Everything is going to change. Then a girl arrives. The first girl ever. And the message she delivers is terrifying. Remember. Survive. Run. Praise for the Maze Runner series: A #1 New York Times Bestselling Series A USA Today Bestseller A Kirkus Reviews Best Teen Book of the Year An ALA-YASLA Best Fiction for Young Adults Book An ALA-YALSA Quick Pick "[A] mysterious survival saga that passionate fans describe as a fusion of Lord of the Flies, The Hunger Games, and Lost."—EW.com “Wonderful action writing—fast-paced…but smart and well observed.”—Newsday “[A] nail-biting must-read.”—Seventeen.com “Breathless, cinematic action.”—Publishers Weekly “Heart pounding to the very last moment.”—Kirkus Reviews “Exclamation-worthy.”—Romantic Times [STAR] “James Dashner’s illuminating prequel [The Kill Order] will thrill fans of this Maze Runner [series] and prove just as exciting for readers new to the series.”—Shelf Awareness, Starred "Take a deep breath before you start any James Dashner book."-Deseret News From the Hardcover edition.	http://books.google.com.ec/books/content?id=6gfDfhmmHxMC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780375893773	400	2009-10-06	Delacorte Press	\N	The Maze Runner (Maze Runner, Book One)
88	Santiago Garcés	\N	http://books.google.com.ec/books/content?id=aPYCOwAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9788430551347	178	2005	SUSAETA	\N	Atlas ilustrado de fotografía digital
78	Joshua Bloch	Are you looking for a deeper understanding of the Java™ programming language so that you can write code that is clearer, more correct, more robust, and more reusable? Look no further! Effective Java™, Second Edition, brings together seventy-eight indispensable programmer’s rules of thumb: working, best-practice solutions for the programming challenges you encounter every day. This highly anticipated new edition of the classic, Jolt Award-winning work has been thoroughly updated to cover Java SE 5 and Java SE 6 features introduced since the first edition. Bloch explores new design patterns and language idioms, showing you how to make the most of features ranging from generics to enums, annotations to autoboxing. Each chapter in the book consists of several “items” presented in the form of a short, standalone essay that provides specific advice, insight into Java platform subtleties, and outstanding code examples. The comprehensive descriptions and explanations for each item illuminate what to do, what not to do, and why. Highlights include: New coverage of generics, enums, annotations, autoboxing, the for-each loop, varargs, concurrency utilities, and much more Updated techniques and best practices on classic topics, including objects, classes, libraries, methods, and serialization How to avoid the traps and pitfalls of commonly misunderstood subtleties of the language Focus on the language and its most fundamental libraries: java.lang, java.util, and, to a lesser extent, java.util.concurrent and java.io Simply put, Effective Java™, Second Edition, presents the most practical, authoritative guidelines available for writing efficient, well-designed programs.	http://books.google.com.ec/books/content?id=YRoNBQAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780321356680	346	2008-05-28	Fonenix inc		Effective Java, 2nd Edition
79	Ben Fountain	Nineteen-year-old Billy Lynn is home from Iraq. And he's a hero. Billy and the rest of Bravo Company were filmed defeating Iraqi insurgents in a ferocious firefight. Now Bravo's three minutes of extreme bravery is a YouTube sensation and the Bush Administration has sent them on a nationwide Victory Tour. During the final hours of the tour Billy will mix with the rich and powerful, endure the politics and praise of his fellow Americans - and fall in love. He'll face hard truths about life and death, family and friendship, honour and duty. Tomorrow he must go back to war.	http://books.google.com.ec/books/content?id=TT6wuQAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780857864529	320	2012	Canongate Books	\N	Billy Lynn's Long Halftime Walk
80	Leonard Richardson,Sam Ruby	Shows how to use the REST architectural style to create web sites that can be used by computers as well as machines, providing basic rules for using REST and real-life examples of such Web services.	http://books.google.com.ec/books/content?id=RQVu5YN59loC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780596529260	419	2007-05-08	"O'Reilly Media, Inc."	\N	RESTful Web Services
81	Peter Thiel,Blake Masters	The billionaire Silicon Valley entrepreneur behind such companies as PayPal and Facebook outlines an innovative theory and formula for building the companies of the future by creating and monopolizing new markets instead of competing in old ones. 200,000 first printing.	http://books.google.com.ec/books/content?id=Owc2nQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780804139298	210	2014-09-16	Crown Business	Notes on Startups, Or How to Build the Future	Zero to One
82	Brett King	The first edition of BANK 2.0—#1 on Amazon's bestseller list for banking and finance in the US, UK, Germany, France, and Japan for over 18 months—took the financial world by storm and became synonymous with disruptive customer behaviour, technology shift, and new banking models. In BANK 3.0, Brett King brings the story up to date with the latest trends redefining financial services and payments—from the global scramble for dominance of the mobile wallet and the expectations created by tablet computing to the operationalising of the cloud, the explosion of social media, and the rise of the de-banked consumer, who doesn't need a bank at all. BANK 3.0 shows that the gap between customers and financial services players is rapidly widening, leaving massive opportunities for new, non-bank competitors to totally disrupt the industry. "On the Web and on Mobile, the customer isn't king—he's dictator. Highly impatient, skeptical, cynical. Brett King understands deeply what drives this new hard-nosed customer. Banking professionals would do well to heed his advice." Gerry McGovern, author of Killer Web Content	http://books.google.com.ec/books/content?id=QUAtNQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781118589632	396	2012-12-26	Wiley	Why Banking Is No Longer Somewhere You Go But Something You Do	Bank 3.0
83	Sam Newman	Over the past 10 years, distributed systems have become more fine-grained. From the large multi-million line long monolithic applications, we are now seeing the benefits of smaller self-contained services. Rather than heavy-weight, hard to change Service Oriented Architectures, we are now seeing systems consisting of collaborating microservices. Easier to change, deploy, and if required retire, organizations which are in the right position to take advantage of them are yielding significant benefits.This book takes an holistic view of the things you need to be cognizant of in order to pull this off. It covers just enough understanding of technology, architecture, operations and organization to show you how to move towards finer-grained systems.	http://books.google.com.ec/books/content?id=1uUDoQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781491950357	259	2015-02-17	Oreilly & Associates Incorporated	\N	Building Microservices
84	Naomi Klein	In this groundbreaking alternative history of the most dominant ideology of our time, Milton Friedman's free-market economic revolution, Naomi Klein challenges the popular myth of this movement's peaceful global victory. From Chile in 1973 to Iraq today, Klein shows how Friedman and his followers have repeatedly harnessed terrible shocks and violence to implement their radical policies. As John Gray wrote in The Guardian, "There are very few books that really help us understand the present. The Shock Doctrine is one of those books."	http://books.google.com.ec/books/content?id=ci8dmQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780312427993	720	2008-06-24	Picador	The Rise of Disaster Capitalism	The Shock Doctrine
85	Michael Lopp	The humor and insights in the 2nd Edition of Managing Humans are drawn from Michael Lopp's management experiences at Apple, Netscape, Symantec, and Borland, among others. This book is full of stories based on companies in the Silicon Valley where people have been known to yell at each other and occasionally throw chairs. It is a place full of dysfunctional bright people who are in an incredible hurry to find the next big thing so they can strike it rich and then do it all over again. Among these people are managers, a strange breed of people who, through a mystical organizational ritual, have been given power over the future and bank accounts of many others. Whether you're an aspiring manager, a current manager, or just wondering what the heck a manager does all day, there is a story in this book that will speak to you—and help you survive and prosper amongst the general craziness. Lopp's straight-from-the-hip style is unlike any other writer on management. He pulls no punches and tells stories he probably shouldn't. But they are massively instructive and cut to the heart of the matter whether it's dealing with your boss, handling a slacker, hiring top guns, or seeing a knotty project through to completion. This second editions expands on the management essentials. It will explain why we hate meetings, but must have them, it carefully documents the right way to have a 1-on-1, and it documents the perils of not listening to your team. Writing code is easy. Managing humans is not. You need a book to help you do it, and this is it. What you’ll learn How to lead geeks How to handle conflict How to hire well How to motivate employees How to manage your boss How to say no How to handle stressed people freaking out How to improve your social IQ How to run a meeting well And much more Who this book is for This book is designed for managers and would-be managers staring at the role of a manager wondering why they would ever leave the safe world of bits and bytes for the messy world of managing humans. The book covers handling conflict, managing wildly differing personality types, infusing innovation into insane product schedules, and figuring out how to build a lasting and useful engineering culture. Table of ContentsSection 1: The Management Quiver 1. Don't Be a Prick 2. Managers Are Not Evil 3. The Rands Test 4. How to Run a Meeting 5. The Twinge 6. The Update, The Vent, and the Disaster 7. The Monday Freakout 8. Lost in Translation 9. Agenda Detection 10. Mandate Dissection 11. Information Starvation 12. Subtlety, Subterfuge, and Silence 13. Managementese 14. Fred Hates It 15. DNA 16. An Engineering Mindset 17. Three Superpowers 18. Saying No Part 2: The Process is the Product 19. 1.0 20. How to Start 21. Taking Time to Think 22. The Soak 23. Managing Malcolm Events 24. Capturing Context 25. Trickle Theory 26. When the Sky Falls 27. Hacking is Important Part 3: Versions of You 28. Bored People Quit 29. Bellwethers 30. The Ninety Day Interview 31. Managing Nerds 32. NADD 33. A Nerd in a Cave 34. Meeting Creatures 35. Incrementalists and Completionists 36. Organics and Mechanics 37. Inwards, Outwards, and Holistics 38. Free Electrons 39. Rules for the Reorg 40. An Unexpected Connection 41. Avoiding the Fez 42. A Glimpse and a Hook 43. Nailing the Phone Screen 44. Your Resignation Checklist Glossary	http://books.google.com.ec/books/content?id=-VLNVRTnTF8C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9781430243144	292	2012-06-27	Apress	Biting and Humorous Tales of a Software Engineering Manager	Managing Humans
86	Howard Zinn	Presents the history of the United States from the point of view of those who were exploited in the name of American progress.	http://books.google.com.ec/books/content?id=3sbVlgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780060838652	729	2005-08-02	Harper Perennial Modern Classics	\N	A People's History of the United States
87	Susan Scott	Shows how to make the most of conversations by communicating clearly and forcefully, offering advice on how to overcome barriers to meaningful conversation, confront tough issues, and leverage new skills for frictionless debate.	http://books.google.com.ec/books/content?id=yOfndmcKSzMC&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780425193372	287	2004-01-01	Penguin	Achieving Success at Work & in Life, One Conversation at a Time	Fierce Conversations
89	Eric Evans	Describes ways to incorporate domain modeling into software development.	http://books.google.com.ec/books/content?id=xColAAPGubgC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780321125217	529	2004	Addison-Wesley Professional	Tackling Complexity in the Heart of Software	Domain-driven Design
90	Vaughn Vernon	“For software developers of all experience levels looking to improve their results, and design and implement domain-driven enterprise applications consistently with the best current state of professional practice, Implementing Domain-Driven Design will impart a treasure trove of knowledge hard won within the DDD and enterprise application architecture communities over the last couple decades.” –Randy Stafford, Architect At-Large, Oracle Coherence Product Development “This book is a must-read for anybody looking to put DDD into practice.” –Udi Dahan, Founder of NServiceBus Implementing Domain-Driven Design presents a top-down approach to understanding domain-driven design (DDD) in a way that fluently connects strategic patterns to fundamental tactical programming tools. Vaughn Vernon couples guided approaches to implementation with modern architectures, highlighting the importance and value of focusing on the business domain while balancing technical considerations. Building on Eric Evans' seminal book, Domain-Driven Design, the author presents practical DDD techniques through examples from familiar domains. Each principle is backed up by realistic Java examples–all applicable to C# developers–and all content is tied together by a single case study: the delivery of a large-scale Scrum-based SaaS system for a multitenant environment. The author takes you far beyond “DDD-lite” approaches that embrace DDD solely as a technical toolset, and shows you how to fully leverage DDD's “strategic design patterns” using Bounded Context, Context Maps, and the Ubiquitous Language. Using these techniques and examples, you can reduce time to market and improve quality, as you build software that is more flexible, more scalable, and more tightly aligned to business goals. Coverage includes Getting started the right way with DDD, so you can rapidly gain value from it Using DDD within diverse architectures, including Hexagonal, SOA, REST, CQRS, Event-Driven, and Fabric/Grid-Based Appropriately designing and applying Entities–and learning when to use Value Objects instead Mastering DDD's powerful new Domain Events technique Designing Repositories for ORM, NoSQL, and other databases	http://books.google.com.ec/books/content?id=aVJsAQAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780321834577	612	2013	Pearson Education	\N	Implementing Domain-Driven Design
91	Robert C. Martin	An extremely pragmatic method for writing better code from the start, and ultimately producing more robust applications.	http://books.google.com.ec/books/content?id=dwSfGQAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780132350884	431	2009	Pearson Education	A Handbook of Agile Software Craftsmanship	Clean Code
92	José María Arguedas	La pequeña antología que conforma este volumen tiene un sentido didáctico y no aspira a dar una selección de lo mejor del autor sino a informar sobre su actividad como escritor y etnólogo al servicio de su pueblo y enraizado en su cultura. Está pensada para servir de herramienta a quieres comienzan a penetrar en el mundo de la literatura y quieren profundizar en el aprendizaje de la realidad peruana. Entrega textos completos, atractivos para el lector que comienza a captar con mayor intensidad la vida, tanto en su forma individual como socialmente. Incluye también una bibliografía básica, que será útil para aquellos que deseen ampliar sus lecturas.	http://www.libreriasur.com.pe/foto/muestraPortada.php?id=9789972699375&size=big	\N	100	2011	Horizonte	Agua - Warma Kuyay - Los Escoleros - Oda al jet - ¿Que es el folklore? - No soy un aculturado	Breve Antología Didactica
93	Ana Lucía Herrera Aguirre, Blanca Diego Vicente, et. al	La Universidad Politécnica Salesiana y su Carrera de Comunicación Social apuesta a la constante reflexión académica, al debate conceptual, a la investigación docente y a la generación de conocimientos que permitan a la comunidad universitaria y a la sociedad, transformar pautas culturales que, infortunadamente, reproducen estereotipos aún vigentes en los medios de comunicación y en la cotidianidad. Desde esta perspectiva, somos la primera carrera en el país en contar con la cátedra optativa Comunicación, Género y Derechos Humanos, un espacio para la reflexión en el que los y las futuras profesionales de la comunicación exploran las prácticas patriarcales y machistas que persisten.\n\nConjuntamente con la Corporación Humanas y la Universidad Andina Simón Bolivar, la Carrera de Comunicación Social de la Universidad Politécnica Salesiana, presenta al público en general y entregan a la comunidad académica del país este texto que recoge las reflexiones y aportes de varios especialistas del tema.	http://www.bligoo.com/media/users/21/1064061/images/public/272141/Los_derechos_de_las_mujeres_en_la_mira.jpg?v=1425776140161	\N	151	2014	humanas ecuador	Observatorio de Sentencias Judiciales y de Medios 2013-2014	Los derechos de las mujeres en la mira
94	Jonathan Rasmusson	Looks at the principles of agile software development, covering such topics as project inception, estimation, iteration management, unit testing, refactoring, test-driven development, and continuous integration.	http://books.google.com.ec/books/content?id=KjmXSQAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781934356586	258	2010	\N	How Agile Masters Deliver Great Software	The Agile Samurai
95	Rafa Ku,Marek Rogoziński,Marek Rogozi Ski	A practical tutorial that covers the difficult design, implementation, and management of search solutions.Mastering ElasticSearch is aimed at to intermediate users who want to extend their knowledge about ElasticSearch. The topics that are described in the book are detailed, but we assume that you already know the basics, like the query DSL or data indexing. Advanced users will also find this book useful, as the examples are getting deep into the internals where it is needed.	http://books.google.com.ec/books/content?id=EEBbngEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781783281435	386	2013-08	Packt Pub Limited	\N	Mastering ElasticSearch
96	Jeff Knupp	The "Writing Idiomatic Python" book is finally here! Chock full of code samples, you'll learn the "Pythonic" way to accomplish common tasks. Each idiom comes with a detailed description, example code showing the "wrong" way to do it, and code for the idiomatic, "Pythonic" alternative. *This version of the book is for Python 2.7.3+. There is also a Python 3.3+ version available.* "Writing Idiomatic Python" contains the most common and important Python idioms in a format that maximizes identification and understanding. Each idiom is presented as a recommendation to write some commonly used piece of code. It is followed by an explanation of why the idiom is important. It also contains two code samples: the "Harmful" way to write it and the "Idiomatic" way. * The "Harmful" way helps you identify the idiom in your own code. * The "Idiomatic" way shows you how to easily translate that code into idiomatic Python. This book is perfect for you: * If you're coming to Python from another programming language * If you're learning Python as a first programming language * If you're looking to increase the readability, maintainability, and correctness of your Python code What is "Idiomatic" Python? Every programming language has its own idioms. Programming language idioms are nothing more than the generally accepted way of writing a certain piece of code. Consistently writing idiomatic code has a number of important benefits: * Others can read and understand your code easily * Others can maintain and enhance your code with minimal effort * Your code will contain fewer bugs * Your code will teach others to write correct code without any effort on your part	http://ecx.images-amazon.com/images/I/41brHoUIAiL._SX384_BO1,204,203,200_.jpg	\N	80	2015	\N	For Python 2.7.3+	Writing Idiomatic Python
97	Mark Lutz	Updated for both Python 3.4 and 2.7, this convenient pocket guide is the perfect on-the-job quick reference. You’ll find concise, need-to-know information on Python types and statements, special method names, built-in functions and exceptions, commonly used standard library modules, and other prominent Python tools. The handy index lets you pinpoint exactly what you need.\n\nWritten by Mark Lutz—widely recognized as the world’s leading Python trainer—Python Pocket Reference is an ideal companion to O’Reilly’s classic Python tutorials, Learning Python and Programming Python, also written by Mark.\n\nThis fifth edition covers:\n\n    Built-in object types, including numbers, lists, dictionaries, and more\n    Statements and syntax for creating and processing objects\n    Functions and modules for structuring and reusing code\n    Python’s object-oriented programming tools\n    Built-in functions, exceptions, and attributes\n    Special operator overloading methods\n    Widely used standard library modules and extensions\n    Command-line options and development tools\n    Python idioms and hints\n    The Python SQL Database API	data:image/jpeg;base64,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	\N	\N	\N	O'Reilly	Python in your pocket	Python Pocket Reference
98	JOSEPH R. MORGAN	Este guia prático de apoio para o aprendizado do idioma espanhol, contém muitas frases correntes e amplo vocabulário. São mais de 1.200 expressões e frases, além de um vocabulário de mais de 2.000 palavras que vão ajudar o leitor a entender e a se comunicar de forma correta na língua espanhola. Seja no trabalho, no estudo ou em viagem, o 'Guia de Expressões Idiomáticas - Português-Espanhol', do professor Joseph R. Morgan, será um instrumento bastante útil. Ele facilita a comunicação entre as pessoas e auxilia na compreensão dos mais variados tipos de texto. E, ainda tem a facilidade de manuseio e a localização das palavras como outro ponto positivo deste manual.	images\\no-image.png	9788586234613	186	\N	\N	\N	EXPRESSOES IDIOMATICAS PORTUGUES/ESPANHOL
99	Paulo Caroli	Ao trabalhar em um projeto, você não quer desperdiçar tempo, dinheiro, nem esforço construindo um produto que não vai atender às suas expectativas ou de seu cliente. Para isso, é preciso validar as hipóteses de negócio e viabilizar possíveis passos de criação com o time todo.  Neste livro, Paulo Caroli compartilha a receita da técnica Direto ao Ponto: uma sequência de atividades rápidas e efetivas para entender e planejar a criação de produtos enxutos, baseadas no conceito de produto mínimo viável.	http://cdn.shopify.com/s/files/1/0155/7645/products/direto-ao-ponto-featured_large.png?v=1440069044	\N	148	08/2015	Casa do Código	Criando produtos de forma enxuta	Direto ao ponto
100	Apostolos Doxiadis,Christos H. Papadimitriou	Recounts, in graphic novel format, the life of Bertrand Russell, mathematician and philospher, and his life-long struggle to achieve perfect logic and ultimate truth.	http://books.google.com.br/books/content?id=sBpkPgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781596914520	347	2009-09-29	Bloomsbury Pub Plc USA	An Epic Search for Truth	Logicomix
101	Firoze Manji,Bill Fletcher Jr	'In this unique collection of essays contemporary thinkers from across Africa and internationally commemorate the anniversary of Amilcar Cabral's assasination. They reflect on the legacy of this extraordinary individual and his relevance to contemporary struggles for self-determination and emancipation."--bookcover.	http://books.google.com.br/books/content?id=mf_cnQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9782869785557	520	2013-10	Codesria Conseil Pour Le Developpement de La Reche	The Legacy of Amilcar Cabral	Claim No Easy Victories
102	Humble, Jez; Farley, Dave	\N	\N	\N	\N	\N	Bookman	Como Entregar Software de Forma Rápida e Confiável	Entrega Contínua
103	Jez Humble,David Farley	Entregar uma nova versão de software para usuários costuma ser um processo cansativo, arriscado e demorado. Mas por meio da automação dos processos de compilação, implantação e teste, e da colaboração otimizada entre desenvolvedores, testadores e a equipe de operações, times de entrega podem lançar mudanças em questão de horas – algumas vezes, em minutos. Neste livro, Jez Humble e David Farley apresentam os princípios, as práticas e as técnicas de ponta que tornam possível uma entrega rápida e de alta qualidade, independentemente do tamanho do projeto ou da complexidade de seu código.	http://books.google.com.br/books/content?id=CB04AgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9788582601044	486	2014-01-01	Bookman Editora	Como Entregar Software	Entrega Contínua
104	Bradesco Dental	\N	\N	\N	\N	\N	\N		Manual do Beneficiário Dental
105	Bradesco Saúde	São Paulo Capital e Grande SP	\N	\N	\N	\N	Bradesco Saúde	Seguros de Pequenos Grupos (SPG) - Rede Nacional	Lista de Referência - Bradesco Saúde
106	Bradesco Dental	Sao Paulo	\N	\N	\N	\N	\N	Rede UNNA	Lista de Referência - Bradesco Dental
107	W3C Escritório Brasil	\N	\N	\N	\N	\N	\N	\N	manual dos dados abertos: governo
108	Vários colaboradores	\N	\N	\N	\N	\N	\N	\N	manual dos dados abertos: desenvolvedores
109	Palagummi Sainath	In this thoroughly researched study of the poorest of the poor, we get to see how they manage, what sustains them, and the efforts, often ludicrous, to do something for them.	http://books.google.com.br/books/content?id=lTEsxsIJInsC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780140259841	470	1996	Penguin Books India	Stories from India's Poorest Districts	Everybody Loves a Good Drought
110	Doug Stephens	Traditional retail is becoming increasingly volatile and challenged as a business model. Brick-and-mortar has shifted to online, while online is shifting into pop-up storefronts. Virtual stores in subway platforms and airports are offering new levels of convenience for harried commuters. High Street and Main Street are becoming the stuff of nostalgia. The Big Box is losing ground to new models that attract consumers through their most-trusted assistant—the smartphone. What’s next? What’s the future for you—a retailer—who is witnessing a tsunami of change and not knowing if this means grasping ahold of new opportunity or being swept away? The Retail Revival answers these questions by looking into the not-so-distant retail past and by looking forward into a future that will continue to redefine retail and its enormous effect on society and our economies. Massive demographic and economic shifts, as well as historic levels of technological and media disruption, are turning this once predictable industry—where “average” was king—into a sea of turbulent change, leaving consumer behavior permanently altered. Doug Stephens, internationally renowned consumer futurist, examines the key seismic shifts in the market that have even companies like Walmart and Procter & Gamble scrambling to cope, and explores the current and future trends that will completely change the way we shop. The Retail Revival provides no-nonsense clarity on the realities of a completely new retail marketplace— realities that are driving many industry executives to despair. But the future need not be dark. Stephens offers hope and guidance for any businesses eager to capitalize on these historic shifts and thrive. Entertaining and thought-provoking, The Retail Revival makes sense of a brave new era of consumer behavior in which everything we thought we knew about retail is being completely reimagined. Praise for The Retail Revival “It doesn’t matter what type of retail you do—if you sell something, somewhere, you need to read Doug Stephens’ The Retail Revival. Packed with powerful insights on the changing retail environment and what good retailers should be thinking about now, The Retail Revival is easy to read, well-organized and provides essential food for thought.” — Gregg Saretsky, President and CEO, WestJet “This book captures in sharp detail the deep and unprecedented changes driving new consumer behaviors and values. More importantly, it offers clear guidance to brands and retailers seeking to adapt and evolve to meet entirely new market imperatives for success.” —John Gerzema, Author of Spend Shift and The Athena Doctrine “The Retail Revival is a critical read for all marketing professionals who are trying to figure out what’s next in retail… Doug Stephens does a great job of explaining why retail has evolved the way it has, and the book serves as an important, trusted guide to where it’s headed next. ” —Joe Lampertius SVP, Shopper Marketing, Momentum Worldwide and Owner, La Spezia Flavor Market “Doug Stephens has proven his right to the moniker ‘Retail Prophet.’ With careful analysis and ample examples, the author makes a compelling case for retailers to adapt, change and consequently revive their connection with consumers. Stephens presents actionable recommendations with optimism and enthusiasm—just the spoonful of sugar we need to face the necessary changes ahead.” —Kit Yarrow, Ph.D., Consumer Psychologist; Professor, Golden Gate University; Co-Author, Gen BuY: How Tweens, Teens and Twenty-Somethings are Revolutionizing Retail “Doug Stephens doesn’t just tell you why retail is in the doldrums, he tells you why retail is a major signpost for the larger troubles of our culture and provides a compelling, inspiring vision for a future of retail—and business, and society.” —Eric Garland, author of Future Inc.: How Businesses Can Anticipate and Profit from What’s Next	http://books.google.com.br/books/content?id=XyA_TU19g48C&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781118489673	250	2013-03-11	John Wiley & Sons	Reimagining Business for the New Age of Consumerism	The Retail Revival
111	Charles Duhigg	Lista dos mais vendidos da Veja Durante os últimos dois anos, uma jovem transformou quase todos os aspectos de sua vida. Parou de fumar, correu uma maratona e foi promovida. Em um laboratório, neurologistas descobriram que os padrões dentro do cérebro dela – ou seja, seus hábitos – foram modificados de maneira fundamental para que todas essas mudanças ocorressem. Há duas décadas pesquisando ao lado de psicólogos, sociólogos e publicitários, cientistas do cérebro começaram finalmente a entender como os hábitos funcionam – e, mais importante, como podem ser transformados. Com base na leitura de centenas de artigos acadêmicos, entrevistas com mais de trezentos cientistas e executivos, além de pesquisas realizadas em dezenas de empresas, o repórter investigativo do New York Times Charles Duhigg elabora, em O poder do hábito, um argumento animador: a chave para se exercitar regularmente, perder peso, educar bem os filhos, se tornar uma pessoa mais produtiva, criar empresas revolucionárias e ter sucesso é entender como os hábitos funcionam. Transformá-los pode gerar bilhões e significar a diferença entre fracasso e sucesso, vida e morte.	http://books.google.com.br/books/content?id=k0j8IgiMKoMC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9788539004256	408	2012-10-01	Editora Objetiva	Por que fazemos o que fazemos na vida e nos negócios	O poder do hábito
112	Varios Autores	\N	\N	\N	\N	\N	\N	Histórias de aprendizado e inovação	Antologia Brasil
113	Armando Fox,David A. Patterson	\N	images\\no-image.png	9780984881277	\N	2015-03-01	\N	Uma Abordagem Ágil Usando Computação em Nuvem	Construindo Software como Serviço
114	Daron Acemoğlu,James A. Robinson	An award-winning professor of economics at MIT and a Harvard University political scientist and economist evaluate the reasons that some nations are poor while others succeed, outlining provocative perspectives that support theories about the importance of institutions.	http://books.google.com.br/books/content?id=ErKvvTKBrbYC&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780307719218	529	2012	Crown Business	The Origins of Power, Prosperity, and Poverty	Why Nations Fail
115	CLAYTON M. CHRISTENSEN,LAURA PRADES VEIGA	Este livro pretende assumir a posição de que grandes empresas fracassam exatamente porque fazem tudo certo e demonstrar por que boas empresas, mesmo mantendo sua antena competitiva ligada, ouvindo os clientes e investindo agressivamente em novas tecnologias, perderam sua liderança no mercado quando se confrontaram com mudanças tecnológicas de ruptura e incrementais na estrutura do mercado. Usando as lições de sucesso e fracasso de companhias líderes, 'O Dilema da Inovação' apresenta um conjunto de regras para capitalizar o fenômeno da inovação de ruptura/incremental. Estes princípios visam a determinar quando é certo não ouvir os clientes, quando investir no desenvolvimento de produtos com menor desempenho que prometem margens menores e quando buscar mercados menores às custas daqueles aparentemente maiores e mais lucrativos.	images\\no-image.png	9788576801283	304	\N	\N	\N	O DILEMA DA INOVAÇAO
116	ROBERT C. MARTIN	Mesmo um código ruim pode funcionar. Mas se ele não for limpo, pode acabar com uma empresa de desenvolvimento. Perdem-se a cada ano horas incontáveis e recursos importantes devido a um código mal escrito. O especialista em software, Robert C. Martin, apresenta um paradigma com 'Código limpo - Habilidades Práticas do Agile Software.' O leitor poderá aprender a ler códigos e descobrir o que está correto e errado neles. 'Código limpo' está divido em três partes. Na primeira há diversos capítulos que descrevem os princípios, padrões e práticas para criar um código limpo. A segunda parte consiste em diversos casos de estudo de complexidade cada vez maior. Cada um é um exercício para limpar um código - transformar o código base que possui alguns problemas em melhores e mais eficientes. A terceira parte é a compensação - um único capítulo com uma lista de heurísticas e 'odores' reunidos durante a criação dos estudos de caso.	images\\no-image.png	9788576082675	440	\N	\N	\N	CODIGO LIMPO
117	Jez Humble,David Farley	Winner of the 2011 Jolt Excellence Award! Getting software released to users is often a painful, risky, and time-consuming process. This groundbreaking new book sets out the principles and technical practices that enable rapid, incremental delivery of high quality, valuable new functionality to users. Through automation of the build, deployment, and testing process, and improved collaboration between developers, testers, and operations, delivery teams can get changes released in a matter of hours— sometimes even minutes–no matter what the size of a project or the complexity of its code base. Jez Humble and David Farley begin by presenting the foundations of a rapid, reliable, low-risk delivery process. Next, they introduce the “deployment pipeline,” an automated process for managing all changes, from check-in to release. Finally, they discuss the “ecosystem” needed to support continuous delivery, from infrastructure, data and configuration management to governance. The authors introduce state-of-the-art techniques, including automated infrastructure management and data migration, and the use of virtualization. For each, they review key issues, identify best practices, and demonstrate how to mitigate risks. Coverage includes • Automating all facets of building, integrating, testing, and deploying software • Implementing deployment pipelines at team and organizational levels • Improving collaboration between developers, testers, and operations • Developing features incrementally on large and distributed teams • Implementing an effective configuration management strategy • Automating acceptance testing, from analysis to implementation • Testing capacity and other non-functional requirements • Implementing continuous deployment and zero-downtime releases • Managing infrastructure, data, components and dependencies • Navigating risk management, compliance, and auditing Whether you’re a developer, systems administrator, tester, or manager, this book will help your organization move from idea to release faster than ever—so you can deliver value to your business rapidly and reliably.	http://books.google.com.br/books/content?id=6ADDuzere-YC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780321670229	512	2010-07-27	Pearson Education	Reliable Software Releases through Build, Test, and Deployment Automation (Adobe Reader)	Continuous Delivery
118	Roy Singham,Martin Fowler,Rebecca J. Parsons,Neal Ford,Jeff Bay	ThoughtWorks is a well-known global consulting firm; ThoughtWorkers are leaders in areas of design, architecture, SOA, testing, and agile methodologies. This collection of essays brings together contributions from well-known ThoughtWorkers such as Martin Fowler, along with other authors you may not know yet. While ThoughtWorks is perhaps best known for their work in the Agile community, this anthology confronts issues throughout the software development life cycle. From technology issues that transcend methodology, to issues of realizing business value from applications, you'll find it here.	http://books.google.com.br/books/content?id=o4FXLgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781934356142	223	2008	\N	Essays on Software Technology and Innovation	The Thoughtworks Anthology
119	Jason Fried,David Heinemeier Hansson	"Jason Fried and David Heinemeier Hansson, co-founders of software company 37signals, follow a simpler-is-better philosophy. This extends from writing software used in microblogging phenomenon Twitter - to building a business and managing a career. he company has a million users and a payroll of eight. Their point of difference is pared down simplicity: they make products that are shockingly easy to use. The advice contained in ReWork aimed at small businesses is equally no-nonsense and inspired: spend less money, hire fewer people, work fewer hours, have fewer meetings, and perhaps most surprisingly offer fewer features. Essentially do less than the competition. hey focus on what really matters. Employees are fresh, energised and forced to avoid distractions. With short, to-the-point chapters, ReWork draws together what 37signals has learned in the trenches while building a hugely successful company that not only has loyal customers, it has raving fans. Inspirational, motivational and simple, ReWork will be the post-recession business book of the year."	http://books.google.com.br/books/content?id=ClszWsFKluoC&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780091929787	279	2010	Random House	Change the Way You Work Forever	ReWork
120	Diego Balbino, Paola Prandini	\N	http://2.bp.blogspot.com/-V5KWlBCHNHE/VWyOYSAVGgI/AAAAAAAAAnw/7_ll2bN4E48/s1600/carolinas.jpg	\N	\N	\N	\N	Retratos inspirados em Carolina Maria de Jesus	Carolinas
121	Paulo Caroli (Edição)	\N	https://cdn.shopify.com/s/files/1/0155/7645/products/thoughtworks-antologia-featured_large.png	\N	292	11/2014	Casa do Código	Histórias de aprendizado e inovação	Thoughtworks Antologia Brasil
162	Eric Freeman,Elisabeth Freeman,Andreza Gonçalves,Marcelo Soares,Pedro Cesar de Conti	Esta obra tem o intuito de apresentar padrões de projetos, procurando responder a perguntar como - quais são os padrões que realmente importam; quando e por que devem ser usados; como aplicá-los em seus próprios projetos; quando não usá-los (como evitar a febre dos padrões); quais são os princípios de design da programação orientada a objetos em que os padrões se baseiam.	http://ecx.images-amazon.com/images/I/51-UxkpndnL._SX367_BO1,204,203,200_.jpg	9788576081746	478	2009	\N	padrões e projetos	Use a cabeça
122	ROBERT C. MARTIN	Mesmo um código ruim pode funcionar. Mas se ele não for limpo, pode acabar com uma empresa de desenvolvimento. Perdem-se a cada ano horas incontáveis e recursos importantes devido a um código mal escrito. O especialista em software, Robert C. Martin, apresenta um paradigma com 'Código limpo - Habilidades Práticas do Agile Software.' O leitor poderá aprender a ler códigos e descobrir o que está correto e errado neles. 'Código limpo' está divido em três partes. Na primeira há diversos capítulos que descrevem os princípios, padrões e práticas para criar um código limpo. A segunda parte consiste em diversos casos de estudo de complexidade cada vez maior. Cada um é um exercício para limpar um código - transformar o código base que possui alguns problemas em melhores e mais eficientes. A terceira parte é a compensação - um único capítulo com uma lista de heurísticas e 'odores' reunidos durante a criação dos estudos de caso.	http://www.altabooks.com.br/images/product/15/3D_Codigo_Limpo.jpg	\N	440	\N	alta books	Habilidades Práticas do Ágile Software	CODIGO LIMPO
123	Armando Fox,David A. Patterson	\N	http://ecx.images-amazon.com/images/I/51gmK4Or%2BrL._SX258_BO1,204,203,200_.jpg	\N	\N	2015-03-01	\N	Uma Abordagem Ágil Usando Computação em Nuvem	Construindo Software como Serviço
124	Vários colaboradores	\N	http://www.w3c.br/pub/Noticias/W3CBrasilLancaManualDadosAbertosDesenvolvedores/manualDadosAbertosDesen.png	\N	\N	\N	\N	\N	manual dos dados abertos: desenvolvedores
125	Vários autores	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Manual_Dados_Abertos.pdf/page1-422px-Manual_Dados_Abertos.pdf.jpg	\N	\N	\N	\N	\N	manual dos dados abertos: governo
126	CLAYTON M. CHRISTENSEN,LAURA PRADES VEIGA	Este livro pretende assumir a posição de que grandes empresas fracassam exatamente porque fazem tudo certo e demonstrar por que boas empresas, mesmo mantendo sua antena competitiva ligada, ouvindo os clientes e investindo agressivamente em novas tecnologias, perderam sua liderança no mercado quando se confrontaram com mudanças tecnológicas de ruptura e incrementais na estrutura do mercado. Usando as lições de sucesso e fracasso de companhias líderes, 'O Dilema da Inovação' apresenta um conjunto de regras para capitalizar o fenômeno da inovação de ruptura/incremental. Estes princípios visam a determinar quando é certo não ouvir os clientes, quando investir no desenvolvimento de produtos com menor desempenho que prometem margens menores e quando buscar mercados menores às custas daqueles aparentemente maiores e mais lucrativos.	http://ecx.images-amazon.com/images/I/41NrTb9UliL._SX322_BO1,204,203,200_.jpg	\N	304	\N	\N	\N	O DILEMA DA INOVAÇAO
127	Robert B. Cialdini PhD	Influence, the classic book on persuasion, explains the psychology of why people say "yes"—and how to apply these understandings. Dr. Robert Cialdini is the seminal expert in the rapidly expanding field of influence and persuasion. His thirty-five years of rigorous, evidence-based research along with a three-year program of study on what moves people to change behavior has resulted in this highly acclaimed book.\n\nYou'll learn the six universal principles, how to use them to become a skilled persuader—and how to defend yourself against them. Perfect for people in all walks of life, the principles of Influence will move you toward profound personal change and act as a driving force for your success.	http://d1b14unh5d6w7g.cloudfront.net/0688128165.01.S001.LXXXXXXX.jpg?Expires=1445968663&Signature=B0H+au9A5SB/SBiDQTkt3SMYbeBsovrbEhErG9mq4Rr7aM4zD7Supr/crrO7Bg1MkBmxQTJL8uTlfKZUJMtu7gvG9GX4TtaJByLutKkgzE8zqnHUYeRb/fWLdWKIZ85STr89XeFOD/YjDmpX0fVXzY6ECAkPtvVZK8lYH8V3iRw=&Key-Pair-Id=APKAIUO27P366FGALUMQ	\N	281	June 2, 2009	HarperCollins e-books; Revised edition (May 28, 2009)	The Psychology of Persuasion	Influence
128	Robert B. Cialdini	\N	http://ecx.images-amazon.com/images/I/512-B-1yXuL._SX331_BO1,204,203,200_.jpg	\N	\N	\N	\N	\N	Influence: The Psychology of Persuasion, Revised Edition
129	Daniel O'Malley	\N	http://ecx.images-amazon.com/images/I/81WQ33uXXsL._SL1500_.jpg	\N	497	\N	\N	\N	The Rook
130	Sergios Theodoridis	\N	http://i43.tower.com/images/mm100385619/pattern-recognition-third-edition-sergios-theodoridis-hardcover-cover-art.jpg	\N	\N	\N	\N	\N	Pattern Recognition, Third Edition (Hardcover)
131	Daniel Kahneman	Sinopse\n\nDe forma envolvente, o autor revela quando podemos ou não confiar em nossa intuição!\n\nNesta obra, o autor nos leva a uma viagem pela mente humana e explica as duas formas de pensar: uma é rápida, intuitiva e emocional; a outra, mais lenta, deliberativa e lógica. Kahneman expõe as capacidades extraordinárias - e também os defeitos e vícios do pensamento rápido e revela o peso das impressões intuitivas nas nossas decisões. Comportamentos tais como a aversão à perda, o excesso de confiança no momento de escolhas estratégicas, a dificuldade de prever o que vai nos fazer felizes no futuro e os desafios de identificar corretamente os riscos no trabalho e em casa só podem ser compreendidos se soubermos como as duas formas de pensar moldam nossos julgamentos.	http://img.submarino.com.br/produtos/01/00/item/111458/2/111458225_1GG.jpg	\N	\N	\N	624	\N	Rápido e Devagar: Duas Formas de Pensar
132	Paulo Caroli	\N	http://cdn.shopify.com/s/files/1/0155/7645/products/direto-ao-ponto-featured_large.png?v=1440069044	\N	\N	\N	\N	\N	Direto ao Ponto: Criando produtos de forma enxuta
133	Jez Humble, Joanne Molesky, Barry O'Reilly	\N	http://akamaicovers.oreilly.com/images/0636920030355/cat.gif	\N	\N	\N	\N	\N	Lean Enterprise: How High Performance Organizations Innovate at Scale
134	David Beazley,Brian K. Jones	If you need help writing programs in Python 3, or want to update older Python 2 code, this book is just the ticket. Packed with practical recipes written and tested with Python 3.3, this unique cookbook is for experienced Python programmers who want to focus on modern tools and idioms. Inside, you’ll find complete recipes for more than a dozen topics, covering the core Python language as well as tasks common to a wide variety of application domains. Each recipe contains code samples you can use in your projects right away, along with a discussion about how and why the solution works. Topics include: Data Structures and AlgorithmsStrings and TextNumbers, Dates, and TimesIterators and GeneratorsFiles and I/OData Encoding and ProcessingFunctionsClasses and ObjectsMetaprogrammingModules and PackagesNetwork and Web ProgrammingConcurrencyUtility Scripting and System AdministrationTesting, Debugging, and ExceptionsC Extensions	http://books.google.com.br/books/content?id=6yMNBQAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781449340377	706	2013-06-01	O'Reilly Media; 3 edition (June 1, 2013)	3rd Edition	Python Cookbook
204	Lynn Beighley	Presents an instructional guide to SQL which uses humor and simple images to cover such topics as the structure of relational databases, simple and complex queries, creating multiple tables, and protecting important table data.	http://books.google.com.ec/books/content?id=ZO6MF9Ja1zoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780596526849	571	2007-08-28	"O'Reilly Media, Inc."	Your Brain on SQL -- A Learner's Guide	Head First SQL
135	Lisa Crispin,Janet Gregory	Janet Gregory and Lisa Crispin pioneered the agile testing discipline with their previous work, Agile Testing. Now, in More Agile Testing, they reflect on all they've learned since. They address crucial emerging issues, share evolved agile practices, and cover key issues agile testers have asked to learn more about. Packed with new examples from real teams, this insightful guide offers detailed information about adapting agile testing for your environment; learning from experience and continually improving your test processes; scaling agile testing across teams; and overcoming the pitfalls of automated testing. You'll find brand-new coverage of agile testing for the enterprise, distributed teams, mobile/embedded systems, regulated environments, data warehouse/BI systems, and DevOps practices. You'll come away understanding • How to clarify testing activities within the team • Ways to collaborate with business experts to identify valuable features and deliver the right capabilities • How to design automated tests for superior reliability and easier maintenance • How agile team members can improve and expand their testing skills • How to plan “just enough,” balancing small increments with larger feature sets and the entire system • How to use testing to identify and mitigate risks associated with your current agile processes and to prevent defects • How to address challenges within your product or organizational context • How to perform exploratory testing using “personas” and “tours” • Exploratory testing approaches that engage the whole team, using test charters with session- and thread-based techniques • How to bring new agile testers up to speed quickly–without overwhelming them Janet Gregory is founder of DragonFire Inc., an agile quality process consultancy and training firm. Her passion is helping teams build quality systems. For almost fifteen years, she has worked as a coach and tester, introducing agile practices into companies of all sizes and helping users and testers understand their agile roles. She is a frequent speaker at agile and testing software conferences, and is a major contributor to the agile testing community. Lisa Crispin, an experienced agile testing practitioner and coach, regularly leads conference workshops on agile testing and contributes frequently to agile software publications. She enjoys collaborating as part of an awesome agile team to produce quality software. Since 1982, she has worked in a variety of roles on software teams, in a wide range of industries. She joined her first agile team in 2000 and continually learns from other teams and practitioners.	http://books.google.com.br/books/content?id=AYAhBQAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780321967053	544	2014-10-06	Pearson Education	Learning Journeys for the Whole Team	More Agile Testing
136	Eric Ries	Outlines a revisionist approach to management while arguing against common perceptions about the inevitability of startup failures, explaining the importance of providing genuinely needed products and services as well as organizing a business that can adapt to continuous customer feedback.	http://books.google.com.br/books/content?id=r9x-OXdzpPcC&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780307887894	320	2011	Crown Books	How Today's Entrepreneurs Use Continuous Innovation to Create Radically Successful Businesses	The Lean Startup
137	Eustáquio Rangel de Oliveira Jr.	Este livro é um guia para o conhecimento e aprendizagem da linguagem Ruby. Contém dicas que ajudarão o leitor a fazer desde simples scripts para rodar em terminais em modo texto até aplicações gráficas multiplataforma com acesso a vários bancos de dados. Dentre os assuntos abordados, destacam-se - criação de scripts; desenvolvimento de aplicações gráficas; acesso a diversos bancos de dados; uso de threads; Ruby na web.	http://books.google.com.br/books/content?id=rimKvq_oOpkC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9788574522616	235	2006	Brasport	conhecendo a linguagem	Ruby
138	Ari Lerner	Ready to master AngularJS? What if you could master the entire framework - with solid foundations - in less time without beating your head against a wall? Imagine how quickly you could work if you knew the best practices and the best tools? Stop wasting your time searching and have everything you need to be productive in one, well-organized place, with complete examples to get your project up without needing to resort to endless hours of research.	http://books.google.com.br/books/content?id=I7UpnwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780991344604	624	2013-12	Fullstack IO	\N	Ng-Book - the Complete Book on Angularjs
139	Lisa Crispin,Janet Gregory	Get past the myths of testing in agile environments - and implement agile testing the RIGHT way. * * For everyone concerned with agile testing: developers, testers, managers, customers, and other stakeholders. * Covers every key issue: Values, practices, organizational and cultural challenges, collaboration, metrics, infrastructure, documentation, tools, and more. * By two of the world's most experienced agile testing practitioners and consultants. Software testing has always been crucial, but it may be even more crucial in agile environments that rely heavily on repeated iterations of software capable of passing tests. There are, however, many myths associated with testing in agile environments. This book helps agile team members overcome those myths -- and implement testing that truly maximizes software quality and value. Long-time agile testers Lisa Crispin and Janet Gregory offer powerful insights for three large, diverse groups of readers: experienced testers who are new to agile; members of newly-created agile teams who aren't sure how to perform testing or work with testers; and test/QA managers whose development teams are implementing agile. Readers will learn specific agile testing practices and techniques that can mean the difference between success and failure; discover how to transition 'traditional' test teams to agile; and learn how to integrate testers smoothly into agile teams. Drawing on extensive experience, the authors illuminate topics ranging from culture to test planning to automated tools. They cover every form of testing: business-facing tests, technology-facing tests, exploratory tests, context-driven and scenario tests, load, stability, and endurance tests, and more. Using this book's techniques, readers can improve the effectiveness and reduce the risks of any agile project or initiative.	http://books.google.com.br/books/content?id=R2DImAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780321534460	533	2009	Pearson Education	A Practical Guide for Testers and Agile Teams	Agile Testing
140	ERIC RIES,CARLOS SZLAK	Eric Ries criou uma abordagem de administração que tem por objetivo transformar a maneira pela qual os novos produtos são criados, desenvolvidos e lançados. 'A Startup Enxuta' procura ensinar empreendedores, administradores e líderes empresariais a serem mais bem-sucedidos na condução de seus negócios sem, contudo, desperdiçar tempo e recursos. Na esteira da economia mundial, a inovação pode ser considerada essencial para estimular o crescimento econômico, e o processo criado em 'A Startup Enxuta' foi desenvolvida para que se possa evitar dinâmicas de atualidade. Eric descreve o plano para que cada um possa executar os princípios fundamentais da startup enxuta em qualquer projeto.	https://skoob.s3.amazonaws.com/livros/233484/A_STARTUP_ENXUTA_1335471114B.jpg	9788581780047	224	2012-04-16	\N	\N	A STARTUP ENXUTA
141	Mike Cohn	Goes beyond the strategy of just enough planning and estimating, and shows readers how to make agile practices truly work organizationally.	http://books.google.com.br/books/content?id=j0eFmAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780131479418	330	2006	Prentice-Hall PTR	\N	Agile Estimating and Planning
163	Martin Fowler	Em 'Refatoração', o mentor da tecnologia de objetos Martin Fowler abre novos caminhos, desmitificando práticas importantes e demonstrando como os desenvolvedores de software podem tornar reais os benefícios significativos deste novo processo. O autor demonstra que, com treinamento apropriado, um desenhista de sistemas experiente pode pegar um projeto ruim e retrabalhá-lo num código robusto e bem projetado. Além de discutir as várias técnicas da refatoração, Fowler fornece um catálogo detalhado de mais de 70 refatorações verificadas, com indicadores úteis que ensinam quando aplicá-las; instruções passo a passo para aplicar cada refatoração e um exemplo que mostra como a refatoração funciona. Os exemplos ilustrativos estão escritos em Java, mas as idéias são aplicáveis a qualquer linguagem orientada a objetos.	http://books.google.com.br/books/content?id=zPdb4QJKBtkC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9788536303956	365	2004	Bookman	\N	Refatoração: Aperfeiçoamento e Projeto
142	Robert C. Martin	Written by a software developer for software developers, this book is a unique collection of the latest software development methods. The author incudes OOD, UML, Design Patterns, Agile and XP methods with a detailed description of a complete software design for reusable programs in C++ and Java. Using a practical, problem-solving approach, it shows how to develop an object-oriented application -- from the early stages of analysis, through the low-level design and into the implementation. Walks readers through the designer's thoughts — showing the errors, blind alleys, and creative insights that occur throughout the software design process. Covers: Statics and Dynamics; Principles of Class Design; Complexity Management; Principles of Package Design; Analysis and Design; Patterns and Paradigm Crossings. Explains the principles of OOD, one by one, and then demonstrates them with numerous examples, completely worked-through designs, and case studies. Covers traps, pitfalls, and work arounds in the application of C++ and OOD and then shows how Agile methods can be used. Discusses the methods for designing and developing big software in detail. Features a three-chapter, in-depth, single case study of a building security system. For Software Engineers, Programmers, and Analysts who want to understand how to design object oriented software with state of the art methods.	http://books.google.com.br/books/content?id=0HYhAQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780135974445	529	2003	Prentice Hall	Principles, Patterns, and Practices	Agile Software Development
143	Sam Ruby,David Thomas,David Heinemeier Hansson	Provides information on creating Web-based applications with Rails 4 and Ruby 2, covering such topics as HTTP authentication, validation and unit testing, cart creation, Ajax, caching, migrations, and plugins.	http://books.google.com.br/books/content?id=ymiqnAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781937785567	434	2013	\N	\N	Agile Web Development with Rails 4
144	Robert C. Martin	Presents practical advice on the disciplines, techniques, tools, and practices of computer programming and how to approach software development with a sense of pride, honor, and self-respect.	http://books.google.com.br/books/content?id=VQlvAQAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780137081073	210	2011	Pearson Education	A Code of Conduct for Professional Programmers	The Clean Coder
145	Michael Fogus,Chris Houser	Summary The Joy of Clojure, Second Edition is a deep look at the Clojure language. Fully updated for Clojure 1.6, this new edition goes beyond just syntax to show you the "why" of Clojure and how to write fluent Clojure code. You'll learn functional and declarative approaches to programming and will master the techniques that make Clojure so elegant and efficient. Purchase of the print book includes a free eBook in PDF, Kindle, and ePub formats from Manning Publications. About the Technology The Clojure programming language is a dialect of Lisp that runs on the Java Virtual Machine and JavaScript runtimes. It is a functional programming language that offers great performance, expressive power, and stability by design. It gives you built-in concurrency and the predictable precision of immutable and persistent data structures. And it's really, really fast. The instant you see long blocks of Java or Ruby dissolve into a few lines of Clojure, you'll know why the authors of this book call it a "joyful language." It's no wonder that enterprises like Staples are betting their infrastructure on Clojure. About the Book The Joy of Clojure, Second Edition is a deep account of the Clojure language. Fully updated for Clojure 1.6, this new edition goes beyond the syntax to show you how to write fluent Clojure code. You'll learn functional and declarative approaches to programming and will master techniques that make Clojure elegant and efficient. The book shows you how to solve hard problems related to concurrency, interoperability, and performance, and how great it can be to think in the Clojure way. Appropriate for readers with some experience using Clojure or common Lisp. What's Inside Build web apps using ClojureScript Master functional programming techniques Simplify concurrency Covers Clojure 1.6 About the Authors Michael Fogus and Chris Houser are contributors to the Clojure and ClojureScript programming languages and the authors of various Clojure libraries and language features. Table of Contents PART 1 FOUNDATIONS Clojure philosophy Drinking from the Clojure fire hose Dipping your toes in the pool PART 2 DATA TYPES On scalars Collection types PART 3 FUNCTIONAL PROGRAMMING Being lazy and set in your ways Functional programming PART 4 LARGE-SCALE DESIGN Macros Combining data and code Mutation and concurrency Parallelism PART 5 HOST SYMBIOSIS Java.next Why ClojureScript? PART 6 TANGENTIAL CONSIDERATIONS Data-oriented programming Performance Thinking programs Clojure changes the way you think	http://books.google.com.br/books/content?id=sfTXmgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781617291418	477	2013-06-26	Manning Publications	\N	The Joy of Clojure
146	Paul M. Duvall,Steve Matyas,Andrew Glover	Shows how the practice of Continuous Integration (CI) benefits software development by improving quality and reducing risk.	http://books.google.com.br/books/content?id=MA8QmAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780321336385	283	2007	Addison-Wesley Professional	Improving Software Quality and Reducing Risk	Continuous Integration
147	Chas Emerick,Brian Carper,Christophe Grand	Describes the fundamentals of Clojure, covering such topics as data structures, concurrency, macros, multimethods, JVM, REPL-oriented programming, and relational databases.	http://books.google.com.br/books/content?id=nZTvSa4KqfQC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9781449394707	607	2012-04-12	"O'Reilly Media, Inc."	\N	Clojure Programming
148	Russ Olsen	Presents information on writing Ruby code, covering such topics as control structures, strings, expressions, building methods, classes, and domain specific languages.	http://books.google.com.br/books/content?id=ozhJmQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780321584106	413	2011	Addison-Wesley Professional	\N	Eloquent Ruby
149	Mark Pilgrim	Provides information on the elements on HTML, offers code examples, and describes how to build accessible markup.	http://books.google.com.br/books/content?id=uuGbAgAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780596806026	205	2010-08-13	"O'Reilly Media, Inc."	Up and Running	HTML5
150	Alistair Croll,Benjamin Yoskovitz	Offers six sample business models and thirty case studies to help build and monetize a business.	http://books.google.com.br/books/content?id=VJS5qQWOKUIC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9781449335670	409	2013-04-15	"O'Reilly Media, Inc."	Use Data to Build a Better Startup Faster	Lean Analytics
151	Andrew Hunt	Provides information on ways to "refactor" one's brain to develop better cognitive skills.	http://books.google.com.br/books/content?id=Pq3_PAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781934356050	271	2008	Pragmatic Bookshelf	Refactor Your Wetware	Pragmatic Thinking and Learning
152	Spencer Krum,William Van Hevelingen,Ben Kero,James Turnbull,Jeffrey McCune	Offers information on the installation, use, and development using the configuration managmenet software.	http://books.google.com.br/books/content?id=VfBZAgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9781430260400	332	2013-12-09	Apress	\N	Pro Puppet
203	Russel Jurney	\N	\N	\N	\N	\N	\N	Building Data Analytics Applications with Hadoop	Agile Data Science
205	Tom White	Counsels programmers and administrators for big and small organizations on how to work with large-scale application datasets using Apache Hadoop, discussing its capacity for storing and processing large amounts of data while demonstrating best practices for building reliable and scalable distributed systems. Original.	http://books.google.com.ec/books/content?id=azmxoQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781491901632	756	2015-04-10	Oreilly & Associates Incorporated	\N	Hadoop: The Definitive Guide
153	James Turnbull	Competent system administrators know their success hinges upon being able to perform often tedious tasks with rigor and punctuality. Such metrics are often achieved only by instituting a considerable degree of automation, something that has become even more crucial as IT environments continue to scale both in terms of size and complexity. One of the most powerful system administration tools to be released is Puppet, a solution capable of automating nearly every aspect of a system administrator’s job, from user management, to software installation, to even configuring server services such as FTP and LDAP. Pulling Strings with Puppet: Configuration Management Made Easy is the first book to introduce the powerful Puppet system administration tool. Author James Turnbull will guide you through Puppet’s key features, showing you how to install and configure the software, create automated Puppet tasks, known as recipes, and even create reporting solutions and extend Puppet further to your own needs. A bonus chapter is included covering the Facter library, which makes it a breeze to automate the retrieval of server configuration details such as IP and MAC addresses. What you’ll learn Properly install and configure Puppet in order to begin immediately maximizing its capabilities Create reporting solutions to more easily monitor automated outcomes Extend Puppet to perform tasks that are capable of suiting your organization’s specific needs Use Facter to query server operating systems for key data such as IP addresses, server names, and MAC addresses Who this book is for Ruby developers and system administrators. Table of Contents Introducing Puppet Installing and Running Puppet Speaking Puppet Using Puppet Reporting on Puppet Advanced Puppet Extending Puppet	http://books.google.com.br/books/content?id=BqThxxKBZt4C&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781590599785	192	2008-01-29	Springer	Configuration Management Made Easy	Pulling Strings with Puppet
154	John Resig,Bear Bibeault	In Secrets of the JavaScript Ninja, JavaScript expert John Resig reveals the inside know-how of the elite JavaScript programmers. Written to be accessible to JavaScript developers with intermediate-level skills. This book takes readers on a journey towards mastering modern JavaScript development in three phases: design, construction, and maintenance. It first establishes a base of strong, advanced JavaScript knowledge. The book then teaches readers how to construct a JavaScript library. It examines all the numerous tasks JavaScript libraries have to tackle and provides practical solutions and development strategies. It then presents the various maintenance techniques required to keep their code running well into the future. With Secrets of the JavaScript Ninja readers will gain the knowledge and Ninja-like skills to build their own JavaScript libraries, or to understand how to use any modern JavaScript library available. What's inside: Introduction Testing and debugging Functions Closures Function prototypes Timers Regular expressions With statements Code evaluation Strategies for cross-browser code CSS Selector Engine DOM modification Attributes and CSS Events Ajax Animation Performance	http://books.google.com.br/books/content?id=ab8CPgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781933988696	370	2013	Manning Publications	\N	Secrets of the JavaScript Ninja
155	Daniel Kahneman	A psychologist draws on years of research to introduce his "machinery of the mind" model on human decision making to reveal the faults and capabilities of intuitive versus logical thinking.	http://books.google.com.br/books/content?id=SHvzzuCnuv8C&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780374275631	499	2011-10-25	Macmillan	\N	Thinking, Fast and Slow
156	Kent Beck,Martin Fowler	A guide to XP leads the developer, project manager, and team leader through the software development planning process, offering real world examples and tips for reacting to changing environments quickly and efficiently.	http://books.google.com.br/books/content?id=u13hVoYVZa8C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780201710915	139	2001	Addison-Wesley Professional	\N	Planning Extreme Programming
157	Sandi Metz	Take Ruby development to the next level: leverage Ruby's full power to write more maintainable, manageable, and pleasing applications * *Master object-oriented Ruby techniques for building applications that are as easy to maintain and upgrade as they were to write! *Discover concrete solutions for common issues associated with poorly designed, hard-to-change Ruby applications. *Solves painful problems now facing many of the world's 1+ million Ruby developers, including programmers at all levels of experience. Years after the initial release of Ruby on Rails, the chickens are coming home to roost. Suddenly, anyone could write a web application -- and it seems like everyone did. The web is now awash in Ruby applications that were easy to write but are now virtually impossible to change, extend, or grow. This book solves that problem by teaching developers real-world object oriented design techniques specifically focused on Ruby. Writing for more than 1,000,000 Ruby developers at all levels of experience, Sandi Metz shares knowledge and concrete solutions for creating more extensible, more maintainable applications - and for fixing many of the poorly designed applications they must now manage. The first book to focus squarely on object-oriented Ruby application design, Practical Object Oriented Design in Ruby will guide developers to superior outcomes, even if their previous experience has been strictly limited to 'procedural' techniques. Metz distills a lifetime of conversations about object-oriented design and many years of whiteboard drawings into a set of specific Ruby practices and patterns that lead to more manageable and pleasing code. Novice Ruby programmers will find specific 'rules to live by'; intermediate Ruby programmers will find valuable principles they can flexibly interpret and apply; and advanced Ruby programmers will find a common language they can use to lead development and guide their colleagues.	http://books.google.com.br/books/content?id=rk9sAQAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780321721334	247	2012	Pearson Education	An Agile Primer	Practical Object-oriented Design in Ruby
158	James Shore,Shane Warden	For those considering Extreme Programming, this book provides no-nonsense advice on agile planning, development, delivery, and management taken from the authors' many years of experience. While plenty of books address the what and why of agile development, very few offer the information users can apply directly.	http://books.google.com.br/books/content?id=2q6bAgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780596527679	409	2008-01-21	"O'Reilly Media, Inc."	\N	The Art of Agile Development
159	David Flanagan,Yukihiro Matsumoto	A guide to Ruby programming covers such topics as datatypes and objects, expressions, classes and modules, control structures, and the Ruby platform.	http://books.google.com.br/books/content?id=rbY5mz-_VdQC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780596516178	429	2008-01-25	"O'Reilly Media, Inc."	\N	The Ruby Programming Language
160	Mike Cohn	"Offers a requirements process that saves time, eliminates rework, and leads directly to better software. A great way to build software that meets users' needs is to begin with 'user stories': simple, clear, brief descriptions of functionality that will be valuable to real users. ... [the author] provides you with a front-to-back blueprint for writing these user stories and weaving them into your development lifecycle. You'll learn what makes a great user story, and what makes a bad one. You'll discover practical ways to gather user stories, even when you can't speak with your users. Then, once you've compiled your user stories, [the author] shows how to organize them, prioritize them, and use them for planning, management, and testing"--Back cover.	http://books.google.com.br/books/content?id=SvIwuX4SVigC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780321205681	268	2004	Addison-Wesley Professional	For Agile Software Development	User Stories Applied
161	Gabriella Coleman	Examines the rise of the global collective of hackers, pranksters and tech activists that make up the group known as “Anonymous” who played large roles in the Arab Spring and Occupy Wall Street movements.	http://books.google.com.br/books/content?id=MIjWngEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781781685839	452	2014	Verso Books	The Many Faces of Anonymous	Hacker, Hoaxer, Whistleblower, Spy
206	Daniel Blair	\N	\N	\N	\N	\N	\N	Unleash the power of Banana Pi and use it for home automation, games, and various practical applications	Learning Banana Pi
164	MARC NAGER,CLINT NELSEN,FRANCK NOUYRIGAT,GUILHERME SARKIS	Startup Weekend - a organização por trás dos eventos de 54 horas onde desenvolvedores, designers, marqueteiros e entusiastas se reúnem para trocar ideias, formar equipes, construir projetos e criar startups - gerou uma iniciativa global em empreendedorismo. Em um fim de semana, os participantes mergulham de cabeça na cultura empresarial e, em alguns casos, saem com um empreendimento de sucesso nas mãos. Através de uma ênfase em networking baseado em ações, participantes dos eventos Startup Weekend testemunham pessoas botando a mão na massa e experimentam uma forma de baixo risco para construir relacionamentos de negócios. Eles recebem uma educação experiencial com o benefício de contexto, prazos e feedback instantâneo. Este livro contém as melhores práticas, lições aprendidas e exemplos capacitantes extraídos destes eventos para indivíduos e pequenas organizações seguirem à medida que começam negócios. Há conselhos passo a passo para implementação, como - Aprender a ter faro para o talento em 60 segundos; Obter uma cartilha sobre estruturas organizacionais flexíveis; Aprender a produzir um produto, no mínimo, viável, capaz de mover o negócio para o mercado mais rapidamente; Compreender as consequências para o desenvolvimento de uma startup como empreendedores e fundadores e começar a fazer muito mais, ainda mais rápido; Adotar o modelo de negócios startup - aprender, adaptar e permanecer enxuto. Cada uma dessas crenças-chave em destaque foi testada pelo Startup Weekend e produziu resultados eficazes.	http://img.fnac.com.br/Imagens/Produtos/339-629849-0-5-startup-weekend-como-levar-uma-empresa-do-conceito-a-criacao-em-54-horas.jpg	9788576087700	200	\N	\N	DO CONCEITO A CRIAÇAO EM 54 HORAS	STARTUP WEEKEND - COMO LEVAR UMA EMPRESA
165	José Finocchio Junior	Com o objetivo de desafiar visões pré-estabelecidas e colocar em xeque metodologias convencionais sobre o gerenciamento de projetos, José Finocchio Junior apresenta neste livro um modelo totalmente inovador e adaptado à realidade das empresas e até mesmo ao próprio modo de funcionamento da mente humana.O Project Model Canvas não é mais um “novo” jeito de gerenciar projetos com planilhas do Excel ou documentos do Word. Dê adeus a tudo isso! Como o próprio autor afirma, seu modelo é uma adaptação do aclamado método canvas, criado pelos autores Osterwalder e Pigneur para o efetivo controle de seus projetos em apenas uma única folha e um bloquinho de post-it.Contudo, o autor vai além das teorizações ao incluir em seu método conceitos práticos da neurociência para ajudar o leitor a redefinir seu modelo mental, a pensar e a executar um projeto da maneira simples e sem burocracias, como ele realmente deve ser.	http://images.livrariasaraiva.com.br/imagemnet/imagem.aspx/?pro_id=4967937&qld=90&l=370&a=-1	\N	\N	2013	Elsevier - Campus	\N	Project Model Canvas - Gerenciamento de Projetos Sem Burocracia
166	Douglas Crockford	\N	http://shop.oreilly.com/product/9780596517748.do	\N	153	May 2008	O'Reilly Media	Unearthing the Excellence in JavaScript	JavaScript: The Good Parts
167	Michael Strauss	"Value Creation in Travel Distribution" provides a comprehensive introduction to the world's most rapidly growing industry. It covers the history of the industry and provides an introduction to the management and operation of its three principal segments: transportation, distribution and technology.In the text, emphasis is placed on introducing concepts about travel as an industry and exposing readers to various industry practices. This book presents an insightful discussion of the travel industry's significant strengths, weaknesses, threats and opportunities. Topics include but are not limited to mobile booking, ancillary revenue, virtual meetings, social-media and location dependent services. It exposes the reader to how current trends in telecommunication, technology, digital media and ecology can influence the travel industry as a whole. The author shows some details of possible future developments, namely evolution and revolution, and draws a final conclusion.	http://books.google.com.br/books/content?id=RAu-cQAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780557612468	116	2010-09	Lulu.com	\N	Value Creation in Travel Distribution
168	Steven Haines	First book to address and assess performance of enterprise Java-based applications using the new Java EE 5\n\nPresents Java EE 5 Performance Management as a proven methodology, featuring a set of common problems that have been observed in real-world customer environments\n\nPresents "wait-based" performance tuning methodology, the most efficient Java EE 5 tuning methodology, but one previously neglected in the Java EE 5 space	http://ecx.images-amazon.com/images/I/51sxDTM017L._SX376_BO1,204,203,200_.jpg	\N	424	May 8, 2006	Apress	\N	ProJava EE 5 Performance Management and Optimization
169	Deitel & Deitel	\N	http://ecx.images-amazon.com/images/I/51Yf1z-QlNL._SX373_BO1,204,203,200_.jpg	\N	1130	1998	Prentice Hall	\N	C++ How to Program, Second Edition
170	Brian Goetz,Tim Peierls	Provides information on building concurrent applications using Java.	http://books.google.com.br/books/content?id=6LpQAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780321349606	403	2006	Addison-Wesley Professional	\N	Java concurrency in practice
171	Bill Watterson	"Watterson re-created the thoughts and feelings of a six-year-old with uncanny accuracy ... Calvin and Hobbes was, simply, the best comic strip." --Charles Solomon, Los Angeles Times Many moons ago, the magic of Calvin and Hobbes first appeared on the funny pages and the world was introduced to a wondrous pair of friends -- a boy and his tiger, who brought new life to the comics page. To celebrate the tenth anniversary of this distinguished partnership, Bill Watterson prepared this special book, sharing his thoughts on cartooning and creating Calvin and Hobbes, illustrated throughout with favorite black-and-white and color cartoons.	http://books.google.com.br/books/content?id=fwWOngEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780836204384	208	1995-09-01	Andrews McMeel Publishing	\N	The Calvin and Hobbes Tenth Anniversary Book
172	Don Tapscott,Anthony D. Williams	Explores the phenomenon of mass collaboration demonstrated by MySpace, Second Life, and the Human Genome Project, sharing success stories and describing how businesses can use such open source strategies effectively.	http://books.google.com.br/books/content?id=-WUhErZgmpoC&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781591841388	324	2006	Penguin	How Mass Collaboration Changes Everything	Wikinomics
173	Oscar Pilagallo	Este livro tem por intuito apresentar a história do jornalismo em São Paulo. Pretende abarcar dos primórdios da imprensa no Estado, em 1823, às transformações do início do século XXI, com a expansão da internet. Busca ainda descrever e contextualizar a criação e a trajetória de jornais, revistas e outras plataformas. Tem por objetivo analisar as relações entre jornalismo e poder político no Brasil, a partir da experiência paulista, como a Proclamação da República, o suicídio de Vargas, o golpe de 1964, a redemocratização, a queda de Collor e os governos FHC e Lula.	images\\no-image.png	9788565339018	367	2011-01-01	Traes Estrelas	jornalismo e poder de D. Pedro a Dilma	História da imprensa paulista
207	Jeremy Blum	\N	\N	\N	\N	\N	\N	Tools and Techniques for Engineering Wizardry	Exploring Arduino
174	Gilberto Freyre	Freyre apresenta a importância da casa-grande na formação sociocultural brasileira, assim como a da senzala na complementação da primeira. Além disso, Casa-Grande & Senzala enfatiza a formação da sociedade brasileira no contexto da miscigenação entre os brancos, principalmente portugueses, dos negros das várias nações africanas e dos diferentes indígenas que habitavam o Brasil.\n\nNa opinião de Freyre, a própria arquitetura da casa-grande expressaria o modo de organização social e política do Brasil, o patriarcalismo. Tal estrutura seria capaz de incorporar os vários elementos que comporiam a propriedade fundiária do Brasil Colônia. Do mesmo modo, o patriarca proprietário da terra considerado dono de tudo que nela se encontrasse: escravos, parentes, filhos, esposa, amantes, padres, políticos. Este domínio se estabeleceu incorporando tais elementos e não de excluindo-os. O padrão se expressa na casa-grande que é capaz de abrigar desde escravos até os filhos do patriarca e suas respectivas famílias.\n\nFreyre também desmistifica a noção de determinação racial na formação de um povo, no que dá maior importância àqueles culturais e ambientais. Com isso refuta a ideia de que no Brasil se teria uma raça inferior devido à miscigenação. Antes, aponta para os elementos positivos da formação cultural brasileira oriundos desta miscigenação entre culturas tão distintas.	http://www.institutomillenium.org.br/wp-content/uploads/2009/11/livrograndesenzala.jpg	\N	727	2006	Global Editora	\N	Casa-Grande & Senzala
175	SERGIO GUIMARAES,PAULO FREIRE	No diálogo com Sérgio Guimarães, Paulo Freire recorda a sua vida como educador - os momentos que marcaram a aplicação de seu Método no Recife, no pré-64, a prisão e o exílio. A obra procura revelar o degredo como possibilidade de auto-reflexão, do repensar atitudes e propostas; experiência que ampliou sua concepção do processo pedagógico.	images\\no-image.png	9788577531875	160	\N	\N	NINGUEM FAZ O MUNDO SO	DIALOGANDO COM A PROPRIA HISTORIA
176	Paulo Freire	Escrita quando o autor se encontrava no exílio, a obra reflete a maturação e a autocrítica, sendo o primeiro texto a refletir sobre suas experiências pedagógicas. Paulo Freire não deixa dúvidas quanto à concepção de educação: defende ardorosamente a pedagogia conscientizadora como força de mudança e libertação.	http://www.bestwriting.com.br/imagens/produtos//zoom/ECPDL1653_zoom.JPG	\N	189	Abril/2011	Paz e Terra	\N	Educação como prática da liberdade
177	PAULO FREIRE	Em 'Pedagogia da Esperança', escrito em 1992, Paulo Freire faz uma reflexão sobre 'Pedagogia do Oprimido', publicado em 1968, durante o seu exílio no Chile. Nesse reencontro, analisa suas experiências pedagógicas em quase três décadas nos mais diferentes países. Um relato elaborado com cientificidade, humildade e coerência, que recusa o determinismo e mostra a história humana como um feixe de possibilidades. O livro conta ainda com a colaboração de Ana Maria Araújo Freire, através das notas explicativas, e prefácio de Leonardo Boff.	http://www.piratininga.org.br/images//Lpedagogia_esperanca.jpg	9788577531776	336	\N	\N	\N	PEDAGOGIA DA ESPERANÇA
178	Paulo Freire	Pedagogia do Oprimido é um dos mais conhecidos trabalhos do educador e filósofo brasileiro Paulo Freire. O livro propõe uma pedagogia com uma nova forma de relacionamento entre professor, estudante, e sociedade.\n\nDedicado aos que são referidos como "os oprimidos" e baseado em sua própria experiência ajudando adultos a aprender a ler e escrever, Freire inclui uma detalhada análise de classes marxista em sua exploração da relação entre os que ele chama de "colonizador" e "colonizado." O livro continua popular entre educadores no mundo inteiro e é um dos fundamentos da pedagogia crítica.	http://images.livrariasaraiva.com.br/imagemnet/imagem.aspx/?pro_id=3461626&qld=90&l=370&a=-1	\N	253	Junho/2012	Paz e Terra	\N	Pedagogia do Oprimido
179	Steven D. Levitt,Stephen J. Dubner	Which is more dangerous, a gun or a swimming pool? What do schoolteachers and sumo wrestlers have in common? Why do drug dealers still live with their moms? How much do parents really matter? What kind of impact did Roe v. Wade have on violent crime? These may not sound like typical questions for an economist to ask--but Levitt is not a typical economist. He studies the stuff and riddles of everyday life--from cheating and crime to sports and child rearing--and his conclusions regularly turn the conventional wisdom on its head. The authors show that economics is, at root, the study of incentives--how people get what they want, or need, especially when other people want or need the same thing. In this book, they set out to explore the hidden side of everything. If morality represents how we would like the world to work, then economics represents how it actually does work. -- From publisher description.	http://addicted2success.com/wp-content/uploads/2015/08/Freakonomics.jpg	9780061242700	320	2006	Harper Collins	A Rogue Economist Explores the Hidden Side of Everything	Freakonomics
180	Euclides da Cunha	\N	http://statics.livrariacultura.net.br/products/capas_lg/310/392310.jpg	9788501055910	596	2000	Record	\N	Os sertões
181	ROBERTO POMPEU DE TOLEDO	O leitor é convidado, capítulo a capítulo, a conhecer momentos cruciais da trajetória de São Paulo. O destino da cidade, ao longo dos três primeiros séculos de existência, foi de isolamento e de solidão. Em 1872, quando os primeiros sinais de prosperidade começavam a visitá-la, por obra da riqueza trazida pelo café, ainda assim a população de pouco mais de 30 mil habitantes a situava numa rabeira com relação às demais capitais brasileiras. Em 1890, já tinha dobrado de tamanho. O momento em que finalmente engrena e começa a virar a São Paulo que se conhece é súbito como uma explosão - na passagem do século XIX para o XX, quando se transformou num aglomerado de gente vinda de diferentes partes do mundo.	http://images.livrariasaraiva.com.br/imagemnet/imagem.aspx/?pro_id=4051434&qld=90&l=370&a=-1	9788539001033	600	\N	Objetiva	\N	A CAPITAL DA SOLIDAO
182	Darcy Ribeiro	Por que o Brasil ainda não deu certo? Quando chegou ao exílio no Uruguai, em abril de 1964, Darcy Ribeiro queria responder a essa pergunta na forma de um livro-painel sobre a formação do povo brasileiro e sobre as configurações que ele foi tomando ao longo dos séculos. A resposta veio com este que é o seu livro mais ambicioso, fruto de trinta anos de estudo - uma tentativa de tornar compreensível, por meio de uma explanação histórico-antropológica, como os brasileiros se vieram fazendo a si mesmos para serem o que hoje somos. Uma nova Roma, lavada em sangue negro e sangue índio, destinada a criar uma esplêndida civilização, mestiça e tropical.	http://imagens.socialistamorena.com.br/wp-content/uploads/2015/07/opovobrasileiro.jpg	9788535907810	435	2008-05-01	\N	a formação e o sentido do Brasil	O povo brasileiro
183	Laszlo Book	Trata-se de um livro que fala das formas que o Google desenvolveu para gestão de pessoas, principalmente.	http://images.livrariasaraiva.com.br/imagemnet/imagem.aspx/?pro_id=9081775&qld=90&l=370&a=-1	\N	342	2015	Sextante	O que o Google faz de diferente para ser uma das empresas mais criativas e bem-sucedidas do mundo	Um novo jeito de trabalhar (Work Rules)
184	Danilo Sato	Entregar software em produção é um processo que tem se tornado cada vez mais difícil no departamento de TI de diversas empresas. Ciclos longos de teste e divisões entre as equipes de desenvolvimento e de operações são alguns\ndos fatores que contribuem para este problema. Mesmo equipes ágeis que produzem software entregável ao final de cada iteração sofrem para chegar em produção quando encontram estas barreiras.\nDevOps é um movimento cultural e profissional que está tentando quebrar essas barreiras. Com o foco em automação, colaboração, compartilhamento de ferramentas e de conhecimento, DevOps está mostrando que desenvolvedores e engenheiros de sistema têm muito o que aprender uns com os outros.\nNeste livro, Danilo Sato mostra como implementar práticas de DevOps e Entrega Contínua para aumentar a frequência de deploys na sua empresa, ao mesmo tempo aumentando a estabilidade e robustez do sistema em produção. Você vai aprender como automatizar o build e deploy de uma aplicação web, como automatizar o gerenciamento da infraestrutura, como monitorar o sistema em produção, como evoluir a arquitetura e migrá-la para a nuvem, além de conhecer diversas ferramentas que você pode aplicar no seu trabalho.	http://cdn.shopify.com/s/files/1/0155/7645/products/devops-featured_large.png?v=1411489207	\N	246	10/2013	Casa do Código	Na prática: entrega de software confiável e automatizada	DevOps
185	Watts S. Humphrey	Leaders of software-development projects face many challenges. First, you must produce a quality product on schedule and on budget. Second, you must foster and encourage a cohesive, motivated, and smoothly operating team. And third, you must maintain a clear and consistent focus on short- and long-term goals, while exemplifying quality standards and showing confidence and enthusiasm for your team and its efforts. Most importantly, as a leader, you need to feel and act responsible for your team and everything that it does.\nAccomplishing all these goals in a way that is rewarding for the leader and the team—while producing the results that management wants—is the motivation behind the Team Software Process (TSP). Developed by renowned quality expert Watts S. Humphrey, TSP is a set of new practices and team concepts that helps developers take the CMM and CMMI Capability Maturity Models to the next level. Not only does TSP help make software more secure, it results in an average production gain of 68 percent per project. Because of their quality, timeliness, and security, TSP-produced products can be ten to hundreds of times better than other hardware or software. \nIn this essential guide to TSP, Humphrey uses his vast industry experience to show leaders precisely how to lead teams of software engineers trained in the Personal Software Process (PSP). He explores all aspects of effective leadership and teamwork, including building the right team for the job, the TSP launch process, following the process to produce a quality product, project reviews, and capitalizing on both the leader's and team's capabilities. Humphrey also illuminates the differences between an ineffective leader and a superb one with the objective of helping you understand, anticipate, and correct the most common leadership failings before they undermine the team.\nAn extensive set of appendices provides additional detail on TSP team roles and shows you how to use an organization's communication and command networks to achieve team objectives.\nWhether you are a new or an experienced team leader, TSP: Leading a Development Team provides invaluable examples, guidelines, and suggestions on how to handle the many issues you and your team face together.	http://ecx.images-amazon.com/images/I/41s7i9R5zVL._SX305_BO1,204,203,200_.jpg	\N	307	September/2005	Adison Wesley	Leading a Development Team	TSP
186	Steve McConnell	Widely considered one of the best practical guides to programming, Steve McConnell’s original CODE COMPLETE has been helping developers write better software for more than a decade. Now this classic book has been fully updated and revised with leading-edge practices—and hundreds of new code samples—illustrating the art and science of software construction. Capturing the body of knowledge available from research, academia, and everyday commercial practice, McConnell synthesizes the most effective techniques and must-know principles into clear, pragmatic guidance. No matter what your experience level, development environment, or project size, this book will inform and stimulate your thinking—and help you build the highest quality code.	http://blogs.msdn.com/cfs-filesystemfile.ashx/__key/communityserver-blogs-components-weblogfiles/00-00-01-17-44-metablogapi/2352.9780735619678f_5F00_6D939405.jpg	\N	960	June 19, 2004	Microsoft Press	A practical handbook of software construction	Code Complete
187	Thomas H. Cormen ... [et al]	Some books on algorithms are rigorous but incomplete; others cover masses of material but lack rigor. Introduction to Algorithms uniquely combines rigor and comprehensiveness. The book covers a broad range of algorithms in depth, yet makes their design and analysis accessible to all levels of readers. Each chapter is relatively self-contained and can be used as a unit of study. The algorithms are described in English and in a pseudocode designed to be readable by anyone who has done a little programming. The explanations have been kept elementary without sacrificing depth of coverage or mathematical rigor.\n\nThe first edition became a widely used text in universities worldwide as well as the standard reference for professionals. The second edition featured new chapters on the role of algorithms, probabilistic analysis and randomized algorithms, and linear programming. The third edition has been revised and updated throughout. It includes two completely new chapters, on van Emde Boas trees and multithreaded algorithms, substantial additions to the chapter on recurrence (now called “Divide-and-Conquer”), and an appendix on matrices. It features improved treatment of dynamic programming and greedy algorithms and a new notion of edge-based flow in the material on flow networks. Many new exercises and problems have been added for this edition. As of the third edition, this textbook is published exclusively by the MIT Press.	http://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-046j-introduction-to-algorithms-sma-5503-fall-2005/6-046jf05.jpg	\N	1180	2005	MIT Press	Second Edition	Introduction to Algorithms
188	Laura Klein	Creating a great user experience doesn’t have to be a lengthy or expensive process. This hands-on book shows you how to use Lean UX techniques to do it faster and smarter. You’ll learn how to tighten the iteration loop, get more customer feedback, reduce the time it takes to get great products to market, and build something your customers will truly love. User Experience expert Laura Klein gets you right to work with specific tips on how to make design and research quick, flexible, and measurable enough to work in a Lean environment. Rather than bog you down with a high-level discussion of Lean UX, UX for Lean Startups offers a series of standalone chapters that let you concentrate on those areas most important to your startup. The advice Laura Klein provides in this book comes from more than 15 years of working with startups and building great user experiences.	http://books.google.com.ec/books/content?id=8vHHMQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781449334918	350	2013-04-15	O'Reilly Media, Incorporated	Faster, Smarter User Experience Research and Design	UX for Lean Startups
189	Jon Duckett	Provides information on how to make more interactive, engaging, and usable Web pages with JavaScript and jQuery, covering core programming concepts in both and such techniques as animation, form validation, and interactive galleries.	http://books.google.com.ec/books/content?id=LpctBAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9781118531648	640	2014-06-30	John Wiley & Sons	Interactive Front-End Web Development	JavaScript and JQuery
190	Martin L. Abbot	\N	\N	\N	584	\N	\N	\N	The Art of Scalability
191	David Scott Bernstein	\N	\N	\N	\N	\N	\N	Nine Practices to Extend the Life (and Value) of your software	Beyond Legacy Code
192	Kerry Patterson,Joseph Grenny,Ron McMillan,Al Switzler	The New York Times and Washington Post bestseller that changed the way millions communicate “[Crucial Conversations] draws our attention to those defining moments that literally shape our lives, our relationships, and our world. . . . This book deserves to take its place as one of the key thought leadership contributions of our time.” —from the Foreword by Stephen R. Covey, author of The 7 Habits of Highly Effective People “The quality of your life comes out of the quality of your dialogues and conversations. Here’s how to instantly uplift your crucial conversations.” —Mark Victor Hansen, cocreator of the #1 New York Times bestselling series Chicken Soup for the Soul® The first edition of Crucial Conversations exploded onto the scene and revolutionized the way millions of people communicate when stakes are high. This new edition gives you the tools to: Prepare for high-stakes situations Transform anger and hurt feelings into powerful dialogue Make it safe to talk about almost anything Be persuasive, not abrasive	http://books.google.com.ec/books/content?id=SDXVHRSFVMoC&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780071771320	288	2011-08-19	McGraw Hill Professional	\N	Crucial Conversations Tools for Talking When Stakes Are High, Second Edition
193	Jonas Löwgren	\N	\N	\N	\N	\N	\N	A Design Perspective on Information Technology	Thoughtful Interaction Design
194	Cem Kaner,James Bach,Bret Pettichord	Decades of software testing experience condensed into the most important lessons learned. The world's leading software testing experts lend you their wisdom and years of experience to help you avoid the most common mistakes in testing software. Each lesson is an assertion related to software testing, followed by an explanation or example that shows you the how, when, and why of the testing lesson. More than just tips, tricks, and pitfalls to avoid, Lessons Learned in Software Testing speeds you through the critical testing phase of the software development project without the extensive trial and error it normally takes to do so. The ultimate resource for software testers and developers at every level of expertise, this guidebook features: * Over 200 lessons gleaned from over 30 years of combined testing experience * Tips, tricks, and common pitfalls to avoid by simply reading the book rather than finding out the hard way * Lessons for all key topic areas, including test design, test management, testing strategies, and bug reporting * Explanations and examples of each testing trouble spot help illustrate each lesson's assertion	http://books.google.com.ec/books/content?id=SsYl9RU-zGgC&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780471081128	320	2001-12-31	Wiley	A Context-Driven Approach	Lessons Learned in Software Testing
195	Jon Duckett	Presents information on using HTML and CSS to create Web pages, covering such topics as lists, links, images, tables, forms, color, layout, and video and audio.	http://books.google.com.ec/books/content?id=aGjaBTbT0o0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9781118008188	512	2011-11-08	John Wiley & Sons	Design and Build Websites	HTML and CSS
196	Jakob Nielsen	Executive Summary. What is usability. Generations of user interfaces. The usability engineering lifecycle. Usability heuristics. Usability testing. Usability assessment methods beyond testing. Interface standards. International user interfaces. Future developments. Exercises. Bibliography. Author index. Subject index.	http://books.google.com.ec/books/content?id=95As2OF67f0C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780125184069	362	1994	Morgan Kaufmann	\N	Usability Engineering
197	Ron Jeffries	You need to get value from your software project. You need it "free, now, and perfect." We can't get you there, but we can help you get to "cheaper, sooner, and better." This book leads you from the desire for value down to the specific activities that help good Agile projects deliver better software sooner, and at a lower cost. Using simple sketches and a few words, the author invites you to follow his path of learning and understanding from a half century of software development and from his engagement with Agile methods from their very beginning. The book describes software development, starting from our natural desire to get something of value. Each topic is described with a picture and a few paragraphs. You're invited to think about each topic; to take it in. You'll think about how each step into the process leads to the next. You'll begin to see why Agile methods ask for what they do, and you'll learn why a shallow implementation of Agile can lead to only limited improvement. This is not a detailed map, nor a step-by-step set of instructions for building the perfect project. There is no map or instructions that will do that for you. You need to build your own project, making it a bit more perfect every day. To do that effectively, you need to build up an understanding of the whole process. This book points out the milestones on your journey of understanding the nature of software development done well. It takes you to a location, describes it briefly, and leaves you to explore and fill in your own understanding. What You Need: You'll need your Standard Issue Brain, a bit of curiosity, and a desire to build your own understanding rather than have someone else's detailed ideas poured into your head.	http://books.google.com.ec/books/content?id=qvvsoQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781941222379	150	2015-02-25	\N	Keep It Simple, Make It Valuable, Build It Piece by Piece	The Nature of Software Development
198	Dale Carnegie	Provides suggestions for successfully dealing with people both in social and business situations	http://books.google.com.ec/books/content?id=D7TznQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780671027032	260	1998-10-01	Gallery	\N	How to Win Friends and Influence People
199	Michael J. Kavis	\N	\N	\N	\N	\N	\N	Design Decisions for Cloud Computing	Architecting the Cloud
200	Dawn Griffiths	"Head First Statistics" brings a typically difficult subject to life, teaching readers everything they want and need to know about statistics through engaging, interactive, and thought-provoking material, full of puzzles, stories, quizzes, visual aids, and real-world examples.	http://books.google.com.ec/books/content?id=XzVb4Yz6DBcC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780596527587	677	2008-08-26	O'Reilly Germany	\N	Head First Statistics
201	Jeffrey Liker,Gary L. Convis	From the bestselling author of "The Toyota Way," the missing link to sustainable lean successa four-step leadership model that aligns company culture with lean processes	http://books.google.com.ec/books/content?id=iO9ZF-JyEBEC&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780071780780	280	2011-11-07	McGraw Hill Professional	\N	The Toyota Way to Lean Leadership: Achieving and Sustaining Excellence Through Leadership Development
202	Michael Milton	A guide for data managers and analyzers shares guidelines for identifying patterns, predicting future outcomes, and presenting findings to others; drawing on current research in cognitive science and learning theory while covering such additional topics as assessing data quality, handling ambiguous information, and organizing data within market groups. Original.	http://books.google.com.ec/books/content?id=KqSKipJfxMwC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780596153939	445	2009-07-24	"O'Reilly Media, Inc."	A Learner's Guide to Big Numbers, Statistics, and Good Decisions	Head First Data Analysis
208	A. Rényi	The founder of Hungary's Probability Theory School, A. Rényi made significant contributions to virtually every area of mathematics. This introductory text is the product of his extensive teaching experience and is geared toward readers who wish to learn the basics of probability theory, as well as those who wish to attain a thorough knowledge in the field.\nBased on the author's lectures at the University of Budapest, this text requires no preliminary knowledge of probability theory. Readers should, however, be familiar with other branches of mathematics, including a thorough understanding of the elements of the differential and integral calculus and the theory of real and complex functions. These well-chosen problems and exercises illustrate the algebras of events, discrete random variables, characteristic functions, and limit theorems. The text concludes with an extensive appendix that introduces information theory.	http://ecx.images-amazon.com/images/I/51hmCvQKstL._SX322_BO1,204,203,200_.jpg	\N	666	2007	Dover	\N	Probability Theory
209	Douglas C. Montgomery	Now in its 6th edition, this bestselling professional reference has helped over 100,000 engineers and scientists with the success of their experiments. Douglas Montgomery arms readers with the most effective approach for learning how to design, conduct, and analyze experiments that optimize performance in products and processes. He shows how to use statistically designed experiments to obtain information for characterization and optimization of systems, improve manufacturing processes, and design and develop new processes and products. You will also learn how to evaluate material alternatives in product design, improve the field performance, reliability, and manufacturing aspects of products, and conduct experiments effectively and efficiently. Discover how to improve the quality and efficiency of working systems with this highly-acclaimed book. This 6th Edition: Places a strong focus on the use of the computer, providing output from two software products: Minitab and DesignExpert. Presents timely, new examples as well as expanded coverage on adding runs to a fractional factorial to de-alias effects. Includes detailed discussions on how computers are currently used in the analysis and design of experiments. Offers new material on a number of important topics, including follow-up experimentation and split-plot design. Focuses even more sharply on factorial and fractional factorial design.	http://books.google.com.br/books/content?id=-WyoQgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780471487357	660	2004-12-27	Wiley	\N	Design and Analysis of Experiments
210	Carlos Daniel Mimoso Paulino,Maria Antónia Amaral Turkman,Bento Murteira	\N	http://thumbs.buscape.com.br/livros/estatistica-bayesiana-carlos-daniel-paulino-m-antonia-amaral-turkman-bento-murteira-9723110431_200x200-PU758f1403_1.jpg	9789723110432	446	2003	\N	\N	Estatística bayesiana
211	Alan Cooper,Robert Reimann,Dave Cronin	While the ideas and principles in the original book remain as relevant as ever, the examples in "About Face 3" are updated to reflect the evolution of the Web. Interaction Design professionals are constantly seeking to ensure that software and software-enabled products are developed with the end-user's goals in mind, that is, to make them more powerful and enjoyable for people who use them. "About Face 3" ensures that these objectives are met with the utmost ease and efficiency. Alan Cooper (Palo Alto, CA) has spent a decade making high-tech products easier to use and less expensive to build - a practice known as "Interaction Design." Cooper is now the leader in this growing field.	http://books.google.com.br/books/content?id=0gdRAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780470084113	610	2007	Wiley	the essentials of interaction design	About face 3
212	Rúbian Coutinho Corrêa	Esta Cartilha, elaborada pela Comissão Permanente de Promotores da\nViolência Doméstica e Familiar contra a Mulher, é um marco no combate aos\ncrimes previstos na Lei nO 11.340/2006 (Lei Maria da Penha), a iniciativa legislativa\nque se tomou um paradigma mundial na repressão a esse tipo de violência.\nFruto das contribuições dos Ministérios Públicos Estaduais, com a\ncompetente organização da promotora de Justiça Rúbian Corrêa Coutinho, e sob a\ncoordenação da também competente e dedicada promotora de Justiça Lindinalva\nRodrigues Dalla Costa, coordenadora da COPEVID, do CNPG, esta publicação\ntorna-se, desde logo, leitura obrigatória para os membros do Ministério Público,\ndelegados de polícia, operadores do Direito e para as próprias vitimas de violência\ndoméstica.\nMais do que possibilitar o entendimento do problema, esta Cartilha traz\nricas informações para quem busca o auxilio do Estado diante das agressões\nsofridas, além de ser uma importante ferramenta para aqueles que atuam na\npersecução penal contra os autores desse tipo de violência.\nTemos, em suma, uma publicação abrangente, ainda que materialmente\ncompacta, de vários aspectos imprescindiveis para o enfrentamento de um tipo de\ncrime que só recentemente vem merecendo maior atenção em nosso Pais.	\N	\N	86	2011		Uma Construção Coletiva	O Enfrentamento à Violência Doméstica e Familiar Contra a Mulher
213	Luciano Ramalho	A simplicidade de Python permite que você se torne produtivo rapidamente, porém isso muitas vezes significa que você não estará usando tudo que ela tem a oferecer. Com este guia prático, você aprenderá a escrever um código Python eficiente e idiomático aproveitando seus melhores recursos – alguns deles, pouco conhecidos. O autor Luciano Ramalho apresenta os recursos essenciais da linguagem e bibliotecas de Python mostrando como você pode tornar o seu código mais conciso, mais rápido e mais legível ao mesmo tempo. Muitos programadores experientes tentam dobrar o Python para que ele se enquadre em padrões aprendidos com outras linguagens e jamais descobrem os recursos do Python que estão além de sua experiência. Com este livro, esses programadores Python aprenderão a ser totalmente proficientes em Python 3. Este livro inclui: • O modelo de dados do Python: entenda como os métodos especiais são o segredo para o comportamento consistente dos objetos. • Estruturas de dados: tire total proveito dos tipos embutidos e entenda a dualidade entre texto e bytes na era do Unicode. • Funções como objetos: veja as funções Python como objetos de primeira classe e entenda como isso afeta alguns padrões de projeto populares. • Técnicas de orientação a objetos: crie classes após dominar referências, mutabilidade, interfaces, sobrecarga de operadores e herança múltipla. • Controle de fluxo: tire proveito de gerenciadores de contexto, geradores, corrotinas e concorrência com os pacotes concurrent.futures e asyncio. • Metaprogramação: entenda como funcionam propriedades, descritores de atributos, decoradores de classe e metaclasses.	http://books.google.com.br/books/content?id=XqbfCgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9788575224625	800	2015-11-05	Novatec Editora	Programação clara, concisa e eficaz	Python fluente
233	Terrence Ryan	New technologies are popping up every day. Convincing co-workers to adopt them is the hard part. Adobe software evangelist Ryan breaks down the patterns and types of resistance technologists face in many organizations.	http://books.google.com.br/books/content?id=wdX7RAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781934356609	136	2010	\N	Why People on Your Team Don't Act on Good Ideas, and how to Convince Them They Should	Driving Technical Change
214	Marcos Brizeno	Desenvolvimento de software é uma profissão muito jovem. Entre meados de 1940 (com o computador de Alan Turing) e a década de 2010, são meros 70 anos de história. Para a humanidade, isso não é nada. A maioria da população ainda viveu boa parte de sua vida sem a influência de um computador no seu dia a dia. Tudo é muito novo e muda muito rápido. Ainda não temos um conhecimento aprofundado e difundido do que dá certo e do que não dá.\n\nPadrões de projeto são uma tentativa de estabelecer uma coletânea destes conhecimentos.\n\nIdealmente, essas coletâneas se tornarão um recurso para programadores identificarem o problema com o qual estão lidando, e aplicarem uma solução que é conhecida e "garantida". Nesse cenário, ainda falta uma coisa para que possamos usar esse conhecimento de forma segura: como caminhar da situação atual até a solução do padrão, sem introduzir problemas.\n\nEste livro apresenta exemplos práticos em Ruby para seguir essa jornada de forma responsável. Marcos Brizeno apresenta claramente todos os passos para refatorar o código sem causar problemas para os testes automatizados (e, portanto, em seu programa), e chegar a uma implementação de um padrão de projeto conhecido.	http://s8.postimg.org/u4a7ffud1/Amazon_Refatoracao_Ruby_large.jpg	\N	\N	\N	Casa do Código	Um guia em Ruby	Refatorando com padrões de projeto
215	John Z. Sonmez	Summary Soft Skills: The software developer's life manual is a unique guide, offering techniques and practices for a more satisfying life as a professional software developer. In it, developer and life coach John Sonmez addresses a wide range of important "soft" topics, from career and productivity to personal finance and investing, and even fitness and relationships, all from a developer-centric viewpoint. Forewords by Robert C. Martin (Uncle Bob) and Scott Hanselman. Purchase of the print book includes a free eBook in PDF, Kindle, and ePub formats from Manning Publications. About the Book For most software developers, coding is the fun part. The hard bits are dealing with clients, peers, and managers, staying productive, achieving financial security, keeping yourself in shape, and finding true love. This book is here to help. Soft Skills: The software developer's life manual is a guide to a well-rounded, satisfying life as a technology professional. In it, developer and life coach John Sonmez offers advice to developers on important "soft" subjects like career and productivity, personal finance and investing, and even fitness and relationships. Arranged as a collection of 71 short chapters, this fun-to-read book invites you to dip in wherever you like. A Taking Action section at the end of each chapter shows you how to get quick results. Soft Skills will help make you a better programmer, a more valuable employee, and a happier, healthier person. What's Inside Boost your career by building a personal brand John's secret ten-step process for learning quickly Fitness advice to turn your geekiness to your advantage Unique strategies for investment and early retirement About the Author John Sonmez is a developer, teacher, and life coach who helps technical professionals boost their careers and live a more fulfilled life. Table of Contents Why this book is unlike any book you've ever read SECTION 1: CAREER Getting started with a "BANG!": Don't do what everyone else does Thinking about the future: What are your goals? People skills: You need them more than you think Hacking the interview Employment options: Enumerate your choices What kind of software developer are you? Not all companies are equal Climbing the corporate ladder Being a professional Freedom: How to quit your job Freelancing: Going out on your own Creating your first product Do you want to start a startup? Working remotely survival strategies Fake it till you make it Resumes are BORING—Let's fix that Don't get religious about technology SECTION 2: MARKETING YOURSELF Marketing basics for code monkeys Building a brand that gets you noticed Creating a wildly successful blog Your primary goal: Add value to others #UsingSocialNetworks Speaking, presenting, and training: Speak geek Writing books and articles that attract a following Don't be afraid to look like an idiot SECTION 3: LEARNING Learning how to learn: How to teach yourself My 10-step process Steps 1-6: Do these once Steps 7-10: Repeat these Looking for mentors: Finding your Yoda Taking on an apprentice: Being Yoda Teaching: Learn you want? Teach you must. Do you need a degree or can you "wing it?" Finding gaps in your knowledge SECTION 4: PRODUCTIVITY It all starts with focus My personal productivity plan Pomodoro Technique My quota system: How I get way more done than I should Holding yourself accountable Multitasking dos and don'ts Burnout: I've got the cure! How you're wasting your time The importance of having a routine Developing habits: Brushing your code Breaking things down: How to eat an elephant The value of hard work and why you keep avoiding it Any action is better than no action SECTION 5: FINANCIAL What are you going to do with your paycheck? How to negotiate your salary Options: Where all the fun is Bits and bytes of real estate investing Do you really understand your retirement plan? The danger of debt: SSDs are expensive Bonus: How I retired at 33 SECTION 6: FITNESS Why you need to hack your health Setting your fitness criteria Thermodynamics, calories, and you Motivation: Getting your butt out of the chair How to gain muscle: Nerds can have bulging biceps How to get hash-table abs Starting RunningProgram.exe Standing desks and other hacks Tech gear for fitness: Geeking out SECTION 7: SPIRIT How the mind influences the body Having the right mental attitude: Rebooting Building a positive self-image: Programming your brain Love and relationships: Computers can't hold your hand My personal success book list Facing failure head-on Parting words	http://books.google.com.ec/books/content?id=aEzVoQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781617292392	504	2014-12-29	Manning Publications	The Software Developer's Life Manual	Soft Skills
216	Mike Wilson	Build an application from backend to browser with Node.js, and kick open the doors to real-time event programming. With this hands-on book, you’ll learn how to create a social network application similar to LinkedIn and Facebook, but with a real-time twist. And you’ll build it with just one programming language: JavaScript. If you’re an experienced web developer unfamiliar with JavaScript, the book’s first section introduces you to the project’s core technologies: Node.js, Backbone.js, and the MongoDB data store. You’ll then launch into the project—a highly responsive, highly scalable application—guided by clear explanations and lots of code examples. Learn about key modules in Node.js for building real-time apps Use the Backbone.js framework to write clean browser code, and maintain better data integration with MongoDB Structure project files as a foundation for code that will arrive later Create user accounts and learn how to secure the data Use Backbone.js templates to build the application’s UIs, and integrate access control with Node.js Develop a contact list to help users link to and track other accounts Use Socket.io to create real-time chat functionality Extend your UIs to give users up-to-the-minute information	http://books.google.com.br/books/content?id=FD2ld2178EkC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9781449337391	188	2012-12-24	"O'Reilly Media, Inc."	\N	Building Node Applications with MongoDB and Backbone
217	Brad Green,Shyam Seshadri	Methods for building rich browser-based applications have grown organically over time, leaving JavaScript developers who are new to the process with no structure to follow. This book introduces AngularJS, the open-source JavaScript framework that uses the Model–View–Controller (MVC) pattern to organize your application. Written by two engineers who worked on the AngularJS project at Google, this book shows you how a few conventions can result in dramatically smaller and more expressively and readable code. You’ll learn how easy it is to adopt the "Zen of AngularJS." With AngularJS, you’ll learn how to: Separate responsibilities with MVC for maximum flexibility Use declarative programming for the user interface, and imperative programming for business logic Eliminate the marshalling boilerplate in data binding to make MVC effortless Extend HTML syntax Use dependency injection for refactoring, testability, and designing apps for multiple environments Gain structural support for switching views and deep linking	http://books.google.com.br/books/content?id=-PvAMgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781449344856	120	2013-03-15	O'Reilly Media, Incorporated	\N	AngularJS
218	Martin Fowler,Kent Beck	Users can dramatically improve the design, performance, and manageability of object-oriented code without altering its interfaces or behavior. "Refactoring" shows users exactly how to spot the best opportunities for refactoring and exactly how to do it, step by step.	http://books.google.com.br/books/content?id=1MsETFPD3I0C&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780201485677	431	1999	Edward Elgar Publishing	Improving the Design of Existing Code	Refactoring
219	W. Richard Stevens	Bestselling UNIX author Stevens offers application and system programmers his professional, experienced-based guidance on using the system call interface with C. Since good examples are the key to a book like this, a simple shell program is developed in the first chapter and then expanded throughout the book to demonstrate the principles.	http://books.google.com.br/books/content?id=ksxQAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780201563177	744	1992-01	Addison-Wesley Professional	\N	Advanced Programming in the UNIX Environment
220	Ramez Elmasri,Shamkant B. Navathe	Reunindo teoria e exemplos práticos com as mais modernas tecnologias, este livro introduz os conceitos fundamentais necessários para projetar, usar e implementar os sistemas de banco de dados e suas aplicações. De fácil compreensão, o texto aborda a modelagem e o projeto de banco de dados, suas linguagens e as funcionalidades dos sistemas de gerenciamento de banco de dados e as técnicas de implementação desses sistemas. Entre as características desta edição - Organização adaptável às necessidades dos estudantes; Abordagem para a modelagem de dados que inclui o modelo ER e a UML; SQL avançada com material sobre técnicas de programação; Exemplos que permitem ao leitor comparar as diferentes abordagens que usam a mesma aplicação; Segurança, bancos de dados móveis, GIS e gerenciamento de dados Genoma; XML e bancos de dados para a Internet; Data mining. 'Sistemas de banco de dados' destina-se a estudantes de graduação, pós-graduação ou a usuários familiarizados com programação e conceitos de estruturação de dados e organização básica de computadores.	http://www.pearsonhighered.com/elmasri_br/images/elmasri_4ed.jpg	9788588639171	724	2005	\N	\N	Sistemas de banco de dados
221	SIMON S. HAYKIN	As redes neurais artificiais têm raízes em disciplinas como neurociência, matemática, estatística, física, ciência da computação e engenharia. Suas aplicações podem ser encontradas em campos tão diversos quanto modelagem, análise de séries temporais, reconhecimento de padrões, processamento de sinais e controle. Este livro fornece as bases para o entendimento das redes neurais, reconhecendo a natureza multidisciplinar do tema. O material é acompanhado de exemplos, experimentos computacionais, problemas no final de cada capítulo e bibliografia. Conta ainda com duas páginas de apoio na Web.	http://books.google.com.br/books/content?id=lBp0X5qfyjUC&printsec=frontcover&img=1&zoom=1&source=gbs_api	9788573077186	900	2001	Bookman	\N	Redes Neurais - 2ed.
234	Chancellor Williams	\N	\N	\N	384	\N	\N	Great issues of a race from 4500 B.C. to 2000 A.D.	The Destruction Of Black Civilization
222	Bill Dudney	"The flip–side of Patterns, AntiPatterns provide developers with formal descriptions of common development gaffes that can derail a project along with practical guidelines on how to avoid them. In this book, the authors present dozens of Java AntiPatterns that tackle many of Java′s biggest trouble spots for programming with EJB, JSP, Servlets, and more. Each AntiPattern is documented with real–world examples, code, and refactored (or escape–route) solutions, and the book uses UML (where appropriate) to diagram improved solutions. All code examples from the book are available to the reader on the book′s companion Web site."	http://books.google.com.br/books/content?id=g_F-z16b_o4C&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780471146155	602	2003	John Wiley & Sons	\N	J2EE AntiPatterns
223	Myles Downey	"A book about achieving actual results for individuals, teams, and orgnizations"--Back cover.	http://books.google.com.br/books/content?id=zifwAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781587991721	223	2003	Cengage Learning	Lessons from the Coaches' Coach	Effective Coaching
224	Luciano Ramalho	Python’s simplicity lets you become productive quickly, but this often means you aren’t using everything it has to offer. With this hands-on guide, you’ll learn how to write effective, idiomatic Python code by leveraging its best—and possibly most neglected—features. Author Luciano Ramalho takes you through Python’s core language features and libraries, and shows you how to make your code shorter, faster, and more readable at the same time. Many experienced programmers try to bend Python to fit patterns they learned from other languages, and never discover Python features outside of their experience. With this book, those Python programmers will thoroughly learn how to become proficient in Python 3. This book covers: Python data model: understand how special methods are the key to the consistent behavior of objects Data structures: take full advantage of built-in types, and understand the text vs bytes duality in the Unicode age Functions as objects: view Python functions as first-class objects, and understand how this affects popular design patterns Object-oriented idioms: build classes by learning about references, mutability, interfaces, operator overloading, and multiple inheritance Control flow: leverage context managers, generators, coroutines, and concurrency with the concurrent.futures and asyncio packages Metaprogramming: understand how properties, attribute descriptors, class decorators, and metaclasses work	http://books.google.com.br/books/content?id=kgrXoAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781491946008	770	2015-06-25	O'Reilly Media	\N	Fluent Python
225	André Gravatá e Daniel Ianae	Presente do próprio autor André Gravatá para a Nati Menhem que o doou para o Grupo Educação da ThoughtWorks	\N	\N	192	05/10/2015	Movimento Entusiasmo	\N	Mistérios da Educação
226	Ken Orr	\N	http://www.abebooks.com/servlet/BookDetailsPL?bi=17642207890&searchurl=isbn%3D9780932633026	\N	\N	\N	\N	\N	Becoming a Technical Leader
227	Jeanne Liedtka,Tim Ogilvie	Outlines the popular business trend through which abstract ideas are developed into practical applications for maximum growth, sharing coverage of its mindset, techniques and vocabulary to reveal how design thinking can address a range of problems and become a core component of successful business practice.	http://books.google.com.br/books/content?id=HIxh2_ExnXMC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9780231158381	227	2011	Columbia University Press	A Design Thinking Tool Kit for Managers	Designing for Growth
228	Roger L. Martin	Most companies today have innovation envy. Many make genuine efforts to be innovative: they spend on R&D, bring in creative designers, hire innovation consultants; but they still get disappointing results. Roger Martin argues that to innovate and win, companies need 'design thinking'.	http://books.google.com.br/books/content?id=CvpAgm8dQQkC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9781422177808	191	2009-01-01	Harvard Business Press	Why Design Thinking is the Next Competitive Advantage	The Design of Business
229	Jenifer Tidwell	Users demand applications that are well behaved, good-looking, and easy to use. Your clients or managers demand originality and a short time to market. The good news? UI technology has evolved into a set of best practices and reusable ideas for a wide range of interactive applications today. AndDesigning Interfacesis a bestseller because it's one of the few reliable resources available to guide you. This book captures UI best practices as design patterns -- solutions to common design problems, tailored to the situation at hand. The updated edition now includes patterns for mobile apps, social networks, and search interfaces, as well as web applications and desktop software. Each pattern contains examples in full color, and practical advice that you can put to use immediately. Design engaging and usable interfaces with more confidence and less guesswork Learn key design concepts that are often misunderstood, such as affordances, visual hierarchy, navigational distance, and the use of color Get recommendations for using specific UI patterns, along with alternatives, and warnings on when not to use them Learn concrete UI ideas that you can mix and recombine as you see fit Experienced designers can useDesigning Interfacesas a sourcebook of ideas. Novice designers will find a roadmap to the world of interface and interaction design, with enough guidance to start using these patterns right away.	http://books.google.com.br/books/content?id=FLabAgAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781449379704	547	2010-12-22	"O'Reilly Media, Inc."	\N	Designing Interfaces
230	Caio Prado Júnior	'História Econômica do Brasil' procura auxiliar no entendimento das características estruturais da sociedade brasileira, dos dilemas que herdou do passado e dos possíveis caminhos de sua superação.	http://statics.livrariacultura.net.br/products/capas_lg/482/55482.jpg	\N	366	\N	Editora Brasiliense	\N	História Econômica do Brasil
231	Patrick Kua	A book for Tech Leads, from Tech Leads. Discover how more than 35 Tech Leads find the delicate balance between the technical and non-technical worlds. Discover the challenges a Tech Lead faces and how to overcome them. You may be surprised by the lessons they have to share.	http://books.google.com.br/books/content?id=ZlJ3rgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781505817485	282	2015-04-15	CreateSpace	From Novices to Practitioners	Talking with Tech Leads
232	Gayle Laakmann McDowell,Jackie Bavaro	How many pizzas are delivered in Manhattan? How do you design an alarm clock for the blind? What is your favorite piece of software and why? How would you launch a video rental service in India? This book will teach you how to answer these questions and more. Cracking the PM Interview is a comprehensive book about landing a product management role in a startup or bigger tech company. Learn how the ambiguously-named "PM" (product manager / program manager) role varies across companies, what experience you need, how to make your existing experience translate, what a great PM resume and cover letter look like, and finally, how to master the interview: estimation questions, behavioral questions, case questions, product questions, technical questions, and the super important "pitch."	http://books.google.com.br/books/content?id=vFr9nQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780984782819	366	2013-12	\N	How to Land a Project Manager Job in Technology	Cracking the PM Interview
236	Chancellor Williams	The Destruction of Black Civilization took Chancellor Williams sixteen years of research and field study to compile. The book, which was to serve as a reinterpretation of the history of the African race, was intended to be ""a general rebellion against the subtle message from even the most 'liberal' white authors (and their Negro disciples): 'You belong to a race of nobodies. You have no worthwhile history to point to with pride.'"" The book was written at a time when many black students, educators, and scholars were starting to piece together the connection between the way their history was taught and the way they were perceived by others and by themselves. They began to question assumptions made about their history and took it upon themselves to create a new body of historical research. The book is premised on the question: ""If the Blacks were among the very first builders of civilization and their land the birthplace of civilization, what has happened to them that has left them since then, at the bottom of world society, precisely what happened? The Caucasian answer is simple and well-known: The Blacks have always been at the bottom."" Williams instead contends that many elements—nature, imperialism, and stolen legacies— have aided in the destruction of the black civilization. The Destruction of Black Civilization is revelatory and revolutionary because it offers a new approach to the research, teaching, and study of African history by shifting the main focus from the history of Arabs and Europeans in Africa to the Africans themselves, offering instead ""a history of blacks that is a history of blacks. Because only from history can we learn what our strengths were and, especially, in what particular aspect we are weak and vulnerable. Our history can then become at once the foundation and guiding light for united efforts in serious[ly] planning what we should be about now."" It was part of the evolution of the black revolution that took place in the 1970s, as the focus shifted from politics to matters of the mind.	http://ecx.images-amazon.com/images/I/51ot5RqI4PL._SY344_BO1,204,203,200_.jpg	\N	384	\N		Great issues of a race from 4500 B.C. to 2000 A.D.	The Destruction Of Black Civilization
237	Toby Segaran	Provides information on building Web 2.0 applications that have the capability to mine data created by Internet applications.	http://books.google.com.br/books/content?id=uDnNAwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780596529321	334	2007-08-16	Tang Kinh Cac	Building Smart Web 2.0 Applications	Programming Collective Intelligence
238	Gojko Adzic	Bridging the Communication Gap is a book about improving communication between customers, business analysts, developers and testers on software projects, especially by using specification by example and agile acceptance testing. These two key emerging software development practices can significantly improve the chances of success of a software project. They ensure that all project participants speak the same language, and build a shared and consistent understanding of the domain. This leads to better specifications, flushes out incorrect assumptions and ensures that functional gaps are discovered before the development starts. With these practices in place you can build software that is genuinely fit for purpose.	http://books.google.com.br/books/content?id=pCcqAgAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780955683619	284	2009-01	Lulu.com	Specification by Example and Agile Acceptance Testing	Bridging the Communication Gap
239	Marcel Popescu	Test-driven design can be daunting at first. This book presents a moderately complex task - write a program that can read a mathematical expression like 2 + 3 * 5 and return its result. The author explains each step with both tests and production code until the program can handle decimal numbers, multiple levels of parentheses and even symbols (like in x + 3). This is a code-heavy, hands-on book; just reading it without writing the code yourself might not provide the full benefit.	http://ecx.images-amazon.com/images/I/41nfBBhW5cL._SX331_BO1,204,203,200_.jpg	\N	106	2011/10/13	\N	Evaluating an Expression	TDD by example
240	Betty Friedan,Anna Quindlen,Gail Collins	Views the distorted image of women that prevailed from the end of the Second World War through the early sixties and relects upon changes.	http://books.google.com.br/books/content?id=vU-FAAAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780393346787	592	2013-09-03	W. W. Norton & Company	\N	The Feminine Mystique (50th Anniversary Edition)
241	Gene Kim,Kevin Behr,George Spafford	Bill is an IT manager at Parts Unlimited. It's Tuesday morning and on his drive into the office, Bill gets a call from the CEO. The company's new IT initiative, code named Phoenix Project, is critical to the future of Parts Unlimited, but the project is massively over budget and very late. The CEO wants Bill to report directly to him and fix the mess in ninety days or else Bill's entire department will be outsourced. With the help of a prospective board member and his mysterious philosophy of The Three Ways, Bill starts to see that IT work has more in common with manufacturing plant work than he ever imagined. With the clock ticking, Bill must organize work flow, streamline interdepartmental communications, and effectively serve the other business functions at Parts Unlimited. In a fast-paced and entertaining style, three luminaries of the DevOps movement deliver a story that anyone who works in IT will recognize. Readers will not only learn how to improve their own IT organizations, they'll never view IT the same way again.	http://books.google.com.br/books/content?id=D_77CAAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780988262508	384	2014-10-15	IT Revolution	A Novel About IT, DevOps, and Helping Your Business Win	The Phoenix Project
242	David Allen	Based on the premise that productivity is directly proportional to one's ability to handle tasks in a relaxed manner, the author offers strategies for self-management that minimize stress and enhance one's focus and efficiency. Original.	http://books.google.com.br/books/content?id=yaKUoAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780143126560	352	2015-03	Penguin Paperbacks	The Art of Stress-Free Productivity	Getting Things Done
243	Malcolm Gladwell	The Tipping Point is the biography of an idea, and the idea is quite simple: that many of the problems we face - from murder to teenage delinquency to traffic jams - behave like epidemics. They aren't linear phenomena in the sense that they steadily and predictably change according to the level of effort brought to bear against them. They are capable of sudden and dramatic changes in direction. Years of well-intentioned intervention may have no impact at all, yet the right intervention - at just the right time - can start a cascade of change.	http://books.google.com.br/books/content?id=GqepQgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780316679077	280	2001	Lb Books	How Little Things Can Make a Big Difference	The Tipping Point
259	Steve Krug	O livro trata sobre a usabilidade na Web com informações e conselhos práticos, tanto para novatos quanto para veteranos. Neste livro, Steve Krug adiciona munição essencial para aqueles cujos chefes, clientes, investidores e gerentes de marketing insistem em fazer a coisa errada. 'Não me Faça Pensar!' abrirá a mente (e a carteira) do chefe para investir em usabilidade na Web.	images\\no-image.png	9788576081180	127	2006	\N	uma abordagem de bom senso à usabilidade na web	Não me faça pensar!
244	Chris Anderson	What happens when there is almost unlimited choice? When everything becomes available to everyone? And when the combined value of the millions of items that only sell in small quantities equals or even exceeds the value of a handful of best-sellers? In this ground-breaking book, Chris Anderson shows that the future of business does not lie in hits - the high-volume end of a traditional demand curve - but in what used to be regarded as misses - the endlessly long tail of that same curve. As our world is transformed by the Internet and the near infinite choice it offers consumers, so traditional business models are being overturned and new truths revealed about what consumers want and how they want to get it. Chris Anderson first explored the Long Tail in an article in Wired magazine that has become one of the most influential business essays of our time. Now, in this eagerly anticipated book, he takes a closer look at the new economics of the Internet age, showing where business is going and exploring the huge opportunities that exist: for new producers, new e-tailers, and new tastemakers. He demonstrates how long tail economics apply to industries ranging from the toy business to advertising to kitchen appliances. He sets down the rules for operating in a long tail economy. And he provides a glimpse of a future that's already here.	http://books.google.com.br/books/content?id=gc4e1uC5pScC&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781844138517	244	2007	Random House	How Endless Choice is Creating Unlimited Demand	The Long Tail
245	MICHAEL R. LEGAULT	Na era do imediatismo, louvam-se quem toma decisões rápidas, num piscar de olhos. Agir sem pensar, no entanto, tornou-se uma regra perigosa, como mostra Michael R. LeGault nesta obra instigante. Em 'Think! - Por que não tomar decisões num piscar de olhos' o autor afirma a importância da reflexão na tomada de decisões e demonstra o quanto ações impensadas e sem reflexão são maléficas. Ao contrário do que prega Malcom Gladwell em seu Blink, Le Gault defende em Think que não se tomem decisões sem conhecimento factual ou análise crítica.	images\\no-image.png	9788576841692	368	\N	\N	PISCAR DE OLHOS	THINK! - POR QUE NAO TOMAR DECISOES NUM
246	W. Chan Kim,Renée Mauborgne	Apresenta o conceito de oceano azul, o espaço do mercado desconhecido, e esboça suas principais características. Avalia as consequências do lucro e crescimento, e discute porque sua criação é um imperativo crescente para empresas no futuro. Inclui exemplos de empresas da Europa, Ásia e Estados Unidos.	http://books.google.com.br/books/content?id=epSNS14fA4wC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9788535215243	241	2005	Elsevier Brasil	\N	A Estratégia Do Oceano Azul
247	Paul Butcher	Offers information on how to exploit the parallel architectures in a computer's GPU to improve code performance, scalability, and resilience.	http://books.google.com.br/books/content?id=RgNCngEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781937785659	300	2014-07-10	Pragmatic Bookshelf	When Threads Unravel	Seven Concurrency Models in Seven Weeks
248	Don Tapscott,ANTHONY D. WILLIAMS	Today, encyclopedias, jetliners, operating systems, mutual funds, and many other items are being created by teams numbering in the thousands or even millions. While some leaders fear the heaving growth of these massive online communities, 'Wikinomics' proves this fear is folly. Smart firms can harness collective capability and genius to spur innovation, growth, and success. A guide to one of the most profound changes of our time, 'Wikinomics' challenges our most deeply-rooted assumptions about business and will prove indispensable to anyone who wants to understand competitiveness in the twenty- first century.	http://books.google.com.br/books/content?id=IIqtOwAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781591842316	\N	2008-01-30	\N	\N	Wikinomics
249	Chip Heath; Dan Heath	\N	\N	\N	322	\N	\N	\N	Made to Stick: Why Some Ideas Survive and Others Die
250	Amy Shuen	With case studies that demonstrate what Web 2.0 is and how it works in different business situations, this book illustrates how todays Web technologies and uses are changing the way companies communicate, interact, and make money.	http://books.google.com.br/books/content?id=u5vZmgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780596529963	243	2008-06-11	"O'Reilly Media, Inc."	A Strategy Guide	Web 2.0
251	CHARLES DUHIGG,RAFAEL MANTOVANI	Segundo o autor, a chave para se exercitar regularmente, perder peso, educar os filhos, tornar-se mais produtivo, criar empresas revolucionárias e alcançar o sucesso é entender como os hábitos funcionam. Ele procura mostrar que, ao dominar esta ciência, todos podem transformar suas empresas e suas vidas.	images\\no-image.png	9788539004119	408	\N	\N	\N	O PODER DO HABITO
252	Asa Briggs,Peter Burke,Maria Carmelita Pádua Dias	Esta obra apresenta uma análise dos meios de comunicação, destacando os contextos sociais e culturais em que emergem e se desenvolvem, além de traçar a história das diferentes mídias e das linguagens que elas criam para a civilização ocidental - da invenção da prensa gráfica à Internet.	https://reticenciajornalistica.files.wordpress.com/2011/09/historia-social-da-midia.jpg	9788571107717	375	2004	\N	de Gutenberg à Internet	Uma história social da mídia
253	Leander Kahney	Neste livro, que pretende ser uma biografia sobre Steve Jobs e, ao mesmo tempo, um guia sobre liderança, o autor busca mostrar os princípios que guiaram Jobs ao lançar produtos, ao atrair compradores e ao administrar a sua empresa.	http://books.google.com.br/books/content?id=70vqOv05j30C&printsec=frontcover&img=1&zoom=1&source=gbs_api	9788522009770	263	2008	Agir Editora	\N	A Cabeça de Steves Jobs
254	Jeff Sutherland	Reveals how the software industry's "scrum" management process can be practically applied to other fields to incrementally increase productivity and quality, citing successful examples while outlining key strategies in problem solving and team optimization. 75,000 first printing.	http://books.google.com.br/books/content?id=JySmngEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780385346450	248	2014-09-30	Crown Business	The Art of Doing Twice the Work in Half the Time	Scrum
255	Walter Isaacson,STEVE JOBS,Denise Guimarães Bottmann,Berilo Vargas,Pedro Maia Soares	Este livro, baseado em mais de quarenta entrevistas com Steve Jobs - e entrevistas com familiares, amigos, colegas, adversários e concorrentes -, narra a vida deste empresário, cuja paixão pela perfeição e cuja energia contribuíram para seis indústrias - a computação pessoal, o cinema de animação, a música, a telefonia celular, a computação em tablet e a edição digital.	http://ecx.images-amazon.com/images/I/81VStYnDGrL.jpg	9788535919714	607	2011	\N	a biografia	Steve Jobs
256	Pierre Weil	\N	\N	\N	287	\N	\N	\N	O Corpo Fala
257	Jim Sterne; Anthony Piore	\N	\N	\N	300	\N	\N	\N	E-mail Marketing
258	AVINASH KAUSHIK	Escrito por um profissional da área, este livro vai além dos conceitos e das definições para desafiar o pensamento dominante sobre o campo e fornecer um guia prático para implementar uma estratégia web analítica bem-sucedida. Aprenda os prós e os contras	images\\no-image.png	9788576081784	440	\N	\N	\N	WEB ANALITICA
260	David B. Yoffie,Mary Kwak	A century-old strategy holds the secret to toppling corporate giants. 'In a world where advantage increasingly depends upon movement rather than position, "Judo Strategy" drills home the ultimate principle of strategy: maximize impact while minimizing effort. This is easy to say but difficult to accomplish. The authors provide pragmatic techniques and examples to help make this principle come alive. Don't enter the market without this book' - John Hagel, Author, "Net Gain and Net Worth", and Chief Strategy Officer, 12 Entrepreneuring, Inc. Why do some companies succeed in defeating stronger rivals, while others fail? This is a question that, sooner or later, all ambitious competitors must face.Whether you're a tiny start-up taking on industry giants or a giant moving into markets dominated by powerful incumbents, the basic problem remains the same: How do you compete with opponents who have size, strength, and history on their side? The answer lies in a simple but powerful lesson: Rather than oppose strength to strength, successful challengers use their opponents' size and power to bring them down. This is the message at the heart of "Judo Strategy". Based on extensive research by Harvard Business School professor David Yoffie and research associate Mary Kwak, "Judo Strategy" introduces a groundbreaking approach to competition that shows companies how to win against imposing odds. Using vivid examples from companies ranging from Wal-Mart and Charles Schwab to Juniper Networks and Palm Computing, the authors demonstrate how managers can translate the core principles of judo - a martial art that prizes skill not size - into a winning business strategy.By mastering movement, managers learn to seize the lead and make the most of their initial advantage. By maintaining balance, they can successfully engage with opponents and respond to rivals' attacks. And finally, by exploiting leverage, managers can transform their competitors' strengths into strategic liabilities. This book will help any company - large or small, new or old, virtual or physical - become a more effective competitor. In addition to developing the concept of judo strategy, it presents a defensive primer - in the form of "sumo strategy" - for companies facing judo attacks.Packed with the insights of world-class managers and strategists, "Judo Strategy" does double duty: it can help you become a giant-killer, while also teaching you to protect your hard-fought position from challengers in the wings.		9781578512539	239	2001	Harvard Business Press	Turning Your Competitors' Strength to Your Advantage	Judo Strategy
261	Daniel Domscheit-Berg	Neste livro, Domscheit-Berg procura relatar os bastidores do site WikiLeaks, desde seu primeiro encontro com Assange em 2007. A obra pretende revelar a evolução do site, os aspectos financeiros, as tensões internas da organização, entre outros aspectos. O autor ainda deve contar os motivos que o fizeram acabar com a parceria com Assange.	images\\no-image.png	9788535245462	267	2011	\N	a história do site mais controverso dos últimos tempos escrita pelo seu ex-porta-voz	Os bastidores do WikiLeaks
262	Andy Weir	\N	http://images.livrariasaraiva.com.br/imagemnet/imagem.aspx/?pro_id=8164096&qld=90&l=370&a=-1	\N	\N	\N	Editora Arqueiro	Uma missão a Marte. Um terrível acidente. A luta de um homem pela sobrevivência	Perdido em Marte
263	Luke Wroblewski	Guide to web design optimized for mobile devices, in order to deliver the mobile web experience users want. Argues companies should create websites and applications for mobile devices first, and for desktops/laptop computers second, if at all.	http://static.lukew.com/gfx-mobilefirst2_2x.png	9781937557027	130	2011	Ingram	\N	Mobile First
264	Addison Wesley	\N	\N	\N	\N	\N	\N	Reliable Software Releases through Build, Test, and Deployment Automation	Continuous Delivery
265	Edgar H. Schein	"With the emphasis on teamwork in contemporary society, Schein's model has the potential to improve the collaborative process. A theoretical book based on Schein's extensive teaching and consulting, this is a useful, important resource. Summing up: essential; four stars." --M. Bonner, University of Maryland University College (Choice)Helping is a fundamental human activity, but it can also be a frustrating one. All too often, to our bewilderment, our sincere offers of help are resented, resisted, or refused -- and we often react the same way when people try to help us. Why is it so difficult to provide or accept help? How can we make the whole process easier? Many different words are used for helping: assisting, aiding, advising, caregiving, coaching, consulting, counseling, guiding, mentoring, supporting, teaching, and many more. In this seminal book on the topic, corporate culture and organizational development guru Ed Schein analyzes the social and psychological dynamics common to all types of helping relationships, explains why help is often not helpful, and shows what any would-be helpers must do to ensure that their assistance is both welcomed and genuinely useful.The moment of asking for and offering help is a delicate and complex one, fraught with inequities and ambiguities. Schein helps us navigate that moment so we avoid potential pitfalls, mitigate power imbalances, and establish a solid foundation of trust. He identifies three roles a helper can play, explaining which one is nearly always the best starting point if we are to provide truly effective help. So that readers can determine exactly what kind of help is needed, he describes an inquiry process that puts the helper and the client on an equal footing, encouraging the client to open up and engage and giving the helper much better information to work with. And he shows how these techniques can be applied to teamwork and to organizational leadership.Illustrated with examples from many types of relationships -- husbands and wives, doctors and patients, consultants and clients -- Helping is a concise, definitive analysis of what it takes to establish successful, mutually satisfying helping relationships.	http://books.google.com.br/books/content?id=-fqLuAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9781576758632	167	2009	Berrett-Koehler Pub	How to Offer, Give, and Receive Help	Helping
266	Jurgen Appelo	How software practitioners can become great Agile leaders: simple rules from real-world practice * *Succeed with Agile by mastering eight crucial leadership skills: activating people, empowering teams, aligning results, organizing structure, enforcing discipline, manipulating context, acquiring knowledge, and measuring performance. *Work more effectively with knowledge workers, while managing risk, uncertainty, and change. *The newest book in Mike Cohn's best-selling Signature Series. In Management 3.0, top Agile manager Jurgen Appelo shows managers how to lead Agile adoption and Agile projects more effectively, while also helping their colleagues develop as leaders in Agile environments. Appelo combines the 'what,' 'why,' and 'how' of agile leadership, presenting background, examples, and powerful, proven techniques. Appelo identifies the eight most crucial agile leadership skills, explaining in detail why they matter and how to develop them - both in yourself and in your colleagues. You'll discover powerful ways to activate people, empower teams, align results, organize structure, enforce discipline, manipulate context, acquire knowledge, and measure performance. Management 3.0 will help aspiring managers and leaders: * *Define their teams' boundaries and constraints, so they can self-organize more effectively. *Anticipate issues teams won't or can't resolve on their own. *Give teams the feed and caring they need, and let them grow on their own. *Sow the seeds for a culture of craftsmanship. *Successfully manage risks and uncertainty in fast-changing projects and environments.	http://books.google.com.br/books/content?id=2X4hBQAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780321712479	413	2011-01	Pearson Education	Leading Agile Developers, Developing Agile Leaders	Management 3.0
267	Karl Mathias & Sean P. Kane	Um ótimo livro para iniciante em Docker.	http://novatec.com.br/figuras/capas/9788575224731.gif	\N	240	Janeiro-2016	Novatec	Usando Contêiner em produção	Primeiros Passos com Docker
268	Chimamanda Ngozi Adichie	\N	http://www.companhiadasletras.com.br/images/livros/13925_g.jpg	\N	64	\N	Companhia das Letras	\N	Sejamos Todos Feministas
269	Chimamanda Ngozi Adichie	\N	http://www.companhiadasletras.com.br/images/livros/13925_g.jpg	\N	64	\N	Companhia das Letras	\N	Sejamos Todos Feministas
270	Kent Beck	\N	http://www.grupoa.com.br/uploads/imagensTitulo/fotoAmpliada_1583.jpg	\N	165	\N	Bookman	Acolha as mudanças	Programação eXtrema explicada (XP)
271	Galeano, Eduardo	\N	\N	\N	\N	\N	\N	\N	As Veias Abertas da América Latina
272	FREDERICK P. BROOKS JUNIOR,CESAR BROD	'O Mítico homem-mês' foi a obra literária que expôs as peculiaridades da indústria de software. Nesta edição, o autor traz uma obra com pensamentos sobre o tema e uma retrospectiva sobre as principais mudanças ocorridas desde o lançamento da primeira edição do livro, em 1975.	https://www.solivros.com.br/images/9788535234879.jpg	9788535234879	328	\N	Campus & Elsiever	ENSAIOS SOBRE ENGENHARIA DE SOFTWARE	O MITICO HOMEM-MES
273	David H. Maister	This comprehensive text offers a wealth of common-sense ideas on the managerial problems of professional service firms, from marketing and business development to multinational strategies, and from human resource policies to profit improvement	http://books.google.com.br/books/content?id=xRAhO-RzV5oC&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780684834313	376	1993	Free Press	\N	Managing the professional service firm
274	L. David Marquet	'David Marquet is the kind of leader who comes around only once in a generation ... his ideas and lessons are invaluable' Simon Sinek, author of Start With Why Captain David Marquet was used to giving orders. In the high-stress environment of the USS Santa Fe, a nuclear-powered submarine, it was crucial his men did their job well. But the ship was dogged by poor morale, poor performance and the worst retention in the fleet. One day, Marquet unknowingly gave an impossible order, and his crew tried to follow it anyway. He realized he was leading in a culture of followers, and they were all in danger unless they fundamentally changed the way they did things. Marquet took matters into his own hands and pushed for leadership at every level. Before long, his crew became fully engaged and the Santa Fe skyrocketed from worst t first in the fleet. No matter your business or position, you can apply Marquet's approach to create a workplace where everyone takes responsibility for their actions, people are healthier and happier - and everyone is a leader.	http://books.google.com.br/books/content?id=TVb4sgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	9780241250945	240	2015-10-08	Portfolio (Hardcover)	A True Story of Building Leaders by Breaking the Rules	Turn the Ship Around!
275	Marshall B. Rosenberg	Manual prático e didático que apresenta metodologia criada pelo autor, voltada para aprimorar os relacionamentos interpessoais e diminuir a violência no mundo. Aplicável em centenas de situações que exigem clareza na comunicação: em fábricas, escolas, comunidades carentes e até em graves conflitos políticos.	http://books.google.com.br/books/content?id=2HGf_-uVBEQC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	9788571838260	285	2006-04-18	Editora Agora	Tecnicas para aprimorar relacionamentos pessoais e profissionais	COMUNICACAO NAO-VIOLENTA
276	Dale Carnegie	\N	http://www.extra-imagens.com.br/Control/ArquivoExibir.aspx?IdArquivo=6543483	\N	264	2012	Companhia Editora Nacional	O guia clássico e definitivo para relacionar-se com as pessoas	Como fazer amigos e influenciar pessoas
277	Kerry Patterson, Joseph Grenny, Ron McMillan, Al Switzler	\N	http://geral.leya.com.br/fotos/produtos/250_9788580445640_confrontosdecisivos.jpg	\N	280	\N	Leya	Solucione problemas difíceis e melhore definitivamente seu desempenho nos relacionamentos pessoais e no trabalho	Confrontos Decisivos
\.


--
-- Name: book_gen; Type: SEQUENCE SET; Schema: public; Owner: libraryadmin
--

SELECT pg_catalog.setval('book_gen', 277, true);


--
-- Data for Name: copy; Type: TABLE DATA; Schema: public; Owner: libraryadmin
--

COPY copy (id, status, book_id, library_id) FROM stdin;
159	0	135	6
109	1	94	1
160	0	23	6
43	1	43	2
108	0	5	1
161	0	3	6
172	1	144	6
116	0	98	2
82	1	71	1
34	1	34	2
63	0	59	1
64	0	60	1
84	0	73	1
65	0	3	1
66	0	4	1
69	0	62	1
72	0	64	1
162	0	136	6
163	0	137	6
100	0	88	1
164	0	138	6
76	0	67	1
165	0	139	6
49	1	49	2
40	0	40	2
41	0	41	2
42	0	42	2
47	0	47	2
48	0	48	2
118	1	33	3
73	0	27	1
119	1	100	3
74	0	65	1
70	0	63	1
110	0	95	1
75	0	66	1
77	0	68	1
81	0	70	1
83	0	72	1
120	1	61	3
85	0	74	1
86	0	75	1
87	0	76	1
36	0	36	2
88	0	77	1
89	0	2	1
121	0	101	4
168	0	142	6
169	0	143	6
56	0	53	2
57	0	54	2
91	0	79	1
123	1	103	5
92	0	80	1
93	0	81	1
95	0	83	1
196	1	136	3
96	0	84	1
58	0	55	2
97	0	85	1
124	0	104	5
35	1	35	2
99	0	87	1
103	0	90	1
104	0	15	1
107	0	93	1
125	0	105	5
126	0	106	5
171	0	91	6
127	0	41	5
130	0	109	5
131	0	110	5
132	0	111	5
135	0	114	5
140	0	118	5
141	0	119	5
144	0	120	5
146	0	122	5
147	0	123	5
148	0	124	5
112	0	12	1
94	0	82	1
68	1	61	1
173	0	145	6
106	0	92	1
113	0	13	1
115	0	97	1
149	0	125	5
174	0	33	6
175	0	89	6
153	0	129	5
154	0	130	5
156	0	132	5
192	0	161	6
158	0	134	6
193	0	61	6
195	0	163	6
61	0	17	3
44	0	44	2
177	0	147	6
178	0	148	6
179	0	149	6
180	0	150	6
181	0	151	6
182	0	152	6
183	0	153	6
184	0	154	6
185	0	155	6
186	0	156	6
187	0	157	6
188	0	17	6
189	0	158	6
190	0	159	6
191	0	160	6
38	1	38	2
197	1	164	3
198	0	165	5
199	0	166	3
176	0	146	6
201	0	78	5
202	0	168	5
203	0	169	5
204	0	170	5
205	0	171	5
206	0	172	5
207	0	173	5
208	0	174	5
209	0	175	5
67	1	16	1
111	1	17	1
101	1	89	1
71	0	11	1
210	0	176	5
213	0	179	5
214	0	180	5
114	0	96	1
105	0	91	1
215	0	181	5
157	1	133	5
138	0	117	5
62	0	58	2
117	0	99	2
152	1	128	5
59	0	56	2
55	1	52	2
79	0	22	1
33	1	33	2
54	1	4	2
98	0	86	1
37	0	37	2
102	0	28	1
90	1	78	1
80	0	25	1
78	1	69	1
200	0	167	2
39	0	39	2
150	1	126	5
145	1	121	5
155	0	131	5
139	1	83	5
194	0	162	6
166	0	140	6
51	1	50	2
167	0	141	6
216	0	182	5
217	0	83	6
170	0	83	6
218	0	183	5
219	0	184	5
220	0	185	5
224	0	188	1
225	0	189	1
226	0	190	1
231	0	195	1
235	0	199	1
236	0	200	1
241	0	204	1
242	0	205	1
243	0	206	1
223	1	135	1
237	1	201	1
234	1	198	1
228	1	192	1
240	1	203	1
247	0	209	5
248	0	210	5
249	0	211	5
238	1	34	1
239	1	202	1
250	0	212	2
251	0	213	5
253	0	215	1
229	1	193	1
245	0	207	1
254	1	160	1
255	0	216	5
256	0	217	5
257	0	218	5
258	0	219	5
259	0	220	5
260	0	221	5
261	0	222	5
262	0	136	5
263	0	192	5
264	0	223	5
212	1	178	5
265	0	224	5
266	0	225	5
227	1	191	1
267	0	226	1
279	0	229	2
271	1	50	2
280	1	230	2
270	1	135	2
233	0	197	1
273	1	91	2
246	1	208	5
221	0	186	5
282	0	232	2
285	0	234	2
286	0	235	2
287	0	94	2
288	0	236	2
45	1	45	2
252	1	214	2
292	0	239	2
293	0	240	2
211	1	177	5
244	1	139	1
296	0	243	5
297	0	244	5
298	0	245	5
299	0	246	5
300	0	247	5
301	0	248	5
303	0	250	5
304	0	251	5
305	0	252	5
306	0	253	5
307	0	254	5
308	0	255	5
310	0	38	5
311	0	257	5
312	0	258	5
313	0	259	5
314	0	260	5
315	0	261	5
275	1	90	2
316	0	262	2
46	1	46	2
328	1	271	5
60	1	57	2
317	0	263	2
294	0	241	5
230	1	194	1
336	0	148	2
276	1	139	2
272	0	23	2
283	0	233	2
302	0	249	5
295	0	242	5
290	0	238	2
318	0	264	2
319	0	4	5
320	0	265	5
321	1	266	2
222	0	187	5
269	0	227	2
284	1	70	2
323	1	267	3
324	1	268	2
326	0	270	3
309	1	256	5
232	1	196	1
325	0	269	2
274	1	61	2
327	0	50	5
281	1	231	2
291	0	24	2
268	0	78	2
329	1	151	2
278	0	9	2
289	1	237	2
330	1	272	3
331	0	273	5
277	0	228	2
332	0	274	5
333	0	275	5
322	0	213	2
334	0	276	5
335	0	277	2
\.


--
-- Name: copy_gen; Type: SEQUENCE SET; Schema: public; Owner: libraryadmin
--

SELECT pg_catalog.setval('copy_gen', 336, true);


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: libraryadmin
--

COPY databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels) FROM stdin;
1457123372258-1	eferreir (generated)	changelog.groovy	2016-03-07 08:43:43.031155	1	EXECUTED	7:ff292245049a0df7200a3a4d418bbf81	dropColumn		\N	3.4.2	\N	\N
1457123372258-2	eferreir (generated)	changelog.groovy	2016-03-07 08:43:43.079796	2	EXECUTED	7:0cae31944c8f299820ff1c168007db73	addDefaultValue		\N	3.4.2	\N	\N
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: libraryadmin
--

COPY databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: library; Type: TABLE DATA; Schema: public; Owner: libraryadmin
--

COPY library (id, name, slug) FROM stdin;
1	Quito	quito
2	Belo Horizonte	bh
3	Porto Alegre	poa
4	Johannesburg	jozi
5	São Paulo	sp
6	Recife	rec
\.


--
-- Name: library_gen; Type: SEQUENCE SET; Schema: public; Owner: libraryadmin
--

SELECT pg_catalog.setval('library_gen', 6, true);


--
-- Data for Name: loan; Type: TABLE DATA; Schema: public; Owner: libraryadmin
--

COPY loan (id, end_date, start_date, copy_id, user_id) FROM stdin;
62	2015-10-20	2015-10-20	100	6
63	2015-10-20	2015-10-20	76	6
64	2015-10-20	2015-10-20	79	6
66	\N	2015-10-22	118	65
67	\N	2015-10-22	119	65
68	\N	2015-10-22	120	65
8	2015-10-14	2015-10-14	46	15
9	2015-10-14	2015-10-14	46	15
10	2015-10-14	2015-10-14	35	16
12	2015-10-14	2015-10-14	36	14
14	2015-10-14	2015-10-14	34	14
13	2015-10-14	2015-10-14	36	14
70	2015-10-23	2015-10-23	121	194
110	2015-12-16	2015-11-27	105	366
72	\N	2015-10-26	123	221
73	2015-10-27	2015-10-27	61	262
74	2015-10-27	2015-10-27	61	273
21	2015-10-14	2015-10-14	60	51
75	2015-10-27	2015-10-27	61	273
23	2015-10-15	2015-10-15	54	53
26	2015-10-15	2015-10-15	37	1
25	2015-10-15	2015-10-15	39	1
24	2015-10-15	2015-10-15	38	1
27	2015-10-15	2015-10-15	58	3
76	2015-10-27	2015-10-27	44	3
30	\N	2015-10-15	35	79
32	\N	2015-10-16	43	97
33	2015-10-16	2015-10-16	70	9
36	2015-10-16	2015-10-16	100	10
37	2015-10-16	2015-10-16	79	10
38	2015-10-16	2015-10-16	105	6
39	2015-10-16	2015-10-16	94	10
40	2015-10-16	2015-10-16	79	10
41	2015-10-16	2015-10-16	80	10
42	2015-10-16	2015-10-16	79	6
43	2015-10-16	2015-10-16	80	6
44	2015-10-16	2015-10-16	79	6
45	2015-10-16	2015-10-16	80	6
46	2015-10-16	2015-10-16	82	6
47	2015-10-16	2015-10-16	80	6
50	2015-10-16	2015-10-16	94	7
48	2015-10-16	2015-10-16	80	6
49	2015-10-16	2015-10-16	106	6
54	2015-10-19	2015-10-19	79	135
55	2015-10-19	2015-10-19	98	175
56	\N	2015-10-19	109	177
57	2015-10-19	2015-10-19	108	179
58	2015-10-19	2015-10-19	80	182
59	\N	2015-10-19	82	188
60	\N	2015-10-20	34	193
35	2015-10-20	2015-10-16	84	10
61	2015-10-20	2015-10-20	98	10
78	\N	2015-10-28	38	66
79	\N	2015-10-28	196	271
80	\N	2015-10-28	197	271
81	2015-10-28	2015-10-28	61	285
82	2015-11-03	2015-11-03	45	70
83	2015-11-05	2015-11-05	61	301
84	2015-11-06	2015-11-06	199	254
87	2015-11-09	2015-11-09	176	306
89	2015-11-12	2015-11-12	170	306
34	2015-11-13	2015-10-16	67	9
51	2015-11-16	2015-10-16	110	131
53	2015-11-16	2015-10-16	112	131
52	2015-11-16	2015-10-16	111	131
93	2015-11-16	2015-11-16	237	182
95	\N	2015-11-16	223	75
96	\N	2015-11-16	237	135
92	2015-11-16	2015-11-16	239	131
98	\N	2015-11-16	234	131
99	\N	2015-11-16	228	131
100	\N	2015-11-16	240	346
90	2015-11-17	2015-11-13	54	66
102	\N	2015-11-18	238	131
103	\N	2015-11-18	239	191
105	2015-11-19	2015-11-19	250	279
106	\N	2015-11-20	172	357
109	2015-11-27	2015-11-25	111	366
111	\N	2015-11-30	229	132
97	2015-11-30	2015-11-16	80	345
112	\N	2015-11-30	68	345
113	\N	2015-11-30	101	345
101	2015-12-01	2015-11-17	245	177
115	\N	2015-12-01	254	10
86	2015-12-02	2015-11-09	45	194
117	\N	2015-12-07	212	361
121	\N	2015-12-08	227	390
1	2015-12-09	2015-10-14	49	1
120	2015-12-10	2015-12-07	267	389
108	2015-12-11	2015-11-24	252	58
123	\N	2015-12-11	271	42
125	\N	2015-12-11	280	72
104	2015-12-11	2015-11-19	54	58
128	\N	2015-12-14	270	423
129	2015-12-14	2015-12-14	71	135
130	2015-12-14	2015-12-14	114	425
131	\N	2015-12-14	67	425
132	\N	2015-12-14	111	425
107	2015-12-15	2015-11-23	233	191
65	2015-12-16	2015-10-21	117	197
135	\N	2015-12-16	49	197
136	\N	2015-12-16	273	15
137	\N	2015-12-17	246	253
118	2015-12-17	2015-12-07	221	387
133	2015-12-18	2015-12-15	275	64
31	2015-12-23	2015-10-15	55	42
138	2015-12-23	2015-12-18	114	428
140	\N	2015-12-24	45	90
141	\N	2015-12-24	252	90
85	2016-01-04	2015-11-06	150	304
150	\N	2016-01-04	211	386
151	\N	2016-01-04	244	486
134	2016-01-04	2015-12-16	105	428
119	2016-01-05	2015-12-07	33	63
149	2016-01-07	2016-01-04	155	304
28	2016-01-07	2015-10-15	46	15
154	\N	2016-01-07	275	64
69	2016-01-07	2015-10-22	62	70
144	2016-01-07	2015-12-29	289	422
139	2016-01-07	2015-12-23	117	422
155	\N	2016-01-07	46	422
126	2016-01-07	2015-12-12	274	58
143	2016-01-07	2015-12-24	284	57
142	2016-01-07	2015-12-24	55	57
157	2016-01-08	2016-01-08	59	12
158	\N	2016-01-08	152	540
159	2016-01-08	2016-01-08	79	10
94	2016-01-11	2015-11-16	230	338
152	2016-01-11	2016-01-05	294	383
160	\N	2016-01-11	55	547
161	\N	2016-01-12	230	6
116	2016-01-12	2015-12-07	138	383
148	2016-01-12	2015-12-30	276	423
162	\N	2016-01-13	276	501
145	2016-01-13	2015-12-30	283	470
165	2016-01-14	2016-01-14	290	423
166	2016-01-14	2016-01-14	290	423
167	\N	2016-01-18	33	84
168	\N	2016-01-19	321	193
170	2016-01-21	2016-01-21	98	583
172	2016-01-25	2016-01-25	59	423
163	2016-01-25	2016-01-13	284	2
164	2016-01-26	2016-01-14	222	558
146	2016-01-26	2015-12-30	269	66
173	\N	2016-01-26	54	66
147	2016-01-26	2015-12-30	37	66
174	\N	2016-01-26	284	66
175	\N	2016-01-27	323	600
176	\N	2016-01-27	324	79
91	2016-01-28	2015-11-13	102	9
178	\N	2016-01-28	232	9
177	2016-01-29	2016-01-28	325	1
179	\N	2016-01-29	274	620
180	\N	2016-01-29	90	485
171	2016-02-04	2016-01-22	322	4
127	2016-02-04	2015-12-14	272	420
153	2016-02-10	2016-01-05	295	304
77	2016-02-15	2015-10-27	60	279
124	2016-02-22	2015-12-11	268	74
122	2016-02-23	2015-12-11	278	73
88	2016-03-03	2015-11-10	200	68
114	2016-02-02	2015-12-01	80	177
181	\N	2016-02-02	328	249
182	2016-02-10	2016-02-03	302	304
183	2016-02-10	2016-02-03	309	304
187	\N	2016-02-10	309	646
188	\N	2016-02-12	157	253
189	\N	2016-02-15	281	57
184	2016-02-15	2016-02-05	39	423
169	2016-02-15	2016-01-19	291	423
191	\N	2016-02-22	329	74
192	\N	2016-02-23	289	57
193	\N	2016-02-24	330	48
194	\N	2016-02-25	78	428
195	\N	2016-02-25	150	679
196	\N	2016-02-25	145	679
197	2016-02-29	2016-02-26	277	681
186	2016-02-29	2016-02-10	322	348
185	2016-03-02	2016-02-10	155	304
198	2016-03-03	2016-03-03	194	700
199	2016-03-03	2016-03-03	166	700
200	\N	2016-03-03	139	558
201	2016-03-04	2016-03-04	166	700
202	2016-03-04	2016-03-04	166	700
203	2016-03-04	2016-03-04	167	700
190	2016-03-07	2016-02-15	60	423
204	\N	2016-03-07	60	423
205	2016-03-07	2016-03-07	51	423
206	\N	2016-03-07	51	423
156	2016-03-08	2016-01-07	317	58
\.


--
-- Name: loan_gen; Type: SEQUENCE SET; Schema: public; Owner: libraryadmin
--

SELECT pg_catalog.setval('loan_gen', 206, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: libraryadmin
--

COPY users (id, email, name) FROM stdin;
1	alisboa@thoughtworks.com	Adriano Lisboa
2	fantunes@thoughtworks.com	Felipe Antunes
3	tcarmo@thoughtworks.com	Tiago Carmo
4	eduarte@thoughtworks.com	Elio Duarte
6	mcorrale@thoughtworks.com	David Corrales
7	dalcocer@thoughtworks.com	Diego Alcocer
338	edelgado@thoughtworks.com	Ernesto Medina Delgado
9	mduenias@thoughtworks.com	Maria Elena Duenias
10	jmorales@thoughtworks.com	Jessica Morales
340	jreyes@thoughtworks.com	Jonathan Reyes
12	disrael@thoughtworks.com	Dawson Israel
97	nmenhem@thoughtworks.com	Natalia Menhem
14	jdornel@thoughtworks.com	Juliana Dorneles
15	pprado@thoughtworks.com	Patrick Prado
16	lguimara@thoughtworks.com	Leandro Guimaraes
17	lmunda@thoughtworks.com	Luz Marina Unda
19	agarcia@thoughtworks.com	Ariam Garcia
346	cfuentes@thoughtworks.com	Carlos Fuentes
348	rmaia@thoughtworks.com	Rodrigo Maia
250	mbalhest@thoughtworks.com	Maite Balhester
252	ddeva@thoughtworks.com	Dhiana Deva
254	fmartins@thoughtworks.com	Fernanda Martins
444	mviegas@thoughtworks.com	Marcio Viegas
354	gchasifa@thoughtworks.com	Gabriela Chasifan
262	omachado@thoughtworks.com	Otavio Rodrigues Machado
264	cborim@thoughtworks.com	Carolina Borim
266	gprestes@thoughtworks.com	Guilherme Prestes
268	lmello@thoughtworks.com	Luciene Mello
174	mjormaza@thoughtworks.com	Maria Jose Ormaza
175	sriprak@thoughtworks.com	Sri Prasanna K
270	mneris@thoughtworks.com	Marrony Neris
177	fcoronel@thoughtworks.com	Freddy Coronel
37	josilvam@thoughtworks.com	Jose Silva
272	aamaral@thoughtworks.com	Augusto Amaral
179	digarcia@thoughtworks.com	Diana Garcia
181	geguez@thoughtworks.com	Gustavo Eguez
42	fviane@thoughtworks.com	Francieli Viane
43	lsouza@thoughtworks.com	Luiza Souza
182	arodrig@thoughtworks.com	Adisleydis Rodríguez
276	lpalmas@thoughtworks.com	Leticia Nunes
46	psilva@thoughtworks.com	Pedro Silva
47	ebraga@thoughtworks.com	Eduardo Braga
48	fmorais@thoughtworks.com	Felipe Morais
51	tcruz@thoughtworks.com	Tulio Cruz
186	mtait@thoughtworks.com	Matheus Tait
53	tmegale@thoughtworks.com	Tiago Megale
282	gdutra@thoughtworks.com	Guilherme Dutra
188	rsalazar@thoughtworks.com	Rodrigo Salazar
56	btrecent@thoughtworks.com	Bruno Trecenti
57	rlemos@thoughtworks.com	Raquel Lemos
58	lalonso@thoughtworks.com	Leandro Alonso
191	mmurillo@thoughtworks.com	Mauricio Murillo
366	btorres@thoughtworks.com	Byron Torres
63	fzampa@thoughtworks.com	Felipe Zampa
64	gmelo@thoughtworks.com	Gregorio Melo
65	gvinici@thoughtworks.com	Glauco Vinicius
66	gfroes@thoughtworks.com	Guilherme Froes
131	fureta@thoughtworks.com	Felipe Ureta
68	dnotini@thoughtworks.com	Denise Notini
132	rparedes@thoughtworks.com	Roberto Paredes
70	bdias@thoughtworks.com	Bruno Dias
71	dsilva@thoughtworks.com	Diogo Silva
72	acarvalh@thoughtworks.com	Anderson Carvalho
73	raolivei@thoughtworks.com	Rafael de Almeida Oliveira
74	mcosta@thoughtworks.com	Mateus Costa
75	lnunes@thoughtworks.com	Luiza Nunes
193	ldelfim@thoughtworks.com	Flavia Delfim
194	cboadu@thoughtworks.com	Charles Akoto Boadu
78	bsanches@thoughtworks.com	Barbara Sanches
79	ajmartin@thoughtworks.com	Agda Martins
135	fescobar@thoughtworks.com	Freddy Escobar
195	mscudero@thoughtworks.com	María Fernanda Escudero
83	gnotari@thoughtworks.com	Gabriel Notari
84	procha@thoughtworks.com	Pedro Rocha
197	mbueno@thoughtworks.com	Michel Bueno
199	mganine@thoughtworks.com	Marcos Ganine
90	lavila@thoughtworks.com	Lucas Avila
91	rgoncalv@thoughtworks.com	Ramon Goncalves
298	lramag@thoughtworks.com	Luciano Ramalho
302	tkrische@thoughtworks.com	Thais Krischer
304	vandrade@thoughtworks.com	Vinicius Andrade
306	rguimar@thoughtworks.com	Raquel Guimaraes
207	Jmercad@thoughtworks.com	Jesus Mercado
386	hsoejima@thoughtworks.com	Henrique Soejima
214	gargenti@thoughtworks.com	Gustavo Argentino
390	spuente@thoughtworks.com	Sebastian Puente
392	mrodrigu@thoughtworks.com	Marcus Rodrigues
221	tsiqueir@thoughtworks.com	Thais Siqueira
345	cpinto@thoughtworks.com	Cristian Pinto
249	voliveir@thoughtworks.com	Vania Oliveira
251	ccarrara@thoughtworks.com	Caio Carrara
253	abarbos@thoughtworks.com	Alexandre Barbosa
255	btavare@thoughtworks.com	Bruno Tavares
257	vcosta@thoughtworks.com	Vinicius Costa
259	hrodrigu@thoughtworks.com	Henrique Rodrigues
261	vgama@thoughtworks.com	Vinicius Gama
447	bleonar@thoughtworks.com	Bruno Silva
265	rsoares@thoughtworks.com	Roberto Soares
267	lcampos@thoughtworks.com	Leonardo Campos
269	rliedke@thoughtworks.com	Raquel Liedke
271	jengler@thoughtworks.com	Jonas Engler
273	txavier@thoughtworks.com	Thiago Xavier
275	gliberat@thoughtworks.com	Giovane Liberato
277	acosta@thoughtworks.com	Anne Costa
279	jsantana@thoughtworks.com	Joao Lucas Santana
353	rvallejo@thoughtworks.com	Rodrigo Vallejo
285	dbianche@thoughtworks.com	Diego Bianchetti
357	alacerda@thoughtworks.com	Ana Lacerda
291	greis@thoughtworks.com	Guilherme Reis
293	rretamal@thoughtworks.com	Ricardo Retamal
361	lramalho@thoughtworks.com	Luciano Ramalho
299	imedeiro@thoughtworks.com	Igor Medeiros
301	dbarboza@thoughtworks.com	Danilo Barboza
315	pchavez@thoughtworks.com	Pamela Chavez
381	mnetto@thoughtworks.com	Manoel Netto
325	rcastill@thoughtworks.com	Ramiro Castillo
383	rgomes@thoughtworks.com	Rafael Gomes
387	dcosta@thoughtworks.com	Denis Costa
389	mrueda@thoughtworks.com	Miguel Rueda
391	pevange@thoughtworks.com	Pedro Evangelista
393	kyzhang@thoughtworks.com	Kai Y Zhang
404	cvieira@thoughtworks.com	Carolina Vieira
406	rwendel@thoughtworks.com	Ricardo Wendell
420	adomenic@thoughtworks.com	Adriano Domeniconi
422	lrocha@thoughtworks.com	Lisiane Rocha
423	eferreir@thoughtworks.com	Elayne Ferreira
425	lvargas@thoughtworks.com	Luis Vargas
428	vrodrig@thoughtworks.com	Veronica Rodriguez
470	fdornela@thoughtworks.com	Felipe Dornelas
476	fpio@thoughtworks.com	Fabio Pio
485	sceli@thoughtworks.com	Sofia Celi
486	vzapata@thoughtworks.com	Valentin Zapata
488	agomes@thoughtworks.com	Ana Paula Gomes
490	tfernand@thoughtworks.com	Tayane Fernandes
500	tcasagra@thoughtworks.com	Tulio Casagrande
501	nmoura@thoughtworks.com	Nayara Moura
597	msanches@thoughtworks.com	Mauricio Sanches
700	vlima@thoughtworks.com	Vanessa Lima
600	jgama@thoughtworks.com	Josi Gama
602	larmand@thoughtworks.com	Luis Armando Bianchin
606	mderaldo@thoughtworks.com	Melina Deraldo
518	settwai@thoughtworks.com	Sett Wai
607	jfarah@thoughtworks.com	Julio Farah
609	yueliu@thoughtworks.com	Yue Liu
612	gmaier@thoughtworks.com	Gabriel Pereira
616	lbeier@thoughtworks.com	Lucas Beier
620	mbrizeno@thoughtworks.com	Marcos Brizeno
534	ntsakoc@thoughtworks.com	Ntsako Gift Chauke
622	gmiranda@thoughtworks.com	Gustavo Azevedo
540	tuxavier@thoughtworks.com	Turah Xavier
541	lmedina@thoughtworks.com	Lucas Medina
545	calbuque@thoughtworks.com	Carina Albuquerque
547	rsantos@thoughtworks.com	Romulo Santos
631	tkubotan@thoughtworks.com	Tatiana Kubotani
558	vbarbosa@thoughtworks.com	Vitor Barbosa
559	iecheve@thoughtworks.com	Elena Echeverria
642	jblandin@thoughtworks.com	Jessica Blandina
644	molivei@thoughtworks.com	Marcelo Oliveira
646	gcasagra@thoughtworks.com	Gabriela Casagranda
650	mmachica@thoughtworks.com	Mauricio Machicado
655	gbrigidi@thoughtworks.com	Gabriel Brigidi
658	ialbuqu@thoughtworks.com	Isabella Albuquerque
580	lemme@thoughtworks.com	Luisa Emme
583	vperez@thoughtworks.com	Viviana Perez
701	tsoares@thoughtworks.com	Tomas Soares
705	einacio@thoughtworks.com	Erika Inacio
679	chigashi@thoughtworks.com	Cristiane Higashi
681	ronakja@thoughtworks.com	Ronak Jain
690	dvillaci@thoughtworks.com	Diego Villacis
\.


--
-- Name: users_gen; Type: SEQUENCE SET; Schema: public; Owner: libraryadmin
--

SELECT pg_catalog.setval('users_gen', 744, true);


--
-- Data for Name: waitinglist; Type: TABLE DATA; Schema: public; Owner: libraryadmin
--

COPY waitinglist (id, end_date, start_date, book_id, library_id, user_id) FROM stdin;
\.


--
-- Name: waitinglist_gen; Type: SEQUENCE SET; Schema: public; Owner: libraryadmin
--

SELECT pg_catalog.setval('waitinglist_gen', 1, false);


--
-- Name: book_pkey; Type: CONSTRAINT; Schema: public; Owner: libraryadmin; Tablespace: 
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- Name: copy_pkey; Type: CONSTRAINT; Schema: public; Owner: libraryadmin; Tablespace: 
--

ALTER TABLE ONLY copy
    ADD CONSTRAINT copy_pkey PRIMARY KEY (id);


--
-- Name: library_pkey; Type: CONSTRAINT; Schema: public; Owner: libraryadmin; Tablespace: 
--

ALTER TABLE ONLY library
    ADD CONSTRAINT library_pkey PRIMARY KEY (id);


--
-- Name: loan_pkey; Type: CONSTRAINT; Schema: public; Owner: libraryadmin; Tablespace: 
--

ALTER TABLE ONLY loan
    ADD CONSTRAINT loan_pkey PRIMARY KEY (id);


--
-- Name: pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: libraryadmin; Tablespace: 
--

ALTER TABLE ONLY databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: uk_5nj8t1hc0l2kvb1r212p2lhkx; Type: CONSTRAINT; Schema: public; Owner: libraryadmin; Tablespace: 
--

ALTER TABLE ONLY library
    ADD CONSTRAINT uk_5nj8t1hc0l2kvb1r212p2lhkx UNIQUE (slug);


--
-- Name: uk_6dotkott2kjsp8vw4d0m25fb7; Type: CONSTRAINT; Schema: public; Owner: libraryadmin; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT uk_6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: libraryadmin; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: waitinglist_pkey; Type: CONSTRAINT; Schema: public; Owner: libraryadmin; Tablespace: 
--

ALTER TABLE ONLY waitinglist
    ADD CONSTRAINT waitinglist_pkey PRIMARY KEY (id);


--
-- Name: fk_5nr6joxxjm233xyongnbacj1f; Type: FK CONSTRAINT; Schema: public; Owner: libraryadmin
--

ALTER TABLE ONLY copy
    ADD CONSTRAINT fk_5nr6joxxjm233xyongnbacj1f FOREIGN KEY (book_id) REFERENCES book(id);


--
-- Name: fk_9e00wniurtr8oqb6i164homop; Type: FK CONSTRAINT; Schema: public; Owner: libraryadmin
--

ALTER TABLE ONLY waitinglist
    ADD CONSTRAINT fk_9e00wniurtr8oqb6i164homop FOREIGN KEY (library_id) REFERENCES library(id);


--
-- Name: fk_bwuisnj36jfuu5e55crd3dp0x; Type: FK CONSTRAINT; Schema: public; Owner: libraryadmin
--

ALTER TABLE ONLY copy
    ADD CONSTRAINT fk_bwuisnj36jfuu5e55crd3dp0x FOREIGN KEY (library_id) REFERENCES library(id);


--
-- Name: fk_eqno849fya3lf1n3sf1hng7ni; Type: FK CONSTRAINT; Schema: public; Owner: libraryadmin
--

ALTER TABLE ONLY waitinglist
    ADD CONSTRAINT fk_eqno849fya3lf1n3sf1hng7ni FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_f7obux2dkllw86emoch3jejy7; Type: FK CONSTRAINT; Schema: public; Owner: libraryadmin
--

ALTER TABLE ONLY loan
    ADD CONSTRAINT fk_f7obux2dkllw86emoch3jejy7 FOREIGN KEY (copy_id) REFERENCES copy(id);


--
-- Name: fk_snp5j1a5kw8r7f2kv1pxu9hp0; Type: FK CONSTRAINT; Schema: public; Owner: libraryadmin
--

ALTER TABLE ONLY loan
    ADD CONSTRAINT fk_snp5j1a5kw8r7f2kv1pxu9hp0 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_socuygl9cpvxt4k46pc7j12uv; Type: FK CONSTRAINT; Schema: public; Owner: libraryadmin
--

ALTER TABLE ONLY waitinglist
    ADD CONSTRAINT fk_socuygl9cpvxt4k46pc7j12uv FOREIGN KEY (book_id) REFERENCES book(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

