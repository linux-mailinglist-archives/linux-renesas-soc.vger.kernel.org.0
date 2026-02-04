Return-Path: <linux-renesas-soc+bounces-27890-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONMsIl5Xg2mJlQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27890-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 15:27:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E03F9E7156
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 15:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D77C7306D844
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 14:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D9041B349;
	Wed,  4 Feb 2026 14:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C20a6ZDo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26287410D1F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 14:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770215009; cv=none; b=jGhaXf6eG7x7JCPQHzionFaxmZJ3odEBtcxoSRLkONlIe6v8NyW6h9n1Q0Iv1kXkW4Y62qm2K7q2YwPfucfJid60uk13R8BsDNPftA1f9DWcAVWOrbJeC0Z5ul6+hJIMuzdl8pwXwXR5F26lOySKRGhlRbli4TGVr2KgX0F3vJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770215009; c=relaxed/simple;
	bh=7uZA7LNr7iPsl7XDZ3uueymNvVT1Vu2jXQb+PyBTyuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WTs6nZZ51S0iSEbtw1S+8pszHSQUosu6pdPOAH6DJwBSO6OHBTr6pBaV89U217cQ5rEpHbRbeOroxRr29AmW5yi7DhaWJEqUMqiDemlchkROTpcd4ROCeBQp84TaaZxG43aWufhsXkSmxXDv2GGEN3ee0+6/cjTvzoEKgMWq3Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C20a6ZDo; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b885e8c679bso1080868566b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 06:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770215007; x=1770819807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqD4SOzNdzRZRBlGF2cldwsLifXb9u+irjs2hZVgIzU=;
        b=C20a6ZDoKnopVCH1GQYS0QSbbo1oCnMzX9RDttoly18534gRLAdDb2QJYxF9rIwVBt
         fp/e9DhVhjkd1bp3kI75aM4lOpSsWmeo2PwdN+EhqZXAdg112ggrCytn70SpiKbUDXy2
         I4/yCOspFMvz0Vf+vDdApWWIqZ2wFlaeUGBvVfUAVuIPm+c4QopXY4c26MBBtJeH2al1
         p3al1ZjgsMrZWvTnZ+tGfPT8J1AYS7xIysOdKQCemSkYMyqSO4ScqzQd7G0b3kLYnOR3
         /7tw9dX66xS1juQOSM3MecKrNx4iy6CctZXN82eH0M+jY9Vw9bj4xXfsEYJqgPXMYnEd
         /XfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770215007; x=1770819807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dqD4SOzNdzRZRBlGF2cldwsLifXb9u+irjs2hZVgIzU=;
        b=t48if/9qOwBw+y5OQnzNQN3LPxAuXrwElfIdgbrSMTlAvoSy+82ZmcAXmQGt1mjj5x
         aBuOGwBLIXWJh9E/PdcpF/ctkOrG/kEKQRWBESZoGLm9YDHKxieqPj60OIQuzlCL38ej
         oamR3S+x51cxppaWacaMEBf5U/8aXqpCvt/ucN8cV7E+e+sBuX9pR/vVRxKLdYfwTPlh
         LGEJJmyjbdchArx1Ur/oy7q4uLE8V8i+eLJPE0EDCWh6n2LbFOpfk1Gl6XHk3xK7hVET
         rTN2e6XVng04cFkw6azPiOsnC9VdPHPXk+W24sQU4PK13TKH/kftzzNvf3sRAk4keBM4
         8JwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD4JHf9D3rlLotknTZk/UGCpCnJnEDh1VwToEVcL9M6QIfJMES+R+XSGVFE2ZUXPGiPrHkgehKqJdM9jpQ26fMmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjY6L6IiJHGBOsHr+NHTBA0TKLasQqa7G7yfVHNsWM9xooBngR
	JYUcRKP/hG8vN65VZAlXV+tNbUDKKBtv8fc+3C8vifYNDq1WwIpRqJG1
X-Gm-Gg: AZuq6aJ/p8O8UWG3Cu48ogAzvdDw6GVqE1YRmZCr0Rwbe61lPTGWm8AJ7koz+4K1dDm
	uTW3EMuTMUApnoAdC/89AvLLuK8vDkg8IEbQ/SiUTcwwiWZ4bCF3P9cOM7J4+Amm0GNsg48GVa5
	kfCAjfd13Eank8fgq1uh4tSv2c7yzkMfyOEqNHNlxp9WyQL15FFjDuY1EYs/hap8rDlMSJ9A/qj
	prHlj7RC+WS3Y/lAx9G6olN3IhbLLHJuCxWTV1HeePjENX6W8f+de8bjAoexgipRG5Dtp87j0FA
	Q7y55LUJQZaTgcrP2ZF3/5QVqZYQ841OWIjt9cm6uolQxVbfYAA4rNeVOhdi+coifk0w2ZMfFFu
	fyrdg+LbLFl5ibtK4TOYI+R4Z8h0NQr7YLNWxEOOsFQZpULY6wdVsW+0vr5SGI+aogSbHMBqPcq
	0Pj8yndOjugh40/ahfo0ftQp5AC0MbIvmwjto=
X-Received: by 2002:a17:906:ee8e:b0:b8e:92e:d30b with SMTP id a640c23a62f3a-b8e9f086a2amr246615366b.21.1770215007210;
        Wed, 04 Feb 2026 06:23:27 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:3c9f:a100:4d45:ebc7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea001ea7dsm129038366b.47.2026.02.04.06.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 06:23:26 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 7/8] irqchip/renesas-rzg2l: Add shared irq support
Date: Wed,  4 Feb 2026 14:23:15 +0000
Message-ID: <20260204142320.103184-8-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27890-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E03F9E7156
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of External IRQs in RZ/G2L and RZ/G3L SoC are different.
The RZ/G3L has 16 external IRQs out of which it shares 8 IRQs with TINT,
where as RZ/G2L has only 8 external IRQ. Add shared_irq variable in
struct rzg2l_hw_info to handle this differences by adding the callback
irq_{request,release}_resources().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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


