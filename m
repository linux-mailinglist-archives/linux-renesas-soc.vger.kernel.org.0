Return-Path: <linux-renesas-soc+bounces-34849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 871kJ70iTmp0DwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:13:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BB06F7241AB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:13:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=JblCR4lZ;
	dmarc=pass (policy=none) header.from=163.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0ABDC302C36E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 10:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2FD389DE8;
	Wed,  8 Jul 2026 10:09:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7564E38B7BB;
	Wed,  8 Jul 2026 10:09:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505396; cv=none; b=BM6RO1uc4GB0ZfQOk9XoQrv7YlUQShzNMK6LeWFH21I3sMPrUG91EeOZ4zvn00dfqqosqlvvB1DBr7N4PKYLBr2aHQD95qsKlgzyMpuuGrSGpjngZEtlRR5Ajmn0ay1V3Vi/gkDe5dDm/pYDoF+p9ZzxJZVTOtv2ClVoJXurfxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505396; c=relaxed/simple;
	bh=flOCJcSMI4HKz1cJWhJybbEcwZ5oV6SJCMt1XL1w+mQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b2lOTD7qmirUgXm5+1aFEdW7e2LycPEI1aobBp2iXX/iOkR93AqSwRbo7kHmzqmFYcHZ/VRcSbZaxXZwy2e1hLWwtnyNGym4g0dmUqcP1biLkwUwED703Yy148xvs6OP6GXfjMPb5uE3WBewMCjXmEkMPTGNKZVBrzwzWaamBK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=JblCR4lZ; arc=none smtp.client-ip=117.135.210.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Xf
	U23tvH1FQor2qxI0/H4ZciIyUQjGUNBRN4hWV6UV8=; b=JblCR4lZvPkQeOym0/
	SCJTU+yu+AWqquPKMfXZVJ+w22NmehEP5+xNJGU/tZ83vrqBxGSPTzU9KZMP9hkQ
	I/ho089VgQyFsUOHpDlu1UGcup2y+lzo+2UOHMJa85zoaadQA4q9tj7RU9rLTOXn
	r08z2JcEEyMuMe2Z2ZM/UbkmA=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wBnK1GyIU5q6Bt_Hg--.64211S2;
	Wed, 08 Jul 2026 18:08:52 +0800 (CST)
From: Qingshuang Fu <fffsqian@163.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Magnus Damm <damm+renesas@opensource.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>,
	Qingshuang Fu <fffsqian@163.com>
Subject: [PATCH v5] irqchip/renesas-irqc: fix generic interrupt chip leak on remove
Date: Wed,  8 Jul 2026 18:08:46 +0800
Message-Id: <20260708100846.506314-1-fffsqian@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAMuHMdUxEnBx-2dvjSUPMjEb__0c-44y00OH9oftkPqoW18YyA@mail.gmail.com>
References: <CAMuHMdUxEnBx-2dvjSUPMjEb__0c-44y00OH9oftkPqoW18YyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBnK1GyIU5q6Bt_Hg--.64211S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr4Utr15Gw15Wr13KF43trb_yoW5Gry8pF
	Wxu3s8Zr4UGF18uF4UCr18ZFyYga13KayUt3WIkw12vw1UAw1DGF9FqFWjkr1UKa1xGa1Y
	vF4DJFZ5ua4UAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEknY7UUUUU=
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbC6RSjbmpOIbRlYAAA3E
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34849-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[fffsqian@163.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@linutronix.de,m:damm+renesas@opensource.se,m:geert+renesas@glider.be,m:maz@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:fuqingshuang@kylinos.cn,m:fffsqian@163.com,m:damm@opensource.se,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kylinos.cn,163.com];
	DKIM_TRACE(0.00)[163.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fffsqian@163.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,kylinos.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB06F7241AB

From: Qingshuang Fu <fuqingshuang@kylinos.cn>

The driver allocates domain generic chips using
irq_alloc_domain_generic_chips() during probe. However, on driver
remove, the generic chips are not automatically freed when the interrupt
domain is removed because the domain flags do not include
IRQ_DOMAIN_FLAG_DESTROY_GC.

This causes both the domain generic chips structure and the associated
generic chips to be leaked. Additionally, the generic chips remain on
the global gc_list and may later be visited by generic interrupt chip
suspend, resume, or shutdown callbacks after the driver has been removed,
potentially resulting in a use-after-free and kernel crash.

Fix the resource leak by setting IRQ_DOMAIN_FLAG_DESTROY_GC on the
interrupt domain; this lets the interrupt domain core automatically
release all generic chips when irq_domain_remove() is called, removing
the need for manual cleanup calls in error paths and remove callback.

Fixes: 99c221df33fbfa1b ("irqchip/renesas-irqc: Move over to nested generic chip")
Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
---
Changes from v1 to v2:
- Corrected wrong Fixes commit ID per Geert's review

Changes from v2 to v3:
- Reword commit prose to use full "interrupt" instead of shorthand "IRQ"
- Add manual irq_domain_remove_generic_chips() cleanup in probe error path and remove callback to fix leak

Changes from v3 to v4:
- Adopt tglx's suggestion: set IRQ_DOMAIN_FLAG_DESTROY_GC instead of manual
  irq_domain_remove_generic_chips() cleanup calls

Changes from v4 to v5:
1. Move IRQ_DOMAIN_FLAG_DESTROY_GC assignment right after irq_domain creation
   to align with similar drivers like pdc_intc_probe()
2. Drop redundant comment for flag assignment
3. Remove old Reviewed-by tag since the implementation logic was fully changed

 drivers/irqchip/irq-renesas-irqc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-renesas-irqc.c b/drivers/irqchip/irq-renesas-irqc.c
index a20a6471b0e4..1ff3535a4617 100644
--- a/drivers/irqchip/irq-renesas-irqc.c
+++ b/drivers/irqchip/irq-renesas-irqc.c
@@ -176,6 +176,7 @@ static int irqc_probe(struct platform_device *pdev)
 		goto err_runtime_pm_disable;
 	}
 
+	p->irq_domain->flags |= IRQ_DOMAIN_FLAG_DESTROY_GC;
 	ret = irq_alloc_domain_generic_chips(p->irq_domain, p->number_of_irqs,
 					     1, "irqc", handle_level_irq,
 					     0, 0, IRQ_GC_INIT_NESTED_LOCK);

base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
-- 
2.25.1


