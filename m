Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33D1E5E5A88
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Sep 2022 07:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbiIVFRP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Sep 2022 01:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbiIVFRO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Sep 2022 01:17:14 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 18A7FB029E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Sep 2022 22:17:13 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,335,1654527600"; 
   d="scan'208";a="135788128"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Sep 2022 14:17:12 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6FA21400D0D4;
        Thu, 22 Sep 2022 14:17:12 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 2/2] arm64: dts: renesas: r8a779f0: spider: Enable Ethernet Switch and SERDES
Date:   Thu, 22 Sep 2022 14:17:06 +0900
Message-Id: <20220922051706.3442382-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922051706.3442382-1-yoshihiro.shimoda.uh@renesas.com>
References: <20220922051706.3442382-1-yoshihiro.shimoda.uh@renesas.com>
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
 .../dts/renesas/r8a779f0-spider-ethernet.dtsi | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
index 15e8d1ebf575..8f6f7d5ea31a 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
@@ -4,6 +4,9 @@
  *
  * Copyright (C) 2021 Renesas Electronics Corp.
  */
+&eth_serdes {
+	status = "okay";
+};
 
 &i2c4 {
 	eeprom@52 {
@@ -13,3 +16,54 @@ eeprom@52 {
 		pagesize = <8>;
 	};
 };
+
+&rswitch {
+	status = "okay";
+
+	ethernet-ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			phys = <&eth_serdes 0>;
+			phy-handle = <&u101>;
+			phy-mode = "sgmii";
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
+			phys = <&eth_serdes 1>;
+			phy-handle = <&u201>;
+			phy-mode = "sgmii";
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
+			phys = <&eth_serdes 2>;
+			phy-handle = <&u301>;
+			phy-mode = "sgmii";
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

