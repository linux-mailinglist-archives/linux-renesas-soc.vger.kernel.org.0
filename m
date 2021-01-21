Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039702FE7C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jan 2021 11:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729662AbhAUKju (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jan 2021 05:39:50 -0500
Received: from www.zeus03.de ([194.117.254.33]:57108 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729552AbhAUKjS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jan 2021 05:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=5TEIJ+GdQVS5lY
        bceNg2GF9bT8V+O8cmHFNyB9aGaeg=; b=cEwDytMxItiaa6pWF8xP7gw6yHy0XR
        pjGoD9fjZ632Mlq7qblTwcLRyIF33Mssw2i7Q8naU77mnsHjQNw9fVu2nrXBzNtZ
        OUESt2r7ZrlDESCuy4xxNHkE/OLOkZXPnKEwEanLVoRf1mo9+gir/5+8FlGsbO0P
        g0Sy2ggyHdD7I=
Received: (qmail 1805900 invoked from network); 21 Jan 2021 11:38:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jan 2021 11:38:36 +0100
X-UD-Smtp-Session: l3s3148p1@YniGrGa58L4gAwDPXyX1ACWcscxtZ2TX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] arm64: dts: renesas: falcon: Enable MMC
Date:   Thu, 21 Jan 2021 11:38:30 +0100
Message-Id: <20210121103830.9575-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121103830.9575-1-wsa+renesas@sang-engineering.com>
References: <20210121103830.9575-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Saito <takeshi.saito.xv@renesas.com>

Enable MMC on the Falcon board.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
[wsa: double checked, rebased, slightly improved, moved to falcon-cpu]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes since v1:
* improved node names for regulators
* moved entries to Falcon CPU dtsi

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
2.29.2

