Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C62524A060
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Aug 2020 15:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728548AbgHSNq2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Aug 2020 09:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728555AbgHSNoV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Aug 2020 09:44:21 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F7CCC061345
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2020 06:44:01 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id HRjl2300S4C55Sk01Rjlxb; Wed, 19 Aug 2020 15:43:56 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8ONV-0003E6-JN; Wed, 19 Aug 2020 15:43:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8ONV-0007Fi-Hm; Wed, 19 Aug 2020 15:43:45 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 6/7] arm64: dts: renesas: rcar-gen3: Convert EtherAVB to explicit delay handling
Date:   Wed, 19 Aug 2020 15:43:43 +0200
Message-Id: <20200819134344.27813-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819134344.27813-1-geert+renesas@glider.be>
References: <20200819134344.27813-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Some EtherAVB variants support internal clock delay configuration, which
can add larger delays than the delays that are typically supported by
the PHY (using an "rgmii-*id" PHY mode, and/or "[rt]xc-skew-ps"
properties).

Historically, the EtherAVB driver configured these delays based on the
"rgmii-*id" PHY mode.  This was wrong, as these are meant solely for the
PHY, not for the MAC.  Hence properties were introduced for explicit
configuration of these delays.

Convert the R-Car Gen3 DTS files from the old to the new scheme:
  - Add default "rx-internal-delay-ps" and "tx-internal-delay-ps"
    properties to the SoC .dtsi files, to be overridden by board files
    where needed,
  - Convert board files from "rgmii-*id" PHY modes to "rgmii", adding
    the appropriate "rx-internal-delay-ps" and/or "tx-internal-delay-ps"
    overrides.

Notes:
  - R-Car E3 and D3 do not support TX internal delay handling,
  - On R-Car D3, TX internal delay handling must always be enabled,
    hence this fixes a bug on Draak,
  - On R-Car V3H, RX internal delay handling must always be enabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This depends on "[PATCH v3 5/7] ravb: Add support for explicit internal
clock delay configuration", and thus must not be applied before its
dependency has hit upstream.

v3:
  - No changes,

v2:
  - Replace "renesas,[rt]xc-delay-ps" by "[rt]x-internal-delay-ps".
---
 arch/arm64/boot/dts/renesas/r8a77951.dtsi        | 2 ++
 arch/arm64/boot/dts/renesas/r8a77960.dtsi        | 2 ++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi        | 2 ++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi        | 2 ++
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts   | 3 ++-
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts   | 3 ++-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi        | 2 ++
 arch/arm64/boot/dts/renesas/r8a77980.dtsi        | 2 ++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi        | 1 +
 arch/arm64/boot/dts/renesas/r8a77995.dtsi        | 1 +
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi            | 2 +-
 12 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 9beb8e76d9235b71..1b1a014c829a2e2a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -1250,6 +1250,8 @@
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 812>;
 			phy-mode = "rgmii";
+			rx-internal-delay-ps = <0>;
+			tx-internal-delay-ps = <0>;
 			iommus = <&ipmmu_ds0 16>;
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 4dfb7f07678714e9..e6c88a748692b212 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -1126,6 +1126,8 @@
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			resets = <&cpg 812>;
 			phy-mode = "rgmii";
+			rx-internal-delay-ps = <0>;
+			tx-internal-delay-ps = <0>;
 			iommus = <&ipmmu_ds0 16>;
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 542c44c7dbca30b6..6fdc28a6d2cf0354 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -1012,6 +1012,8 @@
 			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
 			resets = <&cpg 812>;
 			phy-mode = "rgmii";
+			rx-internal-delay-ps = <0>;
+			tx-internal-delay-ps = <0>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index fe4dc12e2bdfae6f..6206e28f37efae73 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -988,6 +988,8 @@
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
 			resets = <&cpg 812>;
 			phy-mode = "rgmii";
+			rx-internal-delay-ps = <0>;
+			tx-internal-delay-ps = <0>;
 			iommus = <&ipmmu_ds0 16>;
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index 5c28f303e911343c..874a7fc2730b00db 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -81,7 +81,8 @@
 
 	renesas,no-ether-link;
 	phy-handle = <&phy0>;
-	phy-mode = "rgmii-id";
+	rx-internal-delay-ps = <1800>;
+	tx-internal-delay-ps = <2000>;
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
index 668a1ece9af00420..7417cf5fea0f0a65 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -102,7 +102,8 @@
 
 	renesas,no-ether-link;
 	phy-handle = <&phy0>;
-	phy-mode = "rgmii-id";
+	rx-internal-delay-ps = <1800>;
+	tx-internal-delay-ps = <2000>;
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index 2b9124a5ca860dd2..7be8ad1ca4646d79 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -615,6 +615,8 @@
 			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
 			resets = <&cpg 812>;
 			phy-mode = "rgmii";
+			rx-internal-delay-ps = <0>;
+			tx-internal-delay-ps = <0>;
 			iommus = <&ipmmu_rt 3>;
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 59f5bbd72161706d..f573dc0552272195 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -667,6 +667,8 @@
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 812>;
 			phy-mode = "rgmii";
+			rx-internal-delay-ps = <0>;
+			tx-internal-delay-ps = <2000>;
 			iommus = <&ipmmu_ds1 33>;
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 1991bdc36792f4e3..07c35e9b049ae151 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -938,6 +938,7 @@
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
 			resets = <&cpg 812>;
 			phy-mode = "rgmii";
+			rx-internal-delay-ps = <0>;
 			iommus = <&ipmmu_ds0 16>;
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 2c2272f5f5b52105..624aaa6d7f20d6d4 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -628,6 +628,7 @@
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
 			resets = <&cpg 812>;
 			phy-mode = "rgmii";
+			rx-internal-delay-ps = <1800>;
 			iommus = <&ipmmu_ds0 16>;
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 1bf77957d2c21db9..6c643ed74fc586bb 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -324,7 +324,7 @@
 	pinctrl-0 = <&avb_pins>;
 	pinctrl-names = "default";
 	phy-handle = <&phy0>;
-	phy-mode = "rgmii-txid";
+	tx-internal-delay-ps = <2000>;
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index ff88af8e39d3fa10..bd4efdf91afca42b 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -144,7 +144,7 @@
 	pinctrl-0 = <&avb_pins>;
 	pinctrl-names = "default";
 	phy-handle = <&phy0>;
-	phy-mode = "rgmii-txid";
+	tx-internal-delay-ps = <2000>;
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-- 
2.17.1

