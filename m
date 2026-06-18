Return-Path: <linux-renesas-soc+bounces-34221-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HUDNDJ1rNGruXgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34221-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 00:05:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 946256A2DEF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 00:05:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=YEu1MySB;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=iJkRsskG;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34221-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34221-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41B6E304B7C0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 22:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0049433D50F;
	Thu, 18 Jun 2026 22:05:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F1E3431E7;
	Thu, 18 Jun 2026 22:05:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781820303; cv=none; b=t9Lm3uIaL99DdMxEyudeMy+2JmEfSCdqYpHL1OWp48HoXkekOgplSceeGQyMaaoEsXTZ0zsNARXXdYkaIBEt8TEWKxsSMi7h0XGPaPZ/Jd0xp5AHxqJzcjSxM/mIQqAvaoOhUHILiVOaUuD310chNZiWoSrbv6jjwUTNDuh0PFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781820303; c=relaxed/simple;
	bh=PWnuZ4jFtsdSW9sKLxrIKcYLa0t1Oz+XdGSPutkyXko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s+fMOSJp8QDoZN9vLEPCeKeKBo4HCb0vrcvo/WOd7BgmYnXz/ExDIF/0V9o5fYAi3PeXa5+63h3j9ZKYJEJpxPDHpdCvb+zP/9M4xHjO793qp/K2sCwoOjeI5nD7cCMTAnDW2B4jB1nKW/siDDHzJkNoO637TYT0d0achVwvFh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YEu1MySB; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=iJkRsskG; arc=none smtp.client-ip=80.241.56.151
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ghFBz6X9Nz9tsX;
	Fri, 19 Jun 2026 00:04:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781820300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/gMsmz/YVE+vex624i9NCwCdWl2Dy91mu9dYa478yfA=;
	b=YEu1MySBlTTkRPRDUXRH4jfDLqNMW5trPKTlqI8QJNIVNRw6eTVAoFVTMw8LpDX5CoblDM
	CnYnniCS2LtA0Omfrc1Ch3a6SJssfcbVHPrCbejPgtOdDgmRajaI1fzf6NF6TAd+6OVWHA
	a4FzZdSCR9uOZg2kl0cKuyHeGk9ShQu4CZ+XYcJuYXrQF8uNAeawPmclkrtyHpEQYwwpa6
	yYZ3ofvSa7NCnUhKKxX2DFfLhfA5wFwm2t1XKPcJC16u0PzFQ8hH144njBj1JQLsa2+vIk
	xasJQCchsKZkNfZzC5W4rBrlkHgnQbEBgcSr2oS7uc77/XRkCsMvRT5713e/LA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781820297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/gMsmz/YVE+vex624i9NCwCdWl2Dy91mu9dYa478yfA=;
	b=iJkRsskGUq9n3yhN9deqfE9wDG1YvTU0vlkBfAiZxC5Y7G1SE/rVSLHwIdaKEvJAA4LhoT
	8ZHx48YBeL8VdAshTOvVPzwqm1m+Gr9Udb28DFTJGovhzNAcRY4FgPkzhb9Xczmmg9UQBX
	inKdSssn8rO73e8YP619obT6OZV3+AzlB1b7F96Ax5OE6mLfCdEg+YckqQtxoVc2fDww6Z
	TSrFpX+WL8fQX7I/KZAHtE/7Tp5tclHZK2/3qt1uWCZC0MV3pZiXS2wzPJZuGw6AzpLQST
	cJmgL7tFizqYHgNhLrKE4CMgOc6mr1Pn49+qlPRFhUjrsYcZz6gNxTE43x7t3A==
To: linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes
Date: Fri, 19 Jun 2026 00:02:02 +0200
Message-ID: <20260618220427.14325-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org>
References: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 091e0d6cf64cfdacc1c
X-MBO-RS-META: br8xtrt6op6jwhtum4eaywqiog95jbzs
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34221-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS(0.00)[m:linux-pci@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:yoshihiro.shimoda.uh@renesas.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,glider.be:email,arm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 946256A2DEF

This SoC implements GIC600 with GICv3 ITS and PCIe host mode on this
SoC can use it. Add GIC ITS node into GIC node, update interrupt-map
and add msi-map into PCIe controller node.

The GIC ITS does have master interface to issue transactions to RAM.
The interface does support cacheable transactions, however, it does
not support shareable attribute, because the AXI port signals are tied
to inactive in this implementation. Therefore, add "dma-noncoherent"
DT property into the GIC ITS subnode.

The GIC redistributor does not have cacheable/shareable, therefore
add "dma-noncoherent" DT property into the GIC node.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
NOTE: This would not be possible without prior work from Shimoda-san
      https://lore.kernel.org/all/20240214052144.1966569-1-yoshihiro.shimoda.uh@renesas.com/
---
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: No change
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 31 ++++++++++++++++-------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 3a8af825bb253..82e864acf2601 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -792,6 +792,7 @@ pciec0: pcie@e65d0000 {
 			resets = <&cpg 624>;
 			reset-names = "pwr";
 			max-link-speed = <4>;
+			msi-parent = <&its>;
 			num-lanes = <2>;
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -802,10 +803,10 @@ pciec0: pcie@e65d0000 {
 			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0 0 0 1 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gic 0 0 GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic 0 0 GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic 0 0 GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>;
 			snps,enable-cdm-check;
 			status = "disabled";
 
@@ -839,6 +840,7 @@ pciec1: pcie@e65d8000 {
 			resets = <&cpg 625>;
 			reset-names = "pwr";
 			max-link-speed = <4>;
+			msi-parent = <&its>;
 			num-lanes = <2>;
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -849,10 +851,10 @@ pciec1: pcie@e65d8000 {
 			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0 0 0 1 &gic GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &gic GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &gic GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &gic GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gic 0 0 GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic 0 0 GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic 0 0 GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
 			snps,enable-cdm-check;
 			status = "disabled";
 
@@ -2131,11 +2133,22 @@ ipmmu_mm: iommu@eefc0000 {
 		gic: interrupt-controller@f1000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-			#address-cells = <0>;
+			#address-cells = <2>;
+			#size-cells = <2>;
 			interrupt-controller;
 			reg = <0x0 0xf1000000 0 0x20000>,
 			      <0x0 0xf1060000 0 0x110000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			dma-noncoherent;
+
+			ranges = <0x0 0x0 0x0 0xf1000000 0x0 0x200000>;
+
+			its: msi-controller@40000 {
+				compatible = "arm,gic-v3-its";
+				reg = <0x0 0x40000 0x0 0x20000>;
+				dma-noncoherent;
+				msi-controller;
+			};
 		};
 
 		gpu: gpu@fd000000 {
-- 
2.53.0


