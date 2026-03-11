Return-Path: <linux-renesas-soc+bounces-29247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJ2nJkHCsWmdFAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:28:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C2A2694EE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9BE7321045B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 19:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76C93DCD81;
	Wed, 11 Mar 2026 19:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkJ+HgAw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8E4375ADE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 19:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257109; cv=none; b=OSjpJRShQuruLnkEXVikcbwtUvYV9P5hb2wA50pw5VjtcIy1GLF1ITrOniyQKW1WTvGx1JdyClZ1fo6IY0hESb3PWBKVs5rDCGvwy481mJAMvLTtucDryy5sj3VbP3HaoAP7x5MXn4bJ53v+OsQAPfp/hmcfh8hlJZp0S8MoksE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257109; c=relaxed/simple;
	bh=lyZczvy+fbbjpuhJdriWY4Xm3ChQADyZfKOTYccb1GA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lzzcB7EtSLFkTCdTm9LQ8dgYiM3tjsfk31Ti71iA+/bboJ3/UGJPhz4Ue2YibgLA1/+SmBG1GtTDOKwv26cIHeE2zyeK6NKoEDsUh0YEadNxFVCgDBf6qUD+kcTM3ArDyoTXBuWX2OhrhzclqT1QwFXiciyDxwd+bYEYJEQ7TRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkJ+HgAw; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso1753995e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 12:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773257106; x=1773861906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGXUvkvzSy+dtJfFo2G7AhUAuLk8jdwln0iV68qBoI0=;
        b=AkJ+HgAwmkPMRZwg+EbtgMmTGWyOYMKacNi1mUc5e1UQHeqO6pUnno5YRcxkLkXFTg
         oQMYNcfyCaGBZopJUa1nr6GfOh12AWU9oRNbGEPimBUhGYgwgnNh68DQlRsrIniVL6N5
         YAwpD6WWkVeGb/dR+F58Wy/XbNar5hJI8zmxfT+VRXpnBUWms0xbH0OEmh6XmYwVt1E6
         y9SpX9jsGBHLrMCOyfHlzxQh1DtrQPXSNIvDfYzTPfkE17mB9GrtoIlqZefynkROfET+
         mYACurB5+yaMgjXf9YzB8VSmvdEDXNQ1SLuhEJf4pHbQ1KcbD2K2DvzPf7FQtr8b2/hC
         Isiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257106; x=1773861906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iGXUvkvzSy+dtJfFo2G7AhUAuLk8jdwln0iV68qBoI0=;
        b=T2QmJWgdG2gs+sK1QZGFjq6K++qGagfy2pZ8ZKvZ4sZNgKEp+V1mrEmdz7Fc2waWWZ
         NUDx4C1IjgxvkTXjpuxyj123Ak0fD+TaMsRd3qAd3nV3nDcO5ZJWsWzdcVmcpPma7i7N
         sfZDyb79XvX6I4xc7Fq+ojmVKu/ovUNic3nCsoOi3DxV9CjM5L8hvj+u2XoYHQpvuHIO
         Hed5c34quSYnzPHU1Kd3EGzIjUuNg39v24gIZk3k3Obi2IJi+1S7HAx6G6mAhMtMbZ/v
         jrflfFVsysOMtJbUl2crrMTaijQIPUzvO2dYU99iFON8UWladtZp5G0xhb4SvnR6TFNo
         7VCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb4SZ+RnqiQpnvugJUPmTvNVYxseDXuRMYxLtyqx5CVj4ii5ELBkyVfjkuzcYD5f6untLUZmFeA1+MQbfe8gUPHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwanFe4AbTOIm5i1tE78UyoOifg+BJSDsEVHLSuX9VVOswBPpU9
	q8gM1BdweEE6xRCPt+nEM5FBz8Wls9J2FJqEHXpwnQhwJxMK3aqLX3Vw
X-Gm-Gg: ATEYQzzOR3u1aRfOjTGGi55r5elNacVf5gDO5ZR2KYnDc/P/f4LiQbkctpI1JdJtQLj
	2wjCme4WA9qdMRqm7iPZ1cCFO9EnrrF6Fheb6DqoM/bZ/Rae+kRo2/c8A8yB8vN0qjxOHRsaYcb
	f1Li5fcEdeZ6ZvSk+V3LL1yyCZrJXo6aH3Zzn0a5pXW/4masCVK3/qop5Q0YQC8T9gJ0PBdLI6s
	DtYXFAaOIgScyfwlJDi5bnp2KF13uaQrRztz6qeSmWDpbfbNa1HN/BTrGYOLthP+XMAehI72WTS
	JhF1cEzzXxHUFy2ooKTzfk23DYt91GGQ/IA0y7YiO/rKjHRvMH7sqeQ1xQRbbivIJDDWxsvGuzC
	21Lv4UP7WrLfEaJVo0QR16qOsrZ3TS7vm6ODaKAeF4DD0VUqbVYgbVbEAPIvm90zQwCyzDK5Kg0
	jCnRYokVhcBDcLsH0VltxZxUaCSJmyt6LHpa/slmLF8/t7dFsdKBg99/R4blg=
X-Received: by 2002:a05:600c:4e56:b0:485:4136:99a8 with SMTP id 5b1f17b1804b1-4854b0fafb9mr58370445e9.22.1773257105975;
        Wed, 11 Mar 2026 12:25:05 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:38b7:8ca3:cb55:d344])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bd9csm1323210f8f.21.2026.03.11.12.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:25:05 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 05/15] irqchip/renesas-rzg2l: Split EOI handler into separate IRQ and TINT functions
Date: Wed, 11 Mar 2026 19:24:36 +0000
Message-ID: <20260311192459.609064-6-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-29247-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 03C2A2694EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The single rzg2l_irqc_eoi() handler used a conditional to determine
whether to clear an IRQ or TINT interrupt. Split this into two dedicated
handlers, rzg2l_irqc_irq_eoi() and rzg2l_irqc_tint_eoi(), each handling
only their respective interrupt type without the need for range checks.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5:
 * New patch.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index a0f03f81d5ef..1c5083a48561 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -130,16 +130,24 @@ static void rzg2l_clear_tint_int(struct rzg2l_irqc_priv *priv, unsigned int hwir
 	}
 }
 
-static void rzg2l_irqc_eoi(struct irq_data *d)
+static void rzg2l_irqc_irq_eoi(struct irq_data *d)
 {
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hw_irq = irqd_to_hwirq(d);
 
 	raw_spin_lock(&priv->lock);
-	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
-		rzg2l_clear_irq_int(priv, hw_irq);
-	else if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ)
-		rzg2l_clear_tint_int(priv, hw_irq);
+	rzg2l_clear_irq_int(priv, hw_irq);
+	raw_spin_unlock(&priv->lock);
+	irq_chip_eoi_parent(d);
+}
+
+static void rzg2l_irqc_tint_eoi(struct irq_data *d)
+{
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	unsigned int hw_irq = irqd_to_hwirq(d);
+
+	raw_spin_lock(&priv->lock);
+	rzg2l_clear_tint_int(priv, hw_irq);
 	raw_spin_unlock(&priv->lock);
 	irq_chip_eoi_parent(d);
 }
@@ -438,7 +446,7 @@ static struct syscore rzg2l_irqc_syscore = {
 
 static const struct irq_chip rzg2l_irqc_irq_chip = {
 	.name			= "rzg2l-irqc",
-	.irq_eoi		= rzg2l_irqc_eoi,
+	.irq_eoi		= rzg2l_irqc_irq_eoi,
 	.irq_mask		= irq_chip_mask_parent,
 	.irq_unmask		= irq_chip_unmask_parent,
 	.irq_disable		= rzg2l_irqc_irq_disable,
@@ -455,7 +463,7 @@ static const struct irq_chip rzg2l_irqc_irq_chip = {
 
 static const struct irq_chip rzg2l_irqc_tint_chip = {
 	.name			= "rzg2l-irqc",
-	.irq_eoi		= rzg2l_irqc_eoi,
+	.irq_eoi		= rzg2l_irqc_tint_eoi,
 	.irq_mask		= irq_chip_mask_parent,
 	.irq_unmask		= irq_chip_unmask_parent,
 	.irq_disable		= rzg2l_irqc_irq_disable,
@@ -472,7 +480,7 @@ static const struct irq_chip rzg2l_irqc_tint_chip = {
 
 static const struct irq_chip rzfive_irqc_irq_chip = {
 	.name			= "rzfive-irqc",
-	.irq_eoi		= rzg2l_irqc_eoi,
+	.irq_eoi		= rzg2l_irqc_irq_eoi,
 	.irq_mask		= rzfive_irqc_mask,
 	.irq_unmask		= rzfive_irqc_unmask,
 	.irq_disable		= rzfive_irqc_irq_disable,
@@ -489,7 +497,7 @@ static const struct irq_chip rzfive_irqc_irq_chip = {
 
 static const struct irq_chip rzfive_irqc_tint_chip = {
 	.name			= "rzfive-irqc",
-	.irq_eoi		= rzg2l_irqc_eoi,
+	.irq_eoi		= rzg2l_irqc_tint_eoi,
 	.irq_mask		= rzfive_irqc_mask,
 	.irq_unmask		= rzfive_irqc_unmask,
 	.irq_disable		= rzfive_irqc_irq_disable,
-- 
2.43.0


