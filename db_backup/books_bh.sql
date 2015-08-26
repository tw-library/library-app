--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.4
-- Started on 2015-08-26 13:19:14 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 181 (class 3079 OID 11861)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2044 (class 0 OID 0)
-- Dependencies: 181
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 1676309)
-- Name: book; Type: TABLE; Schema: public; Owner: bvdgrnmflvqaqk; Tablespace: 
--

CREATE TABLE book (
    id integer NOT NULL,
    author character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    donator character varying(255),
    imageurl text,
    isbn13 bigint,
    numberofpages integer,
    publicationdate character varying(255),
    publisher character varying(255),
    subtitle character varying(255),
    isbn bigint
);


ALTER TABLE book OWNER TO bvdgrnmflvqaqk;

--
-- TOC entry 177 (class 1259 OID 1676347)
-- Name: book_gen; Type: SEQUENCE; Schema: public; Owner: bvdgrnmflvqaqk
--

CREATE SEQUENCE book_gen
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE book_gen OWNER TO bvdgrnmflvqaqk;

--
-- TOC entry 174 (class 1259 OID 1676317)
-- Name: copy; Type: TABLE; Schema: public; Owner: bvdgrnmflvqaqk; Tablespace: 
--

CREATE TABLE copy (
    id integer NOT NULL,
    status integer,
    book_id integer,
    library_id integer NOT NULL,
    donator character varying(255)
);


ALTER TABLE copy OWNER TO bvdgrnmflvqaqk;

--
-- TOC entry 178 (class 1259 OID 1676349)
-- Name: copy_gen; Type: SEQUENCE; Schema: public; Owner: bvdgrnmflvqaqk
--

CREATE SEQUENCE copy_gen
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE copy_gen OWNER TO bvdgrnmflvqaqk;

--
-- TOC entry 172 (class 1259 OID 1546124)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: bvdgrnmflvqaqk
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO bvdgrnmflvqaqk;

--
-- TOC entry 175 (class 1259 OID 1676322)
-- Name: library; Type: TABLE; Schema: public; Owner: bvdgrnmflvqaqk; Tablespace: 
--

CREATE TABLE library (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(30)
);


ALTER TABLE library OWNER TO bvdgrnmflvqaqk;

--
-- TOC entry 179 (class 1259 OID 1676351)
-- Name: library_gen; Type: SEQUENCE; Schema: public; Owner: bvdgrnmflvqaqk
--

CREATE SEQUENCE library_gen
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE library_gen OWNER TO bvdgrnmflvqaqk;

--
-- TOC entry 176 (class 1259 OID 1676327)
-- Name: loan; Type: TABLE; Schema: public; Owner: bvdgrnmflvqaqk; Tablespace: 
--

CREATE TABLE loan (
    id integer NOT NULL,
    end_date date,
    start_date date,
    copy_id integer,
    email character varying(255) NOT NULL
);


ALTER TABLE loan OWNER TO bvdgrnmflvqaqk;

--
-- TOC entry 180 (class 1259 OID 1676353)
-- Name: loan_gen; Type: SEQUENCE; Schema: public; Owner: bvdgrnmflvqaqk
--

CREATE SEQUENCE loan_gen
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE loan_gen OWNER TO bvdgrnmflvqaqk;

--
-- TOC entry 2029 (class 0 OID 1676309)
-- Dependencies: 173
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: bvdgrnmflvqaqk
--

INSERT INTO book VALUES (71, 'Andrew Hunt,David Thomas', 'The Pragmatic Programmer', 'What others in the trenches say about The Pragmatic Programmer... “The cool thing about this book is that it’s great for keeping the programming process fresh. The book helps you to continue to grow and clearly comes from people who have been there.” —Kent Beck, author of Extreme Programming Explained: Embrace Change “I found this book to be a great mix of solid advice and wonderful analogies!” —Martin Fowler, author of Refactoring and UML Distilled “I would buy a copy, read it twice, then tell all my colleagues to run out and grab a copy. This is a book I would never loan because I would worry about it being lost.” —Kevin Ruland, Management Science, MSG-Logistics “The wisdom and practical experience of the authors is obvious. The topics presented are relevant and useful.... By far its greatest strength for me has been the outstanding analogies—tracer bullets, broken windows, and the fabulous helicopter-based explanation of the need for orthogonality, especially in a crisis situation. I have little doubt that this book will eventually become an excellent source of useful information for journeymen programmers and expert mentors alike.” —John Lakos, author of Large-Scale C++ Software Design “This is the sort of book I will buy a dozen copies of when it comes out so I can give it to my clients.” —Eric Vought, Software Engineer “Most modern books on software development fail to cover the basics of what makes a great software developer, instead spending their time on syntax or technology where in reality the greatest leverage possible for any software team is in having talented developers who really know their craft well. An excellent book.” —Pete McBreen, Independent Consultant “Since reading this book, I have implemented many of the practical suggestions and tips it contains. Across the board, they have saved my company time and money while helping me get my job done quicker! This should be a desktop reference for everyone who works with code for a living.” —Jared Richardson, Senior Software Developer, iRenaissance, Inc. “I would like to see this issued to every new employee at my company....” —Chris Cleeland, Senior Software Engineer, Object Computing, Inc. “If I’m putting together a project, it’s the authors of this book that I want. . . . And failing that I’d settle for people who’ve read their book.” —Ward Cunningham Straight from the programming trenches, The Pragmatic Programmer cuts through the increasing specialization and technicalities of modern software development to examine the core process--taking a requirement and producing working, maintainable code that delights its users. It covers topics ranging from personal responsibility and career development to architectural techniques for keeping your code flexible and easy to adapt and reuse. Read this book, and you''ll learn how to Fight software rot; Avoid the trap of duplicating knowledge; Write flexible, dynamic, and adaptable code; Avoid programming by coincidence; Bullet-proof your code with contracts, assertions, and exceptions; Capture real requirements; Test ruthlessly and effectively; Delight your users; Build teams of pragmatic programmers; and Make your developments more precise with automation. Written as a series of self-contained sections and filled with entertaining anecdotes, thoughtful examples, and interesting analogies, The Pragmatic Programmer illustrates the best practices and major pitfalls of many different aspects of software development. Whether you''re a new coder, an experienced programmer, or a manager responsible for software projects, use these lessons daily, and you''ll quickly see improvements in personal productivity, accuracy, and job satisfaction. You''ll learn skills and develop habits and attitudes that form the foundation for long-term success in your career. You''ll become a Pragmatic Programmer.', NULL, 'http://books.google.com.br/books/content?id=5wBQEp6ruIAC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', NULL, 9999, '1999-10-20', 'Addison-Wesley Professional', 'From Journeyman to Master', 9780132119177);
INSERT INTO book VALUES (72, 'Steve Freeman,Nat Pryce', 'Growing Object-oriented Software, Guided by Tests', 'Foreword by Kent Beck "The authors of this book have led a revolution in the craft of programming by controlling the environment in which software grows." --Ward Cunningham "At last, a book suffused with code that exposes the deep symbiosis between TDD and OOD. This one''s a keeper." --Robert C. Martin "If you want to be an expert in the state of the art in TDD, you need to understand the ideas in this book."--Michael Feathers Test-Driven Development (TDD) is now an established technique for delivering better software faster. TDD is based on a simple idea: Write tests for your code before you write the code itself. However, this "simple" idea takes skill and judgment to do well. Now there''s a practical guide to TDD that takes you beyond the basic concepts. Drawing on a decade of experience building real-world systems, two TDD pioneers show how to let tests guide your development and "grow" software that is coherent, reliable, and maintainable. Steve Freeman and Nat Pryce describe the processes they use, the design principles they strive to achieve, and some of the tools that help them get the job done. Through an extended worked example, you''ll learn how TDD works at multiple levels, using tests to drive the features and the object-oriented structure of the code, and using Mock Objects to discover and then describe relationships between objects. Along the way, the book systematically addresses challenges that development teams encounter with TDD--from integrating TDD into your processes to testing your most difficult features. Coverage includes * Implementing TDD effectively: getting started, and maintaining your momentum throughout the project * Creating cleaner, more expressive, more sustainable code * Using tests to stay relentlessly focused on sustaining quality * Understanding how TDD, Mock Objects, and Object-Oriented Design come together in the context of a real software development project * Using Mock Objects to guide object-oriented designs * Succeeding where TDD is difficult: managing complex test data, and testing persistence and concurrency', NULL, 'http://books.google.com.br/books/content?id=vkb7mAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', NULL, 9999, '2010', 'Addison-Wesley Professional', NULL, 9780321503626);
INSERT INTO book VALUES (73, 'Gerald M. Weinberg', 'The Secrets of Consulting', 'If you are a consultant, ever use one, or want to be one, this book will show you how to succeed. With wit, charm, humor, and wisdom, Gerald M. Weinberg shows you exactly how to become a more effective consultant. He reveals specific techniques and strategies that really work. Through the use of vividly memorable rules, laws, and principles -- such as The Law of Raspberry Jam, The Potato Chip Principle, and Lessons from the Farm -- the author shows you how to -- price and market your services -- avoid traps and find alternative approaches -- keep ahead of your clients -- create a special "consultant''s survival kit" -- trade improvement for perfection -- negotiate in difficult situations -- measure your effectiveness -- be yourself You will also find straightforward advice on marketing your services, including how to -- find clients -- get needed exposure -- set just-right fees -- gain trust The Secrets of Consulting -- techniques, strategies, and first-hand experiences -- all that you''ll need to set up, run, and be successful at your own consulting business.', NULL, 'http://books.google.com.br/books/content?id=dse2q-xhTLIC&printsec=frontcover&img=1&zoom=1&source=gbs_api', NULL, 9999, '1985-01-01', 'Dorset House', 'A Guide to Giving & Getting Advice Successfully', 9780932633019);
INSERT INTO book VALUES (74, 'Kerry Patterson,Joseph Grenny,Ron McMillan,Al Switzler,David Maxfield', 'Crucial Accountability: Tools for Resolving Violated Expectations, Broken Commitments, and Bad Behavior, Second Edition ( Paperback)', 'Hold anyone accountable. Master performance discussions. Get RESULTS. Broken promises, missed deadlines, poor behavior--they don''t just make others'' lives miserable; they can sap up to 50 percent of organizational performance and account for the vast majority of divorces. Crucial Accountability offers the tools for improving relationships in the workplace and in life and for resolving all these problems--permanently. PRAISE FOR CRUCIAL ACCOUNTABILITY: "Revolutionary ideas ... opportunities for breakthrough ..." -- Stephen R. Covey, author of The 7 Habits of Highly Effective People "Unleash the true potential of a relationship or organization and move it to the next level." -- Ken Blanchard, coauthor of The One Minute Manager "The most recommended and most effective resource in my library." -- Stacey Allerton Firth, Vice President, Human Resources, Ford of Canada "Brilliant strategies for those difficult discussions at home and in the workplace." -- Soledad O’Brien, CNN news anchor and producer "This book is the real deal.... Read it, underline it, learn from it. It''s a gem." -- Mike Murray, VP Human Resources and Administration (retired), Microsoft', NULL, 'http://books.google.com.br/books/content?id=bQhSkDdQ_AMC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', NULL, 9999, '2013-05-24', 'McGraw-Hill Professional', NULL, 9780071829311);
INSERT INTO book VALUES (75, 'Kerry Patterson,Joseph Grenny,Ron McMillan,Al Switzler', 'Crucial Conversations Tools for Talking When Stakes Are High, Second Edition', 'The New York Times and Washington Post bestseller that changed the way millions communicate “[Crucial Conversations] draws our attention to those defining moments that literally shape our lives, our relationships, and our world. . . . This book deserves to take its place as one of the key thought leadership contributions of our time.” —from the Foreword by Stephen R. Covey, author of The 7 Habits of Highly Effective People “The quality of your life comes out of the quality of your dialogues and conversations. Here’s how to instantly uplift your crucial conversations.” —Mark Victor Hansen, cocreator of the #1 New York Times bestselling series Chicken Soup for the Soul® The first edition of Crucial Conversations exploded onto the scene and revolutionized the way millions of people communicate when stakes are high. This new edition gives you the tools to: Prepare for high-stakes situations Transform anger and hurt feelings into powerful dialogue Make it safe to talk about almost anything Be persuasive, not abrasive', NULL, 'http://books.google.com.br/books/content?id=VhkQpRH9D9gC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', NULL, 9999, '2011-09-16', 'McGraw Hill Professional', NULL, 9780071772204);
INSERT INTO book VALUES (76, 'David Sherwin', 'Creative Workshop', 'Have you ever struggled to complete a design project on time? Or felt that having a tight deadline stifled your capacity for maximum creativity? If so, then this book is for you. Within these pages, you''ll find 80 creative challenges that will help you achieve a breadth of stronger design solutions, in various media, within any set time period. Exercises range from creating a typeface in an hour to designing a paper robot in an afternoon to designing web pages and other interactive experiences. Each exercise includes compelling visual solutions from other designers and background stories to help you increase your capacity to innovate. Creative Workshop also includes useful brainstorming techniques and wisdom from some of today''s top designers. By road-testing these techniques as you attempt each challenge, you''ll find new and more effective ways to solve tough design problems and bring your solutions to vibrant life.', NULL, 'http://books.google.com.br/books/content?id=mTSNYmfEIykC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', NULL, 9999, '2010-11-24', 'HOW Books', '80 Challenges to Sharpen Your Design Skills', 9781600617973);
INSERT INTO book VALUES (77, 'Tim Brown', 'Change by Design', 'The myth of innovation is that brilliant ideas leap fully formed from the minds of geniuses. The reality is that most innovations come from a process of rigorous examination through which great ideas are identified and developed before being realized as new offerings and capabilities. This book introduces the idea of design thinking‚ the collaborative process by which the designer′s sensibilities and methods are employed to match people′s needs not only with what is technically feasible and a viable business strategy. In short‚ design thinking converts need into demand. It′s a human−centered approach to problem solving that helps people and organizations become more innovative and more creative. Design thinking is not just applicable to so−called creative industries or people who work in the design field. It′s a methodology that has been used by organizations such as Kaiser Permanente to icnrease the quality of patient care by re−examining the ways that their nurses manage shift change‚ or Kraft to rethink supply chain management. This is not a book by designers for designers; this is a book for creative leaders seeking to infuse design thinking into every level of an organization‚ product‚ or service to drive new alternatives for business and society.', NULL, 'http://books.google.com.br/books/content?id=FGfglgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', NULL, 9999, '2009-09-29', 'HarperBusiness', 'How Design Thinking Transforms Organizations and Inspires Innovation', 9780061766084);
INSERT INTO book VALUES (80, 'Addy Osmani', 'Learning JavaScript Design Patterns', 'An introduction to writing code with JavaScript using classical and modern design patterns, including modules, observers, facades, and mediators.', NULL, 'http://books.google.com.br/books/content?id=JYPEgK-1bZoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', NULL, 9999, '2012-08-20', '"O''Reilly Media, Inc."', NULL, 9781449331818);
INSERT INTO book VALUES (81, 'Jeff Gothelf,Josh Seiden', 'Lean UX', 'User experience (UX) design has traditionally been a deliverables-based practice, with wireframes, site maps, flow diagrams, and mockups. But in today’s web-driven reality, orchestrating the entire design from the get-go no longer works. This hands-on book demonstrates Lean UX, a deeply collaborative and cross-functional process that lets you strip away heavy deliverables in favor of building shared understanding with the rest of the product team. Lean UX is the evolution of product design; refined through the real-world experiences of companies large and small, these practices and principles help you maintain daily, continuous engagement with your teammates, rather than work in isolation. This book shows you how to use Lean UX on your own projects. Get a tactical understanding of Lean UX—and how it changes the way teams work together Frame a vision of the problem you’re solving and focus your team on the right outcomes Bring the designer’s tool kit to the rest of your product team Break down the silos created by job titles and learn to trust your teammates Improve the quality and productivity of your teams, and focus on validated experiences as opposed to deliverables/documents Learn how Lean UX integrates with Agile UX', NULL, 'http://books.google.com.br/books/content?id=7TDQ4WZ1BHoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', NULL, 9999, '2013-03-15', '"O''Reilly Media, Inc."', 'Applying Lean Principles to Improve User Experience', 9781449311650);
INSERT INTO book VALUES (82, 'Steve Krug', 'Rocket Surgery Made Easy', 'Spells out an approach to usability testing that anyone can easily apply to his or her own website, application or other product, in a book that explains how to test any design, keep one''s focus on finding the most important problems and fix the problems one finds using the author''s "the least you can do" approach. Original.', NULL, 'http://books.google.com.br/books/content?id=VzbimAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', NULL, 9999, '2010-01', 'New Riders Pub', 'The Do-it-yourself Guide to Finding and Fixing Usability Problems', 9780321657299);
INSERT INTO book VALUES (83, 'Aurelio Marinho Jargas', 'Expressões Regulares', 'Em uma abordagem incomum de encontrar em livros técnicos, as explicações didáticas e divertidas tornam prazerosa a leitura de um tema tão árido e abstrato. É uma conversa entre amigos, partindo do básico até chegar aos conceitos avançados. Esta obra revela aos poucos o poder das expressões, o leitor irá saborear o tema descobrindo seus segredos descontraidamente.', NULL, 'http://www.piazinho.com.br/ed3/capa-300.jpg', NULL, 208, '2009', 'Novatec', 'Uma abordagem divertida', NULL);
INSERT INTO book VALUES (84, 'Paulo Caroli', 'Thoughtworks Antologia Brasil', 'Estar na vanguarda das tecnologias e metodologias de desenvolvimento é uma das principais características da ThoughtWorks, empresa reconhecida mundialmente e onde trabalham nomes como Martin Fowler, Danilo Sato, Rebecca Parsons, Paulo Caroli e muitos outros expoentes da área.  Neste livro, vários colaboradores da ThoughtWorks passam suas experiências com as mais variadas tecnologias e metodologias. Você vai aprender sobre BDD, testes com JavaScript, inovação em startups, agilidade, técnicas de retrospectivas, técnicas avançadas de trabalho com controle de versão e muito mais.  É um livro indispensável para quem quer se manter atualizado e entender as tecnologias e métodos trabalhados na principal empresa de consultoria da área.', NULL, 'http://cdn.shopify.com/s/files/1/0155/7645/products/thoughtworks-antologia-featured_large.png?v=1416319002', NULL, 9999, '11/2014', 'Casa do Códigos', 'Histórias de aprendizado e inovação', NULL);
INSERT INTO book VALUES (78, 'Cidinha da Silva', 'Racismo no Brasil e afetos correlatos', NULL, NULL, 'http://images.livrariasaraiva.com.br/imagemnet/imagem.aspx/?pro_id=8871656&qld=90&l=370&a=-1', NULL, 9999, '2013', NULL, NULL, 9788567544007);
INSERT INTO book VALUES (88, 'Paola Prandini', 'Cruz e Souza', 'A biografia do poeta simbolista negro Cruz e Sousa, conhecido como o “Cisne Negro”, retrata a trajetória de um dos mais importantes escritores brasileiros. Resgatando momentos como a infância em Santa Catarina, a dedicação à literatura e a luta pela abolição da escravatura, o livro destaca sua produção como poeta vanguardista e traz dados sobre peças e filmes inspirados no autor.
Esta obra faz parte da Coleção Retratos do Brasil Negro, coordenada por Vera Lúcia Benedito, mestre e doutora em Sociologia/Estudos Urbanos pela Michigan State University (EUA) e pesquisadora e consultora da Secretaria de Estado da Cultura de São Paulo. O objetivo da Coleção é abordar a vida e a obra de figuras fundamentais da cultura, da política e da militância negra.', NULL, 'http://www.gruposummus.com.br/images/imprensa/40048.jpg', NULL, 9999, NULL, 'Selo Negro', NULL, NULL);
INSERT INTO book VALUES (85, 'Martin Fowler, Kent Beck, John Brant, William Opdyke, Don Roberts', 'Refactoring', 'Refactoring is about improving the design of existing code. It is the process of changing a software system in such a way that it does not alter the external behavior of the code, yet improves its internal structure. With refactoring you can even take a bad design and rework it into a good one. This book offers a thorough discussion of the principles of refactoring, including where to spot opportunities for refactoring, and how to set up the required tests. There is also a catalog of more than 40 proven refactorings with details as to when and why to use the refactoring, step by step instructions for implementing it, and an example illustrating how it works The book is written using Java as its principle language, but the ideas are applicable to any OO language.', NULL, 'http://ecx.images-amazon.com/images/I/512-aYxS4ML._SX385_.jpg', NULL, 9999, '1999', 'Addison-Wesley Professional', 'Improving the Design of Existing Code', NULL);
INSERT INTO book VALUES (86, 'Danilo Sato', 'DevOps na prática', 'Entregar software em produção é um processo que tem se tornado cada vez mais difícil no departamento de TI de diversas empresas. Ciclos longos de teste e divisões entre as equipes de desenvolvimento e de operações são alguns dos fatores que contribuem para este problema. Mesmo equipes ágeis que produzem software entregável ao final de cada iteração sofrem para chegar em produção quando encontram estas barreiras.', NULL, 'http://cdn.shopify.com/s/files/1/0155/7645/products/devops-featured_large.png?v=1411489207', NULL, 248, '10/2013', 'Casa do Código', 'entrega de software confiável e automatizada', NULL);
INSERT INTO book VALUES (87, 'Marc Lamont Hill', 'Batidas, Rimas e Vida Escolar', 'Este livro vem preencher uma lacuna no debate teórico sobre duas questões primordiais envolvendo a temática da identidade cultural. A primeira, que se refere ao multiculturalismo crítico, ao qual o autor articula uma proposta de pedagogia crítica inspirada no hip-hop. A segunda, que remete a identidade cultural à luta pelo reconhecimento das culturas dos povos historicamente prejudicados, como tem sustentado o filósofo frankfurtiano, Axel Honneth. A ideia central de Hill é conhecer a cultura e os problemas da comunidade trazidos pelos alunos em sala de aula e com eles compartilhar suas angústias, respeitando os seus modos de ser e de se expressar.', NULL, 'http://images.livrariasaraiva.com.br/imagemnet/imagem.aspx/?pro_id=8258565&qld=90&l=370&a=-1', NULL, 272, NULL, 'Vozes', 'Pedagogia Hip-Hop e As Políticas de Identidade', NULL);
INSERT INTO book VALUES (89, 'Diego Balbino, Paola Prandini', 'Carolinas', NULL, NULL, 'http://2.bp.blogspot.com/-V5KWlBCHNHE/VWyOYSAVGgI/AAAAAAAAAnw/7_ll2bN4E48/s1600/carolinas.jpg', NULL, 9999, NULL, NULL, 'Retratos inspirados em Carolina Maria de Jesus', NULL);
INSERT INTO book VALUES (79, 'ANIL HEMRAJANI', 'DESENVOLVIMENTO AGIL EM JAVA COM SPRING, HIBERNAT', '''Desenvolvimento ágil em Java com Spring, Hibermate e Eclipse'' é um livro sobre tecnologias robustas e métodos eficientes que ajudará o programador a trazer simplicidade de volta ao mundo do desenvolvimento corporativo em Java. As três tecnologias abordadas, Spring Framework, Hibernate e Eclipse, permitem reduzir significativamente a complexidade desse tipo de desenvolvimento. Além disso, são compatíveis com os POJOs (Plain Old Java Objects - ''velhos e simples'' objetos Java) em contêineres, em vez dos pesados objetos remotos que os contêineres EJB exigem. Este livro também aborda o uso de ferramentas como Ant, Junit e a biblioteca de tags JSP, além de introduzir outros assuntos, como depuração baseada em GUI, monitoramento usando o JMX, agendamento de tarefas, envio de e-mail e muito mais. E, finalmente, a Extreme Programming (XP), o Agile Model Driven Development (AMDD) e a refatoração são métodos que podem acelerar os projetos de desenvolvimento de software ao mesmo tempo em que reduzem a quantidade de requisitos de programação e de design; portanto, esses assuntos também são discutidos no livro.', NULL, 'http://images.livrariasaraiva.com.br/imagemnet/imagem.aspx/?pro_id=1571283&qld=90&l=370&a=-1', NULL, 9999, NULL, NULL, 'E ECLIPSE', 9788576051275);


--
-- TOC entry 2045 (class 0 OID 0)
-- Dependencies: 177
-- Name: book_gen; Type: SEQUENCE SET; Schema: public; Owner: bvdgrnmflvqaqk
--

SELECT pg_catalog.setval('book_gen', 89, true);


--
-- TOC entry 2030 (class 0 OID 1676317)
-- Dependencies: 174
-- Data for Name: copy; Type: TABLE DATA; Schema: public; Owner: bvdgrnmflvqaqk
--

INSERT INTO copy VALUES (74, 0, 72, 50, NULL);
INSERT INTO copy VALUES (75, 0, 73, 50, NULL);
INSERT INTO copy VALUES (77, 0, 75, 50, NULL);
INSERT INTO copy VALUES (78, 0, 76, 50, NULL);
INSERT INTO copy VALUES (79, 0, 77, 50, NULL);
INSERT INTO copy VALUES (80, 0, 78, 50, NULL);
INSERT INTO copy VALUES (81, 0, 79, 50, NULL);
INSERT INTO copy VALUES (82, 0, 80, 50, NULL);
INSERT INTO copy VALUES (83, 0, 81, 50, NULL);
INSERT INTO copy VALUES (84, 0, 82, 50, NULL);
INSERT INTO copy VALUES (85, 0, 83, 50, NULL);
INSERT INTO copy VALUES (73, 1, 71, 50, NULL);
INSERT INTO copy VALUES (76, 1, 74, 50, NULL);
INSERT INTO copy VALUES (86, 0, 84, 50, NULL);
INSERT INTO copy VALUES (88, 0, 86, 50, NULL);
INSERT INTO copy VALUES (89, 0, 87, 50, NULL);
INSERT INTO copy VALUES (90, 0, 88, 50, NULL);
INSERT INTO copy VALUES (91, 0, 89, 50, NULL);
INSERT INTO copy VALUES (87, 1, 85, 50, NULL);


--
-- TOC entry 2046 (class 0 OID 0)
-- Dependencies: 178
-- Name: copy_gen; Type: SEQUENCE SET; Schema: public; Owner: bvdgrnmflvqaqk
--

SELECT pg_catalog.setval('copy_gen', 91, true);


--
-- TOC entry 2047 (class 0 OID 0)
-- Dependencies: 172
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: bvdgrnmflvqaqk
--

SELECT pg_catalog.setval('hibernate_sequence', 2, true);


--
-- TOC entry 2031 (class 0 OID 1676322)
-- Dependencies: 175
-- Data for Name: library; Type: TABLE DATA; Schema: public; Owner: bvdgrnmflvqaqk
--

INSERT INTO library VALUES (50, 'Belo Horizonte', 'bh');
INSERT INTO library VALUES (51, 'Quito', 'quito');


--
-- TOC entry 2048 (class 0 OID 0)
-- Dependencies: 179
-- Name: library_gen; Type: SEQUENCE SET; Schema: public; Owner: bvdgrnmflvqaqk
--

SELECT pg_catalog.setval('library_gen', 1, true);


--
-- TOC entry 2049 (class 0 OID 0)
-- Dependencies: 180
-- Name: loan_gen; Type: SEQUENCE SET; Schema: public; Owner: bvdgrnmflvqaqk
--

SELECT pg_catalog.setval('loan_gen', 16, true);


--
-- TOC entry 1907 (class 2606 OID 1676316)
-- Name: book_pkey; Type: CONSTRAINT; Schema: public; Owner: bvdgrnmflvqaqk; Tablespace: 
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 1909 (class 2606 OID 1676321)
-- Name: copy_pkey; Type: CONSTRAINT; Schema: public; Owner: bvdgrnmflvqaqk; Tablespace: 
--

ALTER TABLE ONLY copy
    ADD CONSTRAINT copy_pkey PRIMARY KEY (id);


--
-- TOC entry 1911 (class 2606 OID 1676326)
-- Name: library_pkey; Type: CONSTRAINT; Schema: public; Owner: bvdgrnmflvqaqk; Tablespace: 
--

ALTER TABLE ONLY library
    ADD CONSTRAINT library_pkey PRIMARY KEY (id);


--
-- TOC entry 1913 (class 2606 OID 1749195)
-- Name: library_unique_slug; Type: CONSTRAINT; Schema: public; Owner: bvdgrnmflvqaqk; Tablespace: 
--

ALTER TABLE ONLY library
    ADD CONSTRAINT library_unique_slug UNIQUE (slug);


--
-- TOC entry 1915 (class 2606 OID 1676331)
-- Name: loan_pkey; Type: CONSTRAINT; Schema: public; Owner: bvdgrnmflvqaqk; Tablespace: 
--

ALTER TABLE ONLY loan
    ADD CONSTRAINT loan_pkey PRIMARY KEY (id);


--
-- TOC entry 1916 (class 2606 OID 1676332)
-- Name: fk_5nr6joxxjm233xyongnbacj1f; Type: FK CONSTRAINT; Schema: public; Owner: bvdgrnmflvqaqk
--

ALTER TABLE ONLY copy
    ADD CONSTRAINT fk_5nr6joxxjm233xyongnbacj1f FOREIGN KEY (book_id) REFERENCES book(id);


--
-- TOC entry 1917 (class 2606 OID 1676337)
-- Name: fk_bwuisnj36jfuu5e55crd3dp0x; Type: FK CONSTRAINT; Schema: public; Owner: bvdgrnmflvqaqk
--

ALTER TABLE ONLY copy
    ADD CONSTRAINT fk_bwuisnj36jfuu5e55crd3dp0x FOREIGN KEY (library_id) REFERENCES library(id);


--
-- TOC entry 1918 (class 2606 OID 1676342)
-- Name: fk_f7obux2dkllw86emoch3jejy7; Type: FK CONSTRAINT; Schema: public; Owner: bvdgrnmflvqaqk
--

ALTER TABLE ONLY loan
    ADD CONSTRAINT fk_f7obux2dkllw86emoch3jejy7 FOREIGN KEY (copy_id) REFERENCES copy(id);


--
-- TOC entry 2043 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: bvdgrnmflvqaqk
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM bvdgrnmflvqaqk;
GRANT ALL ON SCHEMA public TO bvdgrnmflvqaqk;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-08-26 13:19:46 BRT

--
-- PostgreSQL database dump complete
--

