Return-Path: <linux-renesas-soc+bounces-20096-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F000B1DAA2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 17:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D75272221B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 15:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE953266581;
	Thu,  7 Aug 2025 15:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ROkHHvXx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F24264FBD
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Aug 2025 15:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754579698; cv=none; b=Jon2c5svGxOWG+oxLLxExjN//SJ5gGVl8AWds9f31MLe+yye63A2QL9DmC9E/iULqPwMZL0MPxBFr/uSempekc8ojJDApbt40MpGjOfkhPOz8HWbqDfRZp6i0Laem0e0X9BWZ/p0F0QBaFtG5Z5kb9NH3hpx10m87XjGfRlhj3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754579698; c=relaxed/simple;
	bh=3W7Za0zzgpbzu/KhqXilMjjd//puiWQLIkk3FsPeSK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IGGMvQFUsAn75xfuriNjYQELF6YXVkzod9Lc5XdK7hXmNjeFzWXl1hbfH4ejOF5ecrwl2nuUztokrdSnBvHFEM3qPPDt1disW4MkeOmmNzEX2VZMjR12xRbT9Zuvf/dkH1CHr0PTGd5Cp9fQBRQPirJjV8pjpP7E2BqBZuoYmJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ROkHHvXx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=iNZ/yMKaCOG4AXQujRjUyQct9gy9jiCiAsAKivi2Ogo=; b=ROkHHv
	XxpUahKQkDL64q57ML1e3aPAF+WpsIj/q59w7R6ingGRyQy3GKcfjzS2DzJTi/4p
	a5F8YpAvfJrapFFq1CJKF0lXHJR3zfabjTeDNku0FyaFeIGSkBS+EwCK23nuC5Tt
	kSvFlEjimuM/TTaXWiTRWmo7y8B5GWu0M3htjWceAYv8FePJlhpv84TvyNagE7pv
	Y6G2y0nh3mVh9Ca16pBqhDkU/M7cj+k24Orpq8pi8Ezz+CrB6tdVoOROBHyfpOWm
	QXpS/hX9yBAWAJoY/1M6VvpzdoOxtETQT52skx1j0brVyc7v9Uv/zgd0orG1E2Py
	pVzuusYfkecsNZXg==
Received: (qmail 1277538 invoked from network); 7 Aug 2025 17:14:51 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Aug 2025 17:14:51 +0200
X-UD-Smtp-Session: l3s3148p1@978868c7YInCtheG
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Quynh Nguyen <quynh.nguyen.xb@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: renesas: r9a08g045: Add I3C node
Date: Thu,  7 Aug 2025 17:14:35 +0200
Message-ID: <20250807151434.5241-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250807151434.5241-6-wsa+renesas@sang-engineering.com>
References: <20250807151434.5241-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Quynh Nguyen <quynh.nguyen.xb@renesas.com>

Add the I3C node to RZ/G3S SoC DTSI.

Signed-off-by: Quynh Nguyen <quynh.nguyen.xb@renesas.com>
[wsa: adapted to upstream driver, moved bus frequencies to board file]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 0364f89776e6..6e372e222557 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -272,6 +272,41 @@ channel@8 {
 			};
 		};
 
+		i3c: i3c@1005b000 {
+			compatible = "renesas,r9a08g045-i3c";
+			reg = <0 0x1005b000 0 0x1000>;
+			clocks = <&cpg CPG_MOD R9A08G045_I3C_PCLK>,
+				 <&cpg CPG_MOD R9A08G045_I3C_TCLK>;
+			clock-names = "pclk", "tclk";
+			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 294 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 295 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 296 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 297 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 298 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 299 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ierr", "terr", "abort", "resp", "cmd",
+					  "ibi", "rx", "tx", "rcv","st", "sp",
+					  "tend", "nack", "al", "tmo", "wu", "exit";
+			resets = <&cpg R9A08G045_I3C_PRESETN>,
+				 <&cpg R9A08G045_I3C_TRESETN>;
+			reset-names = "presetn", "tresetn";
+			power-domains = <&cpg>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		vbattb: clock-controller@1005c000 {
 			compatible = "renesas,r9a08g045-vbattb";
 			reg = <0 0x1005c000 0 0x1000>;
-- 
2.47.2


