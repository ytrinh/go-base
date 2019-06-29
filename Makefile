
.PHONY: all
all: clean
	mkdir build
	go get github.com/rubenv/sql-migrate
	GOOS=linux CGO_ENABLED=0 go build -o ./build/sql-migrate ~/go/src/github.com/rubenv/sql-migrate/sql-migrate/*.go
	cp Dockerfile build/
	cd build && docker build -t go-base:1.0 .
	docker save go-base:1.0 | gzip > build/go-base.tar.gz



.PHONY: clean
clean:
	rm -rf build
