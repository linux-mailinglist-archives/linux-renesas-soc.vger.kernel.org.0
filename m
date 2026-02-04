Return-Path: <linux-renesas-soc+bounces-27913-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKF0MY6Mg2lWpAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27913-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 19:14:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBC3EB80D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 19:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45CDB30619B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 18:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0BD843C05D;
	Wed,  4 Feb 2026 18:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/MX2tge"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6125143C052
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 18:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770228398; cv=none; b=AqAwqjEu0kPX5dZkDX256RqeW7sZNacNbXICkJ5Fl9YpYt4MyPAFIa/Y2szOeQLeFk2V9pqxTrgkjTQHZ13O7dwkP83JQBPON+caf/yRSynh46LSF84nbo+ZBplR63lMu86UsS7o4hpyNx1VZq9NmejFPQI/HKklSCTNJwEqsM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770228398; c=relaxed/simple;
	bh=RZsRRRI12m0n+ZiH68KhLTNm8HB+lQV8PiDlcecoEtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PAbd9d61pa+Q2EpgSK63tr4Yn9xfXlWX0EyHzJlSKWUV4JVI/ChA8rMgGFfrL0VZ0Xy3R1WHuuw5mzwbkG1CLjHusPyH25+tsdpRH4E8oVoYGAZI+xViCwPEA/0lOmLetf74G5JlNIIcfmnlrHfw8Nrrvd79Mo4tX8jVXFMpY3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/MX2tge; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8ea3d15580so6416866b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 10:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770228397; x=1770833197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6/TMNgZtCLtmsMEKI62ghyVfgfskVPeqvtedY25OWo=;
        b=F/MX2tgecNHMudQRWcld9doG0iSQ8iLNjfolcZyi7mD2vXP2rqLKfVlHdfrDrdQHJs
         FrZHEGlS0WmMbtOHaj+ZbM/EbV59M2l2ZRR20ERf8h0fli96bOMUCxhfX72dmYLsTTBS
         wtInECp+P4wNu/Dq7IMIDD3n9uGdFX939Fp4L7rGas9hwrdLP56BeJvHx4gZcZBXN4pv
         bcM8LlKGxvpR9Wm8TwhvvP54fGqh8GtgWr01vk5yfOhUBWBMk1/JRk3PPWScynwhDBZs
         5KUmBVax3VEcpmqQmDe1YOMTPhqo2Tq1YoKVKzsjTfcM9PO35LgpnjCWYUxZS7JfcU4P
         Mzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770228397; x=1770833197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R6/TMNgZtCLtmsMEKI62ghyVfgfskVPeqvtedY25OWo=;
        b=T1Jlydy6f1ykAzjzbv5020ByBXM2AcCuwy9Y7bGohAf2E/SA2BGnwitJpnzgOwPiB0
         9/DLcq73wpX5/8QVAn2AmhYjkrQ+R5rHFpVN1eQiGOlbg0vyfNjk/TwEdiewMfefiixV
         XQ3LAylPZIdu87KppPUDDkDNAMgbuaVX/mEUR1DPkUUdpKykRvZ2nvF+w1dAPooMaocO
         68LNvO2eHAyylAklF0oIAC73Qt46ERvkvtlmN5B0nUssCQAIPhQNPwSZQonp5Ghll80O
         TfPhY0Ej4paavmidvfrPU3HpZ23iHtH+7452dHIpZ7IFCnJ30kOYHgNUFahlNB2DfnyA
         l4jA==
X-Forwarded-Encrypted: i=1; AJvYcCXWgr5g/YBEn6EkLmbfr3Br+EZYCidqp8oRRK67WewYMqTmi836HT+y7f0A0sHPcmjXxwi1vE6lk6ghS5U0/+fVEw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0pyOJda0Y6LPZyPEG0bT4DBTEALlU8TGG6sks1v6oafqXnRKh
	IMA09TzB0qHdw8YUyLmZx1xNdlCM5A9+nzWGDz84sg/o1Q/1bZc03yDl
X-Gm-Gg: AZuq6aIjlmwJje/0nQL/y8kxnrKmhlqbaUOVm/O1ZGN9WQMqL5C18j0cW1YsT7FQPhz
	IgrF4KcmaYO7skND/4ltmakqEHhzhXtxsqvsxGKuafjxO0hlruHoFvkUSzBvKCTgaS3yJkmNyxD
	tjJwLCHowahusUNIJg5Yp89OSK6mB2F8+7o1NGZW9rt8AEibYB6CJa7ndQiInEaIlQU2tqGeVtp
	vWPtBfVFy8wqXqUnMke0ohIB1jECYn+08Qlvaj6iG6N8x3ia3xSnPZ9tD6TnxpgfwNdZosJZZyD
	dM545yjNkSIuV6FOZFJCy6tySnhtp1MHC1HhTgbg+/ILUyxrXGk0Sm2dg5/otSU2F1IY18n/tTB
	cW5rAIHgzMwnMWzmwOF/C2iOvknsc0fogsZB/yV9xHszUWq3JMXmcSawl2Ag1lrP4CjIqVM8f78
	dc/+tmtNmevhcUemDdQd1s3x6StlTIY147uzM=
X-Received: by 2002:a17:907:7b9a:b0:b8d:bf4d:7464 with SMTP id a640c23a62f3a-b8e9f1757b9mr290694266b.39.1770228396538;
        Wed, 04 Feb 2026 10:06:36 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:3c9f:a100:4d45:ebc7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea0057dd1sm149677666b.65.2026.02.04.10.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 10:06:36 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/9] irqchip/renesas-rzg2l: Make fwspec variable as pointer in struct rzg2l_irqc_priv
Date: Wed,  4 Feb 2026 18:06:19 +0000
Message-ID: <20260204180632.249139-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204180632.249139-1-biju.das.jz@bp.renesas.com>
References: <20260204180632.249139-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27913-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 2CBC3EB80D
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of IRQs in RZ/G2L and RZ/G3L SoC are different. The
RZ/G3L has 16 external IRQs where as RZ/G2L has only 8 external IRQ.
Dynamicaly allocate fwspec memory instead of static allocation to support
both SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
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


