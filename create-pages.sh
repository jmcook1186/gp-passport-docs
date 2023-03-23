#!/bin/sh
# run from top level dir (/gitcoin-docs), creates all content pages in appropriate subdirs
# if first time, make sure to make executable and update permissions: chmod -x 700

# mkdir src/users && mkdir src/devs && mkdir src/additional && mkdir src/case-studies

touch src/introduction.md
touch src/users/installation.md &&\
touch src/users/who-is-gp-for.md &&\
touch src/users/how-gitcoin-passport-works.md &&\
touch src/users/creating-a-passport.md &&\
touch src/users/collecting-stamps.md &&\
touch src/users/improving-scores.md &&\
touch src/users/connecting-to-apps.md &&\
touch src/devs/quick-start.md &&\
touch src/devs/integrating-passport.md &&\
touch src/devs/passport-gating.md &&\
touch src/devs/using-scoring-api.md &&\
touch src/devs/retrieving-passport-scores.md &&\
touch src/devs/use-default-scorer.md &&\
touch src/devs/custom-scorers.md&&\
touch src/devs/deduplicating-stamps.md &&\
touch src/devs/scoring-api.md &&\
touch src/devs/gitcoin-project-list.md &&\
touch src/devs/passport-protocol.md &&\
touch src/devs/passport-gating.md &&\
touch src/devs/passport-protocol.md &&\
touch src/devs/stamps.md &&\
touch src/devs/streams.md &&\
touch src/devs/reader.md &&\
touch src/devs/verifier.md &&\
touch src/devs/scorer.md &&\
touch src/devs/writer.md &&\
touch src/devs/deduplication.md &&\
touch src/additional/dev-faqs.md &&\
touch src/additional/user-faqs.md &&\
touch src/additional/contributing.md &&\
touch src/case-studies/bankless.md &&\
touch src/case-studies/snapshot.md