Return-Path: <linux-renesas-soc+bounces-26872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A56BD2596E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 17:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5406430787B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 16:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E562C11E9;
	Thu, 15 Jan 2026 16:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OI6iFBwE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB8229E0F8
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 16:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768492931; cv=none; b=i5sXMzvuTNEx6eC10YYnULm0NGYbxE7mzeq8mhT5tGlcWrSMTJTDXxuJFxvGMaet4vGzIOiRtf9G891lpm7MTSar9AckWsCvS4UZgNUOKch7+D5X/Y59xiPTRmJloY7tXGHQFX4v2KaM+g2Mz8HLNgaZ6hNyvIvrlApRPrTZ0pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768492931; c=relaxed/simple;
	bh=1NPuNKvbnM0G7hC3Q3V9qmseyfP5MXAnk1wgBftYtXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tkLCzkTNDcxNuPmMzjpTXzGhBoyFQO9SkKTrBeJ5wQMyGZPYYEY5rDgsXyEgI3P/GLqkXQV5+OadEP5FY9LQnGdY7ctcZxz28QDLRKtmyFkQ8Vjy20qt2z66sDML9mW032SGimtvjOsled2z5OjlYZJz+wORAX6h/re9sGGiDKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OI6iFBwE; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8C72EC1F1DE;
	Thu, 15 Jan 2026 16:01:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 48AFF606E0;
	Thu, 15 Jan 2026 16:02:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3EE710B685A5;
	Thu, 15 Jan 2026 17:01:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768492922; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=XyN7Q0dEIRUyruaphCzrkm+AMluGqYLmuayZqMiQbGc=;
	b=OI6iFBwEe2gf4+8uFT9KMSTaQhH7VX3DtC2Sa9i6LqhCTts6eiweCy92gwFHRdqJrLcSwV
	gJ8tuTXNxsDGdmvrJXWznCFlpotACmQlYq2SLsmutWhXkMbxrrQb5Aea6Ja6FUps7/UHjV
	CCpka4S0JoNAckVRX/lqqqCAbjSUYVs3v87bvwohhRTMg6xMJlIldLkkU1B7rrqTU00UrF
	gmcce4ogBGbiMNjNYAKC4WaPX4232LEUuZfWglK4qvzQ7nw/LOJAWRh2BVSifKwjc/xXt6
	zjc6ORpeOulB9py4acOpZzg1n1dlye6i/euUOR80pgBvjncTRDbl0ktSg/x0hA==
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
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH] ARM: dts: renesas: r9a06g032: Add support for CPU frequency scaling
Date: Thu, 15 Jan 2026 17:01:44 +0100
Message-ID: <20260115160144.1200270-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Herve Codina <herve.codina@bootlin.com>

In RZ/N1 SoCs, CPUs are allowed to work at 125, 250 or 500 MHz when the
'ref' clock frequency value is set to 500 MHz which is the default 'ref'
clock frequency value.

Add support for CPU frequency scaling defining those 3 frequencies in
the opp-table with the assumption that the 'ref' clock is set to its
default value.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
---
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


