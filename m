Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E551C423A1A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Oct 2021 10:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237758AbhJFJAi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Oct 2021 05:00:38 -0400
Received: from www.zeus03.de ([194.117.254.33]:47616 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237653AbhJFJAh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 05:00:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=x1SuSoDS2mpWA9
        diwsCA8sN7XEN+rBgh+hPvJQjk0A8=; b=wQlvU11OiWT79W/WvSNfbwqCMFWPUA
        y1dJnoQh/vz2Ym87t3eFCAJYG3MUUeh8Vw4wpxeGkV4pQLplRAWO0E3cvIeAPZvJ
        j1dOTO0S3d8hfNLFTc4AEdMtlf54SgWTtKYzOFhc27mLTNZReKJ0ebIzLEO5pMkV
        XPVu+udP+mUcY=
Received: (qmail 4135913 invoked from network); 6 Oct 2021 10:58:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Oct 2021 10:58:44 +0200
X-UD-Smtp-Session: l3s3148p1@LFB7WqvNjLggAwDPXwnIAEWfFJ7Kfqru
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 4/4] arm64: dts: renesas: falcon-cpu: add SPI flash via RPC
Date:   Wed,  6 Oct 2021 10:58:36 +0200
Message-Id: <20211006085836.42155-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006085836.42155-1-wsa+renesas@sang-engineering.com>
References: <20211006085836.42155-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index a0a1a1da0d87..81ac05d3b2eb 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -166,6 +166,11 @@ mmc_pins: mmc {
 		power-source = <1800>;
 	};
 
+	qspi0_pins: qspi0 {
+		groups = "qspi0_ctrl", "qspi0_data4";
+		function = "qspi0";
+	};
+
 	scif0_pins: scif0 {
 		groups = "scif0_data", "scif0_ctrl";
 		function = "scif0";
@@ -177,6 +182,34 @@ scif_clk_pins: scif_clk {
 	};
 };
 
+&rpc {
+	pinctrl-0 = <&qspi0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	flash@0 {
+		compatible = "spansion,s25fs512s", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <40000000>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			boot@0 {
+				reg = <0x0 0xcc0000>;
+				read-only;
+			};
+			user@cc0000 {
+				reg = <0xcc0000 0x3340000>;
+			};
+		};
+	};
+};
+
 &rwdt {
 	timeout-sec = <60>;
 	status = "okay";
-- 
2.30.2

