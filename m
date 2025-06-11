Return-Path: <linux-renesas-soc+bounces-18088-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BD8AD505F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 11:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B03751884C0A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 09:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163D0242D90;
	Wed, 11 Jun 2025 09:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cCLQagFi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA62248861
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jun 2025 09:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749634807; cv=none; b=BHPuUoH/o/+dkyzQ/K90BnXT5FLBjlun+z92Hl9fZGgdcaFljnwnMwD8rRkunBV46XzgAnoR2WoZtS2u1GLKtvCBId1+SIgjlBxJwsjaCUn73scuTz9SXaps3lbt6xNmXZGjvM2Ekpv1Nip1Z1gJ3jiReuAGN0HwZqFEY9Q9fB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749634807; c=relaxed/simple;
	bh=rsK4BlAYhH0hOyfLO0pQZiE7QebI40IMovxqlgiM4fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PHP927WuZNYXWPNlDZk3QiEFIBYNQMOlzACT4W0OTyJkfnn/WFtUI/DoZwCgxx8UoIMhkquAKRS5n/Z3qw8l5y5F6h7IkmsQqRMd9n48XwfZj1dxGqDAubbgbvmllt5Ga4MoIZRsY92EweKZPo6d3hu5Ke4NC81qgq/ivJMQ0jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cCLQagFi; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=AwgCxBaxeHErhOrt73l4s8Ky1IwiqVrn4SH13z6dx1A=; b=cCLQag
	FiabJzZRMWMYTURxbQXORSxk6nh65ugnktkH3SAU32bUxsasquRhQAb4gMsVhwMv
	Zy4vDBJg1kFHn+z/rEdHyoFk8F0fZ41kJ37WuT513vHGCgcII5smcZbofiD1tOE6
	O/4ASu0Gev6dpo2uJNe1YPVKTdLOlV0JgV/S81TS3jjGSlsDybh0vr4uKVP9ks3B
	CTpWHV/hgaDA2Sr6SGYYtHa477gLkrFjwOO8jeiMhCpsTpa28BBTPU6tG7HTRAMD
	amYg7GFwSPilkh4ehN5x+WfJJqimqM8dc7PzfiN6Df3mua6jkZvK28rhpLrirgS8
	TBmlbIg1KX0oVYsQ==
Received: (qmail 3186488 invoked from network); 11 Jun 2025 11:39:55 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jun 2025 11:39:55 +0200
X-UD-Smtp-Session: l3s3148p1@1pVwmEg3ALEgAwDPXy2/ACpZfVCNKldR
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH RFC 6/7] arm64: dts: renesas: r9a09g047: Add I3C node
Date: Wed, 11 Jun 2025 11:39:30 +0200
Message-ID: <20250611093934.4208-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Add I3C node support.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 876f70fed433..0c0fbddfd7d4 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -580,6 +580,41 @@ i2c8: i2c@11c01000 {
 			status = "disabled";
 		};
 
+		i3c0: i3c@12400000 {
+			compatible = "renesas,r9a09g047-i3c", "renesas,i3c";
+			reg = <0 0x12400000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0x90>,
+				 <&cpg CPG_MOD 0x91>,
+				 <&cpg CPG_MOD 0x92>;
+			clock-names = "pclk", "pclkrw", "tclk";
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 675 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 677 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 678 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 679 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 680 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 681 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 682 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 689 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ierr", "terr", "abort", "resp",
+					  "cmd", "ibi", "rx", "tx", "rcv",
+					  "st", "sp", "tend", "nack", "al",
+					  "tmo", "wu";
+			resets = <&cpg 0x96>, <&cpg 0x97>;
+			reset-names = "presetn", "tresetn";
+			power-domains = <&cpg>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gpu: gpu@14850000 {
 			compatible = "renesas,r9a09g047-mali",
 				     "arm,mali-bifrost";
-- 
2.47.2


