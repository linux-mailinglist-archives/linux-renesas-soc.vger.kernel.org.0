Return-Path: <linux-renesas-soc+bounces-26881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B46D25D65
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 17:49:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCD10301AD06
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 16:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F043BF2E5;
	Thu, 15 Jan 2026 16:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bHTOD0KL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B145217F27;
	Thu, 15 Jan 2026 16:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768495766; cv=none; b=q0pX1QVQu2VnFgiOlgJtm7V5ouNCitHHo+0b34WbRu+H8tBAHJ2ree8D4rFz9g9m+mOhG6al3qnQiXQIdovUYp0+oBNvSDm4ToGAcnqkCJoKc/HBZDmwq/JFm4zCjZN5tUaVlRdS16a4uI2O0XmQsfuLhtLmW79ynJTtnzFllbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768495766; c=relaxed/simple;
	bh=IdQFJSXwy+AMqU3U54zVviNy0g+m8tItjUI1E+PytD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mxnD6HnYwtrwnD4qUrfUbkKicNOTYBxa+DvtJknhL3wO9vJg4DoRwoxV0Wc8CZ/lI7sYmmI2jIeQQyP+A5mR9cOV8oxS1mQhsQmsahs7prjZQvhOHjrnwNVLWxwNuVJsnTSsC8VjUnsuk/uzVknWaTaU+6aQyJS6VBmMOoJpaGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bHTOD0KL; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BC214C1F1E7;
	Thu, 15 Jan 2026 16:48:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B1ED606E0;
	Thu, 15 Jan 2026 16:49:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 65AD710B686D6;
	Thu, 15 Jan 2026 17:49:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768495761; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=9pCZbbXP/5us9hiblo6tveEStJrU1ebsHM97naLEsEU=;
	b=bHTOD0KLGEf3ZuxSBGro2P3RbI2g56ZO+JsQz0BgSqjQGfC+fDgK0SCy0nmIbnnrwsiEY9
	pg1qMr+/CaTaidW/3EEhyb7rE3LHVZJeDsQNtOxB4On/iOo9eP11LUIC4XGAJJ2gjA/qn8
	1j67C1/NE6u7S8GpavhurQNv4nRoGWpjGJQQIOAy2Jmx3OtzqfegkaJAIrgAv0j6+bmhuf
	PlPpI+UQwkMe+lK7E3boZOqP17ii7SHC9PT1xR9mLi9drWzwL6YSgsckqEHrWL6tu4gwvI
	AiLqWQE9Ac3bFeqMKGGrUixbjAPNVm9yfvVWu1oEP9DQPveZcPLvzVo5DrkRKQ==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Subject: [PATCH v2] ARM: dts: renesas: r9a06g032: Add support for CPU frequency scaling
Date: Thu, 15 Jan 2026 17:49:05 +0100
Message-ID: <20260115164905.1203453-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

In RZ/N1 SoCs, CPUs are allowed to work at 125, 250 or 500 MHz when the
'ref' clock frequency value is set to 500 MHz which is the default 'ref'
clock frequency value.

Add support for CPU frequency scaling defining those 3 frequencies in
the opp-table with the assumption that the 'ref' clock is set to its
default value.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
---
Changes v1 -> v2
  v1: https://lore.kernel.org/all/20260115160144.1200270-1-herve.codina@bootlin.com/

  Fix Author and SoB.

 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 35 ++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 8debb77803bb..9f21d8fba940 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -15,6 +15,39 @@ / {
 	#size-cells = <1>;
 	interrupt-parent = <&gic>;
 
+	/*
+	 * The CPUs clock is based on the 'ref' clock (output of OPPDIV divisor)
+	 * with x1, x2 or x4 ratio between the CPUs clock frequency and this
+	 * 'ref' clock frequency.
+	 *
+	 * The table below is built on the assumption that the 'ref' clock
+	 * frequency is set to 500MHz which is its default value.
+	 *
+	 * The table should be overridden in the board device-tree file based
+	 * on the 'ref' clock frequency if this frequency value is not the
+	 * default one.
+	 */
+	cpu_opp_table: opp-table-cpu {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-125000000 {
+			opp-hz = /bits/ 64 <125000000>;
+			/* ~35 clocks cycles at 125mhz */
+			clock-latency-ns = <300>;
+		};
+
+		opp-250000000 {
+			opp-hz = /bits/ 64 <250000000>;
+			clock-latency-ns = <300>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			clock-latency-ns = <300>;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -24,6 +57,7 @@ cpu@0 {
 			compatible = "arm,cortex-a7";
 			reg = <0>;
 			clocks = <&sysctrl R9A06G032_CLK_A7MP>;
+			operating-points-v2 = <&cpu_opp_table>;
 		};
 
 		cpu@1 {
@@ -33,6 +67,7 @@ cpu@1 {
 			clocks = <&sysctrl R9A06G032_CLK_A7MP>;
 			enable-method = "renesas,r9a06g032-smp";
 			cpu-release-addr = <0 0x4000c204>;
+			operating-points-v2 = <&cpu_opp_table>;
 		};
 	};
 
-- 
2.52.0


