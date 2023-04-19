db_dump:
	python -m src db_dump

export_TV:
	python -m src db_export -d 1 -f tvkill

tests:
	pytest -v tests/

coverage:
	pytest --cov=src --cov-report term-missing -vv

docstring_coverage:
	interrogate -v src/ -e src/__init__.py --ignore-magic --badge-style flat --generate-badge .

compress_db:
	XZ_OPT=-9 tar Jcvf database_dump.tar.xz ./database_dump/
	@#tar -I "pxz -9" -cvf database_dump.tar.xz ./database_dump/

decompress_db:
	tar Jxvf database_dump.tar.xz

.PHONY: tests
