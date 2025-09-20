Return-Path: <linux-renesas-soc+bounces-22113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B5FB8C145
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Sep 2025 09:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73AA256648D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Sep 2025 07:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09722264CB;
	Sat, 20 Sep 2025 07:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ceS0/8Ji"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E29222590
	for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Sep 2025 07:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758351885; cv=none; b=lshwd5hZMiAiVFM/mg12o41aWsmKVCfDzIzumpWHf8pFCswpu1ZoQFHZbmLL7dN3wXnVUjGJKacnsTLuu0ATxRPIoQVdk6dqmOY6FPLyh3A32v4oo1b88A92bz5fmVy+F41VywxidrDV8vYRt8jkeUZ123lY+kIfECYjsnftBJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758351885; c=relaxed/simple;
	bh=ms6H0zuIbTYWoJdWWwX8nF6BGcBfA/YLHETn8ZbeEMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZJ9wrpdavd/VD0q0AiIAnRxN5v/AIrlwGVPc1U42pQHmSP28TKVsRGXOEEfe96EeYM/ZOseE3zPBiwPgXeJi0H3BFDOorxVTp3tr/HeDTcsrK2doK8DBtfSTzW16ra/kpGmu2L+XhEjFMPR5sA864ioWJ4GdckdtSrvCwULKTJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ceS0/8Ji; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=7ennbGTkPtMsB+
	E8zT/JHm1h/5feeorOxgKf4lzb0L8=; b=ceS0/8JiSCfXbJWibdwLOADo2z1J0Z
	4kt4qX2yEcPMhjfCTfPWKLTuWR2OmY39BSmDynnudNj5zyUePu5rdkMF5gKfBqkD
	RzAwpXQtY70S1F68EWd8tUHb89bO9qro04ngHrYgsnQORkLHUzCgYhTB6EawWx12
	Uyh9ktFyKJu5t8MU/+ePeppyXppOlDL2cw4gUnATHSIxa2xXtSp3ai5f9BCQNvCi
	woli2y2DzNdX1IiN4ocJmToJLqSBYe0f4I2JaCdly2KYS2WK8mmRvL94e3ZmaByp
	CLxL9GE4mKwTrXQHKuoISv4IWV1DBldoIp1HKvTdU8AALIzEvsfkL+CQ==
Received: (qmail 4174503 invoked from network); 20 Sep 2025 09:04:41 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Sep 2025 09:04:41 +0200
X-UD-Smtp-Session: l3s3148p1@ywhKMzY/muAgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: v3{m|h}sk: remove wrong sound property in HDMI encoder node
Date: Sat, 20 Sep 2025 09:04:34 +0200
Message-ID: <20250920070433.8229-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'#sound-dai-cells' is not mentioned in the encoder bindings doc, so
dtbs_check rightfully complains. Remove the property.

.../renesas-v8/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dtb: hdmi@39 (adi,adv7511w): '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts | 1 -
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
index 445f5dd7c983..6319a66fac95 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -146,7 +146,6 @@ &i2c0 {
 
 	hdmi@39 {
 		compatible = "adi,adv7511w";
-		#sound-dai-cells = <0>;
 		reg = <0x39>;
 		interrupts-extended = <&gpio1 20 IRQ_TYPE_LEVEL_LOW>;
 		avdd-supply = <&vcc_d1_8v>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
index c2692d6fd00d..2da63b4daa0a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
@@ -138,7 +138,6 @@ &i2c0 {
 
 	hdmi@39 {
 		compatible = "adi,adv7511w";
-		#sound-dai-cells = <0>;
 		reg = <0x39>;
 		interrupts-extended = <&gpio1 20 IRQ_TYPE_LEVEL_LOW>;
 		avdd-supply = <&vcc1v8_d4>;
-- 
2.47.2


