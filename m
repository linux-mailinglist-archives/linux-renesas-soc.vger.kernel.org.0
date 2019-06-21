Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5934E306
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbfFUJQs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:16:48 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34780 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfFUJQs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:16:48 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C0C1125BE43;
        Fri, 21 Jun 2019 19:16:36 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id F4045940FD8; Fri, 21 Jun 2019 11:16:32 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Cao Van Dong <cv-dong@jinso.co.jp>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 11/53] arm64: dts: renesas: r8a7796: Add TPU support
Date:   Fri, 21 Jun 2019 11:15:49 +0200
Message-Id: <8067f6f421dc82eaf43fe7530f36512e8a2c65dc.1561107232.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561107232.git.horms+renesas@verge.net.au>
References: <cover.1561107232.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Cao Van Dong <cv-dong@jinso.co.jp>

Add tpu device node to dtsi for TPU support on r8a7796 SoC.

Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index d5e2f4af83a4..a5c6a9920214 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1319,6 +1319,17 @@
 			status = "disabled";
 		};
 
+		tpu: pwm@e6e80000 {
+			compatible = "renesas,tpu-r8a7796", "renesas,tpu";
+			reg = <0 0xe6e80000 0 0x148>;
+			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 304>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 304>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		msiof0: spi@e6e90000 {
 			compatible = "renesas,msiof-r8a7796",
 				     "renesas,rcar-gen3-msiof";
-- 
2.11.0

