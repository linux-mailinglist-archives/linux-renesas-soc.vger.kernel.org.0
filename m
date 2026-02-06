Return-Path: <linux-renesas-soc+bounces-27985-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9mW3BYPOhWlBGwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27985-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:20:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9498DFD245
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:20:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E781304AD98
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 11:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628513A0B32;
	Fri,  6 Feb 2026 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ord80ujy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3893A0B0C
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Feb 2026 11:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770376624; cv=none; b=RY5ZiaRT1Qkg8f161ESNrPSzM30bcxvE9w1ya0isF2k2Sg5lQ3tH51tK0RqtlL8RxXY7IJJOedmpbDOCN185F0eSdK164Wiw2Vrshh70vPufdqvCLv5bMTrLYWLUmy9ZHbH2JrDE7t+HqaPsnZHF9GhOQZfPkkDC4sD9JCFZF+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770376624; c=relaxed/simple;
	bh=Hbg3emuCT1am9B/27fxHBDXfsVOms2s0E6GBR0y519g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qqyXnFOAX84g26awv2mlBtENus/H5Jls6NMsLXaZ/pRQw+H0A1R0lNDLnLY5eVRofG215rmnR28mRQ8k28w0sXXfAtaa75HUPccksRoamwpZNeN5IVzS2rWMr7W4dy1VCrTcDIvF72oB6yW06X85+rFMbbRJt83eErL1h1FV5Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ord80ujy; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4362d4050c1so301822f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Feb 2026 03:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770376622; x=1770981422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9J1iVCwTS7iX2pXRRIO5Px5zYQH04DMA0QCRC7iMC5A=;
        b=Ord80ujym7lLzDywtwiUip3on4aExg8wVEHQ7LsysNwdQxWAdeO+bhdk6l6odhvXC0
         SXm4ZKTXtkgZWCaHOGB4GVdVdeadx3Y76jrEaHzOMey3MZIp1hiaGfchpLYhCY71a89t
         TSaP5ComZyTFQyjeRweUSihEgnRe50Kr+mXVpOYSkS+7ANZI3jHt0i5WnXORrPDjmffD
         8U24tk9yNUfwtCPiNleRlklDaW6RLrk2AlMtZ74NfZNoftgUci0X8wGVgl16euxZd0iS
         zU39OwcxRS8R9qB6gw4JjCsF2k6YLcnNMH4lSRNe866qk4aPeZENskRXJOkxHaa6SMh4
         z2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770376622; x=1770981422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9J1iVCwTS7iX2pXRRIO5Px5zYQH04DMA0QCRC7iMC5A=;
        b=elet6DnpgiFhiytROY714Wm83veY/TbjSNFBG06CxTJKBS8JL0TYTs3vQIiA8RlMpC
         jJtXzxIxCxbI3lcajNhKQvuIB+5ajPQ4dkeLHYy86XfCPgNfM/g+M6zZbmmLY1hYKpug
         Q98N7qlr+K724NuF11S22HnPQnZV1zRfxuzuY0Nvr101Mftd2cUTD55NCnHaFjWd6gLu
         lAuPMumj5fCKiK4f4IjXuZa0LKpeOesmE0jOzynSPRvGYFj2LOB6TXU+1VXprq7BrklB
         7Qoa6ZJvdqFmR0NKAzoHp5favPGlk4sHSwFkPtrV0yZ52ioEJ5orJ2d1rjbxDdIeOsIK
         +rkA==
X-Forwarded-Encrypted: i=1; AJvYcCX1UYuY/tAeJoAc+mNF+sT4IuS096eIbnZUupMw82ahCCKecRb5e5PPkkoRHQeWNfaSzb+7z8F4aSKm96hp5Rihrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsFHfnYUHT7Bg8XcRn4cVWGM8cc/KsFaOsbPNmhaoM+ORl5hho
	F4/kAlOwVM4MwCB2u6APMI/UYKJT+3ncGQC0UwTHNzb7asBsTPpgJdqS
X-Gm-Gg: AZuq6aIWym651QmtoBaQvxFmsc2zDORU2IDJIB+7SNuQkWQRC3mod7yF6gdgRWyaUAe
	xPUR0j2yZU3b+AjVQyQGcZ2yX/+qUlbBg6BkBpvOmCDfod3Ancq6txuP/5YrRvy2TND9bhgEhjp
	GuhfsThq2nEpX9yu68pxZCa2FsIpVfMMVCSJRXpRklQGwPnQakfO52IP7gH9GMD3kDtyO5xmTz7
	YBNoGZSRQcbXnLx0Z2P3QM/fhtdwJB3Z5udD6ACEjosvwUqypjX0tHYkVVtGnb0Kjsd28BzoYqK
	Er3X8taOE2fLN1v17iN3NjLzRP/K0LyerJJ1bMnWVwr4/SPjnwCbA1gGvlPFUjptE1pnLgX31qO
	uklSol32Nru2DISZWib2D0qtOyEwbQP7lcARS6PNPbg64hpEwviD71Rsf301iZzUmEiJeQw34Nz
	kNNfY8bdg4aOOrqAf7Ew==
X-Received: by 2002:a05:6000:25c7:b0:431:5ac:1fc with SMTP id ffacd0b85a97d-43629341bb4mr3445076f8f.14.1770376622281;
        Fri, 06 Feb 2026 03:17:02 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:1e64:f8d5:9d7a:19d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fa4csm4746380f8f.26.2026.02.06.03.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 03:17:02 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 3/9] irqchip/renesas-rzg2l: Make fwspec variable as pointer in struct rzg2l_irqc_priv
Date: Fri,  6 Feb 2026 11:16:46 +0000
Message-ID: <20260206111658.231934-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206111658.231934-1-biju.das.jz@bp.renesas.com>
References: <20260206111658.231934-1-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-27985-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9498DFD245
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of IRQs in RZ/G2L and RZ/G3L SoC are different. The
RZ/G3L has 16 external IRQs where as RZ/G2L has only 8 external IRQ.
Dynamicaly allocate fwspec memory instead of static allocation to support
both SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change
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


