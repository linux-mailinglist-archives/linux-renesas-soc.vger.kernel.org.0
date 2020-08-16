Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 262F3245956
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Aug 2020 21:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729808AbgHPTdi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 16 Aug 2020 15:33:38 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:7266 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729688AbgHPTdh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Aug 2020 15:33:37 -0400
X-IronPort-AV: E=Sophos;i="5.76,321,1592838000"; 
   d="scan'208";a="54692823"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Aug 2020 04:33:36 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 293D140D5466;
        Mon, 17 Aug 2020 04:33:34 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH 2/3] ARM: dts: r8a7742-iwg21m: Add RTC support
Date:   Sun, 16 Aug 2020 20:33:15 +0100
Message-Id: <20200816193316.7641-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200816193316.7641-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200816193316.7641-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable BQ32000 RTC which is connected to I2C0 on the iWave RainboW-G21M-q7
SOM.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 arch/arm/boot/dts/r8a7742-iwg21m.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7742-iwg21m.dtsi b/arch/arm/boot/dts/r8a7742-iwg21m.dtsi
index 6e8df79bea94..0f26807f92b8 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21m.dtsi
+++ b/arch/arm/boot/dts/r8a7742-iwg21m.dtsi
@@ -35,6 +35,21 @@
 	clock-frequency = <20000000>;
 };
 
+&i2c0 {
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	rtc@68 {
+		compatible = "ti,bq32000";
+		reg = <0x68>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
 &mmcif1 {
 	pinctrl-0 = <&mmc1_pins>;
 	pinctrl-names = "default";
@@ -46,6 +61,11 @@
 };
 
 &pfc {
+	i2c0_pins: i2c0 {
+		groups = "i2c0";
+		function = "i2c0";
+	};
+
 	mmc1_pins: mmc1 {
 		groups = "mmc1_data4", "mmc1_ctrl";
 		function = "mmc1";
-- 
2.17.1

