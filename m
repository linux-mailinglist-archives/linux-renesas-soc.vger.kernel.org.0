Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 043053022A4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Jan 2021 09:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727214AbhAYICW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Jan 2021 03:02:22 -0500
Received: from www.zeus03.de ([194.117.254.33]:50440 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727235AbhAYIAX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jan 2021 03:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=Ealc9vTJF4vUFe
        SMns3bNZH45e82WPEf4k9+Ivd7NqE=; b=hatbshJxawdjv5r1UNtCyI8Uh5umFX
        AT5DlooJMiiRz24dEL40ORkfJibE23S32Or2TxcBnQ5e52hEhTWI8g1URtf6zZRD
        Syl13sCKjGn4wvNFPGBxigIR7ZFcgYC6B7dZqfQw9wGYgJj1ZAqwgpMjQscrPB33
        Nz7wfnu7FBcN0=
Received: (qmail 3246876 invoked from network); 25 Jan 2021 08:58:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jan 2021 08:58:48 +0100
X-UD-Smtp-Session: l3s3148p1@Xfxu6LS5fNJUhs5S
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 2/2] arm64: dts: renesas: falcon: Enable MMC
Date:   Mon, 25 Jan 2021 08:58:45 +0100
Message-Id: <20210125075845.3864-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210125075845.3864-1-wsa+renesas@sang-engineering.com>
References: <20210125075845.3864-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Saito <takeshi.saito.xv@renesas.com>

Enable MMC on the Falcon board.

Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
[wsa: double checked, rebased, slightly improved, moved to falcon-cpu]
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v2: added tags

 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index 0059381443f6..c54d1e287a49 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -32,6 +32,24 @@ memory@700000000 {
 		device_type = "memory";
 		reg = <0x7 0x00000000 0x0 0x80000000>;
 	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &avb0 {
@@ -189,6 +207,23 @@ &i2c6 {
 	clock-frequency = <400000>;
 };
 
+&mmc0 {
+	pinctrl-0 = <&mmc_pins>;
+	pinctrl-1 = <&mmc_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_1p8v>;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+	non-removable;
+	full-pwr-cycle-in-suspend;
+	status = "okay";
+};
+
 &pfc {
 	avb0_pins: avb0 {
 		mux {
@@ -327,6 +362,12 @@ i2c6_pins: i2c6 {
 		groups = "i2c6";
 		function = "i2c6";
 	};
+
+	mmc_pins: mmc {
+		groups = "mmc_data8", "mmc_ctrl", "mmc_ds";
+		function = "mmc";
+		power-source = <1800>;
+	};
 };
 
 &scif0 {
-- 
2.28.0

