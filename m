Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02E589A087
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2019 21:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731509AbfHVTyo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Aug 2019 15:54:44 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:41583 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727953AbfHVTyo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Aug 2019 15:54:44 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 8C3EAC0002;
        Thu, 22 Aug 2019 19:54:41 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: Add LIF channel index to 'vsps'
Date:   Thu, 22 Aug 2019 21:56:00 +0200
Message-Id: <20190822195600.30787-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to the Renesas R-Car DU bindings documentation, the 'vsps'
property should be composed by a phandle to the VSP instance and the
index of the LIF channel assigned to the DU channel. Some SoC device
tree source files do not specify any LIF channel index, relying on the
driver defaulting it to 0 if not specified.

Align all device tree files by specifying the LIF channel index as
prescribed by the bindings documentation. While at it, add a comment to
the 'vsps' property parsing routine to point out the LIF channel index
is still defaulted to 0 for backward compatibility with non-standard DTB
found in the wild.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---

Patch based on Geert's latest renesas-devel master branch
---

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi    | 2 +-
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi     | 2 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi    | 2 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi    | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c        | 9 ++++++++-
 6 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 06c7c849c8ab..d179ee3da308 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -2651,7 +2651,7 @@
 			clock-names = "du.0", "du.1", "du.2";
 			status = "disabled";

-			vsps = <&vspd0 &vspd1 &vspd2>;
+			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>;

 			ports {
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index e4650ae5b75a..14d8513d2a47 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -30,7 +30,7 @@
 };

 &du {
-	vsps = <&vspd0 &vspd1 &vspd2 &vspd3>;
+	vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd3 0>;
 };

 &fcpvb1 {
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 3dc9d73f589a..8c9bf985d436 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -2765,7 +2765,7 @@
 			clock-names = "du.0", "du.1", "du.2";
 			status = "disabled";

-			vsps = <&vspd0 &vspd1 &vspd2>;
+			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>;

 			ports {
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index 0cd3b376635d..2c4ab70e2a39 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -1120,7 +1120,7 @@
 			clock-names = "du.0";
 			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
 			resets = <&cpg 724>;
-			vsps = <&vspd0>;
+			vsps = <&vspd0 0>;
 			status = "disabled";

 			ports {
diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 461a47ea656d..042f4089e546 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -1495,7 +1495,7 @@
 			clock-names = "du.0";
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 724>;
-			vsps = <&vspd0>;
+			vsps = <&vspd0 0>;
 			status = "disabled";

 			ports {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 2dc9caee8767..1a9e182b2b55 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -585,7 +585,14 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)

 		vsps[j].crtcs_mask |= BIT(i);

-		/* Store the VSP pointer and pipe index in the CRTC. */
+		/*
+		 * Store the VSP pointer and pipe index in the CRTC.
+		 *
+		 * FIXME: According to the DT bindings, the LIF pipe instance
+		 * index shall always be specified. For backward compatibility
+		 * with older DTB without any index specified, default it to 0
+		 * if cells < 1.
+		 */
 		rcdu->crtcs[i].vsp = &rcdu->vsps[j];
 		rcdu->crtcs[i].vsp_pipe = cells >= 1 ? args.args[0] : 0;
 	}
--
2.22.0

