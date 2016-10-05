#!/bin/bash
set -e

# Check parameters
VERSION=$1
PUSH=$5
BUILD_DIR="./"
if [ $# != 2 ]
then 
  echo You must provide the product version, push/yes/no \(e.g. \"prepare_release.sh 3.3.0 yes\"\)
exit -1
fi


echo ::: Updating plugin versions ::
mvn -Dtycho.mode=maven org.eclipse.tycho:tycho-versions-plugin:0.20.0:set-version -DnewVersion=$VERSION -Dartifacts=jlab-product,products-csstudio-jlab-features,org.csstudio.jlab.product.feature,jlab-repository
# update product because set-version doesn't
sed -i 's/\(\<product[^>]\+\? version=\"\)[^"]*\("[^>]\+\?>\)/\1'${VERSION}'\2/g'  repository/cs-studio.product

echo ::: Committing and tagging version $VERSION :::
git commit -a -m "Updating changelog, splash, manifests to version $VERSION"
if [ "$PUSH" = "true" ]
then
  echo ::: Tagging version $VERSION :::
  git tag CSS-$VERSION
  echo ::: Pushing changes :::
  git push origin
  git push origin CSS-$VERSION
fi
