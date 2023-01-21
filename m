Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA1BC6766F7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Jan 2023 15:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbjAUO74 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 21 Jan 2023 09:59:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbjAUO74 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Jan 2023 09:59:56 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1D47D20061;
        Sat, 21 Jan 2023 06:59:45 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,235,1669042800"; 
   d="scan'208";a="150151097"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 21 Jan 2023 23:59:45 +0900
Received: from localhost.localdomain (unknown [10.226.92.25])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id ED50342BC25E;
        Sat, 21 Jan 2023 23:59:42 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v3 12/12] arm64: dts: renesas: rzv2mevk2: Enable USB3 role switch
Date:   Sat, 21 Jan 2023 14:58:53 +0000
Message-Id: <20230121145853.4792-13-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230121145853.4792-1-biju.das.jz@bp.renesas.com>
References: <20230121145853.4792-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable USB3 role switch on RZ/V2M EVK by linking USB3 peri node
with hd3ss3220 controller node.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change
v1->v2:
 * No change
---
 .../boot/dts/renesas/r9a09g011-v2mevk2.dts    | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
index 2cd1c9f6dc6a..c9df1c00a08e 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
@@ -22,6 +22,29 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "usb-c-connector";
+		label = "USB-C";
+		data-role = "dual";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				hs_ep: endpoint {
+					remote-endpoint = <&usb3_hs_ep>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				ss_ep: endpoint {
+					remote-endpoint = <&hd3ss3220_in_ep>;
+				};
+			};
+		};
+	};
+
 	memory@58000000 {
 		device_type = "memory";
 		/*
@@ -59,6 +82,28 @@ &i2c0 {
 	pinctrl-names = "default";
 	clock-frequency = <400000>;
 	status = "okay";
+
+	hd3ss3220@47 {
+		compatible = "ti,hd3ss3220";
+		reg = <0x47>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				hd3ss3220_in_ep: endpoint {
+					remote-endpoint = <&ss_ep>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				hd3ss3220_out_ep: endpoint {
+					remote-endpoint = <&usb3_role_switch>;
+				};
+			};
+		};
+	};
 };
 
 &i2c2 {
@@ -93,7 +138,26 @@ &usb3host {
 };
 
 &usb3peri {
+	companion = <&usb3host>;
 	status = "okay";
+	usb-role-switch;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			usb3_hs_ep: endpoint {
+				remote-endpoint = <&hs_ep>;
+			};
+		};
+		port@1 {
+			reg = <1>;
+			usb3_role_switch: endpoint {
+				remote-endpoint = <&hd3ss3220_out_ep>;
+			};
+		};
+	};
 };
 
 &wdt0 {
-- 
2.25.1

