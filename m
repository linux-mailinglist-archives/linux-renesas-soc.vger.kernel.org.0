Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD19C6E1D1C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Apr 2023 09:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjDNH11 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Apr 2023 03:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjDNH10 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Apr 2023 03:27:26 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B7A284C33
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Apr 2023 00:27:25 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,195,1677510000"; 
   d="scan'208";a="155967157"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Apr 2023 16:27:23 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CFF2541AF0C1;
        Fri, 14 Apr 2023 16:27:23 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a779f0: spider: Enable PCIe Host ch0
Date:   Fri, 14 Apr 2023 16:27:17 +0900
Message-Id: <20230414072717.2931212-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230414072717.2931212-1-yoshihiro.shimoda.uh@renesas.com>
References: <20230414072717.2931212-1-yoshihiro.shimoda.uh@renesas.com>
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
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
index dd8e0e159526..12f2a1db4fb7 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
@@ -66,6 +66,14 @@ &extalr_clk {
 	clock-frequency = <32768>;
 };
 
+&gpio2 {
+	pci-clkreq0-hog {
+		gpio-hog;
+		gpios = <15 GPIO_ACTIVE_LOW>;
+		output-high;
+	};
+};
+
 &hscif0 {
 	pinctrl-0 = <&hscif0_pins>;
 	pinctrl-names = "default";
@@ -86,6 +94,12 @@ gpio_exp_20: gpio@20 {
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
 
@@ -125,6 +139,11 @@ &mmc0 {
 	status = "okay";
 };
 
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

