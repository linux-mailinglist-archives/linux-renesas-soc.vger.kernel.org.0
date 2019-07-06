Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB58361105
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  6 Jul 2019 16:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727147AbfGFOHJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 6 Jul 2019 10:07:09 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:55919 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727119AbfGFOHI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 6 Jul 2019 10:07:08 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0535CC0002;
        Sat,  6 Jul 2019 14:07:04 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/19] arm64: dts: renesas: r8a7795: Add CMM units
Date:   Sat,  6 Jul 2019 16:07:37 +0200
Message-Id: <20190706140746.29132-11-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add CMM units to Renesas R-Car H3 device tree and reference them from
the Display Unit they are connected to.

While at it, re-sort the du device node properties to match the ordering
found in other SoCs.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 36 +++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 432f4036a8a8..aae7976f3738 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -2895,6 +2895,38 @@
 			renesas,fcp = <&fcpvi1>;
 		};
 
+		cmm0: cmm@fea40000 {
+			compatible = "renesas,rcar-gen3-cmm";
+			reg = <0 0xfea40000 0 0x1000>;
+			clocks = <&cpg CPG_MOD 711>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 711>;
+		};
+
+		cmm1: cmm@fea50000 {
+			compatible = "renesas,rcar-gen3-cmm";
+			reg = <0 0xfea50000 0 0x1000>;
+			clocks = <&cpg CPG_MOD 710>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 710>;
+		};
+
+		cmm2: cmm@fea60000 {
+			compatible = "renesas,rcar-gen3-cmm";
+			reg = <0 0xfea60000 0 0x1000>;
+			clocks = <&cpg CPG_MOD 709>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 709>;
+		};
+
+		cmm3: cmm@fea70000 {
+			compatible = "renesas,rcar-gen3-cmm";
+			reg = <0 0xfea70000 0 0x1000>;
+			clocks = <&cpg CPG_MOD 708>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 708>;
+		};
+
 		csi20: csi2@fea80000 {
 			compatible = "renesas,r8a7795-csi2";
 			reg = <0 0xfea80000 0 0x10000>;
@@ -3098,9 +3130,11 @@
 				 <&cpg CPG_MOD 722>,
 				 <&cpg CPG_MOD 721>;
 			clock-names = "du.0", "du.1", "du.2", "du.3";
-			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
 			status = "disabled";
 
+			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
+			cmms = <&cmm0 &cmm1 &cmm2 &cmm3>;
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.21.0

