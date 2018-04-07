#!/bin/sh -e

# 1. Run `fetch_papers.py` to query arxiv API and create a file `db.p` that contains all information for each paper. This script is where you would modify the **query**, indicating which parts of arxiv you'd like to use. Note that if you're trying to pull too many papers arxiv will start to rate limit you. You may have to run the script multiple times, and I recommend using the arg `--start-index` to restart where you left off when you were last interrupted by arxiv.
# 2. Run `download_pdfs.py`, which iterates over all papers in parsed pickle and downloads the papers into folder `pdf`
# 3. Run `parse_pdf_to_text.py` to export all text from pdfs to files in `txt`
# 4. Run `thumb_pdf.py` to export thumbnails of all pdfs to `thumb`
# 5. Run `analyze.py` to compute tfidf vectors for all documents based on bigrams. Saves a `tfidf.p`, `tfidf_meta.p` and `sim_dict.p` pickle files.
# 6. Run `buildsvm.py` to train SVMs for all users (if any), exports a pickle `user_sim.p`
# 7. Run `make_cache.py` for various preprocessing so that server starts faster (and make sure to run `sqlite3 as.db < schema.sql` if this is the very first time ever you're starting arxiv-sanity, which initializes an empty database).
# 8. Run the flask server with `serve.py`. Visit localhost:5000 and enjoy sane viewing of papers!

python fetch_papers.py
python download_pdfs.py
python parse_pdf_to_text.py
python thumb_pdf.py
python analyze.py
python buildsvm.py
python make_cache.py

