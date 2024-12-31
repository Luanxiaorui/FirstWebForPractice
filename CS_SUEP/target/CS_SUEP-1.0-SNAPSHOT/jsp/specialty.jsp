<%--
  Created by IntelliJ IDEA.
  User: 28016
  Date: 2024/12/29
  Time: 08:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>专业介绍</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLR3Zk0Xmw5Mn7qkOGLFQJ61XmIbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua7Kw1TIqR8+YB8a0tFz/3/Hsj93l13J8xQAeBlhP/7GZ2vM3Bfnhcz9" crossorigin="anonymous"></script>
    <link rel = "stylesheet" href = "../css/general_style.css">
</head>
<body>

<header class="header">
    <div class="logo">
        <h1>计算机科学与技术</h1>
        <p>SHANGHAI UNIVERSITY OF ELECTRIC POWER</p>
    </div>
    <nav class="navbar">
        <a href="../index.jsp"> 首页 </a>
        <a href="../news_information">新闻动态</a>
        <a href="../jsp/college_overview.jsp">学校概况</a>
        <a href="../teacher_group">学科建设</a>
        <a href="../admissions_employment">招生就业</a>
        <a href="../jsp/public_services.jsp">公共服务</a>
        <!-- 二级目录导航 -->
        <div class="dropdown">
            <a href="#" class="dropbtn">个人服务</a>
            <div class="dropdown-content">
                <a href="message_board.jsp">留言板</a>
                <a href="resources_list">资源下载</a>
            </div>
        </div>
    </nav>
</header>

<main class="main-content">
    <div class="content">
        <aside class="sidebar">
            <ul>
                <li><a href="../teacher_group">教师队伍</a></li>
                <li><a href="javascript:void(0)" onclick="showProgram('computer_science')">计算机科学与技术专业介绍</a></li>
                <li><a href="javascript:void(0)" onclick="showProgram('data_science')">数据科学与大数据技术专业介绍</a></li>
                <li><a href="javascript:void(0)" onclick="showProgram('software_engineering')">软件工程专业介绍</a></li>
                <li><a href="javascript:void(0)" onclick="showProgram('information_security')">信息安全专业介绍</a></li>
                <li><a href="javascript:void(0)" onclick="showProgram('network_engineering')">网络工程专业介绍</a></li>
            </ul>
        </aside>
        <section class="news">
            <div class="content">
                <div id="computer_science" class="content-box">
                    <h2>计算机科学与技术专业介绍</h2>
                    <p>
                        培养目标：(包含计算机应用方向、电力企业信息化方向)本专业培养具有良好的科学素养，系统地掌握计算机科学与技术，包括计算机硬件、软件与应用的基本理论、基本知识和基本技能，从事计算机科学与技术开发与应用的工程技术人才。<br><br>
                        本专业分为两个方向：1）计算机应用  2）电力企业信息化。<br><br>
                        计算机应用方向着重于培养学生具有计算机软件和硬件的全面知识，并掌握计算机应用的基本方法和技能，具备解决实际问题的能力和创新能力。<br><br>
                        电力企业信息化方向瞄准电力发、供电企业在信息化建设中对计算机科学和信息技术人才的需求，突出我院与电力企业紧密联系的优势与特色，培养既有计算机科学与技术扎实的专业理论、熟练的专业技能，又具备电力工业生产与运行的专业基础及专业技能的高级工程技术人员。本专业方向是卓越工程师试点专业方向。<br><br>
                        培养要求：毕业生应获得以下几方面的知识和能力：<br>
                        1．具有较扎实的自然科学基础，较好的人文社会科学基础和外语综合能力；<br>
                        2．掌握计算机科学与技术的基本理论、基本知识；<br>
                        3．掌握计算机系统分析和设计的基本方法；<br>
                        4．具有研究和开发计算机软件、硬件的基本能力；<br>
                        5．了解计算机与科学的发展动态；<br>
                        6．掌握文献检索、资料查询的基本方法，具有较强的自学能力，能适应计算机科学迅速发展的需求。<br>
                        7．熟悉电力企业的生产、运行与管理。<br><br>
                        本专业的主要课程：计算机应用基础、电路原理、模拟电子技术、数字电子技术、高级程序设计、离散数学、计算机组成原理、汇编语言、数据结构、操作系统原理、数据库原理、计算机网络、微机原理及接口技术等。<br><br>
                        学生继续深造的方向：计算机应用技术、软件工程、信息安全工程、网络工程以及与计算机应用技术相关的其它所有学科和专业。<br><br>
                        师资队伍：经过多年的建设，计算机科学与技术专业拥有一支结构合理、教学科研素养都教高的师资队伍，目前教师队伍中具有高级职称的教师近20人，具有博士学位的教师16人。拥有上海市重点学科“电力企业信息化与决策支持”。近年来，本专业承担了一批省部级的科研项目，取得了丰硕的科研成果。<br><br>
                        学生就业情况：计算机科学与技术专业从1992年组建以来，培养了大量的分布在各行各业的毕业生，服务于国民经济、国防建设、社会发展的各行各业。计算机科学与技术专业学生的就业渠道非常广泛，本专业近3年的就业率都在95%左右。<br><br>
                        1.培养目标<br>
                        本专业培养掌握计算机    网络相关专业基础理论知识和基本技能，并获得网络工程师的基本训练且兼具创新精神，有较强的自学能力和工程实践能力，能够从事计算机网络系统开发、设计、部署、实施、运维和管理，掌握电力信息网络建设技能的高级工程技术人才。<br><br>
                        2.专业特色<br>
                        本专业针对智能电网和电力信息化建设中对网络工程技术人才的需求，通过完善的创新创业人才培养体系，培养既有计算机网络专业基础和专业技能，又能适应电力信息化发展需要、理论基础扎实、实践能力强、创新创业能力强的优秀网络工程技术人才。<br><br>
                        3.主干课程<br>
                        计算机组成原理、面向对象程序设计、数据库原理、计算机网络、网络协议分析与编程、计算机网络工程、华为/思科认证网络工程师、网络攻击与防御、网络测试与评价等。<br><br>
                        4.毕业生就业<br>
                        本专业毕业生就业面宽、就业前景可观，能够在网络通信类科研院所、政府机构、银行、电力企业、计算机网络公司、通信公司等各类企事业单位从事计算机网络的科学研究、系统设计、系统防护、系统管理与维护等工作。依据已毕业学生就业数据统计本专业毕业生就业率达95%及以上。<br>
                    </p>
                </div>
                <div id="data_science" class="content-box hidden">
                    <h2>数据科学与大数据技术专业介绍</h2>
                    <p>
                        培养目标<br>
                        本专业适应经济社会和国家能源电力发展战略新要求和新需求，面向现代能源电力生产和现代化经济建设一线，培养是有坚定理想信念、家国情怀、国际视野和综合素养，德智体美劳全面发展，具备扎实的应用数学、统计学和计算机等相关学科基本理论和基本知识，掌握大数据采集、存储、处理与分析、传输与应用等技术，具备大数据工程项目的系统集成能力、应用软件设计和开发能力，从事数据科学与大数据技术的科研、开发、管理工作，具有较强系统分析和决策能力及创新意识，适应行业发展变革的高水平应用型人才。<br><br>
                        本专业培养学生毕业5年左右在社会和专业领域应达到的具体目标包括:<br>
                        目标1:具备良好的综合素养。掌握马列主义、毛泽东思想与中国特色社会主义基本理论，具有健全的人格、良好的人文社会科学素养和心理素质，具备高尚的职业道德和强烈的社会责任感;<br>
                        目标2:具有国际化视野和交流合作能力。能够在多学科和跨文化环境下开展工作。具备一定的英文能力，能阅读本专业的英文资料和文献，有较好的语言表达能具有一定的组织管理能力和团队合作能力，具备在团队中分工协作、交流沟通能力，以及发挥领导作用的潜力，能胜任技术负责、经营与管理等工作;<br>
                        目标3:掌握专业基础知识。掌握从事本专业工作所需的数学、计算机科学、统计学、数据科学与大数据技术等学科领域的基础知识，能够运用相关技术标准及专业知识和工程技术原则;<br>
                        目标4:具有解决复杂工程问题的能力。具有大数据专业扎实的理论基础和宽厚的专业视野，具有较高的综合业务素质、较强的创新与实践能力，具备运用专业知识和工程技术解决相关领域复杂工程技术问题的实际工作能力。能够从事大数据应用分析、大数据应用开发、大数据系统研发及数据可视化等工作;<br>
                        目标5:具有终身学习的能力。具有终身学习与专业发展的意识和自我管理能力，具备运用现代信息技术手段获取相关信息和新技术、新知识，不断学习适应社会发展和行业竞争的能力;<br>
                        目标6:具有创新意识和能力。了解数据科学的发展现状和趋势，具有创新意识，并具有理论创新和系统创新的初步能力。<br><br>
                        专业特色<br>
                        定位于新工科人才培养，将按照新工科人才素质要求探索多元化的人才培养模式。结合学校电力特色，培养服务于能源电力行业的高水平应用型数据科学人才，更好地服务于能源互联网的建设。<br><br>
                        主干课程<br>
                        数据科学导论、数据库原理、数据结构、算法设计与分析、现代应用统计学、面向数据科学编程语言Python、大数据分布式存储技术、大数据分析与应用。<br><br>
                        就业方向<br>
                        大数据分析、处理、服务、开发和利用；<br>
                        大数据系统集成与管理维护；<br>
                        大数据研究、咨询、教育培训。<br>
                    </p>
                </div>
                <div id="software_engineering" class="content-box hidden">
                    <h2>软件工程专业介绍</h2>
                    <p>
                        1.培养目标<br>
                        以国民经济和社会信息化需求为导向，面向软件产业，以构思、设计、实施和运行实际工程为工程教育背景环境，培养掌握扎实的计算机基础理论知识；能综合运用专业知识分析和解决实际软件工程问题，具有软件产业实践经验，适应现代化工程团队、新产品和新系统开发需求；具有较强的创新创业能力、较强的工程实践能力和团队协作能力、德智体全面发展的有国际竞争力的高层次、应用型、复合型软件工程技术。<br><br>
                        本专业毕业的学生，既可从事软件工程基础理论研究、大中型软件系统开发、软件工程项目管理、新方法和新技术开发等软件工程领域的科技工作，也可承担软件企业管理、软件开发技术管理及软件企业市场经营等工作。<br><br>
                        2. 专业特色<br>
                        （1）厚基础，重应用，培养学生竞争力：理论和专业基础方面围绕以Java 企业级开发技术、软件工程及软件体系架构、软件测试等3条主线展开教学。<br><br>
                        （2）注重案例与实验教学，加强实际动手能力的培养：在专业基础课和专业主干课教学中探索以实际案例进行渐进式教学，90% 以上的专业课程都开设相应的课程实验。<br><br>
                        （3）积极探索校企合作培养软件人才的新模式：引进与国际接轨的培训模式，与浦东软件园知名 IT 企业建立了联合校外实训中心和校内实训基地，积极促进学生参与实际项目的研发和实践。<br><br>
                        3、核心课程<br>
                        计算机科学导论、面向对象程序设计(Java)、数字电路与数字逻辑、数据结构（Java）、计算机组成原理、数据库原理与应用、面向对象分析与设计、软件工程概论、软件项目管理、软件测试与质量控制、软件系统设计与体系结构、计算机网络原理及应用、Java EE等。<br><br>
                        学生继续深造的方向：软件工程、信息安全工程、计算机应用技术等。<br><br>
                        软件产业的发展水平，决定了一个国家的信息产业发展水平及其在国际市场上的综合竞争力。未来几年，国内外高层次软件人才将供不应求。毕业生主要在各大软件公司、企事业单位、高等院校、各大研究所、国防等重要部门从事软件设计、开发、应用与研究工作。目前，我国软件高级人才的短缺已经成为制约我国软件产业快速发展的一个瓶颈。在国内市场对软件人才的需求每年高达20万人，而高校计算机毕业生中的软件工程人才还很缺乏，尤其是高素质的软件工程人才的极度短缺。尽快培养起适合信息产业所需要的高素质软件工程人才，已经成为信息化工作中的重中之重。在中国十大IT职场人气职位中，软件工程人才的就业前景十分乐观。<br>
                    </p>
                </div>
                <div id="information_security" class="content-box hidden">
                    <h2>信息安全专业介绍</h2>
                    <p>
                        1.培养目标<br>
                        本专业培养掌握该领域基本理论、基本技术和应用知识，具备科学研究、技术开发和应用服务工作能力的信息安全科技人才，能够从事信息安全、信息科学、信息技术及其他相关领域的信息安全研究、技术开发和应用服务等工作，适应电力、政府机关、科研、企事业单位            等方面需求的高级应用型专门人才。<br><br>
                        2.专业特色<br>
                        以电力信息安全为主线，以电力应用为背景，系统地研究电力系统和电力网络中的信息安全问题，侧重培养与锻炼学生在电力行业中从事信息安全技术研究、系统设计、产品开发、产品策略制定与管理、以及基础设施运行维护的能力。培养了解电力行业应用需求，能适应社会及电力行业需求的应用型信息安全技术人才。<br><br>
                        3.主干课程<br>
                        离散数学、数据结构、计算机组成原理、汇编语言、高级程序设计(C++)、操作系统原理、应用密码学、计算机系统安全、计算机网络安全、网络安全程序设计、网络攻击与防御、信息隐藏。<br><br>
                        4.毕业生就业<br>
                        本专业毕业生主要在信息安全科研院所、政府机构、银行、电力、电信、金融等各企事业单位从事计算机网络信息安全的科学研究、安全系统设计、系统防护、系统管理与维护等工作。本专业2017届毕业生就业率达100%。<br>
                    </p>
                </div>
                <div id="network_engineering" class="content-box hidden">
                    <h2>网络工程专业介绍</h2>
                    <p>
                        1.培养目标<br>
                        本专业培养掌握计算机网络相关专业基础理论知识和基本技能，并获得网络工程师的基本训练且兼具创新精神，有较强的自学能力和工程实践能力，能够从事计算机网络系统开发、设计、部署、实施、运维和管理，掌握电力信息网络建设技能的高级工程技术人才。<br><br>
                        2.专业特色<br>
                        本专业针对智能电网和电力信息化建设中对网络工程技术人才的需求，通过完善的创新创业人才培养体系，培养既有计算机网络专业基础和专业技能，又能适应电力信息化发展需要、理论基础扎实、实践能力强、创新创业能力强的优秀网络工程技术人才。<br><br>
                        3.主干课程<br>
                        计算机组成原理、面向对象程序设计、数据库原理、计算机网络、网络协议分析与编程、计算机网络工程、华为/思科认证网络工程师、网络攻击与防御、网络测试与评价等。<br><br>
                        4.毕业生就业<br>
                        本专业毕业生就业面宽、就业前景可观，能够在网络通信类科研院所、政府机构、银行、电力企业、计算机网络公司、通信公司等各类企事业单位从事计算机网络的科学研究、系统设计、系统防护、系统管理与维护等工作。依据已毕业学生就业数据统计本专业毕业生就业率达95%及以上。<br>
                    </p>
                </div>
            </div>

        </section>
    </div>
</main>

<script type="text/javascript">
    function toggleOptions(id) {
        var options = document.getElementById(id);
        if (options.classList.contains('hidden')) {
            options.classList.remove('hidden');
        } else {
            options.classList.add('hidden');
        }
    }

    function showProgram(id) {
        var contents = document.getElementsByClassName('content-box');
        for (var i = 0; i < contents.length; i++) {
            contents[i].classList.add('hidden');
        }
        document.getElementById(id).classList.remove('hidden');
    }
</script>
<footer>
    &copy; 2024 计算机学院. 版权所有.
</footer>
</body>
</html>