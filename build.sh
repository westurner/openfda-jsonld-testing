#!/bin/bash +e +x

# Generate JSON-LD @contexts from OpenFDA ElasticSearch JSON mappings
# NOTE: this script expects to be run within the repo root directory

git clone https://github.com/westurner/elasticsearchjsonld
pip install -e elasticsearchjsonld/
./elasticsearchjsonld/scripts/build_openfda_jsonld_contexts.sh ./schemas ./ns

echo "<html><head><title>openfda-jsonld-testing</title></head><body><pre>" > index.html
find ./schemas ./ns | tr '<' '_' | tr '>' '_' >> index.html  # XXX
echo "</pre></body></html>" >> index.html


(cd ./schemas && \
echo "<html><head><title>openfda-jsonld-testing</title></head><body><pre>" > index.html && \
(find . | tr '<' '_' | tr '>' '_' >> index.html)  &&
echo "</pre></body></html>" >> index.html)

(cd ./ns && \
echo "<html><head><title>openfda-jsonld-testing</title></head><body><pre>" > index.html && \
(find . | tr '<' '_' | tr '>' '_' >> index.html)  &&
echo "</pre></body></html>" >> index.html)
