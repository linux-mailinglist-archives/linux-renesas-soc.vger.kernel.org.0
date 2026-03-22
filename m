Return-Path: <linux-renesas-soc+bounces-30072-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EV7GP3fv2ml9wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30072-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:26:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5722E92E9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 04B1130131FE
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 12:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45274382F1C;
	Sun, 22 Mar 2026 12:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2gobF60"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB8D3815F9
	for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 12:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774182280; cv=none; b=M1THT8ky+86a4xM3OqF3dhkbdSbJCQ22ObrYGfS3ofnLgvAHduMojryCfxyE2laJuRQYx3QUUt334kYNkpA8lJ7GbI73BMgYDb2aKR2VSVDKElWKH7KEJLPaySX4vRLvK0np1UcddQvxrH+2Vmvx1JKE4eH7/7sZvAD49ql8jP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774182280; c=relaxed/simple;
	bh=S+4BPxJU5Kk+nIfPsnBIoHPjbABp6TSzLPC/76S+g9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gb7FXpJGszh4IhqZcl0hRfPTKOgdYlkq1pLgtK0X2j2VSqg7vk01LW5HIQzKm9PqzXGeEzcLSMkYpzgHwMWrN6XLTxkTnsSMn1XGLhYzWezh6upEMCGd34lDjeAzPqxg6bTFm2r0th7RScg8toBQN1GiJ1/8/N5Jkm1iDrnx2/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2gobF60; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43b44c0bcdbso3417852f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 05:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774182276; x=1774787076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KrJ4mSuL5E0IZGdIKCuZQd5Am0OCty4uBI8sBwOehI8=;
        b=Y2gobF604o2iiceFqniMDK7OFA2dxzM792R6+tzDkpozQb+fBPJLiD1WT0ro8DC33h
         4CY86R1bDSjvXyC9AbA8LnGMFBnXRNU7RTwveuUuRpreXe1ieITq+t2wuVCaPOao+KrW
         MXmefGK/w+RZ+LuaR1Jq//+KT12w1qLBHxttYyUN5EaHZMKJgKT1Zz5kxB5TeuyYiteu
         5Vp4e1UgKD/Xr81pKIj65/4YCb3kUZtl5Q6erEBqJGs6xbXaWpVhyfh02HOmHf+K2FV8
         HKfSKAqIpptG3AVB7jpak+Dgj1iDqm0JkFWX8MUGuufVuGq3G6JmEg0rWtc5xei36JQL
         AHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774182276; x=1774787076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KrJ4mSuL5E0IZGdIKCuZQd5Am0OCty4uBI8sBwOehI8=;
        b=CGKUUuCEvwMbBF02rkGcLvF4dX04cWvcSFVvk0XtHXdcVn1lVxlPMxa8z8vVFVicMU
         ZctuBoovdxVxkgZWq234M2o+MjcHO3SkqjOxmSyK/P7+yHWXGB6C3Q3ojFFoJpeFrYJy
         QXpxN6xyJx1bEq/Y7hl9ABNRYm38E2MXNKuCCbjDAu1JZvQZr1JpfX4xQi4xn3PYq2+f
         sSllsUWUyzGGlgdCmzQeRwIKS/uHpr/OPTiosR7V4g1YQHXwV7pznXI11CGm8KO1CG4T
         l4uR8AbaovkaPsWd29rdi7dtgbzk6Z4mCkMJP6lJSmEsAIaAGZk9FpFwupYhOtOWugbZ
         q6Nw==
X-Forwarded-Encrypted: i=1; AJvYcCX9mx/yI8ilNH1Pj0eyk+Ot0kKRukQ1hYW6ku2ovSmEw/GEiYZ5wKlpJIzE5oZdOCrUfQ2UKuo19FiDuazeW5HWTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWrbeyPMryeTigfXyc4Y1i5QYEH+zMGpmecBWGPvWCu7KNuUzK
	4VdKkXzltEOu0xe/JgqHeTo+MZgmECt1t2f+5scShmJ+va3kHj0AO/qC
X-Gm-Gg: ATEYQzyQakU7Gl48vWmRbuuP8WboHsINAl6sbYtKvq2zZHEdWPG7RVCQOTwi7rMnwlA
	98IEHAA9RMRBbxhJydk6DRQH72DeMpm5YNxmfIN9eosPEfkKCCcwBiST6rhwBZxR1Cv/WJ+v3dK
	fZsljUzp3+AsmkYHHh+cDQ7k6QWmQSNMT3KfnQs9uYGM5V5jtZkjbxTLiYuobfvvb+S4ApR1VXy
	ChAhdHvAcQ5lFFehcbRIPgj32IUhebKDFXtMDz188zmj9An3Z0838Ng1EH0v9SiuGOVGrpSXE9Q
	4cHTo+7Lr7Y6lXJYfMhjD4e6n2ADIf9j92t78tZEMcfHb5HzfLgc+GiLUTyMFpO8Fg/oTdOvYRU
	ZYFA5KT3/omf05VuyGPFHxpyFU5bQ4vlbbo63LjwmuS9wJ0rGGWNc524eJY+9WvsB79aH2rCFnp
	PTWav+AWKrqAPhjgy02LMTSmkzcAwEzHPBy1Y1zDhBDKQWJbbg
X-Received: by 2002:a05:6000:2010:b0:43b:5022:804 with SMTP id ffacd0b85a97d-43b64262ff5mr13488541f8f.29.1774182275561;
        Sun, 22 Mar 2026 05:24:35 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1bdc:7f84:18bc:1e56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703343sm21072695f8f.19.2026.03.22.05.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 05:24:35 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 13/15] irqchip/renesas-rzg2l: Drop IRQC_IRQ_COUNT macro
Date: Sun, 22 Mar 2026 12:23:56 +0000
Message-ID: <20260322122421.132474-14-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322122421.132474-1-biju.das.jz@bp.renesas.com>
References: <20260322122421.132474-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30072-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 5C5722E92E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of external interrupts in RZ/G2L and RZ/G3L SoC are
different. The RZ/G3L has 16 external interrupts whereas RZ/G2L has only 8
external interrupts. Add irq_count variable in struct rzg2l_hw_info to
handle these differences and drop the macro IRQC_IRQ_COUNT.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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
index 922d9dfeddcd..8aff8b9d49c9 100644
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


