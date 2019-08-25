Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8749F9C43A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Aug 2019 16:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728393AbfHYOAS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 25 Aug 2019 10:00:18 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:32939 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728359AbfHYOAS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Aug 2019 10:00:18 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id A3191FF805;
        Sun, 25 Aug 2019 14:00:15 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: renesas: Add LIF channel indices to vsps property
Date:   Sun, 25 Aug 2019 16:01:34 +0200
Message-Id: <20190825140135.12150-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190825140135.12150-1-jacopo+renesas@jmondi.org>
References: <20190825140135.12150-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to the Renesas R-Car DU bindings documentation, the 'vsps'
property should be composed of a phandle to the VSP instance and the
index of the LIF channel assigned to the DU channel. Some SoC device
tree source files do not specify any LIF channel index, relying on the
driver defaulting it to 0 if not specified.

Align all device tree files by specifying the LIF channel index as
prescribed by the bindings documentation.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi    | 2 +-
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi     | 2 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi    | 2 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi    | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

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
--
2.23.0

