Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99BEF40477C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Sep 2021 11:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232346AbhIIJEf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Sep 2021 05:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232355AbhIIJEb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Sep 2021 05:04:31 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2358C0613C1
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Sep 2021 02:03:21 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7d44:646d:3ffb:9bbf])
        by albert.telenet-ops.be with bizsmtp
        id rl3L250033eH4vN06l3LGL; Thu, 09 Sep 2021 11:03:20 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mOFxn-003D1e-Nu; Thu, 09 Sep 2021 11:03:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mOFxm-00BOvJ-VP; Thu, 09 Sep 2021 11:03:18 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] arm64: dts: renesas: rcar-gen3: Add missing Ethernet PHY resets
Date:   Thu,  9 Sep 2021 11:03:12 +0200
Message-Id: <3e6fd765850e8ef0980d8e98bc5f2126538d626f.1631177442.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631177442.git.geert+renesas@glider.be>
References: <cover.1631177442.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe all Ethernet PHY reset GPIOs on R-Car Gen3 boards, to avoid
relying solely on boot loaders to bring PHYs out of reset.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This assumes the CPLD on v3hsk takes care of the PHY reset, like it is
documented to do on v3msk.
---
 arch/arm64/boot/dts/renesas/draak.dtsi          | 1 +
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts  | 1 +
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts  | 2 ++
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts | 2 ++
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts  | 2 ++
 5 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts/renesas/draak.dtsi
index 5f5a0bb2da86cc57..eb0327c0df48f2e3 100644
--- a/arch/arm64/boot/dts/renesas/draak.dtsi
+++ b/arch/arm64/boot/dts/renesas/draak.dtsi
@@ -249,6 +249,7 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		interrupt-parent = <&gpio5>;
 		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio5 18 GPIO_ACTIVE_LOW>;
 		/*
 		 * TX clock internal delay mode is required for reliable
 		 * 1Gbps communication using the KSZ9031RNX phy present on
diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index c7451973f8a5b2a7..6586a3bd51b4aad6 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -98,6 +98,7 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio1 16 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
index 2f77ec4ed7e16166..39f3e6cbba3d500f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -8,6 +8,7 @@
 
 /dts-v1/;
 #include "r8a77970.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Renesas V3M Starter Kit board";
@@ -113,6 +114,7 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio1 16 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
index 4cb5bfa6932d5809..3d6d10c82f48d667 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
@@ -8,6 +8,7 @@
 
 /dts-v1/;
 #include "r8a77980.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Renesas Condor board based on r8a77980";
@@ -138,6 +139,7 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		interrupt-parent = <&gpio4>;
 		interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
index ca69d1b1d67af047..1d09d8867651a06b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
@@ -8,6 +8,7 @@
 
 /dts-v1/;
 #include "r8a77980.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Renesas V3H Starter Kit board";
@@ -118,6 +119,7 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		interrupt-parent = <&gpio4>;
 		interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
 	};
 };
 
-- 
2.25.1

