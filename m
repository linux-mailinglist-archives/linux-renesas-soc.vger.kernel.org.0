Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DCE259A6A4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Aug 2022 21:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351586AbiHSTka (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Aug 2022 15:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351559AbiHSTk3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Aug 2022 15:40:29 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1C66C21E04;
        Fri, 19 Aug 2022 12:40:28 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,248,1654527600"; 
   d="scan'208";a="131896596"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Aug 2022 04:40:27 +0900
Received: from localhost.localdomain (unknown [10.226.92.25])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 20502400D4C0;
        Sat, 20 Aug 2022 04:40:25 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: renesas: rzv2m evk: Enable i2c
Date:   Fri, 19 Aug 2022 20:39:44 +0100
Message-Id: <20220819193944.337599-4-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819193944.337599-1-phil.edworthy@renesas.com>
References: <20220819193944.337599-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 .../boot/dts/renesas/r9a09g011-v2mevk2.dts    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
index c3a52fa0b16e..3666d71c7762 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
@@ -7,6 +7,7 @@
 
 /dts-v1/;
 #include "r9a09g011.dtsi"
+#include <dt-bindings/pinctrl/rzv2m-pinctrl.h>
 
 / {
 	model = "RZ/V2M Evaluation Kit 2.0";
@@ -53,6 +54,32 @@ &extal_clk {
 	clock-frequency = <48000000>;
 };
 
+&i2c0 {
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&i2c2 {
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <100000>;
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
+
+&pinctrl {
+	i2c0_pins: i2c0 {
+		pinmux = <RZV2M_PORT_PINMUX(5, 0, 2)>, /* SDA */
+			 <RZV2M_PORT_PINMUX(5, 1, 2)>; /* SCL */
+	};
+
+	i2c2_pins: i2c2 {
+		pinmux = <RZV2M_PORT_PINMUX(3, 8, 2)>, /* SDA */
+			 <RZV2M_PORT_PINMUX(3, 9, 2)>; /* SCL */
+	};
+};
-- 
2.34.1

