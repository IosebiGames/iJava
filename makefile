.PHONY: clean

debug:
	rm -rf Payload iJava.ipa
	xcodebuild -scheme iJava -configuration Debug -derivedDataPath build -destination 'generic/platform=iOS' clean build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGN_ENTITLEMENTS="" CODE_SIGNING_ALLOWED="NO"
	mkdir -p Payload
	cp -R build/Build/Products/Debug-iphoneos/iJava.app Payload/
	zip -r iJava.ipa Payload

release:
	rm -rf Payload iJava.ipa
	xcodebuild -scheme iJava -configuration Release -derivedDataPath build -destination 'generic/platform=iOS' clean build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGN_ENTITLEMENTS="" CODE_SIGNING_ALLOWED="NO"
	mkdir -p Payload
	cp -R build/Build/Products/Release-iphoneos/iJava.app Payload/
	zip -r iJava.ipa Payload

clean:
	rm -rf build Payload iJava.ipa
