Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 908EA458746
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Nov 2021 00:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbhKVABU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Nov 2021 19:01:20 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:17767 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229735AbhKVABT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Nov 2021 19:01:19 -0500
X-IronPort-AV: E=Sophos;i="5.87,253,1631545200"; 
   d="scan'208";a="101342571"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Nov 2021 08:58:13 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6FC244008545;
        Mon, 22 Nov 2021 08:58:11 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: dts: hihope-rzg2-ex-lvds: Add power-supply and enable-gpios to backlight node
Date:   Sun, 21 Nov 2021 23:58:08 +0000
Message-Id: <20211121235808.10167-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds missing power-supply and enable-gpios property to
backlight node. This fixes the warning "pwm-backlight backlight:
backlight supply power not found, using dummy regulator".

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi
index 40c5e8d6d841..a4fb8582a36b 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi
@@ -12,6 +12,17 @@
 
 		brightness-levels = <0 2 8 16 32 64 128 255>;
 		default-brightness-level = <6>;
+		power-supply = <&reg_12v>;
+		enable-gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_12v: regulator2 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
 	};
 };
 
-- 
2.17.1

