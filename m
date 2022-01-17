Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 888B049032D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jan 2022 08:51:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237718AbiAQHvi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jan 2022 02:51:38 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:42933 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235240AbiAQHvi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jan 2022 02:51:38 -0500
X-IronPort-AV: E=Sophos;i="5.88,295,1635174000"; 
   d="scan'208";a="107295307"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Jan 2022 16:51:37 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id DD6194006DEA;
        Mon, 17 Jan 2022 16:51:35 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: rzg2lc-smarc: Enable microSD on SMARC platform
Date:   Mon, 17 Jan 2022 07:51:30 +0000
Message-Id: <20220117075130.6198-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220117075130.6198-1-biju.das.jz@bp.renesas.com>
References: <20220117075130.6198-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch enables microSD card slot connected to SDHI1 on RZ/G2LC SMARC
platform by removing the sdhi1 overlay which disabled it and adding the
necessary pinmux required for SDHI1.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/r9a07g044c2-smarc.dts    |  7 ----
 .../dts/renesas/rzg2lc-smarc-pinfunction.dtsi | 39 +++++++++++++++++++
 2 files changed, 39 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
index 53845823d0dc..bfeeb6c86854 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
@@ -71,13 +71,6 @@
 	status = "disabled";
 };
 
-&sdhi1 {
-	/delete-property/ pinctrl-0;
-	/delete-property/ pinctrl-1;
-	/delete-property/ vmmc-supply;
-	status = "disabled";
-};
-
 &spi1 {
 	/delete-property/ pinctrl-0;
 	status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
index 5333a1f9a0e7..1032f6563515 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
@@ -17,6 +17,45 @@
 			 <RZG2L_PORT_PINMUX(38, 1, 1)>;	/* RxD */
 	};
 
+	sd1-pwr-en-hog {
+		gpio-hog;
+		gpios = <RZG2L_GPIO(39, 2) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "sd1_pwr_en";
+	};
+
+	sdhi1_pins: sd1 {
+		sd1_data {
+			pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3";
+			power-source = <3300>;
+		};
+
+		sd1_ctrl {
+			pins = "SD1_CLK", "SD1_CMD";
+			power-source = <3300>;
+		};
+
+		sd1_mux {
+			pinmux = <RZG2L_PORT_PINMUX(19, 0, 1)>; /* SD1_CD */
+		};
+	};
+
+	sdhi1_pins_uhs: sd1_uhs {
+		sd1_data_uhs {
+			pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3";
+			power-source = <1800>;
+		};
+
+		sd1_ctrl_uhs {
+			pins = "SD1_CLK", "SD1_CMD";
+			power-source = <1800>;
+		};
+
+		sd1_mux_uhs {
+			pinmux = <RZG2L_PORT_PINMUX(19, 0, 1)>; /* SD1_CD */
+		};
+	};
+
 	sound_clk_pins: sound_clk {
 		pins = "AUDIO_CLK1", "AUDIO_CLK2";
 		input-enable;
-- 
2.17.1

