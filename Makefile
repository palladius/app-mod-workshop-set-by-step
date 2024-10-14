

app:
	git clone https://github.com/gdgpescara/app-mod-workshop app-mod-workshop-copy


grep-todos:
# Note this strange quoting is to avoid finding myself :)
	@echo Riccardo these are the TODOs to fix.
	grep -r TODO'(ricc)' .
