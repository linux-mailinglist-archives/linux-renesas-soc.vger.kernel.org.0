Return-Path: <linux-renesas-soc+bounces-11182-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0689EB7A4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 18:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 660CC18871E7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413D186347;
	Tue, 10 Dec 2024 17:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BY4gWM0a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B0523A59A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 17:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850632; cv=none; b=LBFCCt3J1Qhp90umDTTTC2flch1ICsraTd9ZmQlrfjCAWBQzLoPzZ65L6vEzNY7LZxJIqu9wuQ9Hpw+xfM0u14nlc5EGqlbF7qmYDlWv2XV9eiAURVIXYuWUlFDMoDFqexIu7hjgCof4I2HyiZvtts8XgaxbFkurG0SJb4uRmlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850632; c=relaxed/simple;
	bh=cnajpc59mzRLWDYn+TlQEWJ18Tzqm1CRjbROQ6JPtZs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DIhyDMC4ko6l9oPcag4mirtTBeQXvHmYeDmbokAHV9XZMc4O5mawJKA+lBrC4F89OG8crRdV0ffxalbT0ycojLDWATpnakIemmOpAxaHPbShASMpDNsbqXKgkVGfCkEZZ040uHz6LM4y/+WyqFQtvbfzTP2Sv+e48G3ir4ycSNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BY4gWM0a; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d3f249f3b2so3606303a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 09:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850628; x=1734455428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3F8PzVf1JVHBMdfZjuuSPBsoTNCHuDc7mT2swoePkeA=;
        b=BY4gWM0aRKGmRPNfU/t17wSV6WCBMCbALqJIZ4xdnA62ORaysTgl0Mq1WJUkC/jvOe
         EtqPV8SeIsWUpXEHMdIo1c8ASje479H3/71wwqGhO3lmhIjeJ7y9U2kCThtRAxUGo+Y5
         9pl2SuPLNEF42r//twOOg5LRgNgar9DFo2waWQUjstF0PZZ8ZGD5IEaQga6RYBzS8aI4
         TuRFpVgkOT4HlZLzfo0mAsTMy5HkDY+bgcScK9oLG2PgCRL0EZphfkwVUSSU+n/Janrv
         ygBdWpp2fy6pVySIZmTqxnk1/CtHuq3Cc7tAAXkiQ9QZ28GURU+2nZltLA2fgy3btaMr
         0umw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850628; x=1734455428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3F8PzVf1JVHBMdfZjuuSPBsoTNCHuDc7mT2swoePkeA=;
        b=uLwTbO0nf3Cr7Gmnws/vtPsYnOMFvdeRsGVPLD/I3FHWcwvgo4WixwxQFQI2GEOn6S
         u8t94gRn4sWsADYhDfj+//H1L2ZWyR1NccB3m8oAHpq/tnnBXZlIWh1Q2hI/TniWQqJc
         I1Id/JIhv0CcPCTs/b8VB4oyRW1Z8SH2yN4++AcsyCStJVTPPjk3F39uC1c/9Y2fuUl1
         jRt+TXgK3KSLUQXTeMXhwo0GpTZ9NABZgldYaALoXar3FyCssBXcPp6FDeKv27sXvL+s
         MrgDh2jw8txhqRAplXVZUbm6yBCxhGoOu7yIbe2S8NAFYWz+w7sTQW1yu227wtIMFCB+
         k97A==
X-Forwarded-Encrypted: i=1; AJvYcCW0eDXenNNqKvDJTrjyFAmW2fvBEU4opVWal9E2vLdWHlwzAZM/bIeYc/HAcleXQQLGYJm50UcQfyIdAxbJCEKD/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzimtZSbhLRSs9xjz/OdGw5DRshLOYEjaFTXliNZUq8CKI9RMaQ
	0DAucgkRc7HUi8BHwVlVuaYsTpyK3JxHeezgWIfCk5qIOmAApF789aB8cfXHu3Q=
X-Gm-Gg: ASbGncucEZRVoNQQrC42ifaVruaA9n0P2HsBYS7kelUVEbHwmPGl5xegRlsSGCUsxoO
	PrEVoD7hDquOP9ykcH6fehH29JJ+Iuv00/nkhLMd/J83s55USqtBo2nENO25VrEHu2ncqQ8odao
	kLPAj1LjFygFSA+4No6nFDIYrgeYpdPD3LjaGnktI4gM3VYEeVX9RkESD0Iyl7TMYmaemd+pet/
	jjQKI0ZyIkiJh7JlwXie3KDOZMMbG3tXeVFppAIW9iIXRnisI8B7bLzbXpUKL3T2QBEjGKc7NzA
	Ny/GlPQ7
X-Google-Smtp-Source: AGHT+IF6mILseNMfJmIB9ZOyimXPXPfxpdkmjbt3WuqKLQbtoG5tgiV9L7CF+aAEAjMF8dRgPTsU9A==
X-Received: by 2002:a05:6402:42c6:b0:5d0:ea4f:972f with SMTP id 4fb4d7f45d1cf-5d4185060b8mr11381588a12.8.1733850628448;
        Tue, 10 Dec 2024 09:10:28 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:27 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 10/24] ASoC: renesas: rz-ssi: Use readl_poll_timeout_atomic()
Date: Tue, 10 Dec 2024 19:09:39 +0200
Message-Id: <20241210170953.2936724-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use readl_poll_timeout_atomic() instead of hardcoding something similar.
While at it replace dev_info() with dev_warn_ratelimited() as the
rz_ssi_set_idle() can also be called from IRQ context and if the SSI
idle is not properly set this is at least a warning for user.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 1a98f6b3e6a7..03d409d3070c 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/dmaengine.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
@@ -307,7 +308,8 @@ static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
 
 static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
 {
-	int timeout;
+	u32 tmp;
+	int ret;
 
 	/* Disable irqs */
 	rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TUIEN | SSICR_TOIEN |
@@ -320,15 +322,9 @@ static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
 			      SSISR_RUIRQ), 0);
 
 	/* Wait for idle */
-	timeout = 100;
-	while (--timeout) {
-		if (rz_ssi_reg_readl(ssi, SSISR) & SSISR_IIRQ)
-			break;
-		udelay(1);
-	}
-
-	if (!timeout)
-		dev_info(ssi->dev, "timeout waiting for SSI idle\n");
+	ret = readl_poll_timeout_atomic(ssi->base + SSISR, tmp, (tmp & SSISR_IIRQ), 1, 100);
+	if (ret)
+		dev_warn_ratelimited(ssi->dev, "timeout waiting for SSI idle\n");
 
 	/* Hold FIFOs in reset */
 	rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_FIFO_RST);
-- 
2.39.2


