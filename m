Return-Path: <linux-renesas-soc+bounces-30526-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ej3UB3+ux2l8agUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30526-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 11:33:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B08234E180
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 11:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF4A2302712B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 10:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6721A31578E;
	Sat, 28 Mar 2026 10:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEl1+sBB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D981C257821
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Mar 2026 10:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774694011; cv=none; b=eMyf4pt0wfGl3Zkq+mCWdAYrxdx8WwjbWvz3r7qCWIKT4GxXnUORjltPabU7U5yBPkiElOgPjiK5y2ZB5DYR6NyX1mj7BCZr4hydY3a0aBxLA4q9ASbKbdzN6UeVrpknvbGCmGJXgXs5GsS0rw0YPoY4w0iqf4bcGXziKbF2v6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774694011; c=relaxed/simple;
	bh=zIXN1eOSFxHm08xg/0aS9h67G1NP0b1qZaBd3UKNS2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U3/f1bp3mayTTm81pois5maw70hlc8vqctAuIMiQrdBIrEuTobi7lJDDGjTK9MGgZToQHYi+kfvnNxNGlBQ1uWNHd7F0nP1P/G9Ba0olu1mjanslaxiYcMvuIvzgasjNueg/i7OWrFjAaYz1zgeKwWc0kbL6xxS0943QhBr4xBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEl1+sBB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fda2a389so23263835e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Mar 2026 03:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774694008; x=1775298808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/W97cpYOeY9DEXDRzpvu8BXZnfFoUWnEBDpZGzN5QQ=;
        b=gEl1+sBBuNBnhGplr+iVCPiCl9oZFLVjux2D1y2GP/4QPAG8CgPy1VsCGjlV2bDOhb
         +CybSDB2V6mGcDszuFOgkrMhjbC2DGfhLySH17IhLXPgjWpvk/mqYaZzjJ0M6b5XN3so
         kTo9OdL0/hF2ZxoAsw0Nqlby8hoIYbX2latE4jmrz3tHRT8Qq4yVRuK4OU5xxrLkMdP9
         pfQizaKV3EFgZNrkqW88T4USHU0wlQ31ThqZb08biFxoZa8r8tkVzl57LNUxWh+pugKq
         4zsJLd1qavfvQhxsn4jaL0bkddW/rj2sDcgm2NwNwqFkkeCKEdXTfT9K1NnHfbfumJOk
         TGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774694008; x=1775298808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5/W97cpYOeY9DEXDRzpvu8BXZnfFoUWnEBDpZGzN5QQ=;
        b=XQ6l73QeO/iTuuM4SOwGfCI3fPgYQGR7t6TgTXUcoDdAbv3W+czVZrvXeiJaLhGV4G
         pUQRQnST6zyuorWTXf+4UeGnuUotib6au2B6nRW5J1yzMgCR0CuKBIOb7RUaaj1BQMbr
         JXf4fnvDgG+hNtiDR4mTbYBcZEnMtJK7qqFGe6mt9pbHJAqfYWDPn5TllNb4vXil2Pa3
         xmmPKYEA+C5hhIUMSBI1DHPud2Ey2VvaN7IN3kzbyaxOMmkFjVxIH1/fB5UD9e+psPhx
         KTOOX6cPcOLj1ILApBF55EqJzQic1ddjAc1j9bTNAEuGsj+7UpDxbNvyFOt4vNSBhVQ5
         wdlw==
X-Forwarded-Encrypted: i=1; AJvYcCUv4wA+vURgSnYSoY4XKcjtMyTJBfoG+eOuCSBvGJTW3tQLrdRhUhqGLQKUKXFNRIF28ky7/Lvu7ypbp362JYrC9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwogCKp+rCvFLYMXj37uQ+BxqhfoScZO+AIMxtL5ikhNcC2VpUR
	wSBgUhLl1x7CX19cyOLgNoArT6A390vS7s0YBvskuL622Xta6uUmKagD
X-Gm-Gg: ATEYQzy3/OJY84jlV6NJsMLTAZ5nJBEo6xqmItUIa4d4sgHIDTQK7haaQvtjNntiZmB
	P7Edsptw52E0koklXC99FZeUF0zIyn/LRr7C4Uwv5RJ2QryvJWkZXPMsqrtv0mW7yzz4sxGmSH7
	wmo8dh7hJCkK2oNKzXlxnU3MWgiXkv0oJcTy++I42h/sufchsi5qUK3v1BFmV+SEnwJtvOfKAgc
	a41iATTpLGdqCe646iyDvzTHdmGR9B9TWC5O3jiar9LyP2SHbREpBMEIKz5P6EQ4zLtWQ6YcuUh
	Tucr7Sn+JuN0uX59UWUNmBlhB01aNlfeKqmQfczIppfCxTwT5mLwFgFRvZDUkvM5suNFuKbxvEQ
	nyezYWTdCuWwereRHI+xmInE6vRl+PtjclrDN1211BOo1yVXFZNnSXZPTWpzgjZh4mmK2KUU8Ut
	b3bbIjmDU/JzGr9+t1oWGae22ftpNwwFkYY2QXCSKYYc91vghX
X-Received: by 2002:a05:600c:1d15:b0:483:703e:4ad9 with SMTP id 5b1f17b1804b1-48727ee9b10mr91444565e9.19.1774694007925;
        Sat, 28 Mar 2026 03:33:27 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8a55:5310:98fe:930d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487270fd880sm42270035e9.8.2026.03.28.03.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 03:33:27 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/3] irqchip/renesas-rzg2l: Fix shared IRQ bit not cleared on free
Date: Sat, 28 Mar 2026 10:33:18 +0000
Message-ID: <20260328103324.134131-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260328103324.134131-1-biju.das.jz@bp.renesas.com>
References: <20260328103324.134131-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30526-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6B08234E180
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Calling irq_domain_free_irqs_common() internally calls
irq_domain_reset_irq_data(), which explicitly sets irq_data->hwirq
to 0. Consequently, irqd_to_hwirq(d) returns 0 when called after it.
Since 0 falls outside the valid shared IRQ ranges,
rzg2l_irqc_is_shared_and_get_irq_num() evaluates to false, completely
bypassing the test_and_clear_bit() operation. This leaves the bit set
in priv->used_irqs, causing future allocations to fail with -EBUSY.
Fix this by retrieving irq_data and caching hwirq before calling
irq_domain_free_irqs_common().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index f5c4d7e0aec3..3cc1efd8d914 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -699,15 +699,14 @@ static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
 
 static void rzg2l_irqc_free(struct irq_domain *domain, unsigned int virq, unsigned int nr_irqs)
 {
+	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
 	struct rzg2l_irqc_priv *priv = domain->host_data;
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
 	irq_domain_free_irqs_common(domain, virq, nr_irqs);
 
-	if (priv->info.shared_irq_cnt) {
-		struct irq_data *d = irq_domain_get_irq_data(domain, virq);
-
-		rzg2l_irqc_shared_irq_free(priv, irqd_to_hwirq(d));
-	}
+	if (priv->info.shared_irq_cnt)
+		rzg2l_irqc_shared_irq_free(priv, hwirq);
 }
 
 static const struct irq_domain_ops rzg2l_irqc_domain_ops = {
-- 
2.43.0


