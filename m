Return-Path: <linux-renesas-soc+bounces-34717-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aWb2L+9sSWrd1gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34717-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 22:28:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF547086D7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 22:28:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=xkc7ZeAx;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=SLcaHXI3;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34717-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34717-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA6CA302AC21
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2026 20:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4A8374E7D;
	Sat,  4 Jul 2026 20:28:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43A12FF675;
	Sat,  4 Jul 2026 20:28:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783196891; cv=none; b=LsarOGK6deIG6G1lfBtlqZKUsucxY6WIJ4Z4HQ4/6ueI7vrfZND6FUPV88N5/c8ts2t7fUEVYXPDR6p2ZeEUqFeybzTRoI9Tom4YN3sBd7sPq7vjJrEF6X972NysoABJhENbfQK3yAWvHiAPWwjjC2o4brKb/MIZ+d3z8okUdeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783196891; c=relaxed/simple;
	bh=LVc2TEinO2WrEv73cUAuEMN7v04qGED0oNaOsC0wpOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bwv7jv6Mp3tStz6h+1yYVwZaSvKqRaeqGuJK6Hm5wp5whmEBxcdSsyKusaVbpjxWJ3xEy+/+8oFaAlvnhZuyNEEKnEF97QH5gOslGOyifJVeJS9dzPRV7Fih4/hdDBeWvZkO52perFsFrLdSPihEWxbZ5R/C/ZEydWCNz2oPVPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xkc7ZeAx; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SLcaHXI3; arc=none smtp.client-ip=80.241.56.161
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gt2Hh3CjSz9tPg;
	Sat,  4 Jul 2026 22:28:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783196880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wG1WCsKg3RUuHGLn9ILO3Q4aycjzCLniXXvwWv//DhY=;
	b=xkc7ZeAxSvAeomSfUrdTjy/YHjNWtmJIDMpAN/77ablwBM2wmAzCN5DAM0tLitiFlB2eiJ
	oilJbsQAU0AoAOasICuZ6ItMLKm0XjLjnEEwMFk6Urv83F+rGg5Tp0wPMp4hJP7KN3vbHw
	ZLm3gFiBlQS9JgEMRewmcFf+QNd91iSpsI/J6vQaqW5F2mA3ue8/QMlp8Z6vGfis46pnla
	GejJEtq0yeWsROVWiMu8isRmPrkD7xqGi6UYoycBi5Uvv/QCancxIV0JrZD1yUZYL5IT4Y
	nPAkCEQUnz8XehHTP0RTlM1cj4bbYs8gnEbUNpviFwzcJSCPmLKjO/f3o04q6A==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783196878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wG1WCsKg3RUuHGLn9ILO3Q4aycjzCLniXXvwWv//DhY=;
	b=SLcaHXI3D41hvctl2/WSNyvNtybndAIkaE3vVH6PeU0Xq5kOo4kSKqyB/41EiM/zuvr2lg
	gH31HqAZHxrEI9uLrkmE5wdSts9zjK+ab64D0LfotXH22YQQRudKPi1nY7nkRq1PWwiE9o
	yHIu1TNdgfCdEZf6EdX5AyFKAu5cNBFFW4r09dcUZuD1j3kBvgLnbGgwYCbx8rWEuSS10F
	3cDGtH+pZmn88iZ5kPrlhm8AMoR+q+84QQqBWL/YL58favabm2IdG7UeYWy7GVhJJ1TbZ+
	r4LfcBczluNNZFaLsbB/PLYjNRyaxWxKyMehwyfGCJWP7I5u1ld1t0gYHP4gBg==
To: linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/5] PCI: dwc: rcar-gen4: Add support for R-Car X5H PCIe4
Date: Sat,  4 Jul 2026 22:24:59 +0200
Message-ID: <20260704202748.355708-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: db54d7b53264bfe5a79
X-MBO-RS-META: uy1cmxqpc78n344okxu7i1dgtw8h6o9d
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
	TAGGED_FROM(0.00)[bounces-34717-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS(0.00)[m:linux-pci@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:from_mime,mailbox.org:dkim,mailbox.org:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2AF547086D7

Add support for R8A78000 (R-Car X5H) PCIe4.

This driver previously supported R-Car Gen4 S4/V4H/V4M. PCIe features
of R-Car X5H PCIe4 are almost all the same, except for different PHY
which has its own driver, slightly different initialization code and
the DMA is no longer eDMA but HDMA.

Endpoint mode is currently not implemented for R-Car Gen5 PCIe4.

Depends:
PCI: rcar-gen4: irqchip/gic-v3: Handle GIC ITS
https://lore.kernel.org/all/20260701203918.63189-1-marek.vasut+renesas@mailbox.org/

Marek Vasut (5):
  dt-bindings: PCI: rcar-gen4-pci-host: Add R-Car X5H PCIe4 compatible
  PCI: dwc: rcar-gen4: Return error code from .additional_common_init
  PCI: dwc: rcar-gen4: Split .start_link into ltssm_control and
    speed_control
  PCI: dwc: rcar-gen4: Handle PERST via reset subsystem
  PCI: dwc: rcar-gen4: Add support for R-Car X5H PCIe4

 .../bindings/pci/rcar-gen4-pci-host.yaml      |  74 +++++--
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   | 209 ++++++++++++++++--
 2 files changed, 239 insertions(+), 44 deletions(-)

---
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.53.0


