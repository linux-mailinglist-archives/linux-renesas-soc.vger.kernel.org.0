Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2692C9C41D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Aug 2019 15:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728556AbfHYNvA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 25 Aug 2019 09:51:00 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:51213 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728493AbfHYNu7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Aug 2019 09:50:59 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A88EDC0003;
        Sun, 25 Aug 2019 13:50:55 +0000 (UTC)
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
Subject: [PATCH v3 07/14] arm64: dts: renesas: r8a77995: Add CMM units
Date:   Sun, 25 Aug 2019 15:51:47 +0200
Message-Id: <20190825135154.11488-8-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add CMM units to Renesas R-Car D3 device tree and reference them from
the Display Unit they are connected to.

While at it, re-sort the du device node properties to match the ordering
found in other SoCs.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 183fef86cf7c..b91a20fbbbc6 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -993,6 +993,22 @@
 			iommus = <&ipmmu_vi0 9>;
 		};
 
+		cmm0: cmm@fea40000 {
+			compatible = "renesas,cmm-r8a77995";
+			reg = <0 0xfea40000 0 0x1000>;
+			clocks = <&cpg CPG_MOD 711>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 711>;
+		};
+
+		cmm1: cmm@fea50000 {
+			compatible = "renesas,cmm-r8a77995";
+			reg = <0 0xfea50000 0 0x1000>;
+			clocks = <&cpg CPG_MOD 710>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 710>;
+		};
+
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a77995";
 			reg = <0 0xfeb00000 0 0x40000>;
@@ -1003,9 +1019,11 @@
 			clock-names = "du.0", "du.1";
 			resets = <&cpg 724>;
 			reset-names = "du.0";
-			vsps = <&vspd0 0>, <&vspd1 0>;
 			status = "disabled";
 
+			vsps = <&vspd0 0>, <&vspd1 0>;
+			cmms = <&cmm0 &cmm1>;
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.22.0

