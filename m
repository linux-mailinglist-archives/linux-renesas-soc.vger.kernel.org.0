Return-Path: <linux-renesas-soc+bounces-30546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANGuNCUGyGlggQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 17:47:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BA334F357
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 17:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 111133017252
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 16:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD0813B293;
	Sat, 28 Mar 2026 16:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E93zJLHk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B1339FCE
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Mar 2026 16:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774716451; cv=none; b=n8r6zfOte9SUYLlAiBttztPn2jrzhyRMBvZVB/66bw+5YeX4/pCPkCfwUeCAgWQklHCjl9bubsk7ftiXq1+lV5cfNcB0Rovowc8TLB1eD3IaTVSQCGfVwmJMGU1otxonb23O1X6LQjQ0sR08ewnpV3y5fdcjy3i5aGrYdODV5Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774716451; c=relaxed/simple;
	bh=KvfJRp0nUStSKRhrm3jt/wT14zOGyFLEzceS3aiuksg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KmCdAp2SxcJMDah8nIJDGwtCaD120WnOF5yDJgFywlZ/DlBGKWrXiKvS6v5W75x+8l2scipE2ojR+1GjovPUcb1Nml4BaRh2zBFJlllD7GKZ3+UC0Iw9snoXe1TBTkR6eMZp+5qh+o/zRHiLqw7Nf//ZZxtiDefdnFhq05xOs+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E93zJLHk; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66b32fd9f26so2161790a12.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Mar 2026 09:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774716448; x=1775321248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpkfLhVlMgxKNy+AHa8AmXlRoOSs/MnBxA/WI7MP0+I=;
        b=E93zJLHkD1CQQ75OD4VJVPvK5uToCztBN4k6I3UK8YKRiOji5pjBigG9N+gO6yRmg+
         2okcCQM1SAsKnkxBby1ZdgxI667/ZUtme0+Tycu36sazbKGoTzuTbEGSGLC0VWPiQPfF
         VVaQXoVFMVft/g28aF7RX7H2/4ebbZW2jdgfa62FFdRmdFak3IMEWypfi/KGE3eGnOBQ
         WahxVjswEe79eB1z+hBzk9WgpNmQYYWLs2jpBPKPo4/FQdn4vwuKaUdQV1NcQWTPeTo1
         npr6541c+fiazqPuJEAs7jC3tZAXqnWfjG3fOl6XPTdqY3uxyk/WLhdD5S4bFWRgmrDE
         70wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774716448; x=1775321248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vpkfLhVlMgxKNy+AHa8AmXlRoOSs/MnBxA/WI7MP0+I=;
        b=DgIhLhifKwV+PFnihRv507z3vP5x1jx/QEDzjitYDHj1hKI5zL24i/FwglPzD4Gc2+
         2LYAC4hwTSb1M0PyckWub87RaThbwKfgT5NuVxjrYjFlwSkr1iqCX9BjKb22a/CFBXhY
         F/DoY5BjHPSTgDgLAdbuekc4FXsDWAqP98GHhQVwJ0lk7pGA+LXG7FzYXEtHzjrrxgrx
         hiXENJEJTs7d6MfeMH0UWc4VJQPrUtwKDjF8friWQHKNKqlbVysw+9wce1gbNLShZ0JK
         XvSZ7Ao2MIlSnDY4GoWQRZSP9ZnoWnwibEooOdA7yh/N14UgS0uG2Vdb0mMfwmOYND4Y
         S/Gw==
X-Forwarded-Encrypted: i=1; AJvYcCW/3USWW9GoNev986Pu0U3BxN1FpHhr7uvaQ28m0z5KHjL2MIo5WomqdMGOA50I88ZH8lGpUNucpfnmLFkIEhuNAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcPSQEJuC0wgybKDvIyAk1TITm0z9hEcs7+KdSxDxJVV1f6kvD
	Zz7ACNPoZpsISI8ZKQsnAOUSJfUiqMDwcsxi1lDlHNeJ3x6WXl6sswma/XtXtA==
X-Gm-Gg: ATEYQzzlDCNUctZnXWXtsIpWXl4tOm1bddqR/oncCNmXjnpFarOw4kEZvpQvLAzrOIb
	94NJxZPEV9ajg052xAQdC6pi40gfBPcQQQepStbKQzEyuG6hTBARZcvB1BnP1cJEmmlVI/yDezV
	LgPcKYYUSBcUYIpRKkyM+wvvRrH/isd3G1wr/5+zJTC8osnKCDXQPHZP3z85PFzK1mwGno8KfU9
	1i0P6LJ/8/2agMF9xmAMxJ85f4w8LqffRn2s8NVGIGf/itrk1lcioOTFFNkT6IWN8fjxyFGMuuY
	ePbsGB31Api378vhbWlxKZXrVmD+/vjP7MSTanJQRLbj/dzRryLcNIOaoBv7VkXo2sp6ui1NZWx
	f5nBvO0vyyQtPVywZ76oSlzsbM9J3xd4GqF/JiXTSehvN3h/4szPN6aUEx4G2bsEyoUuHT539E+
	RslF5D1radh3Zg8oZu75skbHC2kAunBvdIFMMMb/mgNW+5tERG
X-Received: by 2002:a05:600c:c172:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-48729109ac4mr74822815e9.10.1774694008610;
        Sat, 28 Mar 2026 03:33:28 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8a55:5310:98fe:930d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487270fd880sm42270035e9.8.2026.03.28.03.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 03:33:28 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/3] irqchip/renesas-rzg2l: Replace raw_spin_{lock,unlock} with guard() in rzg2l_irq_set_type()
Date: Sat, 28 Mar 2026 10:33:19 +0000
Message-ID: <20260328103324.134131-3-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30546-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 55BA334F357
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Simplify the locking logic in rzg2l_irq_set_type() by using guard(),
eliminating the need for an explicit unlock call.

While at it, add the missing cleanup.h header file.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 3cc1efd8d914..0f1157d5ce55 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/io.h>
@@ -373,14 +374,13 @@ static int rzg2l_irq_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	raw_spin_lock(&priv->lock);
+	guard(raw_spinlock)(&priv->lock);
 	tmp = readl_relaxed(priv->base + IITSR);
 	tmp &= ~IITSR_IITSEL_MASK(iitseln);
 	tmp |= IITSR_IITSEL(iitseln, sense);
 	if (clear_irq_int)
 		rzg2l_clear_irq_int(priv, hwirq);
 	writel_relaxed(tmp, priv->base + IITSR);
-	raw_spin_unlock(&priv->lock);
 
 	return 0;
 }
-- 
2.43.0


