Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60D953AC95C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 13:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233913AbhFRLGa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 07:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232164AbhFRLG0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 07:06:26 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D13C0617AD
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Jun 2021 04:04:16 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:104a:f93d:b771:fc40])
        by laurent.telenet-ops.be with bizsmtp
        id Jb4C2500K47PYg101b4CXG; Fri, 18 Jun 2021 13:04:13 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1luCIG-000yA7-DW; Fri, 18 Jun 2021 13:04:12 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1luCIF-007GWd-Oa; Fri, 18 Jun 2021 13:04:11 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/5] arm64: dts: renesas: r8a774c0: Add generic compatible string to IIC node
Date:   Fri, 18 Jun 2021 13:04:09 +0200
Message-Id: <d222c2faa63f95d672efa07e55e8d01bddd17e65.1624013699.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1624013699.git.geert+renesas@glider.be>
References: <cover.1624013699.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to the Hardware User's Manual, automatic transmission for PMIC
control (DVFS) is not available" on the RZ/G2E SoC.  This really means
that support for automatic DVFS is not present, while the IIC automatic
transmission feature itself is still available, albeit not super useful.

Hence there is no longer a reason not to declare compatibility with the
R-Car Gen3-specific and generic versions.  Accordingly, extend the reg
property to cover the automatic transmission registers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index a5d4dce8476d7ea1..0b0f871bac1cb116 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -577,8 +577,10 @@ i2c7: i2c@e6690000 {
 		i2c_dvfs: i2c@e60b0000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			compatible = "renesas,iic-r8a774c0";
-			reg = <0 0xe60b0000 0 0x15>;
+			compatible = "renesas,iic-r8a774c0",
+				     "renesas,rcar-gen3-iic",
+				     "renesas,rmobile-iic";
+			reg = <0 0xe60b0000 0 0x425>;
 			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 926>;
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
-- 
2.25.1

