Return-Path: <linux-renesas-soc+bounces-30571-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kK5QAlRZymn27gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30571-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 13:07:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 189B8359ED7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 13:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9ABEB30AA255
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 10:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCD33C554D;
	Mon, 30 Mar 2026 10:48:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from Atcsqr.andestech.com (exmail.andestech.com [60.248.187.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C903C0606;
	Mon, 30 Mar 2026 10:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.187.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867696; cv=none; b=m8DE3e3gp1TuEA6b5lKMhrKfe/zkJ3ZbBD8KLmzMsxpPze94396w2X9d2hbmn6iRDlzK5kP1KsL05YUP8YNMcjJvJavCdT/nj0L2crJrH7YhLbjhlczTqVk/dLHizslYrBdTs3ii6RdPY1PNz9/yjsc7WqaOmfj72PwPltyT+xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867696; c=relaxed/simple;
	bh=/47/5HHnaif3JHAckrH81FG+m9EH64JkilwpPo/i3Fo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OcySWEJBI1PgErEmQ5g/mvqYrXTBHI37FTeoaZQeyVgUHYzW7YVWqaEe4n+PS+s/Pg9H1G5GtVNI3FNVqAzikMb2E3gia7H97PpWw1V6hz3KaojNCwevVbX9rMVLQiEQ0xZ9BQDmoZGmHrWVoWrm/6+hDZ3Ifd3MjRxBBxMzAqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.187.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 62UAT1Oq039879;
	Mon, 30 Mar 2026 18:29:01 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 62UAS8LP038225;
	Mon, 30 Mar 2026 18:28:08 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Mar
 2026 18:28:07 +0800
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
 Min Mina Chou" <minachou@andestech.com>,
        Leo Yu-Chi Liang
	<ycliang@andestech.com>
Subject: [PATCH 3/7] cache: andes_llcache: improve performance of LLC operation
Date: Mon, 30 Mar 2026 18:27:20 +0800
Message-ID: <20260330102724.1012470-4-minachou@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 62UAT1Oq039879
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_REJECT(2.00)[andestech.com : SPF not aligned (relaxed), No valid DKIM,reject];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30571-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,glider.be,bp.renesas.com,gmail.com,andestech.com,huawei.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[andestech.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[andestech.com:email,andestech.com:mid,andestech.com:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[minachou@andestech.com,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 189B8359ED7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Eliminate get_cpu() on !CONFIG_SMP and switch readl/writel to their
relaxed variants to remove unnecessary fence instructions on I/O
memory access. The platform specification defines all I/O regions are
on channel 0 (point-to-point strongly ordered), so explicit fences are
not required [1][2][3]. Explicit memory barriers (mb) are added before
and after the CCTL loop to ensure overall memory consistency.

Also fix hart ID mapping by switching to cpuid_to_hartid_map() instead
of using the logical CPU ID directly. In AMP setups (e.g. Linux on
Hart 1, RTOS on Hart 0), Linux sees itself as CPU 0 but must access
Hart 1's CCTL registers, so using the logical ID would cause accidental
interference with other cores.

[1] platform spec 2.1.1: https://github.com/riscvarchive/riscv-platform-specs/blob/main/riscv-platform-spec.adoc?plain=1#L169
[2] privileged spec 3.6.5: https://github.com/riscv/riscv-isa-manual/blob/main/src/machine.adoc?plain=1#L2835
[3] riscv: asm/mmio.h: https://gitea.andestech.com/RD-SW/linux/src/branch/ast-v5_4_0-branch/arch/riscv/include/asm/mmio.h#L105

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
---
 drivers/cache/andes_llcache.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
index d318b8009f7f..57f666bc537a 100644
--- a/drivers/cache/andes_llcache.c
+++ b/drivers/cache/andes_llcache.c
@@ -66,7 +66,7 @@ static struct andes_priv andes_priv;
 /* LLC operations */
 static inline uint32_t andes_cpu_llc_get_cctl_status(void)
 {
-	return readl(andes_priv.llc_base + ANDES_LLC_REG_CCTL_STATUS_OFFSET_C0);
+	return readl_relaxed(andes_priv.llc_base + ANDES_LLC_REG_CCTL_STATUS_OFFSET_C0);
 }
 
 static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
@@ -74,16 +74,22 @@ static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
 {
 	unsigned long line_size = andes_priv.andes_cache_line_size;
 	void __iomem *base = andes_priv.llc_base;
-	int mhartid = smp_processor_id();
 	unsigned long pa;
+	int mhartid = 0;
 
+	if (IS_ENABLED(CONFIG_SMP))
+		mhartid = cpuid_to_hartid_map(get_cpu());
+	else
+		mhartid = cpuid_to_hartid_map(0);
+
+	mb(); /* complete earlier memory accesses before the cache flush */
 	while (end > start) {
 		csr_write(CSR_UCCTLBEGINADDR, start);
 		csr_write(CSR_UCCTLCOMMAND, l1_op);
 
 		pa = virt_to_phys((void *)start);
-		writel(pa, base + ANDES_LLC_REG_CCTL_ACC_OFFSET_BY_CORE(mhartid));
-		writel(llc_op, base + ANDES_LLC_REG_CCTL_CMD_OFFSET_BY_CORE(mhartid));
+		writel_relaxed(pa, base + ANDES_LLC_REG_CCTL_ACC_OFFSET_BY_CORE(mhartid));
+		writel_relaxed(llc_op, base + ANDES_LLC_REG_CCTL_CMD_OFFSET_BY_CORE(mhartid));
 		while ((andes_cpu_llc_get_cctl_status() &
 			ANDES_LLC_CCTL_STATUS_MASK_BY_CORE(mhartid)) !=
 			ANDES_LLC_CCTL_STATUS_IDLE)
@@ -91,6 +97,10 @@ static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
 
 		start += line_size;
 	}
+	mb(); /* issue later memory accesses after the cache flush */
+
+	if (IS_ENABLED(CONFIG_SMP))
+		put_cpu();
 }
 
 /* Write-back L1 and LLC entry */
-- 
2.34.1


