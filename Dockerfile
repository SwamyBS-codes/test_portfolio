FROM nginx:1.27-alpine

LABEL org.opencontainers.image.title="portfolio"
LABEL org.opencontainers.image.description="Static personal portfolio site"

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

COPY index.html index.css about.html contact.html projects.html services.html writing.html resume.html case-study.html ./

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
	CMD wget -qO- http://127.0.0.1/ >/dev/null || exit 1

CMD ["nginx", "-g", "daemon off;"]