Return-Path: <linux-renesas-soc+bounces-26671-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEDDD18F48
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 13:55:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F1B830382B3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 12:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99BBF38F940;
	Tue, 13 Jan 2026 12:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMnVnuJb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C59F2BE04C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 12:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768308801; cv=none; b=pMujdv/3O5T/IapOqjqGi3MJebHb04TPD+Tl5nRz7uDrSwkIvcrr1fmOAKXuErl0gsxljou7902UAZArfzthLVYTFaItfR/rQ51eGBOEywTmiGZyDd39j14YsgzJ48fInEu/Ox+FArwhC23aqTCgst/aXQii4B8oT54G5QKiTbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768308801; c=relaxed/simple;
	bh=RBjrxpw6rBeWzaUv22y6Mivq542Mk1uYfTYzGXgu+V0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CREu0dRJAqjTP3REZlxgjmKf+nAiqlwYGVkKbws/4V1Y/qb0a7McBN2f7786eDp3dd2XGLUZMNL6Ff+LIshLakTTlH11VXkChOxVtEBDrUGH9nwAN7KTUmNzWVaUpXWBf/lSQvVJfoxa08+dPiiRnkIGl1uJvDoMzlbcbNX0lbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMnVnuJb; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso68885805e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 04:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768308798; x=1768913598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzJnVanZSGuF0ZOAEYYBK7FYXPM3QHU28MIcm0ORk/I=;
        b=BMnVnuJbqZf8EvGmjmOFDni/h0x7trXPdhK3K8eqDhntAc/+SzbLJgdg6xPum6uIqq
         wp3n7rHLrHHzS8/d2tgkVsq6kDSsf3LwVaF8gDiZcL1VDtSSLKqe2TCUktpGfhE9+y4n
         9BeR9CY4QO3VkD/tzOO0tsNezjTLm4OL0EpDxmWhKhqDfxEmXchQxi8ILNaQX8DvuGA7
         PlxeHxXtd6eeu6+lRFI/4CfYWTvMyzdvWNUG3LT9+Lu5TVUif2YLtnAgGmHt4FKWL+29
         Qm5Edtk2MDAi4FaIZLAf2TrGSWjiJ8jCU5HMw65cgEnVXAvaAxgBq3upM45xRLAntiyo
         CAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768308798; x=1768913598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hzJnVanZSGuF0ZOAEYYBK7FYXPM3QHU28MIcm0ORk/I=;
        b=US9N/rXQGsMy7iA/8iuZwJqTSTcVLxw2AoYhJJe262H6LhcGoRXjDUzoQrlGoZ0ory
         TDd1niNjNULjkoTMvZEO8Wh+ZRQ1ZBxT/UyrejnIGoMLkwtrjEZGTKmTTVnze3s9coKO
         XVv3lCJUNftT4KNLrOrUQJfp356S6GCMimO2iQqJtLNaMLr8cExJRumwv/7ijN+2qZjR
         yx6gJ5+QB4On2XjCGlpIYrTZMhebb/l4BTdcLBxu9+qONsLTGGJWNbxKJOQ2fsYPZFLK
         c4YYYNmKCP4VCmunBSkb6EVNRefWDAp+tMtA2pFNJ4raaflsW2WC35lCDTUDhy2GkfTc
         q24A==
X-Forwarded-Encrypted: i=1; AJvYcCUH4IRRM7LJA/P1BTKp7vDdKRIfiUlGN3fswMHjtI8aIHitLaunxPWzwNQ0C123owMrK91MAZSdbJY21ux7HhJE8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPllUWdbXlhhpMiLwnoWqSWHSOWJVTQ6O7M4pzLUn7AhBaYs0p
	k0MRNqZ0YKkXAUgOFTktYgkmSmd6S9GbfY/tUH/VAbJUjAjBhpP/LghJ
X-Gm-Gg: AY/fxX7/30CTh68PSouhok53M7viPXKY/12cP59uhqOnc3sHoWW6OVJaUlB7f//9t3B
	w5fh/6zinpcN3VGFwfMMZLR4AK+4OXJ8qwQ8rCr7on8OY6QTgiQEbPPYbwx6TlhH1B3imbYUe9l
	CFu8szMKSs21aWy3fOaCskngpBxCGW6KAxRyL5uzAewCKcEHAdth/27M0jc/lvpGPrnUoQNvdxU
	5ch9p+peStp5bAJ1TG/oDV4YNOQDLhetCW13YASMdtTgRX1ZiaFT1AiBLasqG6nf7xOC9RRJq9k
	Wqm2iouUv2UMRcm8We+DinaLicM68iAN5qa4PZi0xhk4YaYo1HBwYOFW5xaBTDheUdJ4Wx3Es1M
	g5KWDBNgw5DoovG2W+MVDBPEmH/solJhj5x4cdUUwh6EGQkUSLYExSRvKkN+Flz2f+CAuwKTbdg
	PdLEPd5OnR4D2W/wJK26xx+1/MnXeA
X-Google-Smtp-Source: AGHT+IGOirOAYn2tzO17vJ9z9ef1/cjsrZEx6LmVqf11RdruY5oxxpOp9DNJ6gh/cAuMalGuZiZpnQ==
X-Received: by 2002:a05:600c:3555:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-47d84b3b692mr291376505e9.31.1768308798268;
        Tue, 13 Jan 2026 04:53:18 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:6e35:f12b:dc2b:8e25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f4184cbsm423744265e9.6.2026.01.13.04.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 04:53:18 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] irqchip/renesas-rzv2h: Prevent TINT spurious interrupt during resume
Date: Tue, 13 Jan 2026 12:53:11 +0000
Message-ID: <20260113125315.359967-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113125315.359967-1-biju.das.jz@bp.renesas.com>
References: <20260113125315.359967-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

A glitch in the edge detection circuit can cause a spurious interrupt. The
hardware manual recommends clearing the status flag after setting the
ICU_TSSRk register as a countermeasure.

Currently, a spurious IRQ is generated on the resume path of s2idle for
the PMIC RTC TINT interrupt due to a glitch related to unnecessary
enabling/disabling of the TINT enable bit.

Fix this issue by not setting TSSR(TINT Source) and TITSR(TINT Detection
Method Selection) registers if the values are the same as those set
in these registers.

Fixes: 0d7605e75ac2 ("irqchip: Add RZ/V2H(P) Interrupt Control Unit (ICU) driver")
Cc: stable@vger.kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzv2h.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 0c44b6109842..9b4565375e83 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -328,6 +328,7 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 	u32 titsr, titsr_k, titsel_n, tien;
 	struct rzv2h_icu_priv *priv;
 	u32 tssr, tssr_k, tssel_n;
+	u32 titsr_cur, tssr_cur;
 	unsigned int hwirq;
 	u32 tint, sense;
 	int tint_nr;
@@ -376,12 +377,18 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 	guard(raw_spinlock)(&priv->lock);
 
 	tssr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
+	titsr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TITSR(titsr_k));
+
+	tssr_cur = field_get(ICU_TSSR_TSSEL_MASK(tssel_n, priv->info->field_width), tssr);
+	titsr_cur = field_get(ICU_TITSR_TITSEL_MASK(titsel_n), titsr);
+	if (tssr_cur == tint && titsr_cur == sense)
+		return 0;
+
 	tssr &= ~(ICU_TSSR_TSSEL_MASK(tssel_n, priv->info->field_width) | tien);
 	tssr |= ICU_TSSR_TSSEL_PREP(tint, tssel_n, priv->info->field_width);
 
 	writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
 
-	titsr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TITSR(titsr_k));
 	titsr &= ~ICU_TITSR_TITSEL_MASK(titsel_n);
 	titsr |= ICU_TITSR_TITSEL_PREP(sense, titsel_n);
 
-- 
2.43.0


