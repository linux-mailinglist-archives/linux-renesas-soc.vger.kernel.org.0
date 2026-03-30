Return-Path: <linux-renesas-soc+bounces-30570-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2J1xDotWymn27gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30570-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 12:55:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA926359C0E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 12:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A75B030C6315
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 10:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147873C4572;
	Mon, 30 Mar 2026 10:48:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from Atcsqr.andestech.com (unknown [60.248.187.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387CD3BFE3C;
	Mon, 30 Mar 2026 10:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.187.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867690; cv=none; b=B8BPPng+hP0edZFvTXua3sqI6OnhkJgAfIVehXve0xOnTMFw3CF7B3guhAw0gWia8tFb/xemAya+kkpATFO1dqMrAvVJdQK1bfem7Om9OeUGWJpYRs4CSJKdE4pRS+W7t8qkrNxD3VuD/bym0xKfef2GCkzOmxNHgut6naNVZkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867690; c=relaxed/simple;
	bh=hKHKp9my13roBU2qU8iKtL9x9H9TJ7oi8Qn9L8SW+R4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c1cPSe+G2nX+ni1jWfNl4/vJBw0xSOsXLX5OyZDRJhUqJov4IABOU7Ks4opHSVf01Ig6ibduC98x26b/1Rqc+rPUMZp2uTb8XvYxxqRKVORJGgywIvFop5OXQUMbOzyqZfbrryIw5Ys1sxBLjnXgbMf0+NjFsu01PAGErljCZ+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.187.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 62UAT1vF039878;
	Mon, 30 Mar 2026 18:29:01 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 62UAS2eU038167;
	Mon, 30 Mar 2026 18:28:02 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Mar
 2026 18:28:02 +0800
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
Subject: [PATCH 2/7] cache: andes_llcache: refactor initialization and cache operations
Date: Mon, 30 Mar 2026 18:27:19 +0800
Message-ID: <20260330102724.1012470-3-minachou@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 62UAT1vF039878
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
	TAGGED_FROM(0.00)[bounces-30570-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,glider.be,bp.renesas.com,gmail.com,andestech.com,huawei.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[andestech.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[andestech.com:email,andestech.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[minachou@andestech.com,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: AA926359C0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch cleans up the Andes LLC cache driver:
 - improved error handling in andes_cache_init() by using goto labels
 - updated andes_dma_cache_inv/wback() to check for !size instead of
   start == end
 - cache-line-size mismatch from an error to a warning
 - Use ALIGN and ALIGN_DOWN helpers instead of the alignment logic in
   andes_dma_cache_inv() and andes_dma_cache_wback().

Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
---
 drivers/cache/andes_llcache.c | 56 ++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
index d5e382f3c801..d318b8009f7f 100644
--- a/drivers/cache/andes_llcache.c
+++ b/drivers/cache/andes_llcache.c
@@ -111,21 +111,17 @@ static void andes_dma_cache_inv(phys_addr_t paddr, size_t size)
 {
 	unsigned long start = (unsigned long)phys_to_virt(paddr);
 	unsigned long end = start + size;
-	unsigned long line_size;
+	unsigned long line_size = andes_priv.andes_cache_line_size;
 	unsigned long flags;
 
-	if (unlikely(start == end))
+	if (unlikely(!size))
 		return;
 
-	line_size = andes_priv.andes_cache_line_size;
-
-	start = start & (~(line_size - 1));
-	end = ((end + line_size - 1) & (~(line_size - 1)));
+	start = ALIGN_DOWN(start, line_size);
+	end = ALIGN(end, line_size);
 
 	local_irq_save(flags);
-
 	andes_cpu_dcache_inval_range(start, end);
-
 	local_irq_restore(flags);
 }
 
@@ -133,15 +129,15 @@ static void andes_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
 	unsigned long start = (unsigned long)phys_to_virt(paddr);
 	unsigned long end = start + size;
-	unsigned long line_size;
+	unsigned long line_size = andes_priv.andes_cache_line_size;
 	unsigned long flags;
 
-	if (unlikely(start == end))
+	if (unlikely(!size))
 		return;
 
-	line_size = andes_priv.andes_cache_line_size;
-	start = start & (~(line_size - 1));
-	end = ((end + line_size - 1) & (~(line_size - 1)));
+	start = ALIGN_DOWN(start, line_size);
+	end = ALIGN(end, line_size);
+
 	local_irq_save(flags);
 	andes_cpu_dcache_wb_range(start, end);
 	local_irq_restore(flags);
@@ -159,14 +155,13 @@ static int andes_get_llc_line_size(struct device_node *np)
 
 	ret = of_property_read_u32(np, "cache-line-size", &andes_priv.andes_cache_line_size);
 	if (ret) {
-		pr_err("Failed to get cache-line-size, defaulting to 64 bytes\n");
+		pr_err("Cache: Failed to get cache-line-size\n");
 		return ret;
 	}
 
 	if (andes_priv.andes_cache_line_size != ANDES_CACHE_LINE_SIZE) {
-		pr_err("Expected cache-line-size to be 64 bytes (found:%u)\n",
-		       andes_priv.andes_cache_line_size);
-		return -EINVAL;
+		pr_warn("Cache: Expected cache-line-size to be 64 bytes (found:%u)\n",
+			andes_priv.andes_cache_line_size);
 	}
 
 	return 0;
@@ -186,16 +181,18 @@ static const struct of_device_id andes_cache_ids[] = {
 static int __init andes_cache_init(void)
 {
 	struct resource res;
-	int ret;
+	int ret = 0;
 
 	struct device_node *np __free(device_node) =
 		of_find_matching_node(NULL, andes_cache_ids);
-	if (!of_device_is_available(np))
-		return -ENODEV;
+	if (!of_device_is_available(np)) {
+		ret = -ENODEV;
+		goto err_ret;
+	}
 
 	ret = of_address_to_resource(np, 0, &res);
 	if (ret)
-		return ret;
+		goto err_ret;
 
 	/*
 	 * If IOCP is present on the Andes AX45MP core riscv_cbom_block_size
@@ -208,17 +205,22 @@ static int __init andes_cache_init(void)
 		return 0;
 
 	andes_priv.llc_base = ioremap(res.start, resource_size(&res));
-	if (!andes_priv.llc_base)
-		return -ENOMEM;
+	if (!andes_priv.llc_base) {
+		ret = -ENOMEM;
+		goto err_ret;
+	}
 
 	ret = andes_get_llc_line_size(np);
-	if (ret) {
-		iounmap(andes_priv.llc_base);
-		return ret;
-	}
+	if (ret)
+		goto err_unmap;
 
 	riscv_noncoherent_register_cache_ops(&andes_cmo_ops);
 
 	return 0;
+
+err_unmap:
+	iounmap(andes_priv.llc_base);
+err_ret:
+	return ret;
 }
 early_initcall(andes_cache_init);
-- 
2.34.1


