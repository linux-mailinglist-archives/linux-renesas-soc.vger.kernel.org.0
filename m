Return-Path: <linux-renesas-soc+bounces-3512-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE21873534
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 11:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 535911F24264
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 10:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980306089E;
	Wed,  6 Mar 2024 10:58:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4553A262
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Mar 2024 10:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709722728; cv=none; b=Yz22WTfRM+MWxLFsKyopnQOKqi5LQcxq1Rq/gRz5NqOu9M2QtNs2M8lUJz21s0iM79z/+bIb71RatNGxBr4B7zzgnGcpNp9F7TexIoIPKs+gEImMJt2BLz7QgMjXxuRFi+ShOmUfaOXOKq4rClodQIm4uKTkyiKoAg6cx1gaknM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709722728; c=relaxed/simple;
	bh=yOuPaPBqKDcmtyk5O+TXJAAqBYShjqLRSbQhJo63mfA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lRYcX0KQXVeXvQMoa0pRMQnOdFduFo4ok8GjdAZob3a+mMF2/y4Gaiq136T3keaqUh+MWrWI8UqaxbtCgux+QmEDQqGxBTYH6cqYzt6DSvG9illmbI+gXgYd7rf/pyOj0nWfBUdHUGRCo3cUCaswmpVFJEQfFsVOdOJNHAA2W5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([84.195.187.55])
	by albert.telenet-ops.be with bizsmtp
	id vNyj2B00P1C8whw06Nyj41; Wed, 06 Mar 2024 11:58:44 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rhoyk-002Y9V-JX;
	Wed, 06 Mar 2024 11:58:43 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rhoyx-00EMM2-Nj;
	Wed, 06 Mar 2024 11:58:43 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779h0: Add thermal nodes
Date: Wed,  6 Mar 2024 11:58:35 +0100
Message-Id: <d1f07c77943912145583d8916ba3ca65d143b1b1.1709722573.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Duy Nguyen <duy.nguyen.rh@renesas.com>

Add device nodes for the Thermal Sensor/Chip Internal Voltage
Monitor/Core Voltage Monitor (THS/CIVM/CVM) and the various thermal
zones on the Renesas R-Car V4M (R8A779H0) SoC.

Add support for 2 TSC nodes of thermal.

Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on Renesas Gray Hawk Single with an R-Car V4M SoC that has
unfortunately no calibration values fused.
To be queued in renesas-devel for v6.10.

Changes compared to the BSP:
  - Drop bogus interrupts property, as interrupts are routed to the ECM,
  - Change polling-delay from <0> to <1000> as interrupts are not
    supported.
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 40 +++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 11885729181bc903..a01929231e08fa30 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -318,6 +318,16 @@ sysc: system-controller@e6180000 {
 			#power-domain-cells = <1>;
 		};
 
+		tsc: thermal@e6198000 {
+			compatible = "renesas,r8a779h0-thermal";
+			reg = <0 0xe6198000 0 0x200>,
+			      <0 0xe61a0000 0 0x200>;
+			clocks = <&cpg CPG_MOD 919>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 919>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		i2c0: i2c@e6500000 {
 			compatible = "renesas,i2c-r8a779h0",
 				     "renesas,rcar-gen4-i2c";
@@ -653,6 +663,36 @@ prr: chipid@fff00044 {
 		};
 	};
 
+	thermal-zones {
+		sensor_thermal_cr52: sensor1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsc 0>;
+
+			trips {
+				sensor1_crit: sensor1-crit {
+					temperature = <120000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		sensor_thermal_ca76: sensor2-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsc 1>;
+
+			trips {
+				sensor2_crit: sensor2-crit {
+					temperature = <120000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts-extended = <&gic GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
-- 
2.34.1


