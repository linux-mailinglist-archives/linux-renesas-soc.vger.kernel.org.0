Return-Path: <linux-renesas-soc+bounces-29245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GG4yM/3BsWmdFAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:26:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5372694C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B34D331825ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 19:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7E8375AD7;
	Wed, 11 Mar 2026 19:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJEK3wP/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56AA3290D8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 19:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257107; cv=none; b=vEtwtoP6kTj9Fp6mi9PnZ4vIFlrXPmbMQcEuA4CXVEzRvKw3r4tPB63e+ckRexLxY5sxoTPwO5rqSfcCW4need0Vg6KYthMVFUYCYTLsVTJJMWUdmFBcTfl8Pue97IDLrqPhlUni3d9GSo0Mq7jDTW2tdfHoQY7XDsndm7AyMJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257107; c=relaxed/simple;
	bh=xKHRn3RNcVtUiNIL/eNizfyjOoN4mERcnoooSjEnW9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c71Tn78oSlL34lUqXaflrldYJuCikPyiNX15RTk0FkRLlt+Vlgf2DIZpdrgJ1ve2DqNXqWk9Ukwxzf95vk/BD0T9nJHMoG7L5F5wPqlL5L9iyU1HbstUYNEuXx8C91+zYCU9jHzFJMqvlb4qYCTMQqZZLtsnu5z7FPDjRMbTHbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJEK3wP/; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439ce3605ecso201855f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 12:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773257104; x=1773861904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8F6HhvqhQOM/m0xacwgmagy13b9e+xAbi5NBHxIavIs=;
        b=JJEK3wP/Yk1/yF4DEJufev5rykwAe+QRVvgG3991A/83BMwoUSLTXNd6qUnV5BDuvO
         OG6jaIMjml4m8VtrDnfhItEHiz4G1NgI6mh9MUXuQtYcwwTqVRPrfznZnrxSUVJSsD9a
         N6bSjoT+i8iYY5VNI2BP49LSTegFEYUL9r7Wm3LCBbSolB8PQ0YMSqxKr/eOgJFxnSLU
         yWXpy7jGnkU7GPn+OcJUU1vkNh32pjNtlyntXPUs0i0hoqS/AEXbSC/r7JH8HH3CLATj
         5yiZcoPK4QSzXhBDoh2Tj/8UTmDsDth9c2OqS/45qImAISCK1QYMet7Z/R8q/a1WakjR
         rHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257104; x=1773861904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8F6HhvqhQOM/m0xacwgmagy13b9e+xAbi5NBHxIavIs=;
        b=GLtfKQZOZTei16XsicrlnsaWSUTyb79ORR1Oa5prLJjipJsL21/s7b+tq51cfLGC3M
         v37W0Br1gUDg73A3yAx1tbd1heiG6RcvSxjNvxykaCTMzajSEREnTanfx5WIyaxdg9EB
         C5jrI3keogUdgxSNJMbeTG7Z1WxYTL2r+MWj9Q6rvjZSZ+rsXOpLKc1N2v92HIO5DdIl
         UmKTnelFbD3FEoWDRgHUMAiwrtgg0QGrqAaOsAfgAfdeb8iOrHqoGE9h0Sw9Mt/9Lm4O
         VEAXB/w+XT06kVZyq+VT5ZqH4ZCtZfOWBrmP5sDYJMvZRVhXGwLxPatPD1L/BGoQVJOs
         PDmw==
X-Forwarded-Encrypted: i=1; AJvYcCWJI7lMu9mehAaQ2R+tllHX1ddUoXqOdcmXQcDmYofru45TMeEopCV4+XTnXSdQ2Sb+2Yb3FwIY+nYvy1IxCPCTUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWngB6S36+/2P9uR102sjuOw5q5oXUPUSBGtyeHUfPv2ru8cd6
	RlH4vUg7mTqzeOCn4WZYxhqjcz/XkNDdzOY/N6Z2ZmP1Bpay/14sAGYS
X-Gm-Gg: ATEYQzwvnvmpNRoIp72XkHEXGD4UiXarSNu2kmzaDovPcujzpkgWU9MPRd9s1D/lvO8
	cVAjrsLAmS2O2G3tVcQ1wr2E0E7IJBSZXYnXVpkkp/QRp9wMWspSt2acBhqlGFirAFMxVIpcDHb
	QceBBsNHwGagHV5G5fIpEKI+nMztxoNPmDUCExqwL4YwS7AMtiYeS8nttiuB22NLnOg/6JOnyPL
	m36FQNVfUgTkkcAZdDKjYo5Y277HXmsPbKAgTz4GST1yErD0bcMy1335WzyOAA8D/rmLxCCkrZf
	hz6PKl1TpV+IbYPgQ+AsxmHmMX4eH2yOQBq5gundFVcy43hFXoLherZVCVRjJ1KiVkFi4Zfkiof
	cyxRGyhvp1y+XO9sEtBYrf3HGwtPCShS0NFvZhaM5rF6XsovF1yF4S+sugNe9nAbdVW4FlEGeLt
	AhsZ15XX4aWhhX1ydqatRvnViBS7jyUi/EmFZ546KVSS+TSbip
X-Received: by 2002:a05:6000:238a:b0:439:d8cc:3626 with SMTP id ffacd0b85a97d-439f82231d9mr7658058f8f.48.1773257104244;
        Wed, 11 Mar 2026 12:25:04 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:38b7:8ca3:cb55:d344])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bd9csm1323210f8f.21.2026.03.11.12.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:25:04 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 03/15] irqchip/renesas-rzg2l: Drop redundant IRQC_TINT_START check in rzg2l_irqc_alloc()
Date: Wed, 11 Mar 2026 19:24:34 +0000
Message-ID: <20260311192459.609064-4-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-29245-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 3C5372694C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The check `hwirq < IRQC_TINT_START` in rzg2l_irqc_alloc() is unnecessary
as the condition is already guaranteed to be false at that point in the
code. The outer `if (hwirq > IRQC_IRQ_COUNT)` block ensures that hwirq
is always above IRQC_IRQ_COUNT before reaching this check, and since
IRQC_TINT_START <= IRQC_IRQ_COUNT, the guard can never trigger.

Remove the dead code to simplify the allocation path.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5:
 * New patch.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index e73d426cea6d..ed8044b0a339 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -491,9 +491,6 @@ static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
 	if (hwirq > IRQC_IRQ_COUNT) {
 		tint = TINT_EXTRACT_GPIOINT(hwirq);
 		hwirq = TINT_EXTRACT_HWIRQ(hwirq);
-
-		if (hwirq < IRQC_TINT_START)
-			return -EINVAL;
 	}
 
 	if (hwirq > (IRQC_NUM_IRQ - 1))
-- 
2.43.0


