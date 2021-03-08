FROM ubuntu:18.04
RUN apt-get update && \
    apt-get install --no-install-recommends -y python3.8 python3-pip python3.8-dev
ADD requirement.txt requirement.txt
RUN apt-get install -y groff bash curl openssh-client gnupg && \
    pip3 --version && \
    pip3 install --no-cache-dir -r requirement.txt

ENV INPUT_BUCKET_FILE=s3://test/latest.csv
ENV OUTPUT_BUCKET=s3://test
ADD date-count.py date-count.py

# Adding Manually for testing
ADD input.csv input.csv
# Commented for testing
# RUN aws s3 cp $INPUT_BUCKET_FILE input.csv

RUN python3 date-count.py > output.csv && \
    cat output.csv # Printing For testing

# Commented for testing
# RUN aws s3 cp output.csv $OUTPUT_BUCKET/output.csv
