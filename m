Return-Path: <linux-renesas-soc+bounces-10832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AED8D9E1AC0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 12:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 800B8B2AA84
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 10:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55191E285D;
	Tue,  3 Dec 2024 10:55:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26D71E284A;
	Tue,  3 Dec 2024 10:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733223353; cv=none; b=O/zVU4C/pvsYbLR/9RHJO60MqpOF7MVQ4DoCOCbRpEIX/MNChxF3GagveJxCYvlqioM2moMdOMdIyuG7gP/5oVOLWtTnGJ9+rFVPwRg6I1EYOtKZWdBddP6Dclh3WOT7dUuBdw9Q3EcEroaqJrDJWHkfzZlBonUKWCqI0tiTa5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733223353; c=relaxed/simple;
	bh=7Fm6CbWuGgiN2qgEOJd6T5SSUT8N9DpyAWZXnknC7rQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ckGVdomI0YCgr7o2TESRinSyhRpSKDqRakN7elkkFVqdZiELcxOWzRBZxQra0iqBxrwATq7Rgg5kdwqATcMkv4rslSkvA2FBpTXgel1SPvMKmt+HsuvZ+t5ptQ7e3hOaHnhmKJWWSSnL0PfohD+sAwNTL3jo4mWE7vZTNkx0AQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: jztms97SRcSZB/edsqLEDw==
X-CSE-MsgGUID: Zg6UYKAfTsinPunOAy1A7w==
X-IronPort-AV: E=Sophos;i="6.12,204,1728918000"; 
   d="scan'208";a="226779510"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Dec 2024 19:50:47 +0900
Received: from localhost.localdomain (unknown [10.226.93.2])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3635540062A5;
	Tue,  3 Dec 2024 19:50:43 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 10/13] arm64: dts: renesas: r9a09g047: Add OPP table
Date: Tue,  3 Dec 2024 10:49:37 +0000
Message-ID: <20241203105005.103927-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add OPP table for RZ/G3E SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch.
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 4176b9aa6892..39a7cfb3095b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -20,6 +20,39 @@ audio_extal_clk: audio-clk {
 		clock-frequency = <0>;
 	};
 
+	/*
+	 * The default cluster table is based on the assumption that the PLLCA55 clock
+	 * frequency is set to 1.7GHz. The PLLCA55 clock frequency can be set to
+	 * 1.7/1.6/1.5/1.1 GHz based on the BOOTPLLCA_0/1 pins (and additionally can be
+	 * clocked to 1.8GHz as well). The table below should be overridden in the board
+	 * DTS based on the PLLCA55 clock frequency.
+	 */
+	cluster0_opp: opp-table-0 {
+		compatible = "operating-points-v2";
+
+		opp-1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <900000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-850000000 {
+			opp-hz = /bits/ 64 <850000000>;
+			opp-microvolt = <800000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-425000000 {
+			opp-hz = /bits/ 64 <425000000>;
+			opp-microvolt = <800000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-212500000 {
+			opp-hz = /bits/ 64 <212500000>;
+			opp-microvolt = <800000>;
+			clock-latency-ns = <300000>;
+			opp-suspend;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -30,6 +63,8 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R9A09G047_CA55_0_CORECLK0>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu1: cpu@100 {
@@ -38,6 +73,8 @@ cpu1: cpu@100 {
 			device_type = "cpu";
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R9A09G047_CA55_0_CORECLK1>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu2: cpu@200 {
@@ -46,6 +83,8 @@ cpu2: cpu@200 {
 			device_type = "cpu";
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R9A09G047_CA55_0_CORECLK2>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu3: cpu@300 {
@@ -54,6 +93,8 @@ cpu3: cpu@300 {
 			device_type = "cpu";
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R9A09G047_CA55_0_CORECLK3>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		L3_CA55: cache-controller-0 {
-- 
2.43.0


