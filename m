Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91CD161101
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  6 Jul 2019 16:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727174AbfGFOHM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 6 Jul 2019 10:07:12 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:52889 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727153AbfGFOHK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 6 Jul 2019 10:07:10 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 5DA04C000C;
        Sat,  6 Jul 2019 14:07:07 +0000 (UTC)
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
Subject: [PATCH v2 11/19] arm64: dts: renesas: r8a77965: Add CMM units
Date:   Sat,  6 Jul 2019 16:07:38 +0200
Message-Id: <20190706140746.29132-12-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add CMM units to Renesas R-Car M3-N device tree and reference them from
the Display Unit they are connected to.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 25 +++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index b701aeb4f438..aad9ea67c379 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2307,6 +2307,30 @@
 			resets = <&cpg 602>;
 		};
 
+		cmm0: cmm@fea40000 {
+			compatible = "renesas,rcar-gen3-cmm";
+			reg = <0 0xfea40000 0 0x1000>;
+			clocks = <&cpg CPG_MOD 711>;
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			resets = <&cpg 711>;
+		};
+
+		cmm1: cmm@fea50000 {
+			compatible = "renesas,rcar-gen3-cmm";
+			reg = <0 0xfea50000 0 0x1000>;
+			clocks = <&cpg CPG_MOD 710>;
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			resets = <&cpg 710>;
+		};
+
+		cmm3: cmm@fea70000 {
+			compatible = "renesas,rcar-gen3-cmm";
+			reg = <0 0xfea70000 0 0x1000>;
+			clocks = <&cpg CPG_MOD 708>;
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			resets = <&cpg 708>;
+		};
+
 		csi20: csi2@fea80000 {
 			compatible = "renesas,r8a77965-csi2";
 			reg = <0 0xfea80000 0 0x10000>;
@@ -2457,6 +2481,7 @@
 			status = "disabled";
 
 			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd0 1>;
+			cmms = <&cmm0 &cmm1 &cmm3>;
 
 			ports {
 				#address-cells = <1>;
-- 
2.21.0

