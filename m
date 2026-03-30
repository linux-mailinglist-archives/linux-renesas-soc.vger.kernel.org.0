Return-Path: <linux-renesas-soc+bounces-30572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHNBHxFXymn27gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 12:57:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB58F359CA7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 12:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6AE1E30CDC1D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 10:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86BE3C5DA0;
	Mon, 30 Mar 2026 10:48:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from Atcsqr.andestech.com (unknown [60.248.187.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7EB3C552D;
	Mon, 30 Mar 2026 10:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.187.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867702; cv=none; b=ipdeU9BNr1B9VqEwhb7AnhnsTRPX2FYZiADpTLUby1Pah9/kNgssV5laFvzXCvNRlMGd0ETBfcjJ73ogCiHr+na/+TJcK9JYvQ8IDoU5M3tTJtBGdC88y+bOOvr/uERLkUcYNNODfAhsKnuATwDtkRaCn2U8/LT+hLI8skc5AE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867702; c=relaxed/simple;
	bh=CQ87WG7tB0NGFgqYnwUzrD65BoyJsudzvJu0vnidgbQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=reiVeLeE7D7T0czZSd694vQbp0CrX/z3qfvKdfoiyrPKcoLtdxlKuTX7QHYszbS2ODLdfF0bpcx2wc6l2rNRNYXL6mdOp9GoSNLWCyy6Sb+wlEiTAhllqPk4QmNvijJ/OyDd1UQoXnKenIHncu2Oz/XINUlv1s54FMW3sfdy4zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.187.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 62UATE7s040024;
	Mon, 30 Mar 2026 18:29:14 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 62UASEsn038230;
	Mon, 30 Mar 2026 18:28:14 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Mar
 2026 18:28:14 +0800
From: Hui Min Mina Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <geert+renesas@glider.be>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <magnus.damm@gmail.com>,
        <ben717@andestech.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jonathan.cameron@huawei.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
CC: <tim609@andestech.com>, <alex749@andestech.com>, <az70021@gmail.com>,
        "Hui
 Min Mina Chou" <minachou@andestech.com>
Subject: [PATCH 4/7] cache: andes_llcache: centralize cache ops and use native WBINVAL
Date: Mon, 30 Mar 2026 18:27:21 +0800
Message-ID: <20260330102724.1012470-5-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330102724.1012470-1-minachou@andestech.com>
References: <20260330102724.1012470-1-minachou@andestech.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 62UATE7s040024
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_REJECT(2.00)[andestech.com : SPF not aligned (relaxed), No valid DKIM,reject];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30572-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,glider.be,bp.renesas.com,gmail.com,andestech.com,huawei.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[andestech.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[minachou@andestech.com,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[andestech.com:email,andestech.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AB58F359CA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce andes_cpu_cache_operation() to centralize address
translation, alignment, and IRQ handling, removing the redundant
wrappers andes_cpu_dcache_wb_range and andes_cpu_dcache_inval_range.

This refactoring includes the following refinements:
- Consolidates address translation, boundary alignment, and IRQ handling
  (local_irq_save/restore) into the central function.
- Make IRQ handling per cache line instead of across the entire cache
  operation.
- Cleans up redundant intermediate wrapper functions
  (andes_cpu_dcache_wb_range, andes_cpu_dcache_inval_range).
- wback_inv was chaining wback + inv separately; use the hardware's
  native WBINVAL CCTL instead, which does both in one shot.

Signed-off-by: Alex Chun-Ju Lin <alex749@andestech.com>
Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
---
 drivers/cache/andes_llcache.c | 63 ++++++++++++-----------------------
 1 file changed, 21 insertions(+), 42 deletions(-)

diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
index 57f666bc537a..0efa6e9c80bd 100644
--- a/drivers/cache/andes_llcache.c
+++ b/drivers/cache/andes_llcache.c
@@ -69,21 +69,29 @@ static inline uint32_t andes_cpu_llc_get_cctl_status(void)
 	return readl_relaxed(andes_priv.llc_base + ANDES_LLC_REG_CCTL_STATUS_OFFSET_C0);
 }
 
-static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
-				       unsigned int l1_op, unsigned int llc_op)
+static void andes_cpu_cache_operation(phys_addr_t paddr, size_t size,
+				      unsigned int l1_op, unsigned int llc_op)
 {
 	unsigned long line_size = andes_priv.andes_cache_line_size;
 	void __iomem *base = andes_priv.llc_base;
+	unsigned long start = (unsigned long)phys_to_virt(paddr);
+	unsigned long end = start + size;
+	unsigned long flags;
 	unsigned long pa;
 	int mhartid = 0;
 
+	start = ALIGN_DOWN(start, line_size);
+	end = ALIGN(end, line_size);
+
 	if (IS_ENABLED(CONFIG_SMP))
 		mhartid = cpuid_to_hartid_map(get_cpu());
 	else
 		mhartid = cpuid_to_hartid_map(0);
 
 	mb(); /* complete earlier memory accesses before the cache flush */
-	while (end > start) {
+	for (; start < end; start += line_size) {
+		local_irq_save(flags);
+
 		csr_write(CSR_UCCTLBEGINADDR, start);
 		csr_write(CSR_UCCTLCOMMAND, l1_op);
 
@@ -95,7 +103,7 @@ static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
 			ANDES_LLC_CCTL_STATUS_IDLE)
 			;
 
-		start += line_size;
+		local_irq_restore(flags);
 	}
 	mb(); /* issue later memory accesses after the cache flush */
 
@@ -103,60 +111,31 @@ static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
 		put_cpu();
 }
 
-/* Write-back L1 and LLC entry */
-static inline void andes_cpu_dcache_wb_range(unsigned long start, unsigned long end)
-{
-	andes_cpu_cache_operation(start, end, ANDES_L1D_CCTL_VA_WB,
-				   ANDES_LLC_CCTL_PA_WB);
-}
-
-/* Invalidate the L1 and LLC entry */
-static inline void andes_cpu_dcache_inval_range(unsigned long start, unsigned long end)
-{
-	andes_cpu_cache_operation(start, end, ANDES_L1D_CCTL_VA_INVAL,
-				   ANDES_LLC_CCTL_PA_INVAL);
-}
-
 static void andes_dma_cache_inv(phys_addr_t paddr, size_t size)
 {
-	unsigned long start = (unsigned long)phys_to_virt(paddr);
-	unsigned long end = start + size;
-	unsigned long line_size = andes_priv.andes_cache_line_size;
-	unsigned long flags;
-
 	if (unlikely(!size))
 		return;
 
-	start = ALIGN_DOWN(start, line_size);
-	end = ALIGN(end, line_size);
-
-	local_irq_save(flags);
-	andes_cpu_dcache_inval_range(start, end);
-	local_irq_restore(flags);
+	andes_cpu_cache_operation(paddr, size, ANDES_L1D_CCTL_VA_INVAL,
+				  ANDES_LLC_CCTL_PA_INVAL);
 }
 
 static void andes_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
-	unsigned long start = (unsigned long)phys_to_virt(paddr);
-	unsigned long end = start + size;
-	unsigned long line_size = andes_priv.andes_cache_line_size;
-	unsigned long flags;
-
 	if (unlikely(!size))
 		return;
 
-	start = ALIGN_DOWN(start, line_size);
-	end = ALIGN(end, line_size);
-
-	local_irq_save(flags);
-	andes_cpu_dcache_wb_range(start, end);
-	local_irq_restore(flags);
+	andes_cpu_cache_operation(paddr, size, ANDES_L1D_CCTL_VA_WB,
+				  ANDES_LLC_CCTL_PA_WB);
 }
 
 static void andes_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
 {
-	andes_dma_cache_wback(paddr, size);
-	andes_dma_cache_inv(paddr, size);
+	if (unlikely(!size))
+		return;
+
+	andes_cpu_cache_operation(paddr, size, ANDES_L1D_CCTL_VA_WBINVAL,
+				  ANDES_LLC_CCTL_PA_WBINVAL);
 }
 
 static int andes_get_llc_line_size(struct device_node *np)
-- 
2.34.1


