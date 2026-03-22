Return-Path: <linux-renesas-soc+bounces-30069-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAAMOjThv2ml9wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30069-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:31:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 973832E9384
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 730C7304FF9A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 12:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAAD93822B7;
	Sun, 22 Mar 2026 12:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wn0FaM/Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13792382296
	for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 12:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774182276; cv=none; b=pA0PcJYKXf88DL+e7HFL2PMMpaHW+y4sCnsR+eKw9QMEw8pl5q23FejyhRW2phfKqLSfZNnghXaZB64o3ZFtLtemRMu8qsQ/mpNXOnoeN0SlFSu4oGs28YeYrczwGmfWWBqkAS9U2fBpHz8T+LWjpD0W8zxrL0Da8w6sJtZhrrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774182276; c=relaxed/simple;
	bh=0XWo6QwMNSzFLNGlc54LjYgpN9pg0m7+EFFpEd5JzT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=spm2595gAeq6QhpvrYjxSrc6me+HT+Q6fvtsLpDcWa2IRDVeZU4XgzfRM06c9BlLrdOIufd7uSbuIL5iRUAHS02/Yncvayukq7MFgXksEGwQuVt+JRrQflLKDrsoPoXm9dAvGMItpbVKIj31pf6Jzmfgkq0r0iZIiQ/24/wr/NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wn0FaM/Q; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so17461425e9.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 05:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774182274; x=1774787074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NdU9IK1zXt2LOJRqNLkN6I6YWTD/eeOJBLTngDVgk4=;
        b=Wn0FaM/QYvwwJT9L8uJNVsKoTSK0UVGlQYwXu5rxgU0zWUm+XbGKS4Oj7YgLSYob3v
         n3Qp4z4D1ePnfQ4CU6WC9207g/x1yFw99tXcaHTzg7ZNYm8I1cDPRnVjM+IeMc1kt3vE
         uyMJv50cdJEB2EZtCNr/oxwWFuI9PTKRZ7YkgnQ+pJ8yCpspF/loca+E4PUJYgSIzkI/
         fgMVSYRqsTRRuwOTPl07x93okr27VwcriDUGsUBiQD8fDDwQTBSrVzXYj1cvNdYUrJvZ
         YBX5VTe2cr7hR3zbRypT3JWW+OTMJjZYZ01Cb4luiHkM32Nefz6Rwl8slYSsMtCJfX6C
         p9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774182274; x=1774787074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8NdU9IK1zXt2LOJRqNLkN6I6YWTD/eeOJBLTngDVgk4=;
        b=EjuS83lemfRmDMYyLFw2VXHvoMwSVePr/Kz5Xy6ywwAaNLF0gpCWMx7OU5qKBSEqWu
         I4WbJTN+TAUOT5yQVXRcLXZ2wfxFx2qEIHGj6rVVvBGhKhlu0pw1mqdy8o7KPbP2i+Ci
         nj+XoYZ2YzBWVnjNjDrWVi1DxakRZooaWh+Zc+y1uzX3kifTQhVuOHzgiz0Fkoa2mLXI
         Lj7VFv+FIcYOZXOLhdEEXcMsIBWQ2isMJ5BdKyPATfsrjpT7PfbTjveb/VvK1mgVTBI6
         MHzYSBH2zylpZtg34vOdohgn+dpU8O8ia/4vEktu67M7e1Jjri6dReIzsiaW9hG3pHuV
         0z3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTl6XVk6zr9gWRt8VbMX+UpV7gg6tyJ6WAFk0iKpQ3omPXW8DHnfoj3xWgkhO+0mi/vpwhSVk2vrMthZrQNS3+nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRe8VG29W4AsievbgMpc/SP1+6FZBUXWJZq02rdn7foCQQ/I9F
	VWezAIeQVK9a0mJQ+ZIff7TsBzcbARcspx4gnn1TQ2HItVsmSeL75jck
X-Gm-Gg: ATEYQzxJLUHgnnp5paD3+Qp6Zw3APpKnLe5RFX1K4Kbr8KkWc9sBHx3w/RB3ejAzwSS
	3b/yi0c3KlPCCKUzAylWfG0DNC7SemscHy7qybuZGJFTAi0b8YVSjS2QxaxIbn6McAzxLOYEBWz
	D/CajVrX8VNdk2/wxrwY+s3GolrELouvqmuJBeWKX40J471B84M6wuT8evqmj/KchGM9w4AvU7C
	rpnp07f1+ccYP+OLYs2j2RzMP/EhEqgY+zV41iLebK/wHR2w7dLmIerawPAroDtjogwla8qtKVB
	6L/VzFTpIIWl4ASR3nosj4yooM1Rj9cBTbdrNGLQTG4wky1kQIzRZIfYghtOyb5Lm6H0ckhiZ7U
	5mBPR+hP7X6fQtnjosBqfvkAFkImsbbuzvhskFBcIN3RLulBwOxwTwnOoYA1AROoWrqeuyVoM95
	cJ8chjX9z6ZTA8Od6e2IRI9iUuQTbk5Kk2zHWUS1EcSz7KKmXj
X-Received: by 2002:a05:600c:5291:b0:485:34b3:8589 with SMTP id 5b1f17b1804b1-486ff04d42fmr130918315e9.31.1774182273540;
        Sun, 22 Mar 2026 05:24:33 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1bdc:7f84:18bc:1e56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703343sm21072695f8f.19.2026.03.22.05.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 05:24:33 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 10/15] irqchip/renesas-rzg2l: Dynamically allocate fwspec array
Date: Sun, 22 Mar 2026 12:23:53 +0000
Message-ID: <20260322122421.132474-11-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-30069-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 973832E9384
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of interrupts in RZ/G2L and RZ/G3L SoC are different. The
RZ/G3L has 16 external interrupts whereas RZ/G2L has only 8 external
interrupts. Dynamically allocate fwspec memory instead of static
allocation to support both SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * No change.
v4->v5:
 * No change.
v3->v4:
 * Updated commit header
 * Replaced IRQs->interrupts in commit description
 * Fixed the typo Dynamicaly->Dynamically
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/irqchip/irq-renesas-rzg2l.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 0b1bad002653..cf0d45c40083 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -81,7 +81,7 @@ static struct rzg2l_irqc_priv {
 	void __iomem			*base;
 	const struct irq_chip		*irq_chip;
 	const struct irq_chip		*tint_chip;
-	struct irq_fwspec		fwspec[IRQC_NUM_IRQ];
+	struct irq_fwspec		*fwspec;
 	raw_spinlock_t			lock;
 	struct rzg2l_irqc_reg_cache	cache;
 } *rzg2l_irqc_data;
@@ -632,6 +632,11 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 	if (IS_ERR(rzg2l_irqc_data->base))
 		return PTR_ERR(rzg2l_irqc_data->base);
 
+	rzg2l_irqc_data->fwspec = devm_kcalloc(&pdev->dev, IRQC_NUM_IRQ,
+					       sizeof(*rzg2l_irqc_data->fwspec), GFP_KERNEL);
+	if (!rzg2l_irqc_data->fwspec)
+		return -ENOMEM;
+
 	ret = rzg2l_irqc_parse_interrupts(rzg2l_irqc_data, node);
 	if (ret)
 		return dev_err_probe(dev, ret, "cannot parse interrupts: %d\n", ret);
-- 
2.43.0


