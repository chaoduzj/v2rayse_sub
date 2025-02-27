#!/bin/zsh



to_path=../surge_conf
source_folder=$(cd "$(dirname "$0")"; pwd)

cd $to_path

echo "\n"
./before_pull.sh
echo "\n"



source_paths=(
  "wzdnzd_aggregator_sub"
)

keywords=("Clash" "V2Ray" "SingBox" "Loon" "Surge" "QuantumultX")

for source_path in "${source_paths[@]}"; do
  for keyword in "${keywords[@]}"; do
    source_file=${source_folder}/${source_path}/${keyword}
    echo "source path: ${source_file}"
    echo "\n"

    to_folder=$source_path
    file_name=$keyword

    echo "copy to: ${to_folder}/${file_name}"
    echo "\n"

    mkdir -p $to_folder
    cp $source_file $to_folder/$file_name
  done
done



rm -rf tglaoshiji; cp -r $source_folder/tglaoshiji tglaoshiji
rm -rf gist_config; cp -r $source_folder/gist_config gist_config
rm -rf github_config; cp -r $source_folder/github_config github_config
rm -rf top_size; cp -r $source_folder/top_size top_size
rm -rf gist_aggregator; cp -r $source_folder/gist_aggregator gist_aggregator
rm -rf convert_base64; cp -r $source_folder/convert_base64 convert_base64
rm -rf v2rayclashnodes; cp -r $source_folder/v2rayclashnodes v2rayclashnodes
rm -rf myconfig; cp -r $source_folder/myconfig myconfig
rm -rf clashv2ray-hub_clashfree_sub; cp -r $source_folder/clashv2ray-hub_clashfree_sub clashv2ray-hub_clashfree_sub

echo "\n"
./after_push.sh copy_to_gitlab_log.txt