Return-Path: <linux-renesas-soc+bounces-34833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iSYBHexjTWoVzQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 22:39:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4F071F9A5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 22:39:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="ZLqOG5/I";
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=qT40Wz79;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13827302845E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 20:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF27841B351;
	Tue,  7 Jul 2026 20:38:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC523F23B9;
	Tue,  7 Jul 2026 20:38:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783456705; cv=none; b=mSmmUeEVgpef+a5UIYXenVx9y8tiZ+Av6AlEa2Ij6EiymSEs2hhU184zTUj7APQpTbbZchq6p8hqy6YXUBXzbutcXtnOX2qXc8vuwT7cdVNqU62VzB3dgrxDOFhMTQPquBLq4lNe3Iy/Gu4cqTQpTlO+SuVGXDYuy1rfzJGE2ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783456705; c=relaxed/simple;
	bh=er0LKYmTqdHKZb/LceNMjTWg2egAAK1IdNpaajhc9U8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kqvnF2BBf2uRp4U01rgsfIQfA8r8V7/6rwnbFYQFiDr1+MRIUq38UFvtki3QdMQ9KAn+4us371ggoocjL4y5613cMZcmJa2khodrsP7bkUTfGIkTbHCBm28FlJyle6bIHro3fI+12Gquna+A+s0MO+TyWQPzvQi9B07Lzh1f6IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ZLqOG5/I; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qT40Wz79; arc=none smtp.client-ip=80.241.56.152
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gvtN663xGzKvw3;
	Tue, 07 Jul 2026 22:38:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783456694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3R1gWPaiItuEMxFOZsKEpycG2kSertLK7DcDGmeuD5A=;
	b=ZLqOG5/IQeGDrVoiiymiJ+NsuCGQwO2MN4e3sHtolP2HL4nICynFYZ7PHyKwUwZZLnX43Y
	RwYzUFSgp7E4TT9Lo58254lznb1FcFF6L6UINr0wbMpl1hPYailyZ92/B5ezLF6BiMUw8b
	LhWvfDJ2yN73kj9HcfGEkihKNG7u9cyIhtm5Mpv2spGw3vbMWBIkMFwiESZTYmEU7NIlsq
	18ATUZrahLGQCtsAAnsVzr9WhB+eo5QDw3KxmvNqIRbXWcH+gdABjuWxjzhnRZygbH9Ua5
	ZQ0f3pkQvtdb0EwXo5VsgPlLzkUR9auf5aYwdHZaXpM0nxMHgOPTJnv32JZ3GQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783456692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3R1gWPaiItuEMxFOZsKEpycG2kSertLK7DcDGmeuD5A=;
	b=qT40Wz79XWmjYujjZpDcgS+jAn7PuAwqNep7KJUM6mnsdKFLnZ2kGI2mfi5LcKEVUwqtbn
	f3eiFAfoEf+iK+Aw+NxJ1SApQkrA5+kz7wRf3nxUIZuZZ0ScUWbLpcbo2JKNiOkrj0FFs9
	dGfHZGMIECoLcBklceTFhn9GoQWzSBrqvk0qc40b14yX4dDvgsrUpDaXY4bW7oVUXEMUXF
	lTI6JKQsBjEy+OcJgOw0dV6SB7QZPBTHQ1vTMIRfUorKVsrF85p7hNJBvHXSeifqzUD8y8
	d0j43JUgTOlUs3s5NZLJ++I7rR5OvC3w0v2OFIBhfhbcdrKeHuj7UNxHeFJNpA==
To: linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 4/5] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
Date: Tue,  7 Jul 2026 22:35:42 +0200
Message-ID: <20260707203743.88299-5-marek.vasut+renesas@mailbox.org>
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
X-MBO-RS-ID: 0e703ae12616d092e1a
X-MBO-RS-META: 3bir1kfmfwuenjkeyh1wx4ii48fskhwm
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
	TAGGED_FROM(0.00)[bounces-34833-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-pci@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:maz@kernel.org,m:tglx@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_TWELVE(0.00)[19];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF4F071F9A5

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

Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Thomas Gleixner <tglx@kernel.org>
Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
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
V3: - Add Co-developed-by to credit Shimoda-san
    - Add AB from Marc
V4: - Add AB from Thomas
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
index e136e5abdb33f..b1e0d4f1cd712 100644
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
index d7b46c10ef940..bf507f42ffb87 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -4889,6 +4889,11 @@ static bool __maybe_unused its_enable_quirk_hip09_162100801(void *data)
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


