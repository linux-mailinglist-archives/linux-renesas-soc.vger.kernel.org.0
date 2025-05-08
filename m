Return-Path: <linux-renesas-soc+bounces-16822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78292AB02D6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 20:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19DD19C6527
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 18:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0022286D58;
	Thu,  8 May 2025 18:31:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB808C1E;
	Thu,  8 May 2025 18:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746729084; cv=none; b=bRV5sRUSrscrsrdE9ZHNATxRT+2hIvVgs5mJ150GJI/awvGdQlVFZc1rIcV5RFvnCNWQ4QcDDvICmAEt9uqivexCeX+5DPUNyQ6WgoadpcA61fVPehb8S9rrf0zuXadv+bJ5i5mi3FvAnMJWozlH2952XrGiQZBoNCmRcNZ3vJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746729084; c=relaxed/simple;
	bh=uIZjuucy1TnRlJJTTFqtBDRgLK7GmWufKqQ3a6nfs+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V2ytY6o/O/cw8U2vqMFyMuj7RB7/MqjkCnPUUBBfGy/SI+e+1X/aavEyYutx9A7FZuxdKPLYild7B1fFOhSTD91x0biPKknHRpxvQsgl3NxGIusoxnF9LRHzkc331gSWYgVgYApfA5VPWWb/X1JLQQxQ9Vkfe72d+wl0Qy+o9nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: GCiBtavhQWmZMRC24Hl4NQ==
X-CSE-MsgGUID: URqwrbAJRayw/UfURhq27w==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 May 2025 03:31:17 +0900
Received: from localhost.localdomain (unknown [10.226.92.89])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 00F33405D108;
	Fri,  9 May 2025 03:31:14 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/2] arm64: dts: renesas: r9a09g047: Add XSPI node
Date: Thu,  8 May 2025 19:31:03 +0100
Message-ID: <20250508183109.137721-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250508183109.137721-1-biju.das.jz@bp.renesas.com>
References: <20250508183109.137721-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add xspi node to RZ/G3E ("R9A09G047") SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 876f70fed433..3d3aa371dad8 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -280,6 +280,27 @@ sys: system-controller@10430000 {
 			resets = <&cpg 0x30>;
 		};
 
+		xspi: spi@11030000 {
+			compatible = "renesas,r9a09g047-xspi";
+			reg = <0 0x11030000 0 0x10000>,
+			      <0 0x20000000 0 0x10000000>;
+			reg-names = "regs", "dirmap";
+			interrupts = <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "pulse", "err_pulse";
+			clocks = <&cpg CPG_MOD 0x9f>,
+				 <&cpg CPG_MOD 0xa0>,
+				 <&cpg CPG_CORE R9A09G047_SPI_CLK_SPI>,
+				 <&cpg CPG_MOD 0xa1>;
+			clock-names = "ahb", "axi", "spi", "spix2";
+			resets = <&cpg 0xa3>, <&cpg 0xa4>;
+			reset-names = "hresetn", "aresetn";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		scif0: serial@11c01400 {
 			compatible = "renesas,scif-r9a09g047", "renesas,scif-r9a09g057";
 			reg = <0 0x11c01400 0 0x400>;
-- 
2.43.0


