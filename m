Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72A5D5EF383
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Sep 2022 12:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233770AbiI2KbM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Sep 2022 06:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235532AbiI2KbK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Sep 2022 06:31:10 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 61CC112FF10;
        Thu, 29 Sep 2022 03:31:09 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,354,1654527600"; 
   d="scan'208";a="136619499"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 29 Sep 2022 19:31:09 +0900
Received: from localhost.localdomain (unknown [10.226.92.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1F218400F7A8;
        Thu, 29 Sep 2022 19:31:05 +0900 (JST)
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
Subject: [PATCH RFC 5/7] arm64: dts: renesas: r9a07g044: Add MTU3 PWM support
Date:   Thu, 29 Sep 2022 11:30:41 +0100
Message-Id: <20220929103043.1228235-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220929103043.1228235-1-biju.das.jz@bp.renesas.com>
References: <20220929103043.1228235-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add MTU3 pwm support by adding pwm nodes to RZ/G2L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 05193457502a..f853b2d0b8ff 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -249,6 +249,48 @@ counter@2 {
 				reg = <2>;
 				status = "disabled";
 			};
+
+			pwm@1 {
+				compatible = "renesas,rz-mtu3-pwm";
+				reg = <1>;
+				#pwm-cells = <2>;
+				status = "disabled";
+			};
+
+			pwm@2 {
+				compatible = "renesas,rz-mtu3-pwm";
+				reg = <2>;
+				#pwm-cells = <2>;
+				status = "disabled";
+			};
+
+			pwm@3 {
+				compatible = "renesas,rz-mtu3-pwm";
+				reg = <3>;
+				#pwm-cells = <2>;
+				status = "disabled";
+			};
+
+			pwm@4 {
+				compatible = "renesas,rz-mtu3-pwm";
+				reg = <4>;
+				#pwm-cells = <2>;
+				status = "disabled";
+			};
+
+			pwm@6 {
+				compatible = "renesas,rz-mtu3-pwm";
+				reg = <6>;
+				#pwm-cells = <2>;
+				status = "disabled";
+			};
+
+			pwm@7 {
+				compatible = "renesas,rz-mtu3-pwm";
+				reg = <7>;
+				#pwm-cells = <2>;
+				status = "disabled";
+			};
 		};
 
 		gpt0: pwm@10048000 {
-- 
2.25.1

