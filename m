Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC97462F435
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 13:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235282AbiKRMJ6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Nov 2022 07:09:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235088AbiKRMJ6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 07:09:58 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AEC758FF8F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 04:09:56 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,174,1665414000"; 
   d="scan'208";a="140505613"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 18 Nov 2022 21:09:55 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B11A840065A3;
        Fri, 18 Nov 2022 21:09:55 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v6 2/3] arm64: dts: renesas: r8a779f0: spider: Enable Ethernet Switch and SERDES
Date:   Fri, 18 Nov 2022 21:09:52 +0900
Message-Id: <20221118120953.1186392-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118120953.1186392-1-yoshihiro.shimoda.uh@renesas.com>
References: <20221118120953.1186392-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable Ethernet Switch and SERDES for R-Car S4-8 (r8a779f0).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 .../dts/renesas/r8a779f0-spider-ethernet.dtsi | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
index 15e8d1ebf575..33c1015e9ab3 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
@@ -5,6 +5,10 @@
  * Copyright (C) 2021 Renesas Electronics Corp.
  */
 
+&eth_serdes {
+	status = "okay";
+};
+
 &i2c4 {
 	eeprom@52 {
 		compatible = "rohm,br24g01", "atmel,24c01";
@@ -13,3 +17,89 @@ eeprom@52 {
 		pagesize = <8>;
 	};
 };
+
+&pfc {
+	tsn0_pins: tsn0 {
+		groups = "tsn0_mdio_b", "tsn0_link_b";
+		function = "tsn0";
+		power-source = <1800>;
+	};
+
+	tsn1_pins: tsn1 {
+		groups = "tsn1_mdio_b", "tsn1_link_b";
+		function = "tsn1";
+		power-source = <1800>;
+	};
+
+	tsn2_pins: tsn2 {
+		groups = "tsn2_mdio_b", "tsn2_link_b";
+		function = "tsn2";
+		power-source = <1800>;
+	};
+};
+
+&rswitch {
+	pinctrl-0 = <&tsn0_pins>, <&tsn1_pins>, <&tsn2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ethernet-ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			phy-handle = <&u101>;
+			phy-mode = "sgmii";
+			phys = <&eth_serdes 0>;
+
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				u101: ethernet-phy@1 {
+					reg = <1>;
+					compatible = "ethernet-phy-ieee802.3-c45";
+					interrupt-parent = <&gpio3>;
+					interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+				};
+			};
+		};
+		port@1 {
+			reg = <1>;
+			phy-handle = <&u201>;
+			phy-mode = "sgmii";
+			phys = <&eth_serdes 1>;
+
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				u201: ethernet-phy@2 {
+					reg = <2>;
+					compatible = "ethernet-phy-ieee802.3-c45";
+					interrupt-parent = <&gpio3>;
+					interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+				};
+			};
+		};
+		port@2 {
+			reg = <2>;
+			phy-handle = <&u301>;
+			phy-mode = "sgmii";
+			phys = <&eth_serdes 2>;
+
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				u301: ethernet-phy@3 {
+					reg = <3>;
+					compatible = "ethernet-phy-ieee802.3-c45";
+					interrupt-parent = <&gpio3>;
+					interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+				};
+			};
+		};
+	};
+};
-- 
2.25.1

