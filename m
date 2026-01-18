Return-Path: <linux-renesas-soc+bounces-26972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E10A9D3958B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 14:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF190300AFCD
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 13:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6D0331A4A;
	Sun, 18 Jan 2026 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ieXjbrSQ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="a/RDxqmV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA4F17A2F6;
	Sun, 18 Jan 2026 13:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768744301; cv=none; b=gvMUBVuvgk26osj8ibFCA3eMXwLcocuP+7+TB7nK3aPcbe8NUKnSjXjK2At4g1uZqTciAk5LOww8OeSOj5jodNE6at7voC4vf6d9xuRk0r+PgEoKz0eiEQIbXbVz/lJp8ROk1zSeiCmfOavy8FS5N7HyitKHQhyyNcoVlUNXvs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768744301; c=relaxed/simple;
	bh=xLu/C2HhqdXHw9Eq2lJOm46es/J0JrkrrSkRP+Tdlo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gan8znUdvqWQ5pZJddqgveUAbldIbtecAlJkOpC70yMb0XVpiSvfdGJk+My2bUAcdq5oJLJtVyC2tLJhy0tWle0xM7iPtVnjqG+ErGmPcG4zyXsURHj4/PD0uhvas+sZtZIaG+TUfrh3GXm8rf62AqI8PIklEaN3q3PlYCWlol0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ieXjbrSQ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=a/RDxqmV; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dvFPD4K8Yz9tdy;
	Sun, 18 Jan 2026 14:51:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4XYuex0QeLqf/2qVUA70rdQFdW1DfuO89ydiRHewS/4=;
	b=ieXjbrSQr5JtSN2nG0yzvf2K7c3rfRghnTSeQlymfTRhqSE0Zh0ICbjuog+qXlPGAvqBNf
	x9qky71uzvFrNIIilo3OR6nqwcZaEHj81VmViV5baJDxZWp+hAmgR8ODJyGcQwCAJp0HD3
	Iux3OSGh7UyQT08zgZvG4rGApOxkZm3pqEHZSmHwBbg/4JrQa/6YM3z2tJKp0YIS+XM3na
	bEzV2e5wn+h4ishFqaNg1H+NJT5HWvMMWg7sOu+2+sH6VtSWWwpNBcVpKn8261u4vBWcdq
	SR1K5E79NPWxfo/U3bURHPkFrlz4xEBAUgzFCmSR+XTT+lEHZU0I23g9arVfbA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="a/RDxqmV";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4XYuex0QeLqf/2qVUA70rdQFdW1DfuO89ydiRHewS/4=;
	b=a/RDxqmVmmQLJaRk5siKEbPTEBTouccUBqVQfno4xFycU9xrvtAybs39AXYSNZcQGWC4FE
	QOqf5wlUA3rTqTpuI7K5rcQ1+1WX02MoYGSxPg7nFiFAz+JlcR6DXBa+Sk7w+SC89rOd1O
	wzfHtByKfVVMtvgn/8jpcOvtgQs4lQz5O9cRDsiRuXJc4gRpHmVGrW9kVOSLBjdIjwQKdT
	2KfUCHD7RF8OcbhMagdOtzdZY874HuVg9TTOBYZ8j3/FoYwWYYOP9VE1P3RNgj5aHWyOu9
	G8HIPbqeEjoB4lt6CIAaYy0Q9UHX6420Ya9I7QcL+R13eZc/+Vj4ThQ1oxf4rw==
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
Subject: [PATCH v2 6/9] arm64: dts: renesas: r8a77990: Add USB 3.0 PHY and USB3S0 clock nodes
Date: Sun, 18 Jan 2026 14:49:54 +0100
Message-ID: <20260118135038.8033-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xdp448xsbzao4m1d1tqce3p75czkmebd
X-MBO-RS-ID: 89f67c90aec460c75b0
X-Rspamd-Queue-Id: 4dvFPD4K8Yz9tdy

Add USB 3.0 PHY and PHY clock node for R8877990 E3 . The PHY node is
different in that it does not have control registers and extal clock,
which are not routed to the SoC pads on E3, therefore describe the
PHY as usb-nop-xceiv simple PHY. Add USB3S0 clock pad fixed-clock
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
V2: Describe PHY as usb-nop-xceiv and update commit message
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 82e9ab458b05b..f2641ce567e8e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -2207,4 +2207,21 @@ timer {
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
+
+	usb3_phy0: usb-phy {
+		compatible = "usb-nop-xceiv";
+		clocks = <&usb3s0_clk>;
+		clock-names = "main_clk";
+		clock-frequency = <100000000>;
+		power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+		#phy-cells = <0>;
+		status = "disabled";
+	};
 };
-- 
2.51.0


