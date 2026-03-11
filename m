Return-Path: <linux-renesas-soc+bounces-29250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHQTCa3BsWkwFAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:25:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC40826944F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 55BE7302704E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 19:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1CFC3E6DE2;
	Wed, 11 Mar 2026 19:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Htnw2DEW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F0A3DF00E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 19:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257111; cv=none; b=iS4YFm+n1r7pzJxNQpsdCTk0mYJKdpN+26LJ4QhVrLbKvRfcsgx0vYD7MGs/hpkuOzRlsHuJHiCymMNPrhTxDqjGrV5Z+z9TXSswDI9hlHqHPJf8uNcCJyfcU1gZQnkUZCwQp+nVSSB3BVJAvhJLWNnf8O37069+UTHHcvIEZvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257111; c=relaxed/simple;
	bh=KjVg6jgythDakrwkbNJ+7szyJnlFzjrKb5GAAraVKPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T41NLp0QYLsg11Uw0WBRZU5sW3vdziXJrrG3KRG4kaan8D3j1lJqekGBGbpzXjdkQ6+F5tC3MetcKICHNsismqFis54fhivOspEutWvx4VLJXWNDaeRFOyu3S5rHpxLHs543Q3vRNI9c0c3jngYRcBFeQz9SjyKU42THbzuZRVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Htnw2DEW; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439aeed8a5bso225196f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 12:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773257108; x=1773861908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Z9binJChsmdA6bW7/G+vBInG1Eko/xnXKMJELpq8QM=;
        b=Htnw2DEWEqry1pwdrRoXrKa3Z3h0YjmjUiXm1BHhSP72e+woMx4DCdm8iJOR0vn7Rf
         N7JCKyFKdeHkCHxzXfTubvqBSU8A5peqB3cWJCgwPJZ+4/5VAbkf4XqOPygxiygr/CVH
         XZqlX45Aqn1SRgCcEB//WYldDwOkDm4VQsUWm90WuP9xJMuyyd/LUnZ57IQkXiqfM3OC
         v1quCP7ayA6VRa2Wt9EvbEIfybtvGMbpQRJw7Yy5W2UcOUUCPxowMMV4pLOgQynOIHua
         wTvqnBDF0sIUrZ/oV3CSuJPvhRJiex71z6Xf2bG9RtVyYRZ4sZ52GaK7ne32cIGqYIvG
         /KAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257108; x=1773861908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Z9binJChsmdA6bW7/G+vBInG1Eko/xnXKMJELpq8QM=;
        b=mgAPe6FOsVt1+lD2kvbl5EX46QwSxBmHzpG0kA62PBk4K8UbifnP3IFyvHBcbKUj8Y
         quh4dRxK89o5o9/7MhMRM5G+IXhhqxnkkoo8QA57XQip46wyhEFdc5AlPOMdjIPe52Is
         cQYLkuqNMvMpibtfYkE8dqoV1xve7I55qpiifT2UYGoCBloKZTpSp9jVH1Bk9OVfeKn0
         GtC4BnMg4+zMVQ1Gxfg9+7aeAHNpZMQrwpM8hh4tk7W9k3SJyEAHFu3khYTWh9d8bhNn
         CZYw9ujfW0ryhgxWCMKcIEpGLl+jXM51imNPkPb4LFp+8DyEcqf8Nsx0/PQj88+gOg9n
         0CVg==
X-Forwarded-Encrypted: i=1; AJvYcCV3TjWs7XKqVxGGYnQ0bMx1UDADUQQ1/M43/klybBY+D8BzZIIPvsVulyK/+75d16zu7IRv0KiN+15SKKZb3tcY0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4dt3YuWdDs+9bHA0x6o8zBYzFFfAyK6drYn0Sb1q3IENPj7rv
	Nj13CiJFcDHvX08RHuqW8CsmbLaGI4z28/qlAviLqXY8WhDmQmLwRAWY
X-Gm-Gg: ATEYQzy11aYIf4ehtqz6Y0XGBR3/4H1b1PFu8GTJtBcs7qG6JNIRDPet+IlKNFW7Uxu
	4MErSEiV+oczC/RhLRF7TcDaBzzf/Q+ixVnfK/LRMhdiYE7/VtvcONxjcTF5VQ3KL+FwJUS4cCD
	ZrxTVYBt7lx94dYbou5hFxeSEgwZdUxSv3AZb4n5aJ1M3+Sd4kxCZgvQUXadZtWjZg6Itf3yMNp
	O4itxDnO6Va89yz7n1k+zYzEjwWnnuy0xqwmLlsg5HZjnOesArg6uujST4HRE9H9J6cuZgdlySg
	gUjfubATSgNTohEs1T7orWHFiGb3oyqhkyPN+8e9qjfFT3+DpsnXy4DxeklH+Ytz2a2ZLrtXFKH
	Gmp/xXMaTx5iR0QrY/rRwLeAa1zXCEXUO5RS/hJX+XR/+9mjvqOpimcDYPXbddXS3sAA6xXTIv1
	xbP/zsOrOfJBEkoNtmCeojHmWxSPgVFu35+Em7t8zLXWrk4WTn
X-Received: by 2002:a5d:588e:0:b0:439:5c75:dc08 with SMTP id ffacd0b85a97d-439f81bc54dmr7161870f8f.10.1773257108174;
        Wed, 11 Mar 2026 12:25:08 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:38b7:8ca3:cb55:d344])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bd9csm1323210f8f.21.2026.03.11.12.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:25:07 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 08/15] irqchip/renesas-rzg2l: Split rzfive_tint_irq_endisable() into separate IRQ and TINT helpers
Date: Wed, 11 Mar 2026 19:24:39 +0000
Message-ID: <20260311192459.609064-9-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29250-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: BC40826944F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

rzfive_tint_irq_endisable() handled both IRQ and TINT enable/disable
paths via a hw_irq range check. Split this into two dedicated helpers,
rzfive_irq_endisable() for IRQ interrupts and rzfive_tint_endisable()
for TINT interrupts, each operating unconditionally on their respective
interrupt type.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5:
 * New patch.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 78 +++++++++++++++++------------
 1 file changed, 47 insertions(+), 31 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 0d6b72e1bc02..9e0080c5ec95 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -212,48 +212,64 @@ static void rzfive_irqc_unmask(struct irq_data *d)
 	irq_chip_unmask_parent(d);
 }
 
-static void rzfive_tint_irq_endisable(struct irq_data *d, bool enable)
+static void rzfive_irq_endisable(struct irq_data *d, bool enable)
 {
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hwirq = irqd_to_hwirq(d);
 
-	if (hwirq >= IRQC_TINT_START && hwirq < IRQC_NUM_IRQ) {
-		u32 offset = hwirq - IRQC_TINT_START;
-		u32 tssr_offset = TSSR_OFFSET(offset);
-		u8 tssr_index = TSSR_INDEX(offset);
-		u32 reg;
-
-		raw_spin_lock(&priv->lock);
-		if (enable)
-			rzfive_irqc_unmask_tint_interrupt(priv, hwirq);
-		else
-			rzfive_irqc_mask_tint_interrupt(priv, hwirq);
-		reg = readl_relaxed(priv->base + TSSR(tssr_index));
-		if (enable)
-			reg |= TIEN << TSSEL_SHIFT(tssr_offset);
-		else
-			reg &= ~(TIEN << TSSEL_SHIFT(tssr_offset));
-		writel_relaxed(reg, priv->base + TSSR(tssr_index));
-		raw_spin_unlock(&priv->lock);
-	} else {
-		raw_spin_lock(&priv->lock);
-		if (enable)
-			rzfive_irqc_unmask_irq_interrupt(priv, hwirq);
-		else
-			rzfive_irqc_mask_irq_interrupt(priv, hwirq);
-		raw_spin_unlock(&priv->lock);
-	}
+	raw_spin_lock(&priv->lock);
+	if (enable)
+		rzfive_irqc_unmask_irq_interrupt(priv, hwirq);
+	else
+		rzfive_irqc_mask_irq_interrupt(priv, hwirq);
+	raw_spin_unlock(&priv->lock);
+}
+
+static void rzfive_tint_endisable(struct irq_data *d, bool enable)
+{
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	unsigned int hwirq = irqd_to_hwirq(d);
+
+	u32 offset = hwirq - IRQC_TINT_START;
+	u32 tssr_offset = TSSR_OFFSET(offset);
+	u8 tssr_index = TSSR_INDEX(offset);
+	u32 reg;
+
+	raw_spin_lock(&priv->lock);
+	if (enable)
+		rzfive_irqc_unmask_tint_interrupt(priv, hwirq);
+	else
+		rzfive_irqc_mask_tint_interrupt(priv, hwirq);
+	reg = readl_relaxed(priv->base + TSSR(tssr_index));
+	if (enable)
+		reg |= TIEN << TSSEL_SHIFT(tssr_offset);
+	else
+		reg &= ~(TIEN << TSSEL_SHIFT(tssr_offset));
+	writel_relaxed(reg, priv->base + TSSR(tssr_index));
+	raw_spin_unlock(&priv->lock);
 }
 
 static void rzfive_irqc_irq_disable(struct irq_data *d)
 {
 	irq_chip_disable_parent(d);
-	rzfive_tint_irq_endisable(d, false);
+	rzfive_irq_endisable(d, false);
 }
 
 static void rzfive_irqc_irq_enable(struct irq_data *d)
 {
-	rzfive_tint_irq_endisable(d, true);
+	rzfive_irq_endisable(d, true);
+	irq_chip_enable_parent(d);
+}
+
+static void rzfive_irqc_tint_disable(struct irq_data *d)
+{
+	irq_chip_disable_parent(d);
+	rzfive_tint_endisable(d, false);
+}
+
+static void rzfive_irqc_tint_enable(struct irq_data *d)
+{
+	rzfive_tint_endisable(d, true);
 	irq_chip_enable_parent(d);
 }
 
@@ -504,8 +520,8 @@ static const struct irq_chip rzfive_irqc_tint_chip = {
 	.irq_eoi		= rzg2l_irqc_tint_eoi,
 	.irq_mask		= rzfive_irqc_mask,
 	.irq_unmask		= rzfive_irqc_unmask,
-	.irq_disable		= rzfive_irqc_irq_disable,
-	.irq_enable		= rzfive_irqc_irq_enable,
+	.irq_disable		= rzfive_irqc_tint_disable,
+	.irq_enable		= rzfive_irqc_tint_enable,
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
 	.irq_set_irqchip_state	= irq_chip_set_parent_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
-- 
2.43.0


