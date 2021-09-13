Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A40384084FC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Sep 2021 08:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237453AbhIMGys (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Sep 2021 02:54:48 -0400
Received: from www.zeus03.de ([194.117.254.33]:37178 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229634AbhIMGys (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 02:54:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=4BFiHFLq2/Zt/T
        8guXqxdpaRn8hSA9gerPF5XNGfi/o=; b=NmIUcBJf8WPuzcKctcgN09+k6YijCF
        glvDoVKI7jYM7x/N1saJD26MvseP0DdaU1sPMva1ws1I/N9vrtDreFVa/adAsl3j
        tKXOM7jltHBJRRXyyny5AlgsHtthPp+9u8gRymd4YacmpM2ESVd6glsM9MihHnag
        ahUWVpvPz1TM0=
Received: (qmail 2765684 invoked from network); 13 Sep 2021 08:53:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Sep 2021 08:53:31 +0200
X-UD-Smtp-Session: l3s3148p1@zwtQ7NrL6MsgAwDPXwnUAPbX7otZ63eo
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 4/4] arm64: dts: renesas: falcon-cpu: add SPI flash via RPC
Date:   Mon, 13 Sep 2021 08:53:17 +0200
Message-Id: <20210913065317.2297-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913065317.2297-1-wsa+renesas@sang-engineering.com>
References: <20210913065317.2297-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Comments: The BSP used 40 MHz as the spi-max-frequency. But it is the
same SPI flash chip as on other R-Car Gen3 boards, so I took the max
value from there, 50MHz. It worked so far.

Probably the boot partition could be described more precisely and split
up into further partitions. Do we want that? So far, I kept what the BSP
is using.

 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index a0a1a1da0d87..854bd7b94ce7 100644
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
+		spi-max-frequency = <50000000>;
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
+			user@00c40000 {
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

