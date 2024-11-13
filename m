Return-Path: <linux-renesas-soc+bounces-10496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5138D9C712E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2024 14:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE17EB30458
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2024 13:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9407206056;
	Wed, 13 Nov 2024 13:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="U5QcSm7i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F23205E0E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Nov 2024 13:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504972; cv=none; b=stAgttHJm/SdQCqx8exgakITd+ic4XWZW7r1l+H7fM6FMmR0YNZZJJb9ZKqPhFnogHJ50IU9xfjdMdbRNYdTZiC7kviqWbf26wo82THvLZXVJX9Xjsf+bsPz05ABm6gnySZKaWgQqnhnEfmWV0osyjQva3F6FpIWY1OjTTspsJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504972; c=relaxed/simple;
	bh=NUgMtnnlt4nR2lbnrP9/gik3mpApdnkEKWDZ4IVi3xQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r7cBvJqX4zQ3D0KE0a/IqGNx/gphi8qAQdXBey0nplj+h29D/L1R3L3EN6xyQJhuVJdAVK8zQhzo88o4SMvnzNfpRgdHYADAVIjupRYPwNILkFc5T7MXQh6B4u7zMLseTG+lUmBWx0euSDHbYIzIRihYhCnTLmaX1m7zeBkvx/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=U5QcSm7i; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso55757915e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Nov 2024 05:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504969; x=1732109769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/aj5+U2C4AQbzB11TbDC8dRK3QJao8LDxVCHZOdJT0=;
        b=U5QcSm7i5rGL1R1leyFKVDUB1s6PGASBgaG0ssAmOTx155klqRzl8DSRkix8uPDREC
         puO4GpxbQl9EeqnHzpwF6JUd+ArQOJDetMuEtDqV63sjT8eFEcbz+ydyrTn5HYjylPKD
         VBSH1Kduz0kCJ8TNwEMAKaXcU7cTX7kqEEQjVZZaB20beP6hcadUbEfxpOIAzgv+oeGg
         M12T+HMUFu8Lf4bnadseV2y0mqRAq8dSh/T1qCi50Nsfy7JckFUoIAWNcxn7CCFlPaSV
         wcYhPa+W3Q0LjOOGaj4JYmim/VJ3n+dyv+ieytUouR4ciHvo371wn7plxXExxqtmxZtL
         ZeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504969; x=1732109769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/aj5+U2C4AQbzB11TbDC8dRK3QJao8LDxVCHZOdJT0=;
        b=l9R0OPZDt6NjwWmjQCAn4g4LHQ9xKls++ZgKb8Q44obrZPnJW6LOQ8eMQAOpzqAr+4
         S0rwT/8hXSf2vQdvJuyc9fvA9nk6Z2gYekQHf1zce8h+a6BXDCfbKGqxfz/L4p1COH/R
         UaRydIuooERjkLRDW4U5wm3I9N5OsjjoZzCInQWJKsKyFm+VafSSdBYoctcvxYxed4fV
         kUxMYnoZiB6ftCsVuWgEKmASGUTB+4q7cPvETAHmJGx13yXPNSw9DFlLGqabB8qsJv8q
         wHGrXcnE7lxJTwWSK+q/HgnD0dm2NuMXMpU85KXJ7D58IaPOMKrWTmoZu1Xv0QfSxZ3j
         RjkA==
X-Gm-Message-State: AOJu0YwNGPi6jvchoecmax1bIOg66Hq8W4a3LQtbG8zxbBGIEAELFyXr
	bN+3VGMKQs9XQ1RKjYwbQ2g4ORMvtCUpSYPsnRa4DNcoZ50KJjiMGLm6M0zlSwc=
X-Google-Smtp-Source: AGHT+IHRUoR6qLLTPcShZ4p5979avpyEOAnKvqkSvqtbLDZ6hUvwGzICszKqBYI3SPEX2Ji1iuwTdw==
X-Received: by 2002:a05:600c:190f:b0:42f:7e87:3438 with SMTP id 5b1f17b1804b1-432b749ee57mr186545625e9.0.1731504969583;
        Wed, 13 Nov 2024 05:36:09 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:36:08 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 12/25] ASoC: renesas: rz-ssi: Use readl_poll_timeout_atomic()
Date: Wed, 13 Nov 2024 15:35:27 +0200
Message-Id: <20241113133540.2005850-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index f230d63339e8..aa175803867f 100644
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


