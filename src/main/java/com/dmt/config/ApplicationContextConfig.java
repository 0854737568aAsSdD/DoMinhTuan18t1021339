package com.dmt.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.dmt.bean.DienThoaiBean;
import com.dmt.bean.KhachHangBean;
import com.dmt.bean.LoaiBean;
import com.dmt.bo.DienThoaiBo;
import com.dmt.bo.LoaiBo;
import com.dmt.dao.DienThoaiDao;
import com.dmt.dao.LoaiDao;

@Configuration
@ComponentScan("com.dmt.*")
public class ApplicationContextConfig {
	@Bean(name = "viewResolver")
	public InternalResourceViewResolver getViewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/view/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}

	@Bean
	public DienThoaiBean dienThoaibean() {
		return new DienThoaiBean();
	}

	@Bean
	public DienThoaiBo dienThoaiBo() {
		return new DienThoaiBo();
	}

	@Bean
	public DienThoaiDao dienThoaidao() {
		return new DienThoaiDao();
	}

	@Bean
	public MessageSource messageSource() {
		ReloadableResourceBundleMessageSource bundleMessageSource = new ReloadableResourceBundleMessageSource();
		bundleMessageSource.setBasename("classpath:messages");
		bundleMessageSource.setDefaultEncoding("utf-8");
		return bundleMessageSource;
	}

	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		dataSource.setUrl("jdbc:sqlserver://localhost:1433;databaseName=QlPhone");
		dataSource.setUsername("sa");
		dataSource.setPassword("123");
		return dataSource;
	}

	@Bean
	public JdbcTemplate jdbcTemplate() {
		return new JdbcTemplate(dataSource());
	}

	@Bean
	public LoaiBean loaiBean() {
		return new LoaiBean();
	}

	@Bean
	public LoaiBo loaiBo() {
		return new LoaiBo();
	}

	@Bean
	public LoaiDao loaiDao() {
		return new LoaiDao();
	}

	@Bean
	KhachHangBean khachhangbean() {
		return new KhachHangBean();
	}

	@Bean
	public JavaMailSender getMailSender() {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		// using gmail
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);
		mailSender.setUsername("shopkikiki123@gmail.com\r\n" + "");
		mailSender.setPassword("nfalgksswonqlpid\r\n" + "");
		mailSender.setDefaultEncoding("utf-8");
		Properties jaProperties = new Properties();
		jaProperties.put("mail.smtp.starttls.enable", "true");
		jaProperties.put("mail.smtp.auth", "true");
		jaProperties.put("mail.transport", "smtp");
		jaProperties.put("mail.debug", "true");
		mailSender.setJavaMailProperties(jaProperties);
		return mailSender;
	}
}