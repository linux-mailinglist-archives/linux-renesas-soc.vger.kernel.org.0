Return-Path: <linux-renesas-soc+bounces-27885-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NpbJmdWg2mJlQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27885-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 15:23:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A77EFE706A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 15:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 53EC23003817
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 14:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD14410D32;
	Wed,  4 Feb 2026 14:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9RXx/f0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E416A410D20
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 14:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770215006; cv=none; b=QAFaQ224Qme1oCKvfajZMdbSsSUdmh1MWHv/tSagxCR2ARDWRh1ZCSjdgbAKjYS4finmrXIN2jf4LxSzcgm+pxZIJZFkLI9VuMZtl3MBFn7JT4hggXoH45ctRcj3/kCuMNv+kzzNRewhGDrGPGFw0WlrCy8Ad4Hum/JOqTXAPVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770215006; c=relaxed/simple;
	bh=GQuhT/tYWweuUx5ujA6rRjXoqkczMUhSFVoDxDBYdc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dOiMZ9upIvR2BaHp+/hMR+oHMbA79LYPUxjWr7nHsykk1u+q+E5bDd9cB2yqbP9jDQdFMUh2AeMkZYYlt+r/4eTuZyW1zi5r5fgH19y0us5IRu2oKfoTQqKQn4/T1e7QJXRWcXvQgfqA84/cacMdEJoJ/AS2t/CwvghnhBIJ+8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9RXx/f0; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b885a18f620so1045469366b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 06:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770215004; x=1770819804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epCayHlvCsfz7S+7gHZWH4Yw7IrAlRqKPfSc7t/2oH4=;
        b=l9RXx/f0R6PTeVYq+TUg2uupHyLLlVp6EXGlGwGmaUW49MMm+LwEnazq3nJFbvkeDo
         DRLLQervAf+n8FbjnpQ8suVOsimrIvVBr2KpKZb7AnR7nCHkGCxUfb369fowv/B0isKO
         g1m+7NDbtVD/96T4uzYFSa1bPgnP0lbyxo0suoIxvPOddTgpDFJFAnMbgF39CRCdLLb5
         cSvX4RZSEAUOq+J3HzHx/XPtV+bGUNDnpZe0MyHKhSQkkEFZ1L4kcTBnKAs7F7YUQmSI
         7SHYAMAC9LgVoAh2afa0e2FEjv5C/oP+hYqcT9nxQEMxU2rq2PqEoQG/9LHTN8OfvNrI
         KS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770215004; x=1770819804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=epCayHlvCsfz7S+7gHZWH4Yw7IrAlRqKPfSc7t/2oH4=;
        b=j3AbAgJFJClLwDs5yoYsvP3VwJtZG1t87e5vorYmqJwYm7QLEKJYLy4gaN6aY+gZJr
         fj6Fu/4QYzZRgzTG4NZxsp8IigPXcwtg0ToO0JGUPzUtx/qJu8gOMhqAxqcPFSDiwiEt
         an4fIpcun6a0CVMxQf1pJN6LbH0qoDHtPKOuzcLs/nEIb3M387/VhtYvuXYMQVbnAJAI
         9SUrLU52G5otfE2Dnc/KXMree5O63ZwXQlu5x3PleDQpYaxlH8efh6NaLs+WDWyA/NjT
         c6AEA9Ap7xi+QHoYcueMWgy674IeqTdLLWgAUCzIZqdq1bdK+G8LBrxkwCRRN9FIIinA
         3FuA==
X-Forwarded-Encrypted: i=1; AJvYcCVyuoa8uHrABbtGOyBwLZCn3kIajHlweG5Wp1g5bSLcxzkvo0b+F3LvUX/wRdxMxpsY9B2xaBBjtbJyEEXc99kwtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgCDPkPhkcQuUFtN2KtYDD00HSURx/uvdQ2MWpU4aSCO6HksSz
	uszLHbR3cojzAAN1q3m0DXI198SLuSiyCzLAsjy7BMfCn2OIyPhbahjftZZt/fYm
X-Gm-Gg: AZuq6aIGvelXerbD1nJ2yxi5sQuPSc1avsNBh/4FLfAJuteW38UHIkXrB86bOmwD6+Y
	+y559Yg4HH+luyaM1kILpdKlMQ7GkWe2u+SmiKkop+ecDpWtv9tExdQwzBi3yRxITvmsLe1x5hw
	5LL2kq3Ei9Ni2q9DNjyle4STP7ksbfqohMhsfz4MuL5nY36cfiGaNjdD1+76WpfgE11YvkStP3C
	OXiKAW6E6a0v6+ZEH5NDfNMYcn7mKgI1/O7hf1omZLQ7VpAeJg5mVxaR61fQC4DKPLY9OikAzBz
	SpAdNGKbH0cIzntNeWSTF3NSh2g+l4cyKHuAdF9QsY+d6+LCL8v33gTaM7gQPahWWwIYHf/avwW
	pDpnar/UVsT2A+ZOdn80Ch1UcEh+j3aiUhsnIazgPJw8o1yMRq5XMPj4St1EA5wE8PmMjm0J1tn
	5I/xxYwBXX1m45e/9afvAjJIEOmPkfc+58DfU=
X-Received: by 2002:a17:907:26c3:b0:b8e:7e21:1344 with SMTP id a640c23a62f3a-b8e9f176d98mr186025866b.23.1770215004004;
        Wed, 04 Feb 2026 06:23:24 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:3c9f:a100:4d45:ebc7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea001ea7dsm129038366b.47.2026.02.04.06.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 06:23:23 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/8] irqchip/renesas-rzg2l: Make fwspec variable as pointer in struct rzg2l_irqc_priv
Date: Wed,  4 Feb 2026 14:23:10 +0000
Message-ID: <20260204142320.103184-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204142320.103184-1-biju.das.jz@bp.renesas.com>
References: <20260204142320.103184-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27885-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: A77EFE706A
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of IRQs in RZ/G2L and RZ/G3L SoC are different. The
RZ/G3L has 16 external IRQs where as RZ/G2L has only 8 external IRQ.
Dynamicaly allocate fwspec memory instead of static allocation to support
both SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index e73d426cea6d..20e2b1c4587b 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -79,7 +79,7 @@ struct rzg2l_irqc_reg_cache {
 static struct rzg2l_irqc_priv {
 	void __iomem			*base;
 	const struct irq_chip		*irqchip;
-	struct irq_fwspec		fwspec[IRQC_NUM_IRQ];
+	struct irq_fwspec		*fwspec;
 	raw_spinlock_t			lock;
 	struct rzg2l_irqc_reg_cache	cache;
 } *rzg2l_irqc_data;
@@ -554,6 +554,11 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 	if (IS_ERR(rzg2l_irqc_data->base))
 		return PTR_ERR(rzg2l_irqc_data->base);
 
+	rzg2l_irqc_data->fwspec = devm_kcalloc(&pdev->dev, IRQC_NUM_IRQ,
+					       sizeof(*rzg2l_irqc_data->fwspec), GFP_KERNEL);
+	if (!rzg2l_irqc_data->fwspec)
+		return -ENOMEM;
+
 	ret = rzg2l_irqc_parse_interrupts(rzg2l_irqc_data, node);
 	if (ret)
 		return dev_err_probe(dev, ret, "cannot parse interrupts: %d\n", ret);
-- 
2.43.0


