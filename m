Return-Path: <linux-renesas-soc+bounces-34845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hh2TAEgbTmqTDQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 11:41:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E65723D74
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 11:41:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=O1MiNJa5;
	dmarc=pass (policy=none) header.from=163.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7832430048D3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 09:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0CD3845AE;
	Wed,  8 Jul 2026 09:40:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267273F7A8C;
	Wed,  8 Jul 2026 09:40:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783503606; cv=none; b=f90CJZrAIecEKNVZZPwqhlaqqmUIeLc8T1+PKhSqAGVJEHfaIZhQkQyhODLjhCdTjQgAReKHk2sgtvejDY6XisplO0hppnvb2fH3VnpqDo3T93n+PXdZOyBlu1+KrXLGL/vP+qriFKMka+yM3rsBdXlm9hwfS7MBulkNmUsycpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783503606; c=relaxed/simple;
	bh=Dgi4zJSRBR4tTAMxRAVsOIdCbQmmsNIvCebfKJQrVxM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ucdWbHsLgDA+ZNq4ocng8ZEpfUBTemI1LIZLO4oUOI9dwFakQUDcbfbdKQa8aeknI7VRSsqe/P/4aN22IAG8a9X/190MeL9mh7+II0Jfl1q4+zgZot8OThpjyy96h2+K13YOlTB3q3C7EiFtqSUTn3MJaowm9zPI7brg3uIIXGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=O1MiNJa5; arc=none smtp.client-ip=220.197.31.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=BN
	3JMg0HYmw0vU84AVFHk2ryR5gBgwYoUDQjnI9SpYE=; b=O1MiNJa5Vkhf+7DN5N
	ntbVM1H9ZnbMZQik5IEUtV27GspaiJiCDuBUD2NpKj3qw5d+zHcYpdGxlOMtTXg/
	cD+g7+vN7UKEmh2ixF37RY7OhDYjAwL7h4z90l8mXHIV/8bH7nshL0R5V9lCG/WR
	3BvTi32Yk9z33uvAIAeLeBeMU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDnN5K1Gk5qaNc6Ig--.55155S2;
	Wed, 08 Jul 2026 17:39:02 +0800 (CST)
From: Qingshuang Fu <fffsqian@163.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Magnus Damm <damm+renesas@opensource.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>,
	Qingshuang Fu <fffsqian@163.com>
Subject: [PATCH v4] irqchip/renesas-irqc: fix generic interrupt chip leak on remove
Date: Wed,  8 Jul 2026 17:38:49 +0800
Message-Id: <20260708093849.501946-1-fffsqian@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <874ii9svk6.ffs@fw13>
References: <874ii9svk6.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnN5K1Gk5qaNc6Ig--.55155S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4xJFWDKryxZF1rJF4kXrb_yoW8ZFWfpF
	W8W345Zw4UGryUZw17CF48ZFyYq3W3t3yak34rG34av3W5Gw1DWF9FvFWqvr12kay8Ka1Y
	vFs8Gay8Wa4UAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEAhLUUUUUU=
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbCwhbhrGpOGrZ34wAA3F
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34845-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@linutronix.de,m:damm+renesas@opensource.se,m:geert+renesas@glider.be,m:maz@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:fuqingshuang@kylinos.cn,m:fffsqian@163.com,m:damm@opensource.se,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[fffsqian@163.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,kylinos.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49E65723D74

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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/irqchip/irq-renesas-irqc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-renesas-irqc.c b/drivers/irqchip/irq-renesas-irqc.c
index a20a6471b0e4..4b8b86c89b6a 100644
--- a/drivers/irqchip/irq-renesas-irqc.c
+++ b/drivers/irqchip/irq-renesas-irqc.c
@@ -194,6 +194,9 @@ static int irqc_probe(struct platform_device *pdev)
 	p->gc->chip_types[0].chip.irq_set_wake	= irqc_irq_set_wake;
 	p->gc->chip_types[0].chip.flags	= IRQCHIP_MASK_ON_SUSPEND;
 
+	/* Automatically free generic chips when interrupt domain is destroyed */
+	p->irq_domain->flags |= IRQ_DOMAIN_FLAG_DESTROY_GC;
+
 	irq_domain_set_pm_device(p->irq_domain, dev);
 
 	/* request interrupts one by one */

base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
-- 
2.25.1


