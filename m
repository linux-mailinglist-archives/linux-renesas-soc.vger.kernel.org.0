Return-Path: <linux-renesas-soc+bounces-5302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D84CA8C1F23
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2024 09:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AB5A28305D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2024 07:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA01161319;
	Fri, 10 May 2024 07:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ArbBT7pM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844C415ECFC;
	Fri, 10 May 2024 07:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715326663; cv=none; b=IKRQAxU47qwojFceupl4k2n/qu7SDr20Pei8gfEhjQOeWxtu6oMrhlL9OxTpghkYFnlrlS5y8ILvRxevIDhfISKYNwDcDEsKLrRjVC0MTXg2qSowGxr8/xirVjxF/2cv+M3/oafwVGyhLyDLVzMEwyRLZgp4eusn1Fi3wt2D+GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715326663; c=relaxed/simple;
	bh=oecI1I5F8ploSJtFJdVODKUb+t2YKq7ntuJtu7bZFnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sn/TsJHchWkMt/g48KOsnZKeZ3N+KDNmmy7mx90f4k7W5DwfuupFaqAK3f6KFppS52sPT/W693+8CPcejqFsYPuAlvcMy8qgdraRlUwdEb25BSvN2ExgIdP6yW1yeTZcgPFSkiRm3kBAnFZDV40IsyFHYkv4OFFXrPnW9YuNuXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ArbBT7pM; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9D4224000F;
	Fri, 10 May 2024 07:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715326660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NzNqKTpVWMnrcgcJVGgyUqBdfYphefuKpHkJ0PXLDgQ=;
	b=ArbBT7pMFK270xL/zfMMmZ02B7LsXveQ1nHlFTKIYeuWNK2iHxGOv+STyrVZ5UaVHmnebb
	XDIijZ+YmYGtH2HiJsqhGeNbqndYkenPl9xd19D1uYrjV3GYcWxwqjM2Bq5P6Hl25xEMbX
	D7dCfHBaCo+9JJBo+8IKen2D4+HnSDdnXpZSIF14hDv2p+vuJqxIAq/hasUbemp+aLh+XJ
	GkLCjoJc4BWIc1ge65QLSQgjy1BuehIPKSj3LqgDUjWYAnMlUtsX8h+/zFcXhpWL9lFmju
	TYM8rJGa733OrYMPN7n+FOD8nMipXs4nUcD3qvf9o8fzc4Lbk3TokRifKj7NQQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Fri, 10 May 2024 09:38:14 +0200
Subject: [PATCH net-next v6 7/7] ARM: dts: r9a06g032: describe GMAC1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240510-rzn1-gmac1-v6-7-b63942be334c@bootlin.com>
References: <20240510-rzn1-gmac1-v6-0-b63942be334c@bootlin.com>
In-Reply-To: <20240510-rzn1-gmac1-v6-0-b63942be334c@bootlin.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>, 
 Serge Semin <fancer.lancer@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: romain.gantois@bootlin.com

From: Clément Léger <clement.leger@bootlin.com>

The r9a06g032 SoC of the RZ/N1 family features two GMAC devices named
GMAC1/2, that are based on Synopsys cores. GMAC1 is connected to a
RGMII/RMII converter that is already described in this device tree.

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
[rgantois: commit log]
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index fa63e1afc4ef4..57c730f43442e 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -316,6 +316,24 @@ dma1: dma-controller@40105000 {
 			data-width = <8>;
 		};
 
+		gmac1: ethernet@44000000 {
+			compatible = "renesas,r9a06g032-gmac", "renesas,rzn1-gmac", "snps,dwmac";
+			reg = <0x44000000 0x2000>;
+			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq", "eth_lpi";
+			clocks = <&sysctrl R9A06G032_HCLK_GMAC0>;
+			clock-names = "stmmaceth";
+			power-domains = <&sysctrl>;
+			snps,multicast-filter-bins = <256>;
+			snps,perfect-filter-entries = <128>;
+			tx-fifo-depth = <2048>;
+			rx-fifo-depth = <4096>;
+			pcs-handle = <&mii_conv1>;
+			status = "disabled";
+		};
+
 		gmac2: ethernet@44002000 {
 			compatible = "renesas,r9a06g032-gmac", "renesas,rzn1-gmac", "snps,dwmac";
 			reg = <0x44002000 0x2000>;

-- 
2.44.0


