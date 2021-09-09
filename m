Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D24B40477E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Sep 2021 11:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232319AbhIIJEf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Sep 2021 05:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232346AbhIIJEb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Sep 2021 05:04:31 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB1A3C061757
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Sep 2021 02:03:21 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7d44:646d:3ffb:9bbf])
        by michel.telenet-ops.be with bizsmtp
        id rl3L250023eH4vN06l3LGx; Thu, 09 Sep 2021 11:03:20 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mOFxn-003D1d-MF; Thu, 09 Sep 2021 11:03:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mOFxm-00BOv0-Ub; Thu, 09 Sep 2021 11:03:18 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] ARM: dts: rzg1: Add missing Ethernet PHY resets
Date:   Thu,  9 Sep 2021 11:03:11 +0200
Message-Id: <e20b3643b4dc5f6c2a9e19d9544495c06075d9ff.1631177442.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631177442.git.geert+renesas@glider.be>
References: <cover.1631177442.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe all Ethernet PHY reset GPIOs on RZ/G1 boards, to avoid relying
solely on boot loaders to bring PHYs out of reset.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7743-sk-rzg1m.dts | 2 ++
 arch/arm/boot/dts/r8a7745-sk-rzg1e.dts | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts b/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
index ce36cf404fa2b1c4..ff274bfcb6646ea7 100644
--- a/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
+++ b/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
@@ -7,6 +7,7 @@
 
 /dts-v1/;
 #include "r8a7743.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "SK-RZG1M";
@@ -75,5 +76,6 @@ phy1: ethernet-phy@1 {
 		interrupt-parent = <&irqc>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
+		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
 	};
 };
diff --git a/arch/arm/boot/dts/r8a7745-sk-rzg1e.dts b/arch/arm/boot/dts/r8a7745-sk-rzg1e.dts
index 4ab6d3fcc857f7db..0a75e8c79acc0e58 100644
--- a/arch/arm/boot/dts/r8a7745-sk-rzg1e.dts
+++ b/arch/arm/boot/dts/r8a7745-sk-rzg1e.dts
@@ -7,6 +7,7 @@
 
 /dts-v1/;
 #include "r8a7745.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "SK-RZG1E";
@@ -70,5 +71,6 @@ phy1: ethernet-phy@1 {
 		interrupt-parent = <&irqc>;
 		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
+		reset-gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
 	};
 };
-- 
2.25.1

