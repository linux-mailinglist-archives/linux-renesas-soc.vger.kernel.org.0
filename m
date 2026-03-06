Return-Path: <linux-renesas-soc+bounces-28962-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HLPA+rpqmmOYAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28962-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 15:51:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 66590223173
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 15:51:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80CE831BD0C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 14:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A456B34A76B;
	Fri,  6 Mar 2026 14:35:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45C830AACD;
	Fri,  6 Mar 2026 14:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772807704; cv=none; b=egVebCjB9q7FlIMlkrM3uVBDjfUHUOkUTIf1D71BYhQlvat7Dx/9Vja9XAmyYyCnhc9NYIhBTsWMylsosQb7hojj145jznJD6rDu6HtD8wIL0+5eJfmODry+ZPnuBrPVVKNZENZsOG3fHP11oekvoUkaeCyfvHiHxBpgtOw+Ca4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772807704; c=relaxed/simple;
	bh=LXRJt4JfbvhubuzDQHIlXLfj76IO4PciN19IzVAI4zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DZkZIB6lGMxLiIWnZMFUa3Q1xceIv4iqFpGVAMBhH7rtmXECeMBInH79zn9VRKf/ak5oANNLbkdNO5rbgc02Fpj77e/dtHWTCLXmGvGmNOjxDn+qZnUoGsHtrhbMxjha0HpHRS6gB7uhMh57U3U1pmYppj37aqk1WB1AR3QDrPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: vqhrXBb+S6mDs18IM6EY5g==
X-CSE-MsgGUID: 8WlIbmiHRxajz+J9bUZXNg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Mar 2026 23:35:01 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.98])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 67B3C4008546;
	Fri,  6 Mar 2026 23:34:56 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: claudiu.beznea.uj@bp.renesas.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org
Cc: robh@kernel.org,
	bhelgaas@google.com,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	biju.das.jz@bp.renesas.com,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	john.madieu@gmail.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v8 03/15] PCI: rzg3s-host: Rework inbound window algorithm for multi-SoC support
Date: Fri,  6 Mar 2026 15:34:10 +0100
Message-ID: <20260306143423.19562-4-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306143423.19562-1-john.madieu.xa@bp.renesas.com>
References: <20260306143423.19562-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 66590223173
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28962-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Action: no action

The existing inbound window configuration algorithm has two issues that
prevent proper operation on RZ/G3E:

1. Over-mapping: Using roundup_pow_of_two() on the remaining region size
   can result in windows that extend beyond the intended memory region.

2. Alignment violation: Addresses are only aligned to 4K regardless of
   the actual window size. According to the RZ/G3S HW manual (Rev.1.10,
   section 34.6.6.7) and RZ/G3E HW manual (Rev.1.15, section 6.6.7.6),
   bit carry must not occur when adding AXI Window Base and AXI Window
   Mask registers. This effectively requires the base address to be
   aligned to the window size.

RZ/G3E strictly enforces these constraints and requires precise window
boundaries with properly aligned addresses.

Rework the algorithm to properly handle arbitrary region sizes and
alignment constraints by splitting non-power-of-2 regions into multiple
windows. The new approach iteratively selects the largest power-of-2
size that:
 - Fits within the remaining region (__fls of remaining size)
 - Does not exceed the natural alignment of the CPU address (__ffs)
 - Does not exceed the natural alignment of the PCI address (__ffs)

This ensures windows never over-map beyond the intended region and
satisfies the hardware requirement that base address + mask must not
cause bit carry, while maintaining the 4K * 2^N byte window size
constraint.

The reworked algorithm is required for RZ/G3E support and remains
fully compatible with RZ/G3S.

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v8: Reworded patch description
v7: No changes
v6: No changes

v5:
 - Updated HW manual section specification
 - Collected Rb tag

v4: No changes
v3: No changes
v2: New patch

 drivers/pci/controller/pcie-rzg3s-host.c | 53 +++++++++++++-----------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index 222891324374..7f5ffc5c218a 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -1270,50 +1270,55 @@ static int rzg3s_pcie_set_inbound_windows(struct rzg3s_pcie_host *host,
 	u64 pci_addr = entry->res->start - entry->offset;
 	u64 cpu_addr = entry->res->start;
 	u64 cpu_end = entry->res->end;
-	u64 size_id = 0;
 	int id = *index;
 	u64 size;
 
-	while (cpu_addr < cpu_end) {
+	/*
+	 * According to the RZ/G3S HW manual (Rev.1.10, section 34.6.6.7) and
+	 * RZ/G3E HW manual (Rev.1.15, section 6.6.7.6):
+	 * - Each window must be a single memory size of power of two
+	 * - Mask registers must be set to (2^N - 1)
+	 * - Bit carry must not occur when adding base and mask registers,
+	 *   meaning the base address must be aligned to the window size
+	 *
+	 * Split non-power-of-2 regions into multiple windows to satisfy
+	 * these constraints without over-mapping.
+	 */
+	while (cpu_addr <= cpu_end) {
+		u64 remaining_size = cpu_end - cpu_addr + 1;
+		u64 align_limit;
+
 		if (id >= RZG3S_MAX_WINDOWS)
 			return dev_err_probe(host->dev, -ENOSPC,
 					     "Failed to map inbound window for resource (%s)\n",
 					     entry->res->name);
 
-		size = resource_size(entry->res) - size_id;
+		/* Start with largest power-of-two that fits in remaining size */
+		size = 1ULL << __fls(remaining_size);
 
 		/*
-		 * According to the RZ/G3S HW manual (Rev.1.10,
-		 * section 34.3.1.71 AXI Window Mask (Lower) Registers) the min
-		 * size is 4K.
+		 * The "no bit carry" rule requires base addresses to be
+		 * aligned to the window size. Find the maximum window size
+		 * that both addresses can support based on their natural
+		 * alignment (lowest set bit).
 		 */
-		size = max(size, SZ_4K);
+		align_limit = min(cpu_addr ? (1ULL << __ffs(cpu_addr)) : ~0ULL,
+				  pci_addr ? (1ULL << __ffs(pci_addr)) : ~0ULL);
 
-		/*
-		 * According the RZ/G3S HW manual (Rev.1.10, sections:
-		 * - 34.3.1.69 AXI Window Base (Lower) Registers
-		 * - 34.3.1.71 AXI Window Mask (Lower) Registers
-		 * - 34.3.1.73 AXI Destination (Lower) Registers)
-		 * the CPU addr, PCIe addr, size should be 4K aligned and be a
-		 * power of 2.
-		 */
-		size = ALIGN(size, SZ_4K);
-		size = roundup_pow_of_two(size);
-
-		cpu_addr = ALIGN(cpu_addr, SZ_4K);
-		pci_addr = ALIGN(pci_addr, SZ_4K);
+		size = min(size, align_limit);
 
 		/*
-		 * According to the RZ/G3S HW manual (Rev.1.10, section
-		 * 34.3.1.71 AXI Window Mask (Lower) Registers) HW expects first
-		 * 12 LSB bits to be 0xfff. Subtract 1 from size for this.
+		 * Minimum window size is 4KB.
+		 * See RZ/G3S HW manual (Rev.1.10, section 34.3.1.71) and
+		 * RZ/G3E HW manual (Rev.1.15, section 6.6.4.1.3.(74)).
 		 */
+		size = max(size, SZ_4K);
+
 		rzg3s_pcie_set_inbound_window(host, cpu_addr, pci_addr,
 					      size - 1, id);
 
 		pci_addr += size;
 		cpu_addr += size;
-		size_id = size;
 		id++;
 	}
 	*index = id;
-- 
2.25.1


