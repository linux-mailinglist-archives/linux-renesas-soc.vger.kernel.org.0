Return-Path: <linux-renesas-soc+bounces-25424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A03C9701E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Dec 2025 12:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0EBC8342270
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Dec 2025 11:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC4C264A92;
	Mon,  1 Dec 2025 11:30:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE9C826158B;
	Mon,  1 Dec 2025 11:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764588635; cv=none; b=i7ePTzRHjdM4abnL35G3HfAiuUH5DIsW8VPCpEwnpqzVMY3+L3jdn2VQ5sBaiItAy4+Sq3ZSgrPmQzvRXoieg1Twk3PxGmto/sHfFpA7tFXNMCObhXAr4kFkCl/kJzP0TxBd0nrsstcD56vNzMxPCBRHg1amPAgDqWN9g8GVouE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764588635; c=relaxed/simple;
	bh=BYr/gDvVEgFo/tdZiwLHAusQdunhJXHXgkkC0vsEYCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uXe6ax6mKkFxUutkcVCXyPbToV7QmSAOIo8Gc0CgwWAAzhYol2/KnEl3yfCKfzsxha8jE3bNdx8acbWTAOmevDP6OGgJZwn8pvjwKnpf0I5CF3HV29sihu77Ud8kwWs7pgIZsUlGaT6Smb/zE9MJjjjD1lgzBe4i1kXv9a6XZBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: gCLAaIslSDeSPpXraHOLjA==
X-CSE-MsgGUID: GyCMw0pYS36Qyi/gB3XVcw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 Dec 2025 20:30:33 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.83])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4982741F1B93;
	Mon,  1 Dec 2025 20:30:30 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: renesas: r9a09g077: add ICU support
Date: Mon,  1 Dec 2025 13:29:32 +0200
Message-ID: <20251201112933.488801-4-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201112933.488801-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20251201112933.488801-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Renesas RZ/T2H (R9A09G077) SoC has an Interrupt Controller (ICU)
block that routes external interrupts to the GIC's SPIs, with the
ability of level-translation, and can also produce software
and aggregate error interrupts.

Add support for it.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V2:
 * no changes

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index f80c6d603eea..0af41287e6a8 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -862,6 +862,79 @@ cpg: clock-controller@80280000 {
 			#power-domain-cells = <0>;
 		};
 
+		icu: interrupt-controller@802a0000 {
+			compatible = "renesas,r9a09g077-icu";
+			reg = <0 0x802a0000 0 0x10000>,
+			      <0 0x812a0000 0 0x50>;
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 1 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 2 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 5 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 6 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 9 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 10 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 11 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 12 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 13 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 14 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 15 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 16 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 17 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 18 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 19 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 20 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 23 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 24 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 27 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 28 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 29 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 30 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 31 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 406 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 407 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 408 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 409 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 410 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 411 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 412 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 413 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 414 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 415 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 416 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 418 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "intcpu0", "intcpu1", "intcpu2",
+					  "intcpu3", "intcpu4", "intcpu5",
+					  "intcpu6", "intcpu7", "intcpu8",
+					  "intcpu9", "intcpu10", "intcpu11",
+					  "intcpu12", "intcpu13", "intcpu14",
+					  "intcpu15",
+					  "irq0", "irq1", "irq2", "irq3",
+					  "irq4", "irq5", "irq6", "irq7",
+					  "irq8", "irq9", "irq10", "irq11",
+					  "irq12", "irq13", "irq14", "irq15",
+					  "sei",
+					  "ca55-err0", "ca55-err1",
+					  "cr520-err0", "cr520-err1",
+					  "cr521-err0", "cr521-err1",
+					  "peri-err0", "peri-err1",
+					  "dsmif-err0", "dsmif-err1",
+					  "encif-err0", "encif-err1";
+			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKM>;
+			power-domains = <&cpg>;
+		};
+
 		pinctrl: pinctrl@802c0000 {
 			compatible = "renesas,r9a09g077-pinctrl";
 			reg = <0 0x802c0000 0 0x10000>,
-- 
2.52.0

