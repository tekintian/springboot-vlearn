<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html xmlns="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8">
    <title>index jsp page</title>
</head>

<body>
<a href="<%=basePath %>index.do">IndexController method Demo</a>
<h1>使用外置的Servlet容器</h1><p>嵌入式Servlet容器：应用打成可执行的jar</p><p><span>		</span>优点：简单、便携；</p><p><span>		</span>
    缺点：默认不支持JSP、优化定制比较复杂（使用定制器【ServerProperties、自定义EmbeddedServletContainerCustomizer】，自己编写嵌入式Servlet容器的创建工厂【EmbeddedServletContainerFactory】）；</p><p>&nbsp;</p><p>外置的Servlet容器：外面安装Tomcat---应用war包的方式打包；</p><h3><a name='header-n902' class='md-header-anchor '></a>步骤</h3><p>1）、必须创建一个war项目；（利用idea创建好目录结构）</p><p>2）、将嵌入式的Tomcat指定为provided；</p><pre spellcheck="false" class="md-fences md-end-block ty-contain-cm modeLoaded" lang="xml"><div class="CodeMirror cm-s-inner CodeMirror-wrap" lang="xml"><div style="overflow: hidden; position: relative; width: 3px; height: 0px; top: 0px; left: 8px;"><textarea autocorrect="off" autocapitalize="off" spellcheck="false" tabindex="0" style="position: absolute; bottom: -1em; padding: 0px; width: 1000px; height: 1em; outline: none;"></textarea></div><div class="CodeMirror-scrollbar-filler" cm-not-content="true"></div><div class="CodeMirror-gutter-filler" cm-not-content="true"></div><div class="CodeMirror-scroll" tabindex="-1"><div class="CodeMirror-sizer" style="margin-left: 0px; margin-bottom: 0px; border-right-width: 0px; padding-right: 0px; padding-bottom: 0px;"><div style="position: relative; top: 0px;"><div class="CodeMirror-lines" role="presentation"><div role="presentation" style="position: relative; outline: none;"><div class="CodeMirror-measure"><pre><span>xxxxxxxxxx</span></pre></div><div class="CodeMirror-measure"></div><div style="position: relative; z-index: 1;"></div><div class="CodeMirror-code" role="presentation" style=""><div class="CodeMirror-activeline" style="position: relative;"><div class="CodeMirror-activeline-background CodeMirror-linebackground"></div><div class="CodeMirror-gutter-background CodeMirror-activeline-gutter" style="left: 0px; width: 0px;"></div><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"><span class="cm-tag cm-bracket">&lt;</span><span class="cm-tag">dependency</span><span class="cm-tag cm-bracket">&gt;</span></span></pre></div><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-tag cm-bracket">&lt;</span><span class="cm-tag">groupId</span><span class="cm-tag cm-bracket">&gt;</span>org.springframework.boot<span class="cm-tag cm-bracket">&lt;/</span><span class="cm-tag">groupId</span><span class="cm-tag cm-bracket">&gt;</span></span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-tag cm-bracket">&lt;</span><span class="cm-tag">artifactId</span><span class="cm-tag cm-bracket">&gt;</span>spring-boot-starter-tomcat<span class="cm-tag cm-bracket">&lt;/</span><span class="cm-tag">artifactId</span><span class="cm-tag cm-bracket">&gt;</span></span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-tag cm-bracket">&lt;</span><span class="cm-tag">scope</span><span class="cm-tag cm-bracket">&gt;</span>provided<span class="cm-tag cm-bracket">&lt;/</span><span class="cm-tag">scope</span><span class="cm-tag cm-bracket">&gt;</span></span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"><span class="cm-tag cm-bracket">&lt;/</span><span class="cm-tag">dependency</span><span class="cm-tag cm-bracket">&gt;</span></span></pre></div></div></div></div></div><div style="position: absolute; height: 0px; width: 1px; border-bottom: 0px solid transparent; top: 115px;"></div><div class="CodeMirror-gutters" style="display: none; height: 115px;"></div></div></div></pre><p>3）、必须编写一个<strong>SpringBootServletInitializer</strong>的子类，并调用configure方法</p><pre spellcheck="false" class="md-fences md-end-block ty-contain-cm modeLoaded" lang="java"><div class="CodeMirror cm-s-inner CodeMirror-wrap" lang="java"><div style="overflow: hidden; position: relative; width: 3px; height: 0px; top: 0px; left: 8px;"><textarea autocorrect="off" autocapitalize="off" spellcheck="false" tabindex="0" style="position: absolute; bottom: -1em; padding: 0px; width: 1000px; height: 1em; outline: none;"></textarea></div><div class="CodeMirror-scrollbar-filler" cm-not-content="true"></div><div class="CodeMirror-gutter-filler" cm-not-content="true"></div><div class="CodeMirror-scroll" tabindex="-1"><div class="CodeMirror-sizer" style="margin-left: 0px; margin-bottom: 0px; border-right-width: 0px; padding-right: 0px; padding-bottom: 0px;"><div style="position: relative; top: 0px;"><div class="CodeMirror-lines" role="presentation"><div role="presentation" style="position: relative; outline: none;"><div class="CodeMirror-measure"><pre><span>xxxxxxxxxx</span></pre></div><div class="CodeMirror-measure"></div><div style="position: relative; z-index: 1;"></div><div class="CodeMirror-code" role="presentation" style=""><div class="CodeMirror-activeline" style="position: relative;"><div class="CodeMirror-activeline-background CodeMirror-linebackground"></div><div class="CodeMirror-gutter-background CodeMirror-activeline-gutter" style="left: 0px; width: 0px;"></div><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"><span class="cm-keyword">public</span> <span class="cm-keyword">class</span> <span class="cm-def">ServletInitializer</span> <span class="cm-keyword">extends</span> <span class="cm-variable">SpringBootServletInitializer</span> {</span></pre></div><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"><span cm-text="">​</span></span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-meta">@Override</span></span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-keyword">protected</span> <span class="cm-variable">SpringApplicationBuilder</span> <span class="cm-variable">configure</span>(<span class="cm-variable">SpringApplicationBuilder</span> <span class="cm-variable">application</span>) {</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp; <span class="cm-comment">//传入SpringBoot应用的主程序</span></span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp;<span class="cm-keyword">return</span> <span class="cm-variable">application</span>.<span class="cm-variable">sources</span>(<span class="cm-variable">SpringBoot04WebJspApplication</span>.<span class="cm-keyword">class</span>);</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; }</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"><span cm-text="">​</span></span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;">}</span></pre></div></div></div></div></div><div style="position: absolute; height: 0px; width: 1px; border-bottom: 0px solid transparent; top: 207px;"></div><div class="CodeMirror-gutters" style="display: none; height: 207px;"></div></div></div></pre><p>4）、启动服务器就可以使用；</p><h3><a name='header-n909' class='md-header-anchor '></a>原理</h3><p>jar包：执行SpringBoot主类的main方法，启动ioc容器，创建嵌入式的Servlet容器；</p><p>war包：启动服务器，<strong>服务器启动SpringBoot应用</strong>【SpringBootServletInitializer】，启动ioc容器；</p><p>&nbsp;</p><p>servlet3.0（Spring注解版）：</p><p>8.2.4 Shared libraries / runtimes pluggability：</p><p>规则：</p><p><span>	</span>1）、服务器启动（web应用启动）会创建当前web应用里面每一个jar包里面ServletContainerInitializer实例：</p><p><span>	</span>2）、ServletContainerInitializer的实现放在jar包的META-INF/services文件夹下，有一个名为javax.servlet.ServletContainerInitializer的文件，内容就是ServletContainerInitializer的实现类的全类名</p><p><span>	</span>3）、还可以使用@HandlesTypes，在应用启动的时候加载我们感兴趣的类；</p><p>&nbsp;</p><p>流程：</p><p>1）、启动Tomcat</p><p>2）、org\springframework\spring-web\4.3.14.RELEASE\spring-web-4.3.14.RELEASE.jar!\META-INF\services\javax.servlet.ServletContainerInitializer：</p><p>Spring的web模块里面有这个文件：<strong>org.springframework.web.SpringServletContainerInitializer</strong></p><p>3）、SpringServletContainerInitializer将@HandlesTypes(WebApplicationInitializer.class)标注的所有这个类型的类都传入到onStartup方法的Set&lt;Class&lt;?&gt;&gt;；为这些WebApplicationInitializer类型的类创建实例；</p><p>4）、每一个WebApplicationInitializer都调用自己的onStartup；</p><p><img src='images/搜狗截图20180302221835.png' alt='' referrerPolicy='no-referrer' /></p><p>5）、相当于我们的SpringBootServletInitializer的类会被创建对象，并执行onStartup方法</p><p>6）、SpringBootServletInitializer实例执行onStartup的时候会createRootApplicationContext；创建容器</p><pre spellcheck="false" class="md-fences md-end-block ty-contain-cm modeLoaded" lang="java" style="break-inside: unset;"><div class="CodeMirror cm-s-inner CodeMirror-wrap" lang="java"><div style="overflow: hidden; position: relative; width: 3px; height: 0px; top: 0px; left: 8px;"><textarea autocorrect="off" autocapitalize="off" spellcheck="false" tabindex="0" style="position: absolute; bottom: -1em; padding: 0px; width: 1000px; height: 1em; outline: none;"></textarea></div><div class="CodeMirror-scrollbar-filler" cm-not-content="true"></div><div class="CodeMirror-gutter-filler" cm-not-content="true"></div><div class="CodeMirror-scroll" tabindex="-1"><div class="CodeMirror-sizer" style="margin-left: 0px; margin-bottom: 0px; border-right-width: 0px; padding-right: 0px; padding-bottom: 0px;"><div style="position: relative; top: 0px;"><div class="CodeMirror-lines" role="presentation"><div role="presentation" style="position: relative; outline: none;"><div class="CodeMirror-measure"><pre><span>xxxxxxxxxx</span></pre></div><div class="CodeMirror-measure"></div><div style="position: relative; z-index: 1;"></div><div class="CodeMirror-code" role="presentation" style=""><div class="CodeMirror-activeline" style="position: relative;"><div class="CodeMirror-activeline-background CodeMirror-linebackground"></div><div class="CodeMirror-gutter-background CodeMirror-activeline-gutter" style="left: 0px; width: 0px;"></div><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"><span class="cm-keyword">protected</span> <span class="cm-variable">WebApplicationContext</span> <span class="cm-def">createRootApplicationContext</span>(</span></pre></div><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp;<span class="cm-variable">ServletContext</span> <span class="cm-variable">servletContext</span>) {</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp;<span class="cm-comment">//1、创建SpringApplicationBuilder</span></span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-variable">SpringApplicationBuilder</span> <span class="cm-variable">builder</span> <span class="cm-operator">=</span> <span class="cm-variable">createSpringApplicationBuilder</span>();</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-variable">StandardServletEnvironment</span> <span class="cm-variable">environment</span> <span class="cm-operator">=</span> <span class="cm-keyword">new</span> <span class="cm-variable">StandardServletEnvironment</span>();</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-variable">environment</span>.<span class="cm-variable">initPropertySources</span>(<span class="cm-variable">servletContext</span>, <span class="cm-atom">null</span>);</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-variable">builder</span>.<span class="cm-variable">environment</span>(<span class="cm-variable">environment</span>);</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-variable">builder</span>.<span class="cm-variable">main</span>(<span class="cm-variable">getClass</span>());</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-variable">ApplicationContext</span> <span class="cm-variable">parent</span> <span class="cm-operator">=</span> <span class="cm-variable">getExistingRootWebApplicationContext</span>(<span class="cm-variable">servletContext</span>);</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-keyword">if</span> (<span class="cm-variable">parent</span> <span class="cm-operator">!=</span> <span class="cm-atom">null</span>) {</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp;<span class="cm-keyword">this</span>.<span class="cm-variable">logger</span>.<span class="cm-variable">info</span>(<span class="cm-string">"Root context already created (using as parent)."</span>);</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp;<span class="cm-variable">servletContext</span>.<span class="cm-variable">setAttribute</span>(</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class="cm-variable">WebApplicationContext</span>.<span class="cm-variable">ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE</span>, <span class="cm-atom">null</span>);</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp;<span class="cm-variable">builder</span>.<span class="cm-variable">initializers</span>(<span class="cm-keyword">new</span> <span class="cm-variable">ParentContextApplicationContextInitializer</span>(<span class="cm-variable">parent</span>));</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; }</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-variable">builder</span>.<span class="cm-variable">initializers</span>(</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp; &nbsp; <span class="cm-keyword">new</span> <span class="cm-variable">ServletContextApplicationContextInitializer</span>(<span class="cm-variable">servletContext</span>));</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-variable">builder</span>.<span class="cm-variable">contextClass</span>(<span class="cm-variable">AnnotationConfigEmbeddedWebApplicationContext</span>.<span class="cm-keyword">class</span>);</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp;</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp;<span class="cm-comment">//调用configure方法，子类重写了这个方法，将SpringBoot的主程序类传入了进来</span></span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-variable">builder</span> <span class="cm-operator">=</span> <span class="cm-variable">configure</span>(<span class="cm-variable">builder</span>);</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp;</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp;<span class="cm-comment">//使用builder创建一个Spring应用</span></span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-variable">SpringApplication</span> <span class="cm-variable">application</span> <span class="cm-operator">=</span> <span class="cm-variable">builder</span>.<span class="cm-variable">build</span>();</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-keyword">if</span> (<span class="cm-variable">application</span>.<span class="cm-variable">getSources</span>().<span class="cm-variable">isEmpty</span>() <span class="cm-operator">&amp;&amp;</span> <span class="cm-variable">AnnotationUtils</span></span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp; &nbsp; .<span class="cm-variable">findAnnotation</span>(<span class="cm-variable">getClass</span>(), <span class="cm-variable">Configuration</span>.<span class="cm-keyword">class</span>) <span class="cm-operator">!=</span> <span class="cm-atom">null</span>) {</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp;<span class="cm-variable">application</span>.<span class="cm-variable">getSources</span>().<span class="cm-variable">add</span>(<span class="cm-variable">getClass</span>());</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; }</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-variable">Assert</span>.<span class="cm-variable">state</span>(<span class="cm-operator">!</span><span class="cm-variable">application</span>.<span class="cm-variable">getSources</span>().<span class="cm-variable">isEmpty</span>(),</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp; &nbsp; <span class="cm-string">"No SpringApplication sources have been defined. Either override the "</span></span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="cm-operator">+</span> <span class="cm-string">"configure method or add an @Configuration annotation"</span>);</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-comment">// Ensure error pages are registered</span></span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-keyword">if</span> (<span class="cm-keyword">this</span>.<span class="cm-variable">registerErrorPageFilter</span>) {</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp;<span class="cm-variable">application</span>.<span class="cm-variable">getSources</span>().<span class="cm-variable">add</span>(<span class="cm-variable">ErrorPageFilterConfiguration</span>.<span class="cm-keyword">class</span>);</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; }</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp;<span class="cm-comment">//启动Spring应用</span></span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-keyword">return</span> <span class="cm-variable">run</span>(<span class="cm-variable">application</span>);</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;">}</span></pre></div></div></div></div></div><div style="position: absolute; height: 0px; width: 1px; border-bottom: 0px solid transparent; top: 874px;"></div><div class="CodeMirror-gutters" style="display: none; height: 874px;"></div></div></div></pre><p>7）、Spring的应用就启动并且创建IOC容器</p><pre spellcheck="false" class="md-fences md-end-block ty-contain-cm modeLoaded" lang="java" style="break-inside: unset;"><div class="CodeMirror cm-s-inner CodeMirror-wrap" lang="java"><div style="overflow: hidden; position: relative; width: 3px; height: 0px; top: 0px; left: 8px;"><textarea autocorrect="off" autocapitalize="off" spellcheck="false" tabindex="0" style="position: absolute; bottom: -1em; padding: 0px; width: 1000px; height: 1em; outline: none;"></textarea></div><div class="CodeMirror-scrollbar-filler" cm-not-content="true"></div><div class="CodeMirror-gutter-filler" cm-not-content="true"></div><div class="CodeMirror-scroll" tabindex="-1"><div class="CodeMirror-sizer" style="margin-left: 0px; margin-bottom: 0px; border-right-width: 0px; padding-right: 0px; padding-bottom: 0px;"><div style="position: relative; top: 0px;"><div class="CodeMirror-lines" role="presentation"><div role="presentation" style="position: relative; outline: none;"><div class="CodeMirror-measure"><pre><span>xxxxxxxxxx</span></pre></div><div class="CodeMirror-measure"></div><div style="position: relative; z-index: 1;"></div><div class="CodeMirror-code" role="presentation" style=""><div class="CodeMirror-activeline" style="position: relative;"><div class="CodeMirror-activeline-background CodeMirror-linebackground"></div><div class="CodeMirror-gutter-background CodeMirror-activeline-gutter" style="left: 0px; width: 0px;"></div><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"><span class="cm-keyword">public</span> <span class="cm-variable">ConfigurableApplicationContext</span> <span class="cm-def">run</span>(<span class="cm-variable-3">String</span>... <span class="cm-variable">args</span>) {</span></pre></div><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-variable">StopWatch</span> <span class="cm-variable">stopWatch</span> <span class="cm-operator">=</span> <span class="cm-keyword">new</span> <span class="cm-variable">StopWatch</span>();</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-variable">stopWatch</span>.<span class="cm-variable">start</span>();</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-variable">ConfigurableApplicationContext</span> <span class="cm-variable">context</span> <span class="cm-operator">=</span> <span class="cm-atom">null</span>;</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-variable">FailureAnalyzers</span> <span class="cm-variable">analyzers</span> <span class="cm-operator">=</span> <span class="cm-atom">null</span>;</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-variable">configureHeadlessProperty</span>();</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-variable">SpringApplicationRunListeners</span> <span class="cm-variable">listeners</span> <span class="cm-operator">=</span> <span class="cm-variable">getRunListeners</span>(<span class="cm-variable">args</span>);</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-variable">listeners</span>.<span class="cm-variable">starting</span>();</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-keyword">try</span> {</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp;<span class="cm-variable">ApplicationArguments</span> <span class="cm-variable">applicationArguments</span> <span class="cm-operator">=</span> <span class="cm-keyword">new</span> <span class="cm-variable">DefaultApplicationArguments</span>(</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class="cm-variable">args</span>);</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp;<span class="cm-variable">ConfigurableEnvironment</span> <span class="cm-variable">environment</span> <span class="cm-operator">=</span> <span class="cm-variable">prepareEnvironment</span>(<span class="cm-variable">listeners</span>,</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class="cm-variable">applicationArguments</span>);</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp;<span class="cm-variable">Banner</span> <span class="cm-variable">printedBanner</span> <span class="cm-operator">=</span> <span class="cm-variable">printBanner</span>(<span class="cm-variable">environment</span>);</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp;<span class="cm-variable">context</span> <span class="cm-operator">=</span> <span class="cm-variable">createApplicationContext</span>();</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp;<span class="cm-variable">analyzers</span> <span class="cm-operator">=</span> <span class="cm-keyword">new</span> <span class="cm-variable">FailureAnalyzers</span>(<span class="cm-variable">context</span>);</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp;<span class="cm-variable">prepareContext</span>(<span class="cm-variable">context</span>, <span class="cm-variable">environment</span>, <span class="cm-variable">listeners</span>, <span class="cm-variable">applicationArguments</span>,</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class="cm-variable">printedBanner</span>);</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp; </span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp; <span class="cm-comment">//刷新IOC容器</span></span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp;<span class="cm-variable">refreshContext</span>(<span class="cm-variable">context</span>);</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp;<span class="cm-variable">afterRefresh</span>(<span class="cm-variable">context</span>, <span class="cm-variable">applicationArguments</span>);</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp;<span class="cm-variable">listeners</span>.<span class="cm-variable">finished</span>(<span class="cm-variable">context</span>, <span class="cm-atom">null</span>);</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp;<span class="cm-variable">stopWatch</span>.<span class="cm-variable">stop</span>();</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp;<span class="cm-keyword">if</span> (<span class="cm-keyword">this</span>.<span class="cm-variable">logStartupInfo</span>) {</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp; &nbsp; <span class="cm-keyword">new</span> <span class="cm-variable">StartupInfoLogger</span>(<span class="cm-keyword">this</span>.<span class="cm-variable">mainApplicationClass</span>)</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .<span class="cm-variable">logStarted</span>(<span class="cm-variable">getApplicationLog</span>(), <span class="cm-variable">stopWatch</span>);</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp;  }</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp;<span class="cm-keyword">return</span> <span class="cm-variable">context</span>;</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; }</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; <span class="cm-keyword">catch</span> (<span class="cm-variable">Throwable</span> <span class="cm-variable">ex</span>) {</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp;<span class="cm-variable">handleRunFailure</span>(<span class="cm-variable">context</span>, <span class="cm-variable">listeners</span>, <span class="cm-variable">analyzers</span>, <span class="cm-variable">ex</span>);</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; &nbsp; &nbsp;<span class="cm-keyword">throw</span> <span class="cm-keyword">new</span> <span class="cm-variable">IllegalStateException</span>(<span class="cm-variable">ex</span>);</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;"> &nbsp; }</span></pre><pre class=" CodeMirror-line " role="presentation"><span role="presentation" style="padding-right: 0.1px;">}</span></pre></div></div></div></div></div><div style="position: absolute; height: 0px; width: 1px; border-bottom: 0px solid transparent; top: 805px;"></div><div class="CodeMirror-gutters" style="display: none; height: 805px;"></div></div></div></pre><p><strong>==启动Servlet容器，再启动SpringBoot应用==</strong></p><p>&nbsp;</p>
</body>
</html>