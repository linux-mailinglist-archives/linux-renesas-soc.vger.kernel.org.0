Return-Path: <linux-renesas-soc+bounces-34628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AYw1E5Z8RWoABAsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 22:46:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A12866F192F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 22:46:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=xExFM1qy;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=jOfnk6I8;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D55343137B12
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2026 20:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2FA63A7D98;
	Wed,  1 Jul 2026 20:39:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F533A71AD;
	Wed,  1 Jul 2026 20:39:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782938396; cv=none; b=g0dQrUCRnns8jUTedrWQJnYYqEngae1O4JA/eMXli6Em9ZGAldmy8jnZkpIu9r1NyjQmZmCNBYtD+MHkWxDvLZc+PWSOPMjjUg1rW3JVmJnVRPIQuxl7u4Rf5Dnqh0kdLbRcVgjwePsR6/TQEUxvyo96dWnbK+YhZON4D757GUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782938396; c=relaxed/simple;
	bh=45ktKS63svINguA/03znAG+kUb0GrmqNXv1eYU/+Fto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m62fHegu6bV5VFx/iFkmPAe6GVVTqpjhHqRzn2hvfusM9b84jScFzZGvo96FS84Mm9cMp3QovE0n2UEdAJNsxikft/Hc2JimujQaiAn8OToRg4HmLzs14sAPcdgNJYe9xOuWChpahMzHLChAkGC0y3JE75Qh+HGlMZWwiTxGCjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xExFM1qy; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jOfnk6I8; arc=none smtp.client-ip=80.241.56.152
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4grBhf05h0z9v3b;
	Wed,  1 Jul 2026 22:39:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782938386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NkxAlTQFGbaiuEekACY4kTmb7QT3eq8R9Ya17Km0roM=;
	b=xExFM1qyH1faobKmzBOkzKHHYG0vK2RhwDumRw2uDRJf3HzJQbSso9yCfk3zJd/5MhdiWU
	oUQrlYAdGic7O8BNN6XEL5oYfejW7JDmoe3gyFZ7Mc0UEoqtULy1sLZC8c8E3j42Jubilf
	K93v6IhJOj6Bf2th6nlRktBnv2AOhRKfB3OCUtK2sPsoK7yEDJSowuFw5IJXftLTe1Kipr
	8DsIDxWvzCYUl5BlZQn9Tqlkk+FPNuNF/DVVt216wQ3R1JXZVu2CbeuBCCA7r1M4Rsh0B+
	gitTcEXCCrziwHwgUFF6n1Q8zu5X3zI+PLtOf+JqbslK2ofBj16rKZ3nz0zNvg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782938384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NkxAlTQFGbaiuEekACY4kTmb7QT3eq8R9Ya17Km0roM=;
	b=jOfnk6I898Lgh1qcpjzFHAMB9Cqhlmfh/Ok1puVoyftl4dAB3IfpmUPEZ/v3NGPjyCYLyo
	C+32SYu9ziYYtAkLH/vSmqaT9ci9byJs8ua6ifHJ2HUqVgStR14O+JRsV8gtxGaoYr8eJ7
	Y499fjgo5PFw0i92B1dx0MAf+PgC8l/MikHx5cdWZ2UYkjhllVqjfNmoi+wrbwh1x994zy
	InEgMGQqv9q59TrZhmYMfYhH1pISkC7z2iIqETUKdE/V5Z83CE/RkTmMWb1Syt+xSxKwUr
	SQbKvq9CFiCbWEfHwF13981rqC2DL9VoVZOqDC9EoXnsA0dVgyjZYRCLKQOVgw==
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
Subject: [PATCH v3 0/5] PCI: rcar-gen4: irqchip/gic-v3: Handle GIC ITS
Date: Wed,  1 Jul 2026 22:37:43 +0200
Message-ID: <20260701203918.63189-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 8qus3hraqq8rxg6as1fu3rbgzyipbcr5
X-MBO-RS-ID: 35fafbef4d7d3e030fb
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34628-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A12866F192F

Configure all R-Car Gen4 PCIe controller MSI registers fully, both in
case MSI are enabled and disabled.

Patch GIC ITS driver and add quirks for R-Car Gen4 GIC ITS, which is
configured to 32-bit address width for AXI or APB interface.

Switch R-Car V4H to use GIC ITS in its DT and describe the GIC ITS
implementation cacheable and shareable limitations.

Marek Vasut (5):
  PCI: dwc: Determine whether iMSI is used before calling .init
  PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
  irqchip/gic-v3: Refactor GIC600 limited to 32bit PA erratum handling
  irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
  arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes

 Documentation/arch/arm64/silicon-errata.rst   |   1 +
 arch/arm64/Kconfig                            |   9 ++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     |  31 +++--
 drivers/irqchip/irq-gic-v3-its.c              |  24 ++--
 .../pci/controller/dwc/pcie-designware-host.c |  10 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   | 118 +++++++++++++++++-
 6 files changed, 168 insertions(+), 25 deletions(-)

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

-- 
2.53.0


