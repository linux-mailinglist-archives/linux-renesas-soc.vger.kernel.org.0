Return-Path: <linux-renesas-soc+bounces-34631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jQJVEPJ8RWorBAsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 22:47:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DA36F1964
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 22:47:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="hII4/v+X";
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=a4No3Vxi;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4CE5315DAD4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2026 20:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081A63B19D4;
	Wed,  1 Jul 2026 20:40:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DEF3A83AC;
	Wed,  1 Jul 2026 20:40:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782938407; cv=none; b=e939i4EQJiKOF2PFjbaYtifyAciTkXsiwNQ9mGed2h02PSBnfgmyhFzlOSthpBYUDTU1ndGhSWHPY9kHn6gNNYIWBK0qa9XSYun5/T+m9g87tkZNmo0dN9TojW+OCeLENVDGgrJu6EuaNRU1K7exBmRpx+9GWuovWZv7QazwYGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782938407; c=relaxed/simple;
	bh=ZOPA/9UQ1lsVFxTrH3T/FRcLUURlF1xW3GTcxNZTxcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eomMlntAKVYvyICk4D1rVWQrkVB3Ok15baRxdP00Du3fZatEh+DZ6GO6j+BlM/6U4w3rn9ON3N5qyBYuN1sB/LHoVhw51fHVk+/byIvrnzAuI/07FD42+S32sKhTz2WufxyqkTsKnzsnV/8G5B9tkHgZ9Y5nYi66HYSC1yn268I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hII4/v+X; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=a4No3Vxi; arc=none smtp.client-ip=80.241.56.152
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4grBj000HTz9vCg;
	Wed,  1 Jul 2026 22:40:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782938404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VtpSn/6kLzzI0fPKRwZyJeSOYrsZvfNjFJIskyKdEpo=;
	b=hII4/v+XyEcgBjsJqnzuHz0HIfc4v0uYbbAlpM5N153KSZ7Lxmql9zyIIHLsDmagEl4DC/
	if9b66JJf0/AH7wAOPjDXpSFowfn4y87SXarGE+JYdtTv62Dp/RHunryEDS+cBkzxNddRs
	JPXXS2sPTc3GtKmFhA2o7+05Lf5Z+Ydv/isVB3YXllRj666UfqkkpAPVEW7x/3nGwJgvpY
	D0VsEnCBEuash+NvG/kSNoO5jWVZ4JQx5PKIbOpqqSctdTgOaYpGeMq9F5uVBEzfPOTBRs
	Q3E70VLCAfeoVSurWSQHjr1yKranyyezlKiBFn7ktuxL18lscXLR7AGULWyvNQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782938401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VtpSn/6kLzzI0fPKRwZyJeSOYrsZvfNjFJIskyKdEpo=;
	b=a4No3Vxi9tIK7D0IhxJV+jG8cxgBv3D8HUGYfF3nazBl5OfRDJtCsB1ncVfoxp60NrV/7l
	WOHhnb4VyE9P5QHy9O+fJRGwbeYiTmQAHwljDyyZUlF0HhO+yXoPi0f0Ol7gK7xuXqsbaG
	r9mDUSMAnr0M4ngg9Jz3sZC7ooVbZVjE46/BZh8FZ8nDbjoTCtcoKhbmBIfLikjE5/FJd9
	elQVUgA7daKpL1bOBWjva6c9dMSHla725LHVnyPFnHZs3AElC+HJCSBGJ1ViB/BS+KEHkB
	nvDFADkY+mSx/za3u+Pja8KuQIAmjKnum1zfAxS58/EpTMc81XSaksXBVZp+vA==
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
Subject: [PATCH v3 5/5] arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes
Date: Wed,  1 Jul 2026 22:37:48 +0200
Message-ID: <20260701203918.63189-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260701203918.63189-1-marek.vasut+renesas@mailbox.org>
References: <20260701203918.63189-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 8cf0f4f9360d4fef111
X-MBO-RS-META: xjw591x7ki7wibk4dthfs8mczz8eraxw
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34631-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-pci@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:yoshihiro.shimoda.uh@renesas.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0DA36F1964

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

Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
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
V3: Add Co-developed-by to credit Shimoda-san
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 31 ++++++++++++++++-------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index c25642a620db8..dba46499b5e9c 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -809,6 +809,7 @@ pciec0: pcie@e65d0000 {
 			resets = <&cpg 624>;
 			reset-names = "pwr";
 			max-link-speed = <4>;
+			msi-parent = <&its>;
 			num-lanes = <2>;
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -819,10 +820,10 @@ pciec0: pcie@e65d0000 {
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
 
@@ -856,6 +857,7 @@ pciec1: pcie@e65d8000 {
 			resets = <&cpg 625>;
 			reset-names = "pwr";
 			max-link-speed = <4>;
+			msi-parent = <&its>;
 			num-lanes = <2>;
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -866,10 +868,10 @@ pciec1: pcie@e65d8000 {
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
 
@@ -2148,11 +2150,22 @@ ipmmu_mm: iommu@eefc0000 {
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


