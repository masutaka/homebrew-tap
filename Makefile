.PHONY: update
update: maltmill
	maltmill -w github-nippou.rb

.PHONY: maltmill
maltmill:
ifeq ($(shell command -v maltmill 2> /dev/null),)
	go install github.com/Songmu/maltmill/cmd/maltmill@main
endif
