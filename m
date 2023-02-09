Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF4DD6909A3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Feb 2023 14:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjBINPS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Feb 2023 08:15:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbjBINPS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 08:15:18 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E50B85FB47;
        Thu,  9 Feb 2023 05:14:53 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,283,1669042800"; 
   d="scan'208";a="152254984"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 09 Feb 2023 22:14:27 +0900
Received: from localhost.localdomain (unknown [10.226.92.132])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C04E940134EF;
        Thu,  9 Feb 2023 22:14:24 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH] arm64: dts: renesas: rzv2m evk: Add uart0 pins
Date:   Thu,  9 Feb 2023 13:14:22 +0000
Message-Id: <20230209131422.192941-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add uart0 pins in pinctrl node and update the uart0 node
to include pinctrl and uart-has-rtscts properties.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
index 5f8dd6f8217c..3e7740f2b3be 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
@@ -151,6 +151,13 @@ pwm13_pins: pwm13 {
 	pwm14_pins: pwm14 {
 		pinmux = <RZV2M_PORT_PINMUX(1, 14, 1)>; /* PM14 */
 	};
+
+	uart0_pins: uart0 {
+		pinmux = <RZV2M_PORT_PINMUX(3, 0, 2)>, /* UATX0 */
+			 <RZV2M_PORT_PINMUX(3, 1, 2)>, /* UARX0 */
+			 <RZV2M_PORT_PINMUX(3, 2, 2)>, /* UACTS0N */
+			 <RZV2M_PORT_PINMUX(3, 3, 2)>; /* UARTS0N */
+	};
 };
 
 &pwm8 {
@@ -201,6 +208,10 @@ &pwc {
 };
 
 &uart0 {
+	pinctrl-0 = <&uart0_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
 	status = "okay";
 };
 
-- 
2.25.1

