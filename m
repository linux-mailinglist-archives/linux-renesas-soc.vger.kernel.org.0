Return-Path: <linux-renesas-soc+bounces-17953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93052AD14E1
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Jun 2025 23:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DCB87A4B6E
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Jun 2025 21:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633AD2580F1;
	Sun,  8 Jun 2025 21:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WnjZSBpW";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="byqGow6S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E08D2550CD;
	Sun,  8 Jun 2025 21:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749419558; cv=none; b=FQlGVX5EDuLJypLQqYHqDyMgwPSSlAxDTO3u6uW5GKEW/2KqCul3CSRpD3gONKpqn8agy+IYSwkhutkB6SaUszCQUcke1fYiKBfTQu9W/xYMi8jYOZG846ns2xdnfMPgQRh3Xcw1yTr8IE0l2F7y6/GUXFqnRabRfUO6wLJTArY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749419558; c=relaxed/simple;
	bh=HLAvGPGdeB//OrPFwh+uXM//lTxqQfmsGLbP3kBBi8o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qt+F0lCKxcuwhd6ihSnLfBjMHDgLyD1yilERumblf6rKoRwbx/y1DQ+BEKAtg5U3gSaKmtRlhGIRF9HV86T4Vw4HaTFSCMQkwcL48WS8byDDf6Ck1AUyqK2Ip+8divY2XGR1629q6XVZ5CTF5YVKj+PgJ2HQm0VMhlOf9yT5QsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WnjZSBpW; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=byqGow6S; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bFpgd1KtGz9stw;
	Sun,  8 Jun 2025 23:52:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749419549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vuHm92jjAqTiOXgOBm3MlO8YN8ijYqZbHNTQKOA2KFA=;
	b=WnjZSBpWdASc9I/HKCzec56Fgj4EfOuvOwOaHxeTadfUiklKfW4YNdCzwjR/McFeHvzaeb
	+/nbpSk8+qFcbh4LUPeuAt53B3X4gw+TXUTK2Tb2eIlttrrngBObs6k2nnitqZX1f6J3MT
	NVVASiPfqjdMSPVHd89wY4eSUpPHgQbvThYvBF3V10aEljquxHS8ZOUNfh5K9bH2QJas5A
	9bVlenOIFbfdZud/lmz2TkW4pNJeOO4hK40WSGhktY95ENbP9qx7PziptzZ7hK5viM5SBb
	adJ1belThfzjBk1gPxv6vi76mVFn1dCBd1bpebT02+bczSf9t3iISUeEPgZVFg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749419547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vuHm92jjAqTiOXgOBm3MlO8YN8ijYqZbHNTQKOA2KFA=;
	b=byqGow6SlDWKWrDm47vundsrmeEbAHpQWrajz9Zwkg4z5UKSvC95cteI6/srtE20IZpdtj
	z5TbZHt+f+TPA6AvkDT6F0qkaQ8LBeKhybZnGFhjpsABBc2JBaaM3+gPGdAluiRYX1WIvc
	qud+96hbMkqXPMSRwUS+d/SeVWfw+PNege9W1TMOgluVotn2BAv9HfS/ShkQzEpIUyOoSl
	U4poEW+ObokNlBNHUO632YbdyDWjGGuP/Dth35XqHJ+lfzxYDvibTyEEEIJwQhfH8IKaAM
	4Qv7iXv6ezqCfU9y8XdAXIutxbDzSFLpFx36PA83gamMNmTtv7ktnyx6Kx5TSg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: Add bootph-all to sysinfo EEPROM on R-Car Gen3
Date: Sun,  8 Jun 2025 23:51:20 +0200
Message-ID: <20250608215212.1619182-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: u1ukiybnrsttf9zk317xy15a748u3jaq
X-MBO-RS-ID: 5080ee407c2994054c4
X-Rspamd-Queue-Id: 4bFpgd1KtGz9stw

Add bootph-all property to sysinfo EEPROM on Renesas R-Car Gen3
Salvator-X(S), ULCB, Condor, Ebisu, Draak boards. The sysinfo
EEPROM is used by U-Boot early on, mark it using the bootph-all
property. No functional change for the Linux kernel, this only
reduces the divergence of DTs between U-Boot and Linux.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/condor-common.dtsi   | 2 ++
 arch/arm64/boot/dts/renesas/draak.dtsi           | 2 ++
 arch/arm64/boot/dts/renesas/ebisu.dtsi           | 2 ++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 2 ++
 arch/arm64/boot/dts/renesas/ulcb.dtsi            | 2 ++
 5 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/condor-common.dtsi b/arch/arm64/boot/dts/renesas/condor-common.dtsi
index a10584150571..9fe9c722187d 100644
--- a/arch/arm64/boot/dts/renesas/condor-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/condor-common.dtsi
@@ -174,6 +174,7 @@ phy0: ethernet-phy@0 {
 &i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 
 	status = "okay";
 	clock-frequency = <400000>;
@@ -230,6 +231,7 @@ eeprom@50 {
 		compatible = "rohm,br24t01", "atmel,24c01";
 		reg = <0x50>;
 		pagesize = <8>;
+		bootph-all;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts/renesas/draak.dtsi
index 380b857fd273..71d9f277c966 100644
--- a/arch/arm64/boot/dts/renesas/draak.dtsi
+++ b/arch/arm64/boot/dts/renesas/draak.dtsi
@@ -308,6 +308,7 @@ &hsusb {
 &i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "default";
+	bootph-all;
 	status = "okay";
 
 	ak4613: codec@10 {
@@ -449,6 +450,7 @@ eeprom@50 {
 		compatible = "rohm,br24t01", "atmel,24c01";
 		reg = <0x50>;
 		pagesize = <8>;
+		bootph-all;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index 4f38b01ae18d..aa3092205879 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -503,6 +503,7 @@ cs2000: clk-multiplier@4f {
 };
 
 &i2c_dvfs {
+	bootph-all;
 	status = "okay";
 
 	clock-frequency = <400000>;
@@ -526,6 +527,7 @@ eeprom@50 {
 		compatible = "rohm,br24t01", "atmel,24c01";
 		reg = <0x50>;
 		pagesize = <8>;
+		bootph-all;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 68971c870d17..bbb3583372d0 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -592,6 +592,7 @@ csa_dvfs: adc@7f {
 };
 
 &i2c_dvfs {
+	bootph-all;
 	status = "okay";
 
 	clock-frequency = <400000>;
@@ -625,6 +626,7 @@ eeprom@50 {
 		compatible = "rohm,br24t01", "atmel,24c01";
 		reg = <0x50>;
 		pagesize = <8>;
+		bootph-all;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index fcab957b54f7..8a30908992ab 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -244,6 +244,7 @@ versaclock5: clock-generator@6a {
 };
 
 &i2c_dvfs {
+	bootph-all;
 	status = "okay";
 
 	clock-frequency = <400000>;
@@ -277,6 +278,7 @@ eeprom@50 {
 		compatible = "rohm,br24t01", "atmel,24c01";
 		reg = <0x50>;
 		pagesize = <8>;
+		bootph-all;
 	};
 };
 
-- 
2.47.2


