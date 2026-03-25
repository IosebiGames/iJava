.PHONY: clean

debug:
	xcodebuild -scheme iJava -configuration Debug -derivedDataPath build -destination 'generic/platform=iOS' clean build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGN_ENTITLEMENTS="" CODE_SIGNING_ALLOWED="NO"
	mkdir payload
	cp -r build/Build/Products/Debug-iphoneos/iJava.app payload/iJava.app
	codesign --remove payload/iJava.app
	zip -Ar iJava.ipa payload

release:
	xcodebuild -scheme iJava -configuration Release -derivedDataPath build -destination 'generic/platform=iOS' clean build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGN_ENTITLEMENTS="" CODE_SIGNING_ALLOWED="NO"
	mkdir payload
	cp -r build/Build/Products/Release-iphoneos/iJava.app payload/iJava.app
	codesign --remove payload/iJava.app
	zip -Ar iJava.ipa payload

clean:
	rm -rf build payload iJava.ipa
