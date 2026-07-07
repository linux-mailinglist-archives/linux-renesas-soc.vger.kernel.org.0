Return-Path: <linux-renesas-soc+bounces-34832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7A89HNVjTWoKzQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 22:38:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 004EB71F992
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 22:38:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=HciGiTdG;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=P0opyTmz;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 948D8302E7D5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 20:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01EB33F23B9;
	Tue,  7 Jul 2026 20:38:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A09B3E5EC5;
	Tue,  7 Jul 2026 20:38:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783456701; cv=none; b=NJcYPxSbnKMyReE9u/olUj+tIlIUlRZa2Br+kp0LA5/2sHaEaIqubMJqp5e7sH+xbkB+3OobfatSoWNMPg1VPbmzYTaJaTfeiKzL5FQvGtFKKnXQyqFS62CMRzCbUaw+aztO80xBgL395luw2jGwaJyVUAK0pPWNOHYX5OgmWoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783456701; c=relaxed/simple;
	bh=SOhgij37R3cGSxuZdXbiSlfRT75516/0tXqGcrO9ljI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fPv2fFS8QY2+4wwPeYEXbU0j2lAwi8dJEFc3m1ackQnTdMK5T1er1iZT8sn2uebBtOKW6HTKfg0KkPj+5vZ3oBcHWA+dQPxSXGCzXxVaiXsGJ2pGjSjVaqlP3KnjCzNWpvmjw+eDp+H27LLQrF7CSMxjBQXpeh4GRVLWuqlSgV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HciGiTdG; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=P0opyTmz; arc=none smtp.client-ip=80.241.56.161
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gvtNB1gDqzKnYq;
	Tue, 07 Jul 2026 22:38:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783456698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xfccldLVCxkbEtlVItFgKJxpZCQLxtTCzIH5oBIqVAM=;
	b=HciGiTdGX0B4YjvdZOHv6vtUEhYWXigGBFKcFX2uE8+b39utoCSA8Ct1P2KyRaIU05rSQq
	9OfMIZjQptVYSf7HSEt56HlND0Mtc4eA75yMW99Rw65TucrfAiiIZLIvmHfET1MYlUUc0P
	ps5+b5EYZvHZph8rNbE0kVjn8aMeYY4KYPrVKnoDbIUq6mzsYnl49shAxNPjuR6Pgh4pyM
	x+yr1V0KmulirhafauMAaZAsnRanNjnkqn1ARvA8DOMCSMMhtFdeRnYJRAZ02yFFDblvTc
	HE+UMp88BZ3L9PabznZCUMlB2KnmxKEGXONwmbhLlQ8ZfFP8IqWW7PuLWWxLRw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783456696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xfccldLVCxkbEtlVItFgKJxpZCQLxtTCzIH5oBIqVAM=;
	b=P0opyTmz2tfP23EpSSkte30I85hZ6Fr3d3HZsnt6Y3CoVRaqcpxEc4pZm7Svzdljp/FLkX
	mbOOKZF7MpRA1fTDONiCZF8K8qsxgLcmsnvLzepWJsKsOyAkmMDKUKRcpUGfHPe2HpPbyu
	+FpMg+hAUObutRqu99moHH8mYf+BT8ZrOH/nRi7vDOMX14TuBCUBq6n3TKgk0z8L6feacK
	zZsNlFt5xqISGIHiCzl1A2Pm16S9qDHKK2KaPxFapLsARBhsU0MFJrq+vDsJx5/eEi/DtK
	hFgZeI7McPFMhrWYCXW6UTB4NqyZ9iLnTqZGrYyPpAC3rl55A6pO4v3IBzFbhQ==
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
Subject: [PATCH v4 5/5] arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes
Date: Tue,  7 Jul 2026 22:35:43 +0200
Message-ID: <20260707203743.88299-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
References: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c41e573af602e797cf2
X-MBO-RS-META: ywcwk7y9uqr5xhh5osbrhnjh1p73wr5x
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34832-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-pci@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:yoshihiro.shimoda.uh@renesas.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 004EB71F992

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
V4: No change
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


