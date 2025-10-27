Return-Path: <linux-renesas-soc+bounces-23649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 48010C0E68D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 15:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D6305504A64
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 14:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4AA311C11;
	Mon, 27 Oct 2025 14:07:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E90D31196A;
	Mon, 27 Oct 2025 14:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761574025; cv=none; b=HOFHY7+TrEgfC3gbPqUGKa5czSRl4Tp61Vq13cX5rRLaXsvk+csaR6KrFp75L/qur6tDUiq+yJ+Cb3UCseSKSo8u9OVbBR4hJ5JdA2o9rVKK8wSWY1M2Am7jIJ4zi1ugXp8wGMkU4XSj2FRLEjLO0/mAxF1LYgIJGKI6j5opn9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761574025; c=relaxed/simple;
	bh=gcVbKAqtB0mg/BJ3362VqIdt9dAcOjtsxlKosHR2Sdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E2MIqd9K9RYkN+v1+KGt/XbZkTgXAFnD9FcKtetAsWfUAa3u0u57raNUrQDE+EWTvD3Km4DUIgArwHf074bGpz3yZsWdSeUAj2kmtbYLRgYoAbb3jGwl4nY9w08SOiWtJnbqBEUdwZNqCX3xD0sFKToe8eIAzf+VnXULoQPWKQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 5UsIOpgoS8KyghiYWtNzAA==
X-CSE-MsgGUID: nl20hn6CR8yLSPFSL3vi1A==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 Oct 2025 23:06:55 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.214])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 219FD41D9331;
	Mon, 27 Oct 2025 23:06:52 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add NMI pushbutton support
Date: Mon, 27 Oct 2025 14:06:51 +0000
Message-ID: <20251027140651.18367-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RZ/V2H EVK has a user pushbutton connected to the SoC NMI pin, which
can be used to wake up the system from suspend to idle. Add a DT node
in the device tree to instantiate the gpio-keys driver for this button.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 5c06bce3d5b4..7fff8bea9494 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -9,6 +9,7 @@
 
 #include <dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include "r9a09g057.dtsi"
 
 / {
@@ -34,6 +35,20 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	keys: keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&nmi_pins>;
+		pinctrl-names = "default";
+
+		key-wakeup {
+			interrupts-extended = <&icu 0 IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_WAKEUP>;
+			label = "NMI_SW";
+			debounce-interval = <20>;
+			wakeup-source;
+		};
+	};
+
 	memory@48000000 {
 		device_type = "memory";
 		/* first 128MB is reserved for secure area. */
@@ -320,6 +335,10 @@ i2c8_pins: i2c8 {
 			 <RZV2H_PORT_PINMUX(0, 7, 1)>; /* I2C8_SCL */
 	};
 
+	nmi_pins: nmi {
+		pins = "NMI";
+	};
+
 	scif_pins: scif {
 		pins = "SCIF_TXD", "SCIF_RXD";
 		renesas,output-impedance = <1>;
-- 
2.51.0


