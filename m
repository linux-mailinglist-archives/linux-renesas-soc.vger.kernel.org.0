Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5544543A6F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 19:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbiFHRao (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 13:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbiFHRam (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 13:30:42 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 26E7BF5C;
        Wed,  8 Jun 2022 10:30:41 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,286,1647270000"; 
   d="scan'208";a="123763353"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 Jun 2022 02:30:40 +0900
Received: from localhost.localdomain (unknown [10.226.92.52])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A9D7840CE62B;
        Thu,  9 Jun 2022 02:30:37 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: rzg2ul-smarc-som: Enable ADC on SMARC platform
Date:   Wed,  8 Jun 2022 18:30:25 +0100
Message-Id: <20220608173025.22792-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220608173025.22792-1-biju.das.jz@bp.renesas.com>
References: <20220608173025.22792-1-biju.das.jz@bp.renesas.com>
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

Enable the ADC found on RZ/G2UL SMARC SoM.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
index 8fdc956cd6c7..cf3b3d118ef1 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
@@ -57,6 +57,14 @@ vccq_sdhi0: regulator-vccq-sdhi0 {
 #endif
 };
 
+#if (SW_SW0_DEV_SEL)
+&adc {
+	pinctrl-0 = <&adc_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+#endif
+
 #if (!SW_ET0_EN_N)
 &eth0 {
 	pinctrl-0 = <&eth0_pins>;
@@ -124,6 +132,10 @@ &ostm2 {
 };
 
 &pinctrl {
+	adc_pins: adc {
+		pinmux = <RZG2L_PORT_PINMUX(6, 2, 1)>; /* ADC_TRG */
+	};
+
 	eth0_pins: eth0 {
 		pinmux = <RZG2L_PORT_PINMUX(4, 5, 1)>, /* ET0_LINKSTA */
 			 <RZG2L_PORT_PINMUX(4, 3, 1)>, /* ET0_MDC */
-- 
2.25.1

