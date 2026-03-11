Return-Path: <linux-renesas-soc+bounces-29248-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLdEOlTCsWmdFAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29248-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:28:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4952694FD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:28:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F46E322186D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 19:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B96F3E276A;
	Wed, 11 Mar 2026 19:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIbTPTcV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56566376BFD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 19:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257110; cv=none; b=BVot/GEp2BdpktmgXhFphjLn6jLJTD7Os9XpPGWyuEPgR7P6KXpC5cEHCr/BB7STIswhhKndGlgRNdnyLZdAESBdQIzLzxctOxMqVEbh2VBS8YhkfCtynGPmLIHSS1xvZa+o6eOGzh6qFNC7BFFqpY/N1q/Ev80IRMbDX6anVkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257110; c=relaxed/simple;
	bh=GxUu1xs7kYlEKPI9Dd6I7x0fdOCHAcuXzmPwqh0MuYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FMyvVirOlAtA67Fg4p1nheQQ5JXhPsPNkWTuDuMHW66vcM/7TxEaXcBpk0G8Bf5ogNmxQe7ueCjtGgzLl6slalLzODHRRb1UH0m3nMbfyaGT/Pg77b5bBwAA6K6zekTN8rX2MJr7SEPjooP8n3vAfqtBhZ63icsc64vLtqqzR3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIbTPTcV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48541edecf9so2254895e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 12:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773257107; x=1773861907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jOEee7Ys7zDFdh8Wx8JB+mmNEi0K8VQIHqBqw2q2fo=;
        b=VIbTPTcVfyI0QDJb/5RX/vBCQqvosbW6QDPUMYCBHCNnI8lxOIypPBD/FxF3uyMUlj
         pvaQYKJGC1eYgKuHIP+wkUHqvcX8Y0HbgOuVA8fPn7WJQ/NoCpH5PUQ6eI8ks2mZUz4W
         En6P6IiQp57FKtC4Hjy0ykcsusxF7m/BWMG0XqmnNQPGbzgXtxk48hU8/9CcrORHHi36
         jKuZ2Rs/DThF2hyAcpTWco70PzyYFqBLYNs4XDRmuL7leM/hT0/o15nLfhQSTaCa/LJr
         aD9v5gvHPeoFDOuyTY018oJYI8XrV3781WC9F2hbQoEYvlaib22IBD6s3C7F9w1H9Ez7
         VbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257107; x=1773861907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6jOEee7Ys7zDFdh8Wx8JB+mmNEi0K8VQIHqBqw2q2fo=;
        b=ndSxfXZ6ZYUhan+NL3cAPuhaFDZ1Oq5mkSF8kngRJNqFwWnJp2927mdYLSeRJZxi6r
         yeoHyUyHrPCKGWjWW9NQoehGgLyFoejvqoNYP/1R5PuSdtQBCogbGH05BZ0Om1rB+tid
         MC07lyJqHlsehwa9CFDv+CJIUtzhF5vxGcnIwFuB42nrCnlJnXMOZLh8+yPJcvdyd8nG
         k4jNXyvwntlHB+qGqusNZcBvgexSUl5x0OUGo3cDjT22e7pTkFjdDbdd2AlQJPHX9/Xq
         tzK3Fld4iXvKzqY59V2b7naL7k1Xd8Sf99A/0OX30755JExMzDvLvZYjhjrQCLGzBwpf
         jTNA==
X-Forwarded-Encrypted: i=1; AJvYcCXEWHTXncqkGCvyOhv053l43MUmq3gMJQpwbL6n8IvyJuzAgAW3RGDhQm8svDeI0BEW96yYzDr82zQV1/srM+jQ1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ7XlzieGQE30ZnOcusHZYeyOZbNPnQ5QyINsO7mzJaOSbgeEi
	mKb9lE9OMFLCMtykjplFwqu9RPCOru94WdAKUTItVvu7mZ0ysZkzmB7PY4WUug==
X-Gm-Gg: ATEYQzyMrK5jOuQcCwXewc+X9v4O6mlLwP3e2wKZomeZLJzrL932PeaPCmret8a5dtm
	5TD0FynUp2GXdf0z/uwQpikv4PhgcQv1mKkf7C4dLIuV0fG1z37s9YmZeUQ7oJTux5w69oaqT6n
	aOgNX5x0bLpi64bPLO5KTA5HjMY/bLiAcSd+igM03FUh32k0EhOsR8FVwQyg1ZVQxd8zTp41CIt
	7UrshPl7KbC25kkcYu90Go+YLxNFUeCZczc+Av/kKNp1OzXN4djwWABEZsRMqKrMMrudnUndOdz
	gML+EEnNlx8fyIUGJtVTBGvnnZpTZW8IxXUmWyFW82fL154EImXHs2R8zezgNSknFnQeoPOJ6Kq
	wnhtFMvX+s9uVxmX/xfJWFF9uphqZb34V7bXo8wvyolkmRIOpwR9pWTyJ2UojUxoTSJpp5lxQkl
	lI+1tMSqMsgXvBGtftpnB8ddGbx92FxroIcYxyYl4uT2Ez3tEN
X-Received: by 2002:a05:600c:8b31:b0:485:3812:36da with SMTP id 5b1f17b1804b1-4854b0afc13mr64808865e9.9.1773257106642;
        Wed, 11 Mar 2026 12:25:06 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:38b7:8ca3:cb55:d344])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bd9csm1323210f8f.21.2026.03.11.12.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:25:06 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 06/15] irqchip/renesas-rzg2l: Split set_type handler into separate IRQ and TINT functions
Date: Wed, 11 Mar 2026 19:24:37 +0000
Message-ID: <20260311192459.609064-7-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-29248-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 8C4952694FD
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
v5:
 * New patch.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 1c5083a48561..c779bcc4028d 100644
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


