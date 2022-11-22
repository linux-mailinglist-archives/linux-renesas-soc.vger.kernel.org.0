Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B29D663496A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Nov 2022 22:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235095AbiKVVgA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Nov 2022 16:36:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235101AbiKVVf5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Nov 2022 16:35:57 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5B2CFC605E;
        Tue, 22 Nov 2022 13:35:56 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,185,1665414000"; 
   d="scan'208";a="143583264"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Nov 2022 06:35:56 +0900
Received: from localhost.localdomain (unknown [10.226.92.123])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9F75D40D24BC;
        Wed, 23 Nov 2022 06:35:53 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 7/7] arm64: dts: renesas: rzg2l-smarc: Enable DSI and link with ADV7535
Date:   Tue, 22 Nov 2022 21:35:29 +0000
Message-Id: <20221122213529.2103849-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221122213529.2103849-1-biju.das.jz@bp.renesas.com>
References: <20221122213529.2103849-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable DSI and link with ADV7535 on RZ/G2L SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 This patch depen upon patch [1]
 [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221122185802.1853648-1-biju.das.jz@bp.renesas.com/

Will link DSI port@0 with DU, once we have DU node is ready.
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi | 30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index 01ea8759c192..6e1aa077b77a 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -33,6 +33,29 @@ &cpu_dai {
 	sound-dai = <&ssi0>;
 };
 
+&dsi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dsi0_in: endpoint {
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dsi0_out: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&adv7535_in>;
+			};
+		};
+	};
+};
+
 &i2c1 {
 	pinctrl-0 = <&i2c1_pins>;
 	pinctrl-names = "default";
@@ -56,6 +79,13 @@ ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
+			port@0 {
+				reg = <0>;
+				adv7535_in: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
 			port@1 {
 				reg = <1>;
 				adv7535_out: endpoint {
-- 
2.25.1

