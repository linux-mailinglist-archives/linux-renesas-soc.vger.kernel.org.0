Return-Path: <linux-renesas-soc+bounces-23396-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E9ABF7FCC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 19:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BC0BE506EDF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 17:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6123534F274;
	Tue, 21 Oct 2025 17:53:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0773234E746;
	Tue, 21 Oct 2025 17:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761069222; cv=none; b=jQoH8fEpluXtqRp3CNQRqPYWI2D+N0BJVfEcvAMzEqpJ68H5ovr6WWrWsL9TBVKUJ7vNe5n1ssovnG6Lxx4T63X/0r9zLeO3WdtyiTOB6owNJtg9f7LACWrKu6eiYCou2IXDEvaVxvvEECjE1kzhKMerikWvd6x4jWXFDqOKyQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761069222; c=relaxed/simple;
	bh=kAMtk77+gh6Ls/eAb+5g7M4zSVS6rIbBx7LYhJZtD8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TGnkLdy66dzPPu/YQpt0Qa+hexUOXJPvRNNWlK7Umls9t6Xrf3x5Qr/q45WGlIAC920mzOKgOQuhFHy6KpkS6zUK1fdZCOuh019cQlsbff8kBqsV+0pak4i65gc3Gu/wFQo9U3nMT66QYu+nckyvi23aDFbomncolLQtevE+6AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: v1dHwJGoRJu8fFKdx9Fmyg==
X-CSE-MsgGUID: 3jxux0IGRAqRnuwitZdbSw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Oct 2025 02:53:34 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.145])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id EA59E4031C11;
	Wed, 22 Oct 2025 02:53:30 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: biju.das.jz@bp.renesas.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add versa3 clock generator node
Date: Tue, 21 Oct 2025 17:53:11 +0000
Message-ID: <20251021175311.19611-5-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021175311.19611-1-ovidiu.panait.rb@renesas.com>
References: <20251021175311.19611-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add versa3 clock generator node. It provides clocks for the RTC, PCIe
and audio devices.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index f20b63acca00..3d2f926a3358 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -100,6 +100,12 @@ vqmmc_sdhi1: regulator-vccq-sdhi1 {
 		states = <3300000 0>, <1800000 1>;
 	};
 
+	x1: x1-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
 	/* 32.768kHz crystal */
 	x6: x6-clock {
 		compatible = "fixed-clock";
@@ -209,6 +215,25 @@ raa215300: pmic@12 {
 		clocks = <&x6>;
 		clock-names = "xin";
 	};
+
+	versa3: clock-generator@69 {
+		compatible = "renesas,5l35023";
+		reg = <0x69>;
+		clocks = <&x1>;
+		#clock-cells = <1>;
+		assigned-clocks = <&versa3 0>,
+				  <&versa3 1>,
+				  <&versa3 2>,
+				  <&versa3 3>,
+				  <&versa3 4>,
+				  <&versa3 5>;
+		assigned-clock-rates = <24000000>,
+				       <24576000>,
+				       <32768>,
+				       <22579200>,
+				       <100000000>,
+				       <100000000>;
+	};
 };
 
 &mdio0 {
-- 
2.51.0


