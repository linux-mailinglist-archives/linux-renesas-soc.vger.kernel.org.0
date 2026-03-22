Return-Path: <linux-renesas-soc+bounces-30065-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIIGEIrgv2ml9wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30065-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:28:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B202E9343
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B58E303A909
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 12:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E489381AFB;
	Sun, 22 Mar 2026 12:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wd7WUdPA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E693815E1
	for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 12:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774182272; cv=none; b=JWxgGVrMiz6Xfyu3kIQYbwXx3ynJYn3dHEskXRwiCafzpbuQLzCXIg6mNT/Md9eZNNjq8FSbYUmPbuwlQSXonWQw/DJcvEpNMYlAqF3ZknVuyNvA3znbdTsgGbH9w4xruQsk1tnltNDviaNxsfgfkK8F/+SEP8B7jx7ahsHv2l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774182272; c=relaxed/simple;
	bh=U1adm3g3B9v7a5MeskhnTiomMzDoVQVY57YQV/+SBsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJK+PrNRsSO2zJ2y4POKkmny26Nmbq9oGseJvODrehzA9r+PKRCA7MUFzDOWeAjD4vn/ln6owB/kgLJs4NC2Grsp+/ha3mooMbxOAWt9JykfB8n+g6Qsmg3kCVidjDZqz06DI35kDejmsB+FF7MlsGD7ASG3S9kQ8UtNBSOhxnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wd7WUdPA; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fd27754bso25139175e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 05:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774182270; x=1774787070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2ypyUw2VRpKAfR8FIRxqzsDwKCOO3CZ741DYEI3teg=;
        b=Wd7WUdPAi8ItlOJOL8ifyKtHijG/PRSH6Dnj33QZZU/ecFyzC0sj26m27KNQrol6av
         PSpvGyxmqs+MeelDt4wnAek08Lf/b8vqkW0euvbu1qTkL/kH9IWe0U232sjYiAIxLusY
         Effoq1p6+Q5Mr0ashEOIBogWTAlc3lx+xgfvPUlBeOiewHau+o9/SW++r9jDwROYtE+9
         XW27j/XLf0o3x3igMZ2bEaYotldRPgAw/DT3aupZXh4ughQXVeDqdRQ/P5zk3ph/CJjy
         kEZNYGzQ6Z24I+2T5YZDoas0i2Wx9hQUcoMZearhQ/JQWUDpxKMg8JKJ+Oe4F69nsZdz
         o9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774182270; x=1774787070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/2ypyUw2VRpKAfR8FIRxqzsDwKCOO3CZ741DYEI3teg=;
        b=P9JqU/7q641jtcYkoGOGZKoPHiArZbXVlV7IBtLCS8dhA0qfVklMu6wc1NloUgW2OG
         lVbyuQjbX+nbkLxlUmSpaPaT+XWdTlzhdYKiyDqUFkcMx+ouWOS7IReXV8gGrRzhOZvC
         KUL2CrubibJqjlKh1Bn9RzGqEQ+zDT0jdTP0fP7U/UHLBvDw6jpU3XjpEDeA1RHyefnM
         svdLvZFPyIpZJ2rVSrJDlR26yYivCoXgGjvYNdl9n3TRiSkUDFgboKjHdo7i4uKnMW76
         mlCG2Utl4KCk21KaMiQW0lcJ3qXkf/YQhMvdhAJpmHWPfHwp1vFLi6c2eYfTtulM4YXe
         briA==
X-Forwarded-Encrypted: i=1; AJvYcCVrm5h4g4MceYyvoGm3NZmrp5LssLQc71GYMfVlah8aarTEl+1gXHA79oqgNEP8b50ahykYB4kVVaWrjVf4wMGY6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp4F2PXKwhYJHscbeJQhHqNBq+KtMH+HEnTj4zFSk3jgjRFLE2
	g8II5wEMNZV6G+HsaVzwLWh3N7CCGhRGpRneLxBQ/op7HFFF5Vmc3rxQ
X-Gm-Gg: ATEYQzyKPrt/xS4wtx6CqNUE5WL0xMg6BTj4tdWzLrPUrJ/e3lQWeKUqSr/HDPp0YBc
	3IJ8VHKCVGLJWrlOw53X931Ij40UTYmVesNo+8mXwAyQ+U2PxQeiWs3TxDv5CTbeN7Y5sMfYlA5
	fS+CFFJO4wt5D51ozR+7pVd/ynWwYA8LRSJuyCg5zLEVYLpIYVVR4+r9vfJc0mdEyh6yHebqRev
	Dibj+jv7+Tqaqnb/J0uPG/U+NOye+zNQAFXpJKnoTf9B6odxn6AR8iBemLmqAzdsdJ4RS9wC6bP
	oJYjHauBovEbQTGg6lEDJaGidRAIHJ2MC6g/8LYptPgu00MH0tFj0ESE949I2mC+whg7K9n4mzV
	6uwTfJqZvDxmGhX/l4NYRya7VRYTjxq0sT9A9SvsdCDvQfZ9VxL1XD2THc3Lzm7Hf/4fmEP6qoX
	7vSV8UXjBjL9DKilLS/YepM0nF0e5G+lE8r5+BxQ7HqPTuMt7k
X-Received: by 2002:a05:600c:474f:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-486fedab2edmr126544385e9.6.1774182269673;
        Sun, 22 Mar 2026 05:24:29 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1bdc:7f84:18bc:1e56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703343sm21072695f8f.19.2026.03.22.05.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 05:24:29 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 06/15] irqchip/renesas-rzg2l: Split set_type handler into separate IRQ and TINT functions
Date: Sun, 22 Mar 2026 12:23:49 +0000
Message-ID: <20260322122421.132474-7-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30065-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 93B202E9343
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The single rzg2l_irqc_set_type() handler used hw_irq range checks to
dispatch to either rzg2l_irq_set_type() or rzg2l_tint_set_edge(). Split
this into two dedicated handlers, rzg2l_irqc_irq_set_type() and
rzg2l_irqc_tint_set_type(), each calling only their respective type
configuration function without runtime conditionals.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * No change.
v5:
 * New patch.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 0683559c31bf..84dded4beae6 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -393,15 +393,22 @@ static int rzg2l_tint_set_edge(struct irq_data *d, unsigned int type)
 	return 0;
 }
 
-static int rzg2l_irqc_set_type(struct irq_data *d, unsigned int type)
+static int rzg2l_irqc_irq_set_type(struct irq_data *d, unsigned int type)
 {
-	unsigned int hw_irq = irqd_to_hwirq(d);
-	int ret = -EINVAL;
+	int ret;
+
+	ret = rzg2l_irq_set_type(d, type);
+	if (ret)
+		return ret;
+
+	return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
+}
+
+static int rzg2l_irqc_tint_set_type(struct irq_data *d, unsigned int type)
+{
+	int ret;
 
-	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
-		ret = rzg2l_irq_set_type(d, type);
-	else if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ)
-		ret = rzg2l_tint_set_edge(d, type);
+	ret = rzg2l_tint_set_edge(d, type);
 	if (ret)
 		return ret;
 
@@ -454,7 +461,7 @@ static const struct irq_chip rzg2l_irqc_irq_chip = {
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
 	.irq_set_irqchip_state	= irq_chip_set_parent_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
-	.irq_set_type		= rzg2l_irqc_set_type,
+	.irq_set_type		= rzg2l_irqc_irq_set_type,
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 	.flags			= IRQCHIP_MASK_ON_SUSPEND |
 				  IRQCHIP_SET_TYPE_MASKED |
@@ -471,7 +478,7 @@ static const struct irq_chip rzg2l_irqc_tint_chip = {
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
 	.irq_set_irqchip_state	= irq_chip_set_parent_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
-	.irq_set_type		= rzg2l_irqc_set_type,
+	.irq_set_type		= rzg2l_irqc_tint_set_type,
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 	.flags			= IRQCHIP_MASK_ON_SUSPEND |
 				  IRQCHIP_SET_TYPE_MASKED |
@@ -488,7 +495,7 @@ static const struct irq_chip rzfive_irqc_irq_chip = {
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
 	.irq_set_irqchip_state	= irq_chip_set_parent_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
-	.irq_set_type		= rzg2l_irqc_set_type,
+	.irq_set_type		= rzg2l_irqc_irq_set_type,
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 	.flags			= IRQCHIP_MASK_ON_SUSPEND |
 				  IRQCHIP_SET_TYPE_MASKED |
@@ -505,7 +512,7 @@ static const struct irq_chip rzfive_irqc_tint_chip = {
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
 	.irq_set_irqchip_state	= irq_chip_set_parent_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
-	.irq_set_type		= rzg2l_irqc_set_type,
+	.irq_set_type		= rzg2l_irqc_tint_set_type,
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 	.flags			= IRQCHIP_MASK_ON_SUSPEND |
 				  IRQCHIP_SET_TYPE_MASKED |
-- 
2.43.0


