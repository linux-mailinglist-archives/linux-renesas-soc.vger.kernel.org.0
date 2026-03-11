Return-Path: <linux-renesas-soc+bounces-29252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNkoF8zCsWmdFAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:30:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B549626956C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F2C132667AD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 19:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BDD43B585C;
	Wed, 11 Mar 2026 19:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlfdp3pE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86F83358DA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 19:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257114; cv=none; b=pmPE9raSZvr4qEJxG/PJHGFASukq8sV3Bgz1yERIxRuDjkS3lyMlejvWcm+t2dr3JItEpboUmDVFnONiA6Ca8BTcXP5pHmpQsksB85q+Ie+/WNn4AuCtCESuzPmXlD9pNfWqOT3oy44zvgxri77JI5qsW+d6SMXdkXhRhwetOeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257114; c=relaxed/simple;
	bh=Fhsau7JTqbO3n6x7+8vynLgBN08mY0xs+GZd/BjCFkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KCe6uAn+BNyUwCZpBrtX/4yv5ylrFcIKe4OqHq0ErBbepddvOmObPtcAcO4UPRufl0dNjxdsj4mVkyvM39fd/q7qvEAvCe3hIElrTZeUtzIS5qwcTpzZP9yymzRGk6OCNZ3TwNP42bUJ+PHeMY8fxzjqbRxWQG9wRmQlFO9zo+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlfdp3pE; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439baf33150so242966f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 12:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773257110; x=1773861910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlpSI76A369aA+ZfuH3lHOVJCrpdR+zN9mPweZq9KC4=;
        b=nlfdp3pEBnswfZHrfHH34E12BeFKaIsYNsqFY5oNaJlK0H9HUOHZCs1CwXkrb+Vj8s
         igqRb5wv3iz+SOGWWlo4LCJHJYgmoGaU9uag3HyK23mxFhe3Bb5BpvA+aZyNGk79fvu8
         g7uWBK90g/4bIn2LN1hrzeB501Wjnc8M0OyfWe0jIasE6Cd3lKAKqf/7RdCJlpIZ3eEU
         99kq/NCplGkzeBj3fS0q6G2WE+bTLwj2n08rA4C8th6G7juElQFLG3XK3c1E4aj6bZaW
         T3qdN6u47XugvT87SfCF1TWfjqxJPP9hYvNCE0ms/OrTH1LGOgBE+tYBBF//MdFGoSLr
         VgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257110; x=1773861910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JlpSI76A369aA+ZfuH3lHOVJCrpdR+zN9mPweZq9KC4=;
        b=o8QZLGvRZqNqMggcas1jrMjjVX/OexhQZxBZlTmhj78peHgAENb4e7tybVaY/z3wG/
         HiT0XaboVHXFteyZVm2M6MoFM+/3i9jR32fCPAdf9NN1W+RCgHLMcUzNtiH8gtfFPbd/
         IWryvYxiFaMuavh4C3og4A+aAWrMspngwO1UsZ+yJ7kPxVEZCJ35j9g2mt42OSkFte3P
         Jwak6riyGN/3cxmOgicYwtUyMqGdOB9Bk59xq6I6qLuYpO8Um4nU4TpEC1DMCBe4sGW+
         mGtcoUymEQKjw4IxHcyN0zDwj6Vi4m1SYGAK6+zY3KTtUZ+Y45aSudxshTtmmpvtyUDf
         Pwrw==
X-Forwarded-Encrypted: i=1; AJvYcCWjyoQkC5GUYdrfNY9js0zdKLwaS9HmL33FlVmw/cw2EpegukO3MKn77h6smFAUdpNWYNNUdU3NdW5HziSQi8AnSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YySif8MJbz5/H50K9xcpVu0TkGzjDilnU7Jic8Zb0z3C6RRPoKm
	gUFVFUBJe8qNPCaOm1LcwGzst6SLGGrLBEC+dLYe/FmxirO3kLc5zXN4
X-Gm-Gg: ATEYQzycR/Db2P8XRWrkctkicqnKgCSv15Gp6bqQ/N4ymIp6TRO4xFOs1cLCl7FRIES
	vMK/4VsxU+ZmnTviUNvoBSJlm8r+8u7Dx51kSOuLfM0io1EO+bIs2IXBPYFxKsMNoHeETcd8B8H
	7uhoKNezHvz986EHphxHRieDyihH5mWLPGfAjHu9GODN0/02jE077+sSMqOpcrNXm6QF1hztD2W
	HnjJKIR+IfWJ0EypmcY5NzUuJ49hvEr1u/rH+gPUE2/WfaGP+2ycs1djhqfouap+QB+g6tFxYeZ
	NUa1SmMA3o5oW0Ij7xbA8Y8LYV7MTkR3Wbayrvdhn0lCt7OGajNbC8Zrg/+08QUZWawpbtuGFui
	WBcKv2ucff/wqpK/G/rVtptAdTSBIQ9khtTAX5fqJ1z5gY2kPkJqLrqbtXpkCQ83XZ2NYDwznEq
	KG1RuoUcm8Cs8br96wHCxX/mygQH3P4xkpiM9vgdZnY3TOjcMD
X-Received: by 2002:a05:6000:24c2:b0:439:c9d0:5fd5 with SMTP id ffacd0b85a97d-439fdf8a978mr1657054f8f.1.1773257110094;
        Wed, 11 Mar 2026 12:25:10 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:38b7:8ca3:cb55:d344])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bd9csm1323210f8f.21.2026.03.11.12.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:25:09 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 10/15] irqchip/renesas-rzg2l: Dynamically allocate fwspec array
Date: Wed, 11 Mar 2026 19:24:41 +0000
Message-ID: <20260311192459.609064-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
References: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29252-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: B549626956C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of interrupts in RZ/G2L and RZ/G3L SoC are different. The
RZ/G3L has 16 external interrupts whereas RZ/G2L has only 8 external
interrupts. Dynamically allocate fwspec memory instead of static
allocation to support both SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Updated commit header
 * Replaced IRQs->interrupts in commit description
 * Fixed the typo Dynamicaly->Dynamically
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/irqchip/irq-renesas-rzg2l.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index fd017c73dfc5..cd850c7dc6f3 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -81,7 +81,7 @@ static struct rzg2l_irqc_priv {
 	void __iomem			*base;
 	const struct irq_chip		*irq_chip;
 	const struct irq_chip		*tint_chip;
-	struct irq_fwspec		fwspec[IRQC_NUM_IRQ];
+	struct irq_fwspec		*fwspec;
 	raw_spinlock_t			lock;
 	struct rzg2l_irqc_reg_cache	cache;
 } *rzg2l_irqc_data;
@@ -636,6 +636,11 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
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


