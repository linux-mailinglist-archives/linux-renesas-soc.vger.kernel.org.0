Return-Path: <linux-renesas-soc+bounces-30286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DzcHiQ3xGnkxQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:27:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6B432B3C1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:27:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 819BD306C665
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3EF3E5563;
	Wed, 25 Mar 2026 19:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NidWblDC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521FA3FF882
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 19:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466709; cv=none; b=p81LNRR1A5CqIfiVKwIEluYZQd98mGzfI5EBU1ZhiOC2uWbwY/yswTR4fE9ETioCZFMhPgpEYJBlro3WKtCrCFFRhjDmyqKjcZXJ49LysZxRt33FwO8d+UzvzZCQ0yQyn4c2VLGvCc19wxGHYYsxuXV29cR4X+LrRBVcyLl38sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466709; c=relaxed/simple;
	bh=kp0OUtMDIm4J2XfXqy8oWljBMliDGG7YLw75mPZHZPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ce4RhDA6M0QqHXvUZv0r0//c9iL1dfFFmv0Ihy1ro3mbb2cm1hjf9wVW9Oh9mb4qyzed4EzhaYRUtOdSSG0yfKk/hUorKzwFS0XZvcNvA1MlEjgb6JMKOM4A820TlAz30dfoxomFphGraN41ECepsKn/lWsVfx/TkobkbJUbV6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NidWblDC; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso2717825e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 12:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774466707; x=1775071507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKRZHMFJsGW8F13mOfxOgzeSlLI8hL8LwVyA8aXqqAU=;
        b=NidWblDC5EVSoESiN7Z6NmBVWx1qAg1nBCPiMuHMusKd5yxsE5exGmTZ63HKSwYKp4
         dh+SZzPvEhlgdta91HtqUofu+3fWhkIMYK7iewiKke6H/2+I7ZsaNkfXXLQpJsPr8fYm
         xOqf9ptKZmb9vI3KKWiwHYf9SS8aycuaPAU6bDx+oXNeVXyV/+hnG9x6zLH8cJQiLR+0
         xPZr9ghD/QEQdFAc4wRJuN7JRWbrMeKAXp6N2rH0M85VshXQu6CqEnL2lVBrciWJU3tT
         X6m+LkfjmcM/KcjQKG3JpokAJS+bNPbZOS59jtqxGtJynCCQQ+D5rhRGopDCjYVnVvQE
         IMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466707; x=1775071507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QKRZHMFJsGW8F13mOfxOgzeSlLI8hL8LwVyA8aXqqAU=;
        b=M8ltujwm8TsS+E4KRujWSEcQ9YPePSvylP56/pyQWF5/mLwn+LG43CdIYZZ2viC+SK
         jTmI0Pb0vs4IuRbqK3clVwYPD0l7asekC1vm999nfCS0vNd2cfNylgGHWxCEwkEk0Pcv
         D8unFUtSfFEoxE/iESABC06EpkRTW6KMK7CmVF1tO0HL+ulTDfd8WJGohxX14a75ypG7
         5WY7K39PSywnFAbQN6xVzKuc/R8BzcFdw4nTamMYGNk6jxGQz8XQjLCGKK5kglF2fH9a
         atm5jxTKHevLIGEkXxVfA5EqnxESIYrQbjImxLpfrTAMKmSqUKmxpFIwMalgxTnWBEwz
         cxBw==
X-Forwarded-Encrypted: i=1; AJvYcCUiCPkrr7XhE7IUFq3ngui/zpcGfmmy8fWCA6+ZQuX6MWuSJ4Hzmuh4oloZEsRUUEXt0HpazqU7To3hW2bmys2N5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLTncgo64bXf7FVg0DP46IQY6tI3N0hborbOih8RO3mG8fqFzU
	zj7jYFg5mVzqDVBwBOprneK4lKYvXIe4qUUCT6JTVc6BuUMYMJj7CotOE7mAHw==
X-Gm-Gg: ATEYQzzpOwQ5c7toX4Gqj2JMt2g3hA0vqWjn9tQRZ488QqEMAW4ZgzxrLo/nq6fY9wL
	/S9LQLpFvslIjn8IBP3V6onhTWrpp6fVTZc+BxLieZCOJ3a7AgKbica9ROJuFhZVolIA2VQjBz0
	6LY1NHQDiJ98KhveoAHon+yE8GmEPrWULypwO76/wDOBr5nT67lFMDz8PALgeN6wzLQZFgQr1Pz
	gJMoF23Ah+r+PDqbgzTWPV7N6LW63xMOgkH7sOQPaePHDYp85Djt1wnQ32ubtCpSvK80jXBbC2M
	5+bXx4k132cK4HwNz4HTQSQ5FYxp0E0H3mk26X5SRJ8YVOaXlOcRimWKrOo3rc6quSD3VZgSNk3
	G2MpkeGPrABrFjA/eMh07nXFZt7RIoA0jhxJ7w4NQHlQzRqTvTFfVKXk3EMPMok5GCwZhYJwnTA
	KK+5rWFBA7VtjWE+b7fOPQGQ9Mjq/Ixf+5WEtxxK6T46ajapEi
X-Received: by 2002:a05:600c:46c6:b0:485:40c6:f507 with SMTP id 5b1f17b1804b1-4871609d044mr77400085e9.30.1774466706367;
        Wed, 25 Mar 2026 12:25:06 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8138:17e4:88b1:468c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e533sm2464485f8f.2.2026.03.25.12.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:25:06 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 14/16] irqchip/renesas-rzg2l: Drop IRQC_IRQ_COUNT macro
Date: Wed, 25 Mar 2026 19:24:29 +0000
Message-ID: <20260325192451.172562-15-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325192451.172562-1-biju.das.jz@bp.renesas.com>
References: <20260325192451.172562-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30286-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 1C6B432B3C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of external interrupts in RZ/G2L and RZ/G3L SoC are
different. The RZ/G3L has 16 external interrupts whereas RZ/G2L has only 8
external interrupts. Add irq_count variable in struct rzg2l_hw_info to
handle these differences and drop the macro IRQC_IRQ_COUNT.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * No change
v5->v6:
 * No change
v4->v5:
 * Dropped hw_irq range check involving info.irq_count.
v3->v4:
 * Updated commit description IRQs->interrupts.
 * Updated variable type of irq_count from u8->unsigned int.
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/irqchip/irq-renesas-rzg2l.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index e5543aea86b4..171717a4805f 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -21,7 +21,6 @@
 #include <linux/syscore_ops.h>
 
 #define IRQC_IRQ_START			1
-#define IRQC_IRQ_COUNT			8
 #define IRQC_TINT_COUNT			32
 
 #define ISCR				0x10
@@ -68,10 +67,12 @@ struct rzg2l_irqc_reg_cache {
 
 /**
  * struct rzg2l_hw_info - Interrupt Control Unit controller hardware info structure.
+ * @irq_count:		Number of IRQC interrupts
  * @tint_start:		Start of TINT interrupts
  * @num_irq:		Total Number of interrupts
  */
 struct rzg2l_hw_info {
+	unsigned int	irq_count;
 	unsigned int	tint_start;
 	unsigned int	num_irq;
 };
@@ -575,7 +576,7 @@ static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
 	 * from 16-31 bits. TINT from the pinctrl driver needs to be programmed
 	 * in IRQC registers to enable a given gpio pin as interrupt.
 	 */
-	if (hwirq > IRQC_IRQ_COUNT) {
+	if (hwirq > priv->info.irq_count) {
 		tint = TINT_EXTRACT_GPIOINT(hwirq);
 		hwirq = TINT_EXTRACT_HWIRQ(hwirq);
 		chip = priv->tint_chip;
@@ -683,8 +684,9 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 }
 
 static const struct rzg2l_hw_info rzg2l_hw_params = {
-	.tint_start	= IRQC_IRQ_START + IRQC_IRQ_COUNT,
-	.num_irq	= IRQC_IRQ_START + IRQC_IRQ_COUNT + IRQC_TINT_COUNT,
+	.irq_count	= 8,
+	.tint_start	= IRQC_IRQ_START + 8,
+	.num_irq	= IRQC_IRQ_START + 8 + IRQC_TINT_COUNT,
 };
 
 static int rzg2l_irqc_probe(struct platform_device *pdev, struct device_node *parent)
-- 
2.43.0


