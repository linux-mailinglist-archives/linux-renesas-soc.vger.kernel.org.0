Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE7CD78FE46
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Sep 2023 15:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349738AbjIAN1j (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Sep 2023 09:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349739AbjIAN1i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Sep 2023 09:27:38 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A18D8CDD
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Sep 2023 06:27:35 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,219,1688396400"; 
   d="scan'208";a="178442526"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 01 Sep 2023 22:27:33 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C6D67401225B;
        Fri,  1 Sep 2023 22:27:33 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 2/2] arm64: dts: renesas: r8a779f0: spider: Enable PCIe Host ch0
Date:   Fri,  1 Sep 2023 22:27:30 +0900
Message-Id: <20230901132730.2861451-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230901132730.2861451-1-yoshihiro.shimoda.uh@renesas.com>
References: <20230901132730.2861451-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable PCIe Host controller channel 0 on R-Car S4-8 Spider board.

Since this board has an Oculink connector, CLKREQ# pin of PFC for PCIe
should not be used. So, using a GPIO is used to output the clock instead.
Otherwise the controller cannot detect a PCIe device.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
index dd8e0e159526..d959105f83bc 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
@@ -33,6 +33,12 @@ memory@480000000 {
 		reg = <0x4 0x80000000 0x0 0x80000000>;
 	};
 
+	rc21012_pci: clk-rc21012-pci {
+		compatible = "fixed-clock";
+		clock-frequency = <100000000>;
+		#clock-cells = <0>;
+	};
+
 	rc21012_ufs: clk-rc21012-ufs {
 		compatible = "fixed-clock";
 		clock-frequency = <38400000>;
@@ -86,6 +92,12 @@ gpio_exp_20: gpio@20 {
 		reg = <0x20>;
 		gpio-controller;
 		#gpio-cells = <2>;
+
+		rc21012-gpio2-hog {
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_LOW>;
+			output-high;
+		};
 	};
 };
 
@@ -125,6 +137,18 @@ &mmc0 {
 	status = "okay";
 };
 
+&pcie0_clkref {
+	compatible = "gpio-gate-clock";
+	clocks = <&rc21012_pci>;
+	enable-gpios = <&gpio2 15 GPIO_ACTIVE_LOW>;
+	/delete-property/ clock-frequency;
+};
+
+&pciec0 {
+	reset-gpio = <&gpio_exp_20 0 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
 &pfc {
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
-- 
2.25.1

