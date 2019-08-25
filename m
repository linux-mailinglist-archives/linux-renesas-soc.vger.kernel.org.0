Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29B9C9C41B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Aug 2019 15:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728460AbfHYNuv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 25 Aug 2019 09:50:51 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:56485 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728477AbfHYNuu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Aug 2019 09:50:50 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id EC819C0005;
        Sun, 25 Aug 2019 13:50:45 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli@fpond.eu, airlied@linux.ie, daniel@ffwll.ch
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/14] arm64: dts: renesas: r8a7795: Add CMM units
Date:   Sun, 25 Aug 2019 15:51:44 +0200
Message-Id: <20190825135154.11488-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
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

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 36 +++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 95deff66eeb6..21b4069f07e7 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -2909,6 +2909,38 @@
 			iommus = <&ipmmu_vi1 10>;
 		};
 
+		cmm0: cmm@fea40000 {
+			compatible = "renesas,cmm-r8a7795";
+			reg = <0 0xfea40000 0 0x1000>;
+			clocks = <&cpg CPG_MOD 711>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 711>;
+		};
+
+		cmm1: cmm@fea50000 {
+			compatible = "renesas,cmm-r8a7795";
+			reg = <0 0xfea50000 0 0x1000>;
+			clocks = <&cpg CPG_MOD 710>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 710>;
+		};
+
+		cmm2: cmm@fea60000 {
+			compatible = "renesas,cmm-r8a7795";
+			reg = <0 0xfea60000 0 0x1000>;
+			clocks = <&cpg CPG_MOD 709>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 709>;
+		};
+
+		cmm3: cmm@fea70000 {
+			compatible = "renesas,cmm-r8a7795";
+			reg = <0 0xfea70000 0 0x1000>;
+			clocks = <&cpg CPG_MOD 708>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 708>;
+		};
+
 		csi20: csi2@fea80000 {
 			compatible = "renesas,r8a7795-csi2";
 			reg = <0 0xfea80000 0 0x10000>;
@@ -3112,9 +3144,11 @@
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
2.22.0

