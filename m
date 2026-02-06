Return-Path: <linux-renesas-soc+bounces-27990-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLbJA8HNhWn0GgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27990-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:17:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B35FD196
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:17:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C2B01300B1A9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 11:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C4C3A4F3F;
	Fri,  6 Feb 2026 11:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHVKtopZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBE339E6F6
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Feb 2026 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770376627; cv=none; b=I0eJ9E8eIX94XLWYW8FHN4e638Mj1srZp69xHxTKR//hg2HGSauvBJcNhHxcu+SqyU5oAgGsuWhTwouX80ag+3nIUHpyQXoXPgRgdi1t9JU5mggmRJSYZtXlSmuS4miOHZ1KhjxpEPT7mWnxr992e9NSjR+qmxYdT/TFQitHVhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770376627; c=relaxed/simple;
	bh=6EPlJdo2gZRs8EUreDsfLms5hWGVCHL4BYg3hBgBLvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N9ZQF9gPkH50JE55EMOkGBLi1ED1MZd9MYSnllfQTURWRrY6Zyc7cSw9GO+heWhEYbVew+TIGuUwo3TRpXkgrPpRJyiGFSMM07GsVreOXcJB95QXYVXTZrG/fomzhzVDia992nmM0O46nKwIFcNz2I9tuOlBi6K1gMepthH8Uj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHVKtopZ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-435a11957f6so1568435f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Feb 2026 03:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770376625; x=1770981425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aj0KFAWYI0f2ECDUwq96InOmBNkVC0SFMlpUZPJRFIU=;
        b=BHVKtopZSXcM/3EPyARktKYRCOaiJ7zhaWQ5Q0W9t8ifLyZIeaRY/j9TMIGrozfygD
         LQhlYclO5K3AEMr2mjYnDpaNClOuDYM+2I4LBIU0c2MIdxS6MJAvejuXnkzPHmDxiSin
         pYhCXxt/TFVvIeYmWF/YhnW5mMlD/NnpNG//Lf824zoEr2ngrwXYy/E9w/OjgIK0zn9v
         S7jpwxpqbWkCkG2xvniapQIQVZDI6u1aVaypt5lHeVO9xgt+q/T4vhKg2zb+xE5BvNuL
         12if6PbHd3R2GwEY75tUU+0u+zuiWheBKOwgTUEBpN4G3Ca5UIfCS3nCmmugDn9PUCnk
         8FPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770376625; x=1770981425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Aj0KFAWYI0f2ECDUwq96InOmBNkVC0SFMlpUZPJRFIU=;
        b=VwN9PQOXKnyujqBLgYcVF78y7ZTTXWYcunjNjgymhd/5aNSQNhs1oZJi8iwCN7XUvL
         9aRdvPjZYrJV8acwj4VkzkvbXSjfpUwlaHvgUi0eOTAJPkqgOeRRIrFlrhKFHidkcy/z
         9Hwm192rDjO/WoZW5ZLJA0w9NhM9m6bKH07yIFnqE5JiHJTEP+GqnOAj2RjOeYpCgdLJ
         qrv7fbLrk4yJthOqdwDYSmwa81GTdZMjfHCJNq0DqlSA6CM7zLyOP8S6ROPubwS4/jFS
         Bn5+gF/756a4OpJXqTwdwUnG+fiPuQKMkElnTJELUAdziqhBBIKMzh/buCxCcn1DU7Rz
         W1eA==
X-Forwarded-Encrypted: i=1; AJvYcCVVM0LxLQR08Aoeo+hC3zNYlhYS3UrK8oQA7bVhtyMyvixRGpPs6WHFl7Ftbv42t6hnv8+Ev5voJ2vYrkNiwoxBaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxF0Al1YYz023lP1THqERapbLZJe5YlE1Gwaw/kaBAdqNkghzg2
	ldB3cvDrWesnqbGqcaSRDBAOQa0KgqUCPL0fhRC2tvC6IReNW3jiopxazNo7UVud
X-Gm-Gg: AZuq6aK/Wog6FHPYXgB6Q8NQZLlH4D85VdZrNjdxG8sC5to4gfYv/lFz+p6lf8KQE9a
	8fdn48dZ4eORaTpQ2rZTEKZC/klNs/D4GeY22UzHwlpMCzMMwreGzHLvNyInnlQ8rjsbKqJENZY
	QtCTM61pPvyiDOdZXx3PLEC2RddDaQ0x8NXAjqWTSpVkMDqPVcJTW9NFTPN4nUtnG5WT16M9NnQ
	1eFa6Ex5IXhZl8zbBhb4ciEbldVMMx66qS4HwfUF3qMDOU/7Kkoriiw25G367yewNTQHqkgUzj2
	3P8K6dqZaiB28nXKl9NGWayOU6DwwPZihaKCTtIBtOGPo74Zs/gKaqTZhjLyfSwytW+iEifVStk
	uvmRX0caeaLqWFJMu4TZxMWEKZuzwcTobfS65kTKKkJS4vpHDUWpl1tOLWHA7+0BuCq7a0iRqq6
	Ke1Zj98ptieQDJk4eBvQ==
X-Received: by 2002:a05:6000:2285:b0:427:526:16aa with SMTP id ffacd0b85a97d-436293b6ae1mr3468731f8f.58.1770376625282;
        Fri, 06 Feb 2026 03:17:05 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:1e64:f8d5:9d7a:19d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fa4csm4746380f8f.26.2026.02.06.03.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 03:17:05 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 8/9] irqchip/renesas-rzg2l: Add shared irq support
Date: Fri,  6 Feb 2026 11:16:51 +0000
Message-ID: <20260206111658.231934-9-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27990-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A0B35FD196
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of External IRQs in RZ/G2L and RZ/G3L SoC are different.
The RZ/G3L has 16 external IRQs out of which it shares 8 IRQs with TINT,
where as RZ/G2L has only 8 external IRQ. Add shared_irq variable in
struct rzg2l_hw_info to handle this differences by adding the callback
irq_{request,release}_resources().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/irqchip/irq-renesas-rzg2l.c | 94 +++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 06c439c98ff5..59108e1d53ec 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -29,6 +29,8 @@
 #define TITSR(n)			(0x24 + (n) * 4)
 #define TITSR0_MAX_INT			16
 #define TITSEL_WIDTH			0x2
+#define INTTSEL				0x2c
+#define TINTSEL(n)			BIT(n)
 #define TSSR(n)				(0x30 + ((n) * 4))
 #define TIEN				BIT(7)
 #define TSSEL_SHIFT(n)			(8 * (n))
@@ -58,10 +60,12 @@
 /**
  * struct rzg2l_irqc_reg_cache - registers cache (necessary for suspend/resume)
  * @iitsr: IITSR register
+ * @inttsel: INTTSEL register
  * @titsr: TITSR registers
  */
 struct rzg2l_irqc_reg_cache {
 	u32	iitsr;
+	u32	inttsel;
 	u32	titsr[2];
 };
 
@@ -71,12 +75,14 @@ struct rzg2l_irqc_reg_cache {
  * @irq_count:		Number of IRQC interrupts
  * @tint_start:		Start of TINT interrupts
  * @num_irq:		Total Number of interrupts
+ * @shared_irq_cnt:	Number of shared interrupts
  */
 struct rzg2l_hw_info {
 	const u8	*tssel_lut;
 	u8		irq_count;
 	u8		tint_start;
 	u8		num_irq;
+	u8		shared_irq_cnt;
 };
 
 /**
@@ -295,6 +301,87 @@ static void rzg2l_irqc_irq_enable(struct irq_data *d)
 	irq_chip_enable_parent(d);
 }
 
+static bool rzg2l_irqc_is_shared_irqc(const struct rzg2l_hw_info *info, unsigned int hw_irq)
+{
+	return ((hw_irq >= (info->tint_start - info->shared_irq_cnt)) &&
+		hw_irq < info->tint_start);
+}
+
+static bool rzg2l_irqc_is_shared_tint(const struct rzg2l_hw_info *info, unsigned int hw_irq)
+{
+	return ((hw_irq >= (info->num_irq - info->shared_irq_cnt)) &&
+		hw_irq < info->num_irq);
+}
+
+static int rzg2l_irqc_irq_request_resources(struct irq_data *d)
+{
+	unsigned int hw_irq = irqd_to_hwirq(d);
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	const struct rzg2l_hw_info *info = priv->info;
+	u32 offset, tssr_offset;
+	u8 tssr_index, tssel_shift;
+	u32 reg, inttsel_reg;
+	u8 value;
+
+	if (!info->shared_irq_cnt)
+		return 0;
+
+	if (rzg2l_irqc_is_shared_irqc(info, hw_irq)) {
+		offset = hw_irq + IRQC_TINT_COUNT - info->tint_start;
+		tssr_offset = TSSR_OFFSET(offset);
+		tssr_index = TSSR_INDEX(offset);
+		tssel_shift = TSSEL_SHIFT(tssr_offset);
+
+		reg = readl_relaxed(priv->base + TSSR(tssr_index));
+		value = (reg & (TIEN << tssel_shift)) >> tssel_shift;
+		if (value)
+			goto err_conflict;
+
+		raw_spin_lock(&priv->lock);
+		inttsel_reg = readl_relaxed(priv->base + INTTSEL);
+		inttsel_reg |= TINTSEL(offset);
+		writel_relaxed(inttsel_reg, priv->base + INTTSEL);
+		raw_spin_unlock(&priv->lock);
+	} else if (rzg2l_irqc_is_shared_tint(info, hw_irq)) {
+		offset = hw_irq - info->tint_start;
+		tssr_offset = TSSR_OFFSET(offset);
+		tssr_index = TSSR_INDEX(offset);
+
+		inttsel_reg = readl_relaxed(priv->base + INTTSEL);
+		value = (inttsel_reg & TINTSEL(offset)) >> offset;
+		if (value)
+			goto err_conflict;
+	}
+
+	return 0;
+
+err_conflict:
+	pr_err("%s: Shared SPI conflict!\n", __func__);
+	return -EBUSY;
+}
+
+static void rzg2l_irqc_irq_release_resources(struct irq_data *d)
+{
+	unsigned int hw_irq = irqd_to_hwirq(d);
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	const struct rzg2l_hw_info *info = priv->info;
+	u32 offset;
+	u8 inttsel_reg;
+
+	if (!priv->info->shared_irq_cnt)
+		return;
+
+	if (rzg2l_irqc_is_shared_irqc(info, hw_irq)) {
+		offset = hw_irq + IRQC_TINT_COUNT - info->tint_start;
+
+		raw_spin_lock(&priv->lock);
+		inttsel_reg = readl_relaxed(priv->base + INTTSEL);
+		inttsel_reg &= ~TINTSEL(offset);
+		writel_relaxed(inttsel_reg, priv->base + INTTSEL);
+		raw_spin_unlock(&priv->lock);
+	}
+}
+
 static int rzg2l_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
@@ -422,6 +509,8 @@ static int rzg2l_irqc_irq_suspend(void *data)
 	void __iomem *base = rzg2l_irqc_data->base;
 
 	cache->iitsr = readl_relaxed(base + IITSR);
+	if (rzg2l_irqc_data->info->shared_irq_cnt)
+		cache->inttsel = readl_relaxed(base + INTTSEL);
 	for (u8 i = 0; i < 2; i++)
 		cache->titsr[i] = readl_relaxed(base + TITSR(i));
 
@@ -440,6 +529,8 @@ static void rzg2l_irqc_irq_resume(void *data)
 	 */
 	for (u8 i = 0; i < 2; i++)
 		writel_relaxed(cache->titsr[i], base + TITSR(i));
+	if (rzg2l_irqc_data->info->shared_irq_cnt)
+		writel_relaxed(cache->inttsel, base + INTTSEL);
 	writel_relaxed(cache->iitsr, base + IITSR);
 }
 
@@ -459,6 +550,8 @@ static const struct irq_chip rzg2l_irqc_chip = {
 	.irq_unmask		= irq_chip_unmask_parent,
 	.irq_disable		= rzg2l_irqc_irq_disable,
 	.irq_enable		= rzg2l_irqc_irq_enable,
+	.irq_request_resources	= rzg2l_irqc_irq_request_resources,
+	.irq_release_resources	= rzg2l_irqc_irq_release_resources,
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
 	.irq_set_irqchip_state	= irq_chip_set_parent_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
@@ -640,6 +733,7 @@ static const struct rzg2l_hw_info rzg3l_hw_params = {
 	.irq_count	= 16,
 	.tint_start	= IRQC_IRQ_START + 16,
 	.num_irq	= IRQC_IRQ_START + 16 + IRQC_TINT_COUNT,
+	.shared_irq_cnt	= 8,
 };
 
 static const struct rzg2l_hw_info rzg2l_hw_params = {
-- 
2.43.0


