Return-Path: <linux-renesas-soc+bounces-34219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B/acC9NrNGoMXwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 00:06:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8A26A2E21
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 00:06:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=sYx7QEo2;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=pCpTIqC9;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A61C306FACF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 22:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDA7325491;
	Thu, 18 Jun 2026 22:05:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1D623E324;
	Thu, 18 Jun 2026 22:04:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781820301; cv=none; b=VG5IgkNrjdyCrHJsig0xbXpbsKiWgoE0mjoYOjiMTub/eysQPY8P6iK7l1VdiFkEaxSzB8He5Oza3Q232g1lSDPJLRRXpvd8RiPodMkcYMw46fyplZauJFG3jRBacxR/fMacSMtyPBnjO/qlAMWii/ouFzQLZsOapdM19ZLCTlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781820301; c=relaxed/simple;
	bh=WhwJUVNml4EXJUNxqaQAhu6Ggp6LviEZk7XZqMfTdLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hknGvES/SDoRttIjihwySckUiJ8oYea0c89aWWRkrHhE/7/FbBfifpolIQPFyBDwrUgUxV5QsKbHE1JvEDwcmn6/u9YmemrjsDw0B0ZGqM3ckHdJcvDmGUL09T3XRImxHRh/vGtoiXSD1LE9GUByw6aWwGXWLRcXpK2ov3/xYLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=sYx7QEo2; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pCpTIqC9; arc=none smtp.client-ip=80.241.56.172
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ghFBv2fdNz9tfD;
	Fri, 19 Jun 2026 00:04:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781820295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EUrRBtBh2pciR67Vv8Z+hWG0Mvemi70rYpWXOZ2LaHo=;
	b=sYx7QEo2lS49J9wsBe3wxu94/S03aY+9LhCX79eqzZFYBKDxlVC3CVBaN0MJ3coCQtkMwi
	AnUBOTwMKLTIKAKKXU+yXUu2CRsDdzd+6eBJ+p4s6jrF7+kj1WWe8+TSsmV7lV6LXu+2yj
	dn8ACxNLV+UZQ+epl/ZEMbS2dgr2SCxVI8QBXKDwwWqbeLGqmQv/lH2/Sl0Ojdsml1tJYQ
	8oVVAE6VMfXn9y79nMNHnd6hVy1ZjNjnZcDs3v2RUaWsJYF1Ol1iPKedhrFDTO5VfNWnLE
	vzwT00X2b9Lxyp3uUhcygEV+GUeh8U+8g+UCG8tT1aqNCYyBM/+REd7LNINTKg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781820293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EUrRBtBh2pciR67Vv8Z+hWG0Mvemi70rYpWXOZ2LaHo=;
	b=pCpTIqC93E7yTW+KEHr6lqzw+w8pG95Av1u2X7bMCHYuMRw2yLyKN/3AkcnU941Klg8S6c
	ldLa/8brrscM8gliUKzzQ37hYTzG/libwcDxCpRh1unLLhvgVoUST8CDW5yngx6vrDM44c
	fwYDbhwdLWY+8JOuNzaBNpUyMwcJGrmMaHA2K5iOlWpzzimfIFvSsKpyZAV1k6K3+Rm5DQ
	AX4+N0SJlJSpMjZFSklyVjJpEqPO359MErTkvl3/qlsy/rbrfhU8vYUYghBuip7DU7wVzl
	gqQicHntco4TiVwIQ6AhWncl6fzv6vLIap0X7A/hWoGHvctQhO9IEl0bVLNPBA==
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
Subject: [PATCH v2 3/4] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
Date: Fri, 19 Jun 2026 00:02:01 +0200
Message-ID: <20260618220427.14325-4-marek.vasut+renesas@mailbox.org>
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
X-MBO-RS-META: g9h8oxz9do3ayuxxqgr9kys7c4dq38ad
X-MBO-RS-ID: 54a33f58b8b92b3ba40
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34219-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,glider.be:email,arm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF8A26A2E21

Renesas R-Car S4/V4H/V4M GIC600 integration has address width for AXI
or APB interface configured to 32 bit, it can therefore access only
the first 4 GiB of physical address space. This information comes from
R-Car V4H Interface Specification sheet, there is currently no technical
update number assigned to this limitation. Further input from hardware
engineer indicates that this limitation also applies to R-Car S4 and V4M.
Name the limitation GEN4GICITS1, and add a driver quirk to mitigate this
limitation.

The quirk is keyed on the combination of the GIC implementation
and the platform identification in the device tree.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
NOTE: This would not be possible without prior work from Shimoda-san
      https://lore.kernel.org/all/20240214052050.1966439-1-yoshihiro.shimoda.uh@renesas.com/
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
V2: Minimize the patch based on newly added patch in the series and
    only add entries into dma_32bit_impaired_platforms array. Update
    second paragraph of commit message slightly.
---
 Documentation/arch/arm64/silicon-errata.rst | 1 +
 arch/arm64/Kconfig                          | 9 +++++++++
 drivers/irqchip/irq-gic-v3-its.c            | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 014aa1c215a16..b0c68b64f5ac2 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -352,6 +352,7 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | Kryo4xx Gold    | N/A             | ARM64_ERRATUM_1286807       |
 +----------------+-----------------+-----------------+-----------------------------+
+| Renesas        | S4/V4H/V4M      | N/A             | RENESAS_ERRATUM_GEN4GICITS1 |
 +----------------+-----------------+-----------------+-----------------------------+
 | Rockchip       | RK3588          | #3588001        | ROCKCHIP_ERRATUM_3588001    |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b3afe0688919b..b9e17ce475e61 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1382,6 +1382,15 @@ config NVIDIA_CARMEL_CNP_ERRATUM
 
 	  If unsure, say Y.
 
+config RENESAS_ERRATUM_GEN4GICITS1
+	bool "Renesas R-Car Gen4: GIC600 can not access physical addresses above 4 GiB"
+	default y
+	help
+	  The Renesas R-Car Gen4 S4/V4H/V4M GIC600 SoC integrations have AXI
+	  addressing limited to the first 32-bit of physical address space.
+
+	  If unsure, say Y.
+
 config ROCKCHIP_ERRATUM_3568002
 	bool "Rockchip 3568002: GIC600 can not access physical addresses higher than 4GB"
 	default y
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 8ec2175b78288..96b26822e5bd2 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -4891,6 +4891,11 @@ static bool __maybe_unused its_enable_quirk_hip09_162100801(void *data)
 }
 
 static const char * const dma_32bit_impaired_platforms[] = {
+#ifdef CONFIG_RENESAS_ERRATUM_GEN4GICITS1
+	"renesas,r8a779f0",
+	"renesas,r8a779g0",
+	"renesas,r8a779h0",
+#endif
 #ifdef CONFIG_ROCKCHIP_ERRATUM_3568002
 	"rockchip,rk3566",
 	"rockchip,rk3568",
-- 
2.53.0


