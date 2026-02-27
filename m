Return-Path: <linux-renesas-soc+bounces-28532-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD+NE7yooWm1vQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28532-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:22:52 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FAE1B8CDB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:22:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37EDC31B6BBC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 14:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E370D43636C;
	Fri, 27 Feb 2026 14:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FadsBg+6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB86436353
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 14:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772201005; cv=none; b=Qq2+najp5uzzG93CqzTjUBEjlg6eD2iBvhMyFY6eRHtNwA6pdUcBrKkJcrPOJ/qaxodHg6bjhPnevauSxd/IrDeOdTVjYKGySMlSO70zBYRNVyfOxbXvquvXbBuh/e7o+iZYtsFLQb3XVqxPIyJJgd0lrVHDTSGIEke6IhBBPTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772201005; c=relaxed/simple;
	bh=kLeeIwZXTuFQwtGnRJO66Ia78cNfNKwFGZTAghybjU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lkUER6+6+7MTrU8Yxw+Rw4NwWOUC9y5MkNeLAvydTlv/EEtiVjTrw+IYjgrSmBVbwETNT7cI/C5y6eEnVsc2yBJrlfCqhGBQgLNLpRxQjCPCPn4kYLZPGg/My7h+zskQUv6TNgTwvs762u0edCDSOs1+yt9msBRIUJ1NukSvJPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FadsBg+6; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43994aa265eso1238748f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 06:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772201002; x=1772805802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sM4T+t8m45keIBSgHiKAJa/srl0mBmQUoM29VE9GTM0=;
        b=FadsBg+6bVXxxUXLHscyYjln+jkfT4fMO22JWFTpCufZSdukSQ5rIdjuKjUNfQ0Htf
         zO9jJnzQP/hafPx0n4oK22D70OE/ixnG2CKeDm2/GHolnJjU+U7oWQpCHDncJ32BdDqi
         VjEXLfI81OyfaJaRG9+YdsF2fCHSWmRusbCD/LzeK0IQ9BN5weUuQPRQNbSYJHiDBgPL
         2MC1zGA4ZFsqWRKplYAXRnJXrcwhdvhFYtnn1bdCahXSDMn20I2kjeadV1CL6iRf/8Dz
         mnDtOT4KxF4/SX/eFYgfqjllwi6uTXn9wFaGDdUyh03DLZEUuuQeWh+ARLoHmdCNTZ/M
         /vbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772201002; x=1772805802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sM4T+t8m45keIBSgHiKAJa/srl0mBmQUoM29VE9GTM0=;
        b=r2qQp8/UlE1W9rt1+X7ZkZZ2I+/BgS4s5GotIix0sMyNo+t6/wbL9Gr0EQJZuxU3gR
         rta5sWbmZHnjr7EZ0hAtZhjdbrWK8aOfeWBqCH6Zcy8AuBYL+ngG1E43kG0P92787tvg
         HewJO/791oTWuf5NZDe+WB2WMjyc2fP1weAJwwlWw73EMoBYgjMe1TW8sDJc5QasnNuq
         BU3mOnvYKz63R5xY3Fw0ftdNb73ErpYhpw8Je6H8TJyW+lxLVkx1e4S9qElId9ytH16I
         d4qJIodcsyVlYb5jFoIIjphmTOwjuEaRnOLxOuhlIo3MOIEGPN1GdB+w2ykg+IN55z8O
         fIkA==
X-Forwarded-Encrypted: i=1; AJvYcCW/19T0RAVsk2OwD88Udk9vGsSyUZ6CNex8zuMMrfBkWhvo0ZpK+0W8sYtZ1Q6xCyEMkDUyI/poK73puRtKt2eSOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgBUjgIf6lgVjAjCHHdOwnkrO2r+RMnIuW/EAotg9Vrg6/uRsu
	TDdOi4lB54h97FM0xAOSo8sftKWWMhmyo3vsr/6m1XIcDIGFp3+dorH6
X-Gm-Gg: ATEYQzwkt6LL+E7SffSvMYBUOer35j0F8fuQfTMG3KcWFP+hY7ZCzRao51qT1dSqIEA
	ETQbwtYongr2cYmXfLulqGvvwuxMeavElv0SkWltww6tW/DC6shwAGGTI+EPlFnQyESwpfyRFD5
	yK132Hg9S078d3LTywlNTFECQZBpbo5rxyeB+tpyRzr9EdUHQVqZ71BewQucLseFVK5X4JE856n
	7VeGTZVTCU2c9YbH2zNdtIoOn38G4DKNdGjZ15p1A0SjTjKicHC5WVVgXo3EGoXKewTyXsXBiHG
	zkdKDKghjoyljRQVbccxity4hs+fpBVqQVzdj5qXH2WlNkyZV9jZeKvQDyNxIEpdOcJfn59MnzB
	etcsBDW5MyWCjgqb9clUtsbWniegbQsYil8WzlOPXm9iQgz+R/FpLshjirPBTSnhCyM9d8033bo
	m21wPImvzu/5AzkoViQiDYGe6kNZagrkQ=
X-Received: by 2002:a5d:5f54:0:b0:439:8a14:ba2c with SMTP id ffacd0b85a97d-4399de20554mr4797809f8f.35.1772201002341;
        Fri, 27 Feb 2026 06:03:22 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:4d8b:fefb:26cf:1906])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60feeesm7658811f8f.1.2026.02.27.06.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:03:21 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 3/9] irqchip/renesas-rzg2l: Dynamically allocate fwspec array
Date: Fri, 27 Feb 2026 14:03:03 +0000
Message-ID: <20260227140316.308106-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227140316.308106-1-biju.das.jz@bp.renesas.com>
References: <20260227140316.308106-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28532-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: A2FAE1B8CDB
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of interrupts in RZ/G2L and RZ/G3L SoC are different. The
RZ/G3L has 16 external interrupts whereas RZ/G2L has only 8 external
interrupts. Dynamically allocate fwspec memory instead of static
allocation to support both SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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


