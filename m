Return-Path: <linux-renesas-soc+bounces-35206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OJH4BqM5VmoV1wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:29:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FC57551E7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:29:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=GKhLiPB4;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=J+lyE4Sy;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81CEE31BDA1C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 13:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CA83033F8;
	Tue, 14 Jul 2026 13:20:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C944012CDA5;
	Tue, 14 Jul 2026 13:20:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035218; cv=none; b=mCGvLza7Vi9LR/h0s1gZY3hGop4kce5NpKXPHVhmI8cY+ISfhr3TZlhEIE1h52h5SXiTTV5HRqnNXfssKGYJTI4UDj1/k8r1OtIA+bfZDPnPiBsd48KH9wqkNQaX975Y/56T20S/UvNvIMqPHNNVrbzN0Rp4moSFAW2Y2VYI6os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035218; c=relaxed/simple;
	bh=2Zh6GCPD45Curzc6XxF95qB5OvTuXdsfKjQmHEiMzGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nbwbSwA2Di28StkodqZ26/3UZDaQWE0gg27i73eh76O+t4Zs48Am/99waJxz7Lmpo/xJCrG+bviFxGkD0ESI2dAV5unafBzd12pYbuALBWejNTDoNZjAdUrpW1jbN4Yj9MJyWnXIyI2zg0Zg8sKfHyoEuq+tkrIUXaN6+vQZ8to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=GKhLiPB4; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=J+lyE4Sy; arc=none smtp.client-ip=80.241.56.152
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4h00KS5WqtzKtxQ;
	Tue, 14 Jul 2026 15:20:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784035212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Uy1v136JBd/TwWAL0fK29hOy7EN7PDxODRCjp0URlHY=;
	b=GKhLiPB4F8rXiuNGBhXLvKHsOaLYz6d3kdCfUFv+yXCbuMMWT+5aQZOQk05Gs1OVqsS9tA
	v2etbJItXbnOlF3psG3wcpPJPys5uIx12eXo2CDP0SxmUVIuLtiqqFFUcEDsHRcN/OJPzB
	ERYpiKOi61HIr9XvGwS9gSy0cuWdIEbYpjG0EhqiUK5ppi11St44A1tDk6LYCCtBPJAsAY
	DcKreRrTdxO9wB5/8QW5NyGXZJL1vrhvBR3odJrhjz1dANbU5jOMS812TkiKtqrvOQDIgX
	bcLoLkdZToek0aCo9oiqGVZGdQv21+XamWaeoYHIxcHvxCnkJlDXTrhSkDTwGQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784035207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Uy1v136JBd/TwWAL0fK29hOy7EN7PDxODRCjp0URlHY=;
	b=J+lyE4SysZUHi0CMVloGo6OKODciXi7fLmIRM+Cmwx/60T8VC7eMJZ41BTH7Y4hMd7gUUT
	NMCP0HU4oUJb2j6WjWvoi5wDvWNrF1LPxJnbPK97H1Avxk+sR9AVtRuw86ZzYA6aX3hARX
	x7ORYNx8OfoTx1nbmYH8rNHiRvvXgrHTug6HBUHSfUjK+QgktnekWKbJD1/IaupbRoEkZ8
	8kqtvgx5lNSnxjw6Yy42sTtnMpgMEvEyU8KhZq7vDIXHpWpdJ0pKu21NLosPBVE8c9qps9
	zej6gZYXzdzyR7USjxYUH8V/ig5lnD+8GCQ71lGYQrC9YNgDTaytZ3zlkFmkAQ==
To: linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	kernel test robot <lkp@intel.com>,
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
Subject: [PATCH v2] PCI: rcar-gen4: Isolate driver to ARM64
Date: Tue, 14 Jul 2026 15:19:27 +0200
Message-ID: <20260714131957.38067-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 31c95b1302611529b56
X-MBO-RS-META: fexm4t6jjueq3oy4dg3s7beno87arnjf
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35206-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS(0.00)[m:linux-pci@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:lkp@intel.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77FC57551E7

The driver includes linux/irqchip/arm-gic-v3.h which pulls in headers
which are available only on ARM and ARM64, on other architectures the
headers are not present and the driver fails to build. This driver is
used only on ARM64 hardware, isolate its build only to ARM64 to avoid
build failures on other architectures.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202607100310.iQw5m9Uo-lkp@intel.com/
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
V2: This is a rework of PCI: rcar-gen4: Inline GIC_TRANSLATER offset macro
    which isolates the driver build to ARM64 via Kconfig instead:
    https://lore.kernel.org/linux-pci/CAMuHMdVvWE7YZgKvreSn_vJLOVD4eMmn3TCGOyqSXksqjBCwvg@mail.gmail.com/
    https://lore.kernel.org/linux-pci/20260714110041.GA1349622@bhelgaas/
---
 drivers/pci/controller/dwc/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index 49a7a2c50ca15..3260d916110b2 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -346,7 +346,7 @@ config PCIE_RCAR_GEN4
 
 config PCIE_RCAR_GEN4_HOST
 	tristate "Renesas R-Car Gen4 PCIe controller (host mode)"
-	depends on ARCH_RENESAS || COMPILE_TEST
+	depends on ARM64 && (ARCH_RENESAS || COMPILE_TEST)
 	depends on PCI_MSI
 	select PCIE_DW_HOST
 	select PCIE_RCAR_GEN4
@@ -357,7 +357,7 @@ config PCIE_RCAR_GEN4_HOST
 
 config PCIE_RCAR_GEN4_EP
 	tristate "Renesas R-Car Gen4 PCIe controller (endpoint mode)"
-	depends on ARCH_RENESAS || COMPILE_TEST
+	depends on ARM64 && (ARCH_RENESAS || COMPILE_TEST)
 	depends on PCI_ENDPOINT
 	select PCIE_DW_EP
 	select PCIE_RCAR_GEN4
-- 
2.53.0


