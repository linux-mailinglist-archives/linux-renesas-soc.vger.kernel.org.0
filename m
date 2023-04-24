Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A44386ED2A4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Apr 2023 18:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231923AbjDXQjY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Apr 2023 12:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231667AbjDXQjX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2023 12:39:23 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BF92E5B98;
        Mon, 24 Apr 2023 09:39:22 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,223,1677510000"; 
   d="scan'208";a="157088489"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 25 Apr 2023 01:39:22 +0900
Received: from localhost.localdomain (unknown [10.226.92.191])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C8F1F4021FBD;
        Tue, 25 Apr 2023 01:39:19 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v8 3/4] arm64: dts: renesas: rzg2l-smarc: Enable DU and link with DSI
Date:   Mon, 24 Apr 2023 17:39:07 +0100
Message-Id: <20230424163908.137535-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230424163908.137535-1-biju.das.jz@bp.renesas.com>
References: <20230424163908.137535-1-biju.das.jz@bp.renesas.com>
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

Enable DU and link with DSI on RZ/{G2L,V2L} SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * No Change.
v7:
 * New patch.
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi | 21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index 2a158a954b2f..cd4f569df5cd 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -49,6 +49,7 @@ ports {
 		port@0 {
 			reg = <0>;
 			dsi0_in: endpoint {
+				remote-endpoint = <&du_out_dsi>;
 			};
 		};
 
@@ -62,6 +63,26 @@ dsi0_out: endpoint {
 	};
 };
 
+&du {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			du_out_dsi: endpoint {
+				remote-endpoint = <&dsi0_in>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+		};
+	};
+};
+
 &i2c1 {
 	adv7535: hdmi@3d {
 		compatible = "adi,adv7535";
-- 
2.25.1

