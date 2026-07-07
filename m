Return-Path: <linux-renesas-soc+bounces-34831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lNCmArxjTWrtzAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 22:38:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9D471F963
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 22:38:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Tmxt6nto;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=YdS1Cmmj;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64A4D302515B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 20:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92F43E8337;
	Tue,  7 Jul 2026 20:38:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FE010785;
	Tue,  7 Jul 2026 20:38:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783456693; cv=none; b=WxJaQfeuGpD3zMDaNiz/ExtCzzQqroax5qNCcsxIrsQneB+jm5n7bTiGGESFMC6K7D0vlTup+/EGIE12OlfDvQNSNfkTt2BKJttaGtJ9xpJ3tec1ZYTkgkn99Tf8tccx2n8tpYWXTV54T27j7XRhXxuXOZWMuSayxAJhCkhHmHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783456693; c=relaxed/simple;
	bh=Zi3czAew4d3ZlftWkZwM7s4gZmhFyFUIS+7NMB7dNwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OULcd0ntgvCZlerIw3xJZBYbOhRonZ1Ar00Tm1XWXpoLNyLPXSRrSSJOpin/b3pwrmoz3C89MNeBg+Oo/Ds6c2nEra1x/fkkvXxDPN6SIaU7FpRp7suqQMZndzSm8vpP+MOf3K8lpkCFjSXG05oO33dWXcdRWMOW5YuDXc+Ihvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Tmxt6nto; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YdS1Cmmj; arc=none smtp.client-ip=80.241.56.171
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gvtMv5yBGzMlMJ;
	Tue, 07 Jul 2026 22:38:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783456683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X2Us4mdNEvhuyOgKQU3GzWXQxNS9dEkI8BiRToUpUN4=;
	b=Tmxt6nto5vPwu2cDgw3ZE1aOER2/fwL/o8QTkxlb1D3WMHQtFRuOw/EwwYhWenpOVN7D4e
	lYY/cKImq427Lkhp7UfiDgsY1cWq1qge7a2jcJ1Bar/zcF9TYNG2dJ5DE6USCXasVkxvmd
	rf6mGOxjJSf7A6bBTiWVH/dG1aJHOv8am7u2FnpsrJQ1n8qalKOuP3EP8MKKmf9AcG49hM
	8Iova3+cnmhdZD5L65uSepuMlC7MbftlelCtBmIycKYh+QKCuV9yiUFPja7/iAAcC0EwUC
	msvcGyAplSWkr75vS+NIJCRgYEimBKQ6XJ4EhlmdPfvtM6W+kED0r6UgUXE0mQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783456682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X2Us4mdNEvhuyOgKQU3GzWXQxNS9dEkI8BiRToUpUN4=;
	b=YdS1CmmjByWm7CZo4bLVwH/7paBZDulYxGFpsF0EN3oN6Nv8Opd1PqZqZ2ZEA2yr4PmnfO
	zsem0EAM3t9zExN7bEpwsTkjDWTV+FLG3eynh8ghZbL407r6ObMu1QPF53QFchpwO4YD3y
	icVrAnn0AIYy/oqpLqCUqbiZevj9nWtcPbQYdLYbjuj7mAw2OX8LLpIhzNQuOmMb+uGzF1
	Oo+nxQBk/aJtXipiTP6GWpwtpKEPRrg5pSL/Ej3NzfDz4eBAAfUiNWQA6I/+rQWW7qeYZ1
	s/TBPo8FcVVrGWCQYfwj3HENFbc0E2S2UhL4mvyfuagiVv1DyEcNj85FrNifug==
To: linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
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
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 1/5] PCI: dwc: Determine whether iMSI is used before calling .init
Date: Tue,  7 Jul 2026 22:35:39 +0200
Message-ID: <20260707203743.88299-2-marek.vasut+renesas@mailbox.org>
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
X-MBO-RS-META: r583po4qoa15sromgjb4oesm4cdjryrp
X-MBO-RS-ID: f11fc97ecda8cba6624
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
	TAGGED_FROM(0.00)[bounces-34831-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-pci@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 8F9D471F963

The R-Car Gen4 PCIe controller integration configures MSI registers
in the controller driver .init callback, because those registers
have to be configured while PERST signal is asserted, and the PERST
signal is asserted across the controller driver .init callback.

The registers have to be configured differently in case the iMSI is
or is not used. Assign pp->use_imsi_rx before the controller driver
.init callback is called, so the controller driver .init callback
implementation can use the pp->use_imsi_rx value.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
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
V3: New patch
V4: No change
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 06722259d2e37..f5a38e6fd8d79 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -587,6 +587,12 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	if (ret)
 		return ret;
 
+	if (pci_msi_enabled()) {
+		pp->use_imsi_rx = !(pp->ops->msi_init ||
+				    of_property_present(np, "msi-parent") ||
+				    of_property_present(np, "msi-map"));
+	}
+
 	if (pp->ops->init) {
 		ret = pp->ops->init(pp);
 		if (ret)
@@ -594,10 +600,6 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	}
 
 	if (pci_msi_enabled()) {
-		pp->use_imsi_rx = !(pp->ops->msi_init ||
-				     of_property_present(np, "msi-parent") ||
-				     of_property_present(np, "msi-map"));
-
 		/*
 		 * For the use_imsi_rx case the default assignment is handled
 		 * in the dw_pcie_msi_host_init().
-- 
2.53.0


