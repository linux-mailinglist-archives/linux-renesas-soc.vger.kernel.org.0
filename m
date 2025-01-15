Return-Path: <linux-renesas-soc+bounces-12154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A64A11FFA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 11:40:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 680C83A9F7D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 10:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2AB71DB15D;
	Wed, 15 Jan 2025 10:39:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C8B248BC8;
	Wed, 15 Jan 2025 10:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736937583; cv=none; b=WgexuYiRzynTNTBpTV3bs1/LtiQiwixCOCCMaJt2OnDokbY7/O6IOpr1KPpdOotHCW/xJ1RkezgUUqNyZ3F70pTVi0TEi0wDN/Z8piJK7k71QBYZm8iQvdHU6pRV6wcN+hk+334cXenj0oPtiksdSZPXtaMK2QLcNHafqLDyeB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736937583; c=relaxed/simple;
	bh=ZRVf4RJUAyamQljIJ290IJ//1j0qrlxZcSb6pDjDz3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oML47DnGKzIOEWrVIRdpzRI8F3hhKvKkzMsW43Hx1iYS5rDhobseOaNTZRfA97MZs1lvoHsg4NR8OsP71AGmTyq7SSKfGsKMJMFvoXaIK7MvjZ5pHbFGKN/N9sDKDM5tj/pI/FXQJgG6AVJnw/6JFBiAN0uWQWa45F1wf09D6PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 2s+jOWB/Tp2rWYODYo410g==
X-CSE-MsgGUID: nnTzI8umQIa7zHtWRhkvVQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 15 Jan 2025 19:39:31 +0900
Received: from localhost.localdomain (unknown [10.226.93.251])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6EBFB422FD27;
	Wed, 15 Jan 2025 19:39:16 +0900 (JST)
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
Subject: [PATCH 4/5] arm64: dts: renesas: r9a09g047: Add WDT1-WDT3 nodes
Date: Wed, 15 Jan 2025 10:38:53 +0000
Message-ID: <20250115103858.104709-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
References: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add WDT1-WDT3 nodes to RZ/G3E ("R9A09G047") SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 200e9ea89193..133aa3272d3a 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -175,6 +175,36 @@ scif0: serial@11c01400 {
 			status = "disabled";
 		};
 
+		wdt1: watchdog@14400000 {
+			compatible = "renesas,r9a09g047-wdt", "renesas,r9a09g057-wdt";
+			reg = <0 0x14400000 0 0x400>;
+			clocks = <&cpg CPG_MOD 0x4d>, <&cpg CPG_MOD 0x4e>;
+			clock-names = "pclk", "oscclk";
+			resets = <&cpg 0x76>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt2: watchdog@13000000 {
+			compatible = "renesas,r9a09g047-wdt", "renesas,r9a09g057-wdt";
+			reg = <0 0x13000000 0 0x400>;
+			clocks = <&cpg CPG_MOD 0x4f>, <&cpg CPG_MOD 0x50>;
+			clock-names = "pclk", "oscclk";
+			resets = <&cpg 0x77>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt3: watchdog@13000400 {
+			compatible = "renesas,r9a09g047-wdt", "renesas,r9a09g057-wdt";
+			reg = <0 0x13000400 0 0x400>;
+			clocks = <&cpg CPG_MOD 0x51>, <&cpg CPG_MOD 0x52>;
+			clock-names = "pclk", "oscclk";
+			resets = <&cpg 0x78>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@14400400 {
 			compatible = "renesas,riic-r9a09g047", "renesas,riic-r9a09g057";
 			reg = <0 0x14400400 0 0x400>;
-- 
2.43.0


