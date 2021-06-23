Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16DCE3B1CFC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 16:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbhFWPBy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 11:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231236AbhFWPBx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 11:01:53 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6716DC061574
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jun 2021 07:59:36 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9418:90dd:e41:936d])
        by michel.telenet-ops.be with bizsmtp
        id LezY2501e1TrtvA06ezYuk; Wed, 23 Jun 2021 16:59:32 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lw4Lf-002ynr-CE; Wed, 23 Jun 2021 16:59:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lw4Lf-0033NO-06; Wed, 23 Jun 2021 16:59:27 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779a0: Restore sort order
Date:   Wed, 23 Jun 2021 16:59:25 +0200
Message-Id: <8d68a7ce449aaf90a88e69397dbe0e9c467d5726.1624460175.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The thermal node was inserted at the wrong place, breaking sort order
(sort by unit address, but group nodes of the same type).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Probably it was my fault, not Niklas' ;-)

To be queued in renesas-devel for v5.15.

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 26 +++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index a7dfade1801a87db..3676b2bd3d646cdb 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -327,6 +327,19 @@ sysc: system-controller@e6180000 {
 			#power-domain-cells = <1>;
 		};
 
+		tsc: thermal@e6190000 {
+			compatible = "renesas,r8a779a0-thermal";
+			reg = <0 0xe6190000 0 0x200>,
+			      <0 0xe6198000 0 0x200>,
+			      <0 0xe61a0000 0 0x200>,
+			      <0 0xe61a8000 0 0x200>,
+			      <0 0xe61b0000 0 0x200>;
+			clocks = <&cpg CPG_MOD 919>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 919>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		tmu0: timer@e61e0000 {
 			compatible = "renesas,tmu-r8a779a0", "renesas,tmu";
 			reg = <0 0xe61e0000 0 0x30>;
@@ -392,19 +405,6 @@ tmu4: timer@ffc00000 {
 			status = "disabled";
 		};
 
-		tsc: thermal@e6190000 {
-			compatible = "renesas,r8a779a0-thermal";
-			reg = <0 0xe6190000 0 0x200>,
-			      <0 0xe6198000 0 0x200>,
-			      <0 0xe61a0000 0 0x200>,
-			      <0 0xe61a8000 0 0x200>,
-			      <0 0xe61b0000 0 0x200>;
-			clocks = <&cpg CPG_MOD 919>;
-			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-			resets = <&cpg 919>;
-			#thermal-sensor-cells = <1>;
-		};
-
 		i2c0: i2c@e6500000 {
 			compatible = "renesas,i2c-r8a779a0",
 				     "renesas,rcar-gen3-i2c";
-- 
2.25.1

