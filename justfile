# 새 플러그인 생성
# 사용 예: just create-plugin awesome_example
create-plugin PLUGIN:
	#!/usr/bin/env zsh
	flutter create --template=plugin --platforms=android,ios packages/{{PLUGIN}}
	PUBSPEC="packages/{{PLUGIN}}/pubspec.yaml"
	if [ -f "$PUBSPEC" ]; then
		echo "Updating pubspec.yaml for {{PLUGIN}}..."

		# 'homepage' 필드 수정
		sed -i '' -e '/homepage:/s|.*|homepage: https://github.com/uprise-fin/flutter-plugins|' "$PUBSPEC"

		# 'repository' 필드 수정
		if grep -q "repository:" "$PUBSPEC"; then
			sed -i '' -e '/repository:/s|.*|repository: https://github.com/uprise-fin/flutter-plugins|' "$PUBSPEC"
		else
			echo "repository: https://github.com/uprise-fin/flutter-plugins" >> "$PUBSPEC"
		fi
	else
		echo "Error: pubspec.yaml not found for {{PLUGIN}}"
	fi

# 플러그인 배포
# 사용 예: just publish-plugin awesome_example
publish-plugin PLUGIN:
	#!/usr/bin/env zsh
	(cd packages/{{PLUGIN}} && flutter pub publish)

# 플러그인 실행
# 사용 예: just run awesome_example
run PLUGIN:
	#!/usr/bin/env zsh
	(cd packages/{{PLUGIN}}/example && flutter run)

# 플러그인 설치
# 사용 예: just pub-get awesome_example
pub-get PLUGIN:
	#!/usr/bin/env zsh
	(cd packages/{{PLUGIN}}/example && flutter pub get)

# 플러그인 청소
# 사용 예: just clean awesome_example
clean PLUGIN:
	#!/usr/bin/env zsh
	(cd packages/{{PLUGIN}}/example && flutter pub cache repair && flutter clean)

