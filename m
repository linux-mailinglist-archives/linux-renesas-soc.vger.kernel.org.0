Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1AFC284AD6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Oct 2020 13:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbgJFL1R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Oct 2020 07:27:17 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:39282 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725891AbgJFL1P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Oct 2020 07:27:15 -0400
X-IronPort-AV: E=Sophos;i="5.77,342,1596466800"; 
   d="scan'208";a="59050097"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 06 Oct 2020 20:27:14 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5F94942CD75D;
        Tue,  6 Oct 2020 20:27:12 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/4] arm64: dts: renesas: aistarvision-mipi-adapter-2.1: Add parent macro for each sensor
Date:   Tue,  6 Oct 2020 12:26:58 +0100
Message-Id: <20201006112701.11800-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201006112701.11800-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20201006112701.11800-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

For HiHope RZ/G2H the OV5645 sensor is populated on i2c2 whereas the imx219
sensor is populated on i2c3 so add support for handling such cases by
adding a parent macro for each sensor.

Also update r8a774c0-ek874-mipi-2.1.dts to incorporate the changes.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi | 4 +++-
 arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts       | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi b/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
index dac6ff49020f..7ce986f0a06f 100644
--- a/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
+++ b/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
@@ -61,7 +61,7 @@
 	};
 };
 
-&MIPI_PARENT_I2C {
+&MIPI_OV5645_PARENT_I2C {
 	ov5645: ov5645@3c {
 		compatible = "ovti,ov5645";
 		reg = <0x3c>;
@@ -77,7 +77,9 @@
 			};
 		};
 	};
+};
 
+&MIPI_IMX219_PARENT_I2C {
 	imx219: imx219@10 {
 		compatible = "sony,imx219";
 		reg = <0x10>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
index f0829e905506..e7b4a929bb17 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
@@ -8,7 +8,8 @@
 
 /dts-v1/;
 #include "r8a774c0-ek874.dts"
-#define MIPI_PARENT_I2C i2c3
+#define MIPI_OV5645_PARENT_I2C i2c3
+#define MIPI_IMX219_PARENT_I2C i2c3
 #include "aistarvision-mipi-adapter-2.1.dtsi"
 
 / {
-- 
2.17.1

