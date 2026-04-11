Return-Path: <linux-renesas-soc+bounces-31170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCReJk802mlezAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 13:45:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AA53DF906
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 13:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A4293078431
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 11:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1873446C0;
	Sat, 11 Apr 2026 11:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LWK5zAMA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3468F340298
	for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 11:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907798; cv=none; b=Gl2WDcia0Y0bLolxQQ7yoUnOb71GQCkjbsgxoooJD5QeZvJ/crOSVvgHb9nw7VWsiIKKRbz+LxgxCcLzDjDZ708pOFF+FvSoE1dk98UM+EFOsqrA+jWITek+sRLrPYZEKr8bcOnAfxBtN6JMzjUkGeeaFZD77sL19JhrNOOzhq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907798; c=relaxed/simple;
	bh=gmR2MVgWRVwxG2GLS1GQZ1Ib/I0giv+IntwWqRZ8pCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PnGa0OidwbK64YqyXgQOon4IZTOTwytpHZF41rmQ/YG1MuKMXCAskQai1QxQyANCZ/U6YTfdoh7wVfcI8PGMHdrUp42tvPtZ+z6ZealAs51mksD+AfVpkKZv1osbPXxFTwC4OL5s0HF7toG9q/G8GSkwCYkpCC+wHFo1x0SwOMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LWK5zAMA; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d04fc3bf2so1683611f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 04:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775907795; x=1776512595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEklTJzShDhVfSMVqbktdCdKI5vT2XbfZJslRpJnIVQ=;
        b=LWK5zAMAs5Qrl1Q/JOXtiW2AyxCvqFKJHYeCsBZ2SPR/cN2cMKxQ80H+jKARE6Cx3F
         Ni8HLEOvVriHKK7lCRP7CXIEFtHD17VPnuQvGYajQOtRgtwVDtU6m4af8ffmRt8EyjRk
         FMFYNFNM3WYUAm7fFe4rEJQS/P9s7KAI4bjfzxXriAhK5EZhtUvzwXY5rZFUzfo3MQkG
         7255XWamcLGLD/ykQFcaQ5dS29M2cnkhFpRjjedzK7l0Y6LElbZDFDt762qZrVLf54oL
         R4GTYMKVsH7W6qtxwx8OlxjzjVD7umaqLRgRICDgNqGIg/VGdTUDb9YEsEyZdwpAnSM+
         RbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775907795; x=1776512595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uEklTJzShDhVfSMVqbktdCdKI5vT2XbfZJslRpJnIVQ=;
        b=lKRLmZDYJGadSYMeqfoWpLydZu0eKz2TszqoR7LLZ6oFUNR4I1t8b94yGKIKYah7O1
         bu+am1xbvmJGkEygTER1MWrhJ3k92KA2MKhtrMSSFaXLFoS7DDTU5mQ/sy3X3zwpnK4w
         itCYkklAKXtsfu6BO5MvtR8Is+QMH9y2dvkDHdgn088VaWl/tk94jIeNkPSTfyruthY2
         pG52WuFx+EYdtl1d1Od0+8p/1UQQNMP5HlqIqwphy8MJGLeq2RMk083gxzYcHrbhI+uL
         okOuDxTP1AqndR2xW5s4IbHNYCZ2hZZo0l8x5RHV6VFuQYJsvXVrp4ps4SrWMZimqit8
         hDDA==
X-Forwarded-Encrypted: i=1; AJvYcCVEdtNuTIBdzNuzeoc4DZlM2R7FrXc5om2aZ8mN2cg8XudUT2/IGLM/Yg7ntX+fZV4GjLQOpGR780SpTsfu+fbBbw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxcu48o9I1S3pXg5RKgLOuznm4YAu27280NxObD9AVnjkVcXKA
	kJvZpH3uiZuR8ivFhJ/5fi4d5n5QMMLTP4aUVjvQh+OBfCPBDYD8f8gbqVQQqrtCIyQ=
X-Gm-Gg: AeBDiet8nW/qBoyzE8N1rKvFsgOiqPCfbqpJgVjiNh/P9fDPSwy6JBr9Zlc2eUWibPN
	B48rbvRqMz71Ylnv1lc4wHoz9/ZvXPlt0zGngZKXfOy0cTPF2F0fY4GzXHCilmiXzG3J/2LdGMR
	IBVvVFbDTJs/Sl77ZvWl0kxTXV/QduHoA2Am3p9Ic3vIARWL7tGBX9TUv6yGfXpMg4kex3IzLI8
	RHVV9K5YA8fSp3HHP6jU28LylppXJTKvg8VNTJewMUL5sv05pk7OktQT7wLt91AhRJx9uRaDLcE
	Yw1R9YUN9T6uboM5mwHqnqwWQ5r0CC/XKrcSz+I+OaOl4XgjNGChrTra+Ugn25ymORBrXMOo+Yv
	O/yEEAoJwQxkDzSXvxheVmuCn1ez7UnpZpNbIwsp4QwT0hSfYXSmSstdwWOxM4bU6cDfW/3AODA
	iTB6MMs6kQaYcpI1X2SlhVQu4VyvNXAWgTfchhe6G95VTuPM+dw0Co
X-Received: by 2002:a05:6000:208a:b0:43d:1df6:ea9 with SMTP id ffacd0b85a97d-43d642c0938mr8925884f8f.40.1775907794662;
        Sat, 11 Apr 2026 04:43:14 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm15776447f8f.33.2026.04.11.04.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:43:14 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	fabrizio.castro.jz@renesas.com,
	long.luu.ur@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 04/17] dmaengine: sh: rz-dmac: Use rz_dmac_disable_hw()
Date: Sat, 11 Apr 2026 14:42:50 +0300
Message-ID: <20260411114303.2814115-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31170-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,bp.renesas.com,pengutronix.de,glider.be,renesas.com];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tuxon.dev:dkim]
X-Rspamd-Queue-Id: 20AA53DF906
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use rz_dmac_disable_hw() instead of open codding it. This unifies the
code and prepares it for the addition of suspend to RAM and cyclic DMA.

The rz_dmac_disable_hw() from rz_dmac_chan_probe() was moved after
vchan_init() as it initializes the channel->vc.chan.device used in
rz_dmac_disable_hw().

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- in rz_dmac_chan_probe(): moved rz_dmac_disable_hw() after the
  vchan_init(&channel->vc, &dmac->engine) call as this is the one which
  initializes data structures used by the debug code from
  rz_dmac_disable_hw(); updated the patch description to reflect this
 
Changes in v3:
- none, this patch is new

 drivers/dma/sh/rz-dmac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 1717b407ab9e..40ddf534c094 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -873,7 +873,7 @@ static void rz_dmac_irq_handle_channel(struct rz_dmac_chan *channel)
 			channel->index, chstat);
 
 		scoped_guard(spinlock_irqsave, &channel->vc.lock)
-			rz_dmac_ch_writel(channel, CHCTRL_DEFAULT, CHCTRL, 1);
+			rz_dmac_disable_hw(channel);
 		return;
 	}
 
@@ -1000,15 +1000,15 @@ static int rz_dmac_chan_probe(struct rz_dmac *dmac,
 	}
 	rz_lmdesc_setup(channel, lmdesc);
 
-	/* Initialize register for each channel */
-	rz_dmac_ch_writel(channel, CHCTRL_DEFAULT, CHCTRL, 1);
-
 	channel->vc.desc_free = rz_dmac_virt_desc_free;
 	vchan_init(&channel->vc, &dmac->engine);
 	INIT_LIST_HEAD(&channel->ld_queue);
 	INIT_LIST_HEAD(&channel->ld_free);
 	INIT_LIST_HEAD(&channel->ld_active);
 
+	/* Initialize register for each channel */
+	rz_dmac_disable_hw(channel);
+
 	/* Request the channel interrupt. */
 	scnprintf(pdev_irqname, sizeof(pdev_irqname), "ch%u", index);
 	irq = platform_get_irq_byname(pdev, pdev_irqname);
-- 
2.43.0


