Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDC2C603B99
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Oct 2022 10:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbiJSIf7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Oct 2022 04:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbiJSIf6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Oct 2022 04:35:58 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 05FC251401
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Oct 2022 01:35:44 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.95,195,1661785200"; 
   d="scan'208";a="137157502"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 19 Oct 2022 17:35:41 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id DBCBE400BC0B;
        Wed, 19 Oct 2022 17:35:41 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4 2/2] arm64: dts: renesas: r8a779f0: spider: Enable Ethernet Switch and SERDES
Date:   Wed, 19 Oct 2022 17:35:38 +0900
Message-Id: <20221019083538.933127-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221019083538.933127-1-yoshihiro.shimoda.uh@renesas.com>
References: <20221019083538.933127-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable Ethernet Switch and SERDES for R-Car S4-8 (r8a779f0).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 .../dts/renesas/r8a779f0-spider-ethernet.dtsi | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
index 15e8d1ebf575..5642d69f76ca 100644
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
@@ -13,3 +17,76 @@ eeprom@52 {
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
+		port@0 {
+			reg = <0>;
+			phy-handle = <&u101>;
+			phy-mode = "sgmii";
+			phys = <&eth_serdes 0>;
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				u101: ethernet-phy@1 {
+					reg = <1>;
+					compatible = "ethernet-phy-ieee802.3-c45";
+				};
+			};
+		};
+		port@1 {
+			reg = <1>;
+			phy-handle = <&u201>;
+			phy-mode = "sgmii";
+			phys = <&eth_serdes 1>;
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				u201: ethernet-phy@2 {
+					reg = <2>;
+					compatible = "ethernet-phy-ieee802.3-c45";
+				};
+			};
+		};
+		port@2 {
+			reg = <2>;
+			phy-handle = <&u301>;
+			phy-mode = "sgmii";
+			phys = <&eth_serdes 2>;
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				u301: ethernet-phy@3 {
+					reg = <3>;
+					compatible = "ethernet-phy-ieee802.3-c45";
+				};
+			};
+		};
+	};
+};
-- 
2.25.1

