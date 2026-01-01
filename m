Return-Path: <linux-renesas-soc+bounces-26235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 147D1CED547
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 01 Jan 2026 21:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37062300518C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jan 2026 20:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6201624D5;
	Thu,  1 Jan 2026 20:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kSGAeDL9";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="KNM7Onf9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765073C17;
	Thu,  1 Jan 2026 20:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767300002; cv=none; b=dHsAYGvOcV9Eq+JbUr+N5zDSeWsHoH2nw271T+adYX2MDH+oLkCX/RsFzVne9CSDxVR/dB/fDdFPoCucrYMDufz1nPLt1o6z+uJz5Yp0wEwQ2+rKNDbMQlU1B6LAH5q3Ccku7pZ2PKlV7wFe7xhqCAMBkrEYyneny570cbCptnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767300002; c=relaxed/simple;
	bh=h3dF13AfbmLh/aNM0INFb+7imVsTGBt8QZiAPjEqafI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m6Bjb3j7QiKk/T1yVWC1b/Z6wozIpjm9mZS6SYalRZ/Zf51yNTFKwVZ0/H7Ic3tgenA27J/lvfJTaI8Ne6Fap2A22XOG2zMPK4v1iKVgGvJTPEx4LMdJQo5YRXd5SgeVJNwQAf3ZhOUTfb3qEsucT+LDCTcW5bm8SyIFhVOqZ4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kSGAeDL9; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=KNM7Onf9; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dhzGQ3zBlz9spj;
	Thu,  1 Jan 2026 21:39:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767299998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uCDtUbPgnjiX6hN1A423qZeAcOS1S6hnA5ROM71zNUU=;
	b=kSGAeDL9rGUYTCq9g0TPwE+HrnRYwovIeom/XK6l53urAwdc/Lkba5dSyoU3nLKZjzO7Sk
	lm0xXctj2reDEeTaOfcN+aa95iy/6gcxX4cd9oEtcAAp9nZQRPOiGtG/vzw4T4cZNdXGP9
	BcNZodj26V51W26Jh+K1QAF52OPA7d11K4q6K5Yhi8A4+6I6ZOQ/zjc3ymMFa7Gw731fPq
	pg1u7dperyysCXz5KELUiYNBlL7Eqxd9S+RLq30e9RKjy99YQc/eTIdI8gmCbDPsH0BDBp
	EMmadiWBLBnHzCLeOgV34KT+kJYmm1561QTrVFvFnkAkMS4zX/uHR1rDJ+WJZA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767299996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uCDtUbPgnjiX6hN1A423qZeAcOS1S6hnA5ROM71zNUU=;
	b=KNM7Onf9kM2AAoMHBgadmJdlEiFVDLOXjdOjYbhquQqLzzBfdoWyuySA2LrY+WQ6RIcPaW
	IobPHBu9r51+lSNa2OSQOu/gXVYxNT+nTSVXv3orImdv22i6XJ5Llqwg1NgbXp8/t7AZ30
	oz9BJpBL6Ce8WWLkbBxIRZ/hQaCXN+uSx9/N41djUugzZVdKYeA+Z34IpAXEkhwXNY7GGT
	HhyVrraL4kvoC8QDwaVKVh/h8eQv15dD04Q0RGpt4TYlKu4nPoyKNETOqfJ1oKfPnKew34
	KWqAKH4zPUZ/DDnBZKNVi0sy3FNMlkcW3bO5QgS3NKfQECoADY+JA94CqpR6OA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 02/11] arm64: dts: renesas: r8a77990: Add USB 3.0 PHY and USB3S0 clock nodes
Date: Thu,  1 Jan 2026 21:35:49 +0100
Message-ID: <20260101203938.159161-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: w4jjscham9zdbfiebfd1y6mxrr81dk84
X-MBO-RS-ID: 156121c78b40487a853

This patch adds USB 3.0 PHY node for R8877990 E3 . The PHY node is
slightly different in that it does not have extal clock, which are
not routed to the SoC pads on E3. Add USB3S0 clock pad fixed-clock
node, the frequency has to be overridden at board level.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 97a7cf675efa7..9b4569782d61d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -763,6 +763,18 @@ usb_dmac1: dma-controller@e65b0000 {
 			dma-channels = <2>;
 		};
 
+		usb3_phy0: usb-phy@e65ee000 {
+			compatible = "renesas,r8a77990-usb3-phy",
+				     "renesas,rcar-gen3-usb3-phy";
+			reg = <0 0xe65ee000 0 0x90>;
+			clocks = <&cpg CPG_MOD 328>, <&usb3s0_clk>;
+			clock-names = "usb3-if", "usb3s_clk";
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 328>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		arm_cc630p: crypto@e6601000 {
 			compatible = "arm,cryptocell-630p-ree";
 			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
@@ -2197,4 +2209,11 @@ timer {
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
 	};
+
+	/* External USB clocks - can be overridden by the board */
+	usb3s0_clk: usb3s0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
 };
-- 
2.51.0


