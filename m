Return-Path: <linux-renesas-soc+bounces-30063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AUdCWLgv2ml9wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:28:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A112E9315
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 703373034280
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 12:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A793803F7;
	Sun, 22 Mar 2026 12:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avx3ZMWR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0C3370D4B
	for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 12:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774182272; cv=none; b=GYr7EIVncqonWSichEylnowDke8hqU396sRkRFNGMJ/mrNf/N1W5aq+p9de6ralY6D201qibMuBDwqElPtOzljkVdzRlXFlX2ORXCT2UsdEfSjV/K+FvLyCoAhu//rL9Vr+r/xePis441RAm59RZwhl9NRLTGpzs3Si2OErDDig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774182272; c=relaxed/simple;
	bh=Q7ZMTU8tA4AeV4I3v7W7pGxsb09bhPm9Dym0oBZQwGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JRhYftmrm4VbgRvPFx+Gh8K8ycgFtV708nl7Yi3xEt/U9RcgasIjPESrgVWwDRIrkgvvFO5uhz3tMOw8TELfhJ2yvvwEPD5n55cSJsiGIQchaR3r7QJjwf4M/ugsHQifVFyBDvITIS1z3oyl4KZPqiWHjsSwtqlySZUpzv9KHXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avx3ZMWR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-487035181a7so7066545e9.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 05:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774182269; x=1774787069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjfkIF3HASnSI8uhb4eTEC1yI6mapcnT2E5vNZU/SGc=;
        b=avx3ZMWRvqGotZYODG/OyyguoJz4a6fEP7jxoCGChR1OBYu02+AwVG8SCH4wjTGIhy
         6GOf3tS0kUlBikvWNO0F/FnVLY/FltH04qQivVott93iur4zkxcW0LlRtu8hnwxqsSfN
         yXjdyVi5/4npcgm5NVsxy6/g+m1zFXQB02/mx9VAb30LY0eaqUMJx4k6RuOsy+lxm9Z2
         7FKlYrFt0Pl9myZEtkakVk/beTHiiYjAp5XOY7vwLyPPVTvxLYF2boiYPC8eOCciEZ2U
         zAJbJw6CJi/6GriJfMiDKxCKAAldGKrkA9Qwn7GVolKIfIL+kto+J1N0kXfqNlT2kJtn
         jk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774182269; x=1774787069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vjfkIF3HASnSI8uhb4eTEC1yI6mapcnT2E5vNZU/SGc=;
        b=fEvrZHN8zro6JGV9/KRcPHAXmTVt4DaEZ/G8hP5em5C7Tun7iv/DBJTEsjd3QF4Am0
         lWIbNcE17c656XhGOx8IB+VhUCp9ujVIhThcoJ0GinwJ/mEcifpH8PmSWseq0Ut+KTCo
         rytsprrbLu19Iy31kpOqNZAUFBvWFnQpSSNliJF6vJ0G/pXENCAMBmz2atq/K2ZtNRz4
         inXi2Z/TrArpUHuiDINTmXT7/YDGwlTkxnK+KGkG89pkXa8yP/MHS0U6uMdPrnn6RZcB
         MBhp/0MDw5WYf+erCPpPijyRz1JUYb3VuRWlTRxbXDmnEVSTCo7eRhK90beezPtLYC5Z
         FyPw==
X-Forwarded-Encrypted: i=1; AJvYcCU/BA5MvcwcTXC5D3uDFV6n4C273yB9hSBqsjaRtwHdxhXhGFa5acr25mgGdbGew5l4bplkBAFhPLbnvIwtUY6rFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVq+JnrgD5yOqpC1fbdJBOeMYkwiPhTnqtrYR4Bn7dMxtIJGaX
	akCEvj4rxeQjVlAOrrvGaUgJNOctKiGqmNVQsB7VbHPofg3QdeACWdOG
X-Gm-Gg: ATEYQzxc//9a8iFUEaMWEmC5opgp4RgTP+rVmfHANE2hyZ/yyKNfn2GcPRU0578oDu7
	QRxQMFPkgiUiXBeXIvqmTYQaWC3CIOuxRp0pAhvoQ0qLvlXLhMvE8lk9FBMa82PNZGMaOq/3/6D
	QoGa6o9ooeRQTrExblO1dPM1zMwgUnbnVZSN+vIQM/50bSvu0tnW7wT9tbJKpdSfcpTLDOpmm6o
	hpcPPu26dENIvZz6cS/T0NrafVbrxpWlWriItNwSF2ft4HsYNYG1HVt3j1D6DDAxp/466DIwNex
	j7sjbwCMMbAjVg6Vjk1qieOFmGAcfWiw54lk7ZnQqvoJuHhBlZwmofjnCVYLFGb2ddNjOi85Y4x
	BoMpxa5x7OS2WyFFcdUwoP7nj6bOjlMk6VHHKxCDWLE+5Pe8kraTivzk2FWVUT/Bsv+uCa/X0cp
	Cf93TzyVQMtMnmYGtEOVv8wNCRYSow3veEFWxN51bR4T0uWg7X
X-Received: by 2002:a05:600c:1f86:b0:483:1403:c47f with SMTP id 5b1f17b1804b1-486febbc653mr130128755e9.6.1774182268916;
        Sun, 22 Mar 2026 05:24:28 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1bdc:7f84:18bc:1e56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703343sm21072695f8f.19.2026.03.22.05.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 05:24:28 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 05/15] irqchip/renesas-rzg2l: Split EOI handler into separate IRQ and TINT functions
Date: Sun, 22 Mar 2026 12:23:48 +0000
Message-ID: <20260322122421.132474-6-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30063-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: B3A112E9315
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The single rzg2l_irqc_eoi() handler used a conditional to determine
whether to clear an IRQ or TINT interrupt. Split this into two dedicated
handlers, rzg2l_irqc_irq_eoi() and rzg2l_irqc_tint_eoi(), each handling
only their respective interrupt type without the need for range checks.

While at it, simplify rzg2l_irqc_{irq,tint}_eoi() by replacing
raw_spin_lock locking/unlocking with scoped_guard().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * Simplified rzg2l_irqc_{irq,tint}_eoi() by replacing raw_spin_lock
   locking/unlocking with scoped_guard().
 * Updated commit description.
v5:
 * New patch.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index a0f03f81d5ef..0683559c31bf 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -130,17 +130,25 @@ static void rzg2l_clear_tint_int(struct rzg2l_irqc_priv *priv, unsigned int hwir
 	}
 }
 
-static void rzg2l_irqc_eoi(struct irq_data *d)
+static void rzg2l_irqc_irq_eoi(struct irq_data *d)
 {
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hw_irq = irqd_to_hwirq(d);
 
-	raw_spin_lock(&priv->lock);
-	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
+	scoped_guard(raw_spinlock, &priv->lock)
 		rzg2l_clear_irq_int(priv, hw_irq);
-	else if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ)
+
+	irq_chip_eoi_parent(d);
+}
+
+static void rzg2l_irqc_tint_eoi(struct irq_data *d)
+{
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	unsigned int hw_irq = irqd_to_hwirq(d);
+
+	scoped_guard(raw_spinlock, &priv->lock)
 		rzg2l_clear_tint_int(priv, hw_irq);
-	raw_spin_unlock(&priv->lock);
+
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


