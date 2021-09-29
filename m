Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF8441BF4C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Sep 2021 08:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244427AbhI2GvQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Sep 2021 02:51:16 -0400
Received: from www.zeus03.de ([194.117.254.33]:40966 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244438AbhI2GvN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Sep 2021 02:51:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=ldM2U5cdiTNY2A
        /Ih2K0y9sTzXBR1AkEdMUf3YIo+OQ=; b=YeVUD3acXT4H61n2m4ByM5gjO5PuM7
        B8MeD7kPGx+YOmpdKUKP5yimcUCTXhkJvT8sA6HcvlzYDIyaVJ4NjAdl7SK1Q/Vt
        +DbQ3UCDFioe/uVsUH/X5EuK2Y3anWQ5V7rXmsys9VXgtHD5jc8ZBzTr91gC4qwR
        yAyS/Ws7fyg6s=
Received: (qmail 1544856 invoked from network); 29 Sep 2021 08:49:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Sep 2021 08:49:31 +0200
X-UD-Smtp-Session: l3s3148p1@HlBxuxzNyNcgAwDPXwj5ACKF5hhAYpZw
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 4/4] arm64: dts: renesas: falcon-cpu: add SPI flash via RPC
Date:   Wed, 29 Sep 2021 08:49:24 +0200
Message-Id: <20210929064924.1997-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210929064924.1997-1-wsa+renesas@sang-engineering.com>
References: <20210929064924.1997-1-wsa+renesas@sang-engineering.com>
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
index a0a1a1da0d87..7eeee1da9c0b 100644
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
+			boot_partition@0 {
+				reg = <0x00000000 0xc40000>;
+				read-only;
+			};
+			user@c40000 {
+				reg = <0x00c40000 0x33c0000>;
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

