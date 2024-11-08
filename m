Return-Path: <linux-renesas-soc+bounces-10413-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 037989C1B5A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2024 11:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9E4C1F23A81
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2024 10:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468601F130E;
	Fri,  8 Nov 2024 10:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kN2Y67Z1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C691EF949
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Nov 2024 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063045; cv=none; b=nuheD1JN4BD5qKcxj4NCCZAGo/2Sl4PnaVRzTKpPNRDV1I705EKMlg478eN1hVSU2WIG4V73py0+j0XDO2inTMMo79Lr9n5TB4nRhOewwi/hW1ivcz46IJw5eAMN7bwjGiy27/fdhTOrbdjEQV1+CZXwFGWW7o3ROUYpVn2RzBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063045; c=relaxed/simple;
	bh=K6Cw19VzanRggQJ9ackg58S/cIHnDftQ+AAbWSfLA4w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lsy3w+WfaIjeDrk4lneYP/e9+G7s4JNGXcCggSrdBTdJTWGvzfJuJA3WnioTWu4U+Y0/mA4ADe45I+c1mZ9l4t2C9AUDk6SsX2MDYjW9TjKIdlg3srYkcsM16LOJLyWyt64iUXCq0YihoM9GK8yDd3PV6RvYsSHDuIQSeu2Qgeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kN2Y67Z1; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9eb3794a04so275769766b.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Nov 2024 02:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063042; x=1731667842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGI8BLotlgYkbPf2kxGSbSSNn1fEysvNxJMS0KOJ8NY=;
        b=kN2Y67Z1k4AnfMFTdK0wWOQ/R7DltDdeQ5KhekuxahpyP9shQhvXSJOhsnOmzO6oSF
         R2Ii2CMdt7NZvKeSTC7xL8JAr41LnQ1XEA68fCrhRZnydP6Qj4VQG0vj5jXi8NpHO1Ke
         8t6J9EKB/Uss8IZYnbg06CMNBDuMclnnvd8vPOUqO93OWIdfo30eJD0gCOwpBRM8rlfg
         KG2NmCUkxJQ3Z/QbQgcjJsGOfk0eYPPoLeQnO+8bvI+KgiwL+ylQ51c8ihHqXFL9m1DJ
         HwFaloAqVp7NohURp7qIk1QvGVhnIzhK7YW2Nyc/mDvWguuxiSwpGx+9Pi8SNM4JXb5y
         y+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063042; x=1731667842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGI8BLotlgYkbPf2kxGSbSSNn1fEysvNxJMS0KOJ8NY=;
        b=oUj+56nxg3gKeY0dBUSPZ5CTIthMCPSHDcXqJTkWb3wEHZVZUmFaRmedGen3GhdC49
         visRi0z2LG5bhJlfJDMUynUK7N5byQ4dRt0aefHdO/sAHhxMnWHYnRuqANJoEbx10FvD
         PdFBvvTOZiWU7PSCQzEgC6BkbQwOcVB0TeSZR4hLoc1KpmzZJYWF67V6nou3TxZZvEqC
         1eFi36pzAMOGFEWDBS42X0Klqzme9GpwoxkM7/t7deIlb98JAAB3UiQu0bEqdOD1NLBv
         MTYlkxhIIVIoFxiNpuj5QUXdqbnVHeO84BUEg1652ZHkdVp8rRwQD7i6Uqzad67utYfH
         9wbw==
X-Gm-Message-State: AOJu0Yw7FtFvpP7c0F6mQB9lnc3+fBTleuK5GG19RzERhBP5KP/ituIr
	PDNleddFzXK8EcCEmm0Kj24gptDUv/i+CruBZ5tMjtITtxxwgqKcYvwwkn5nBV0=
X-Google-Smtp-Source: AGHT+IGs/OQqKoJK1pwx5fwra0tyGy3QmPPNa7cuyW1FS4OzMCdTq2C8v+8ndDd64d+x58RAV4CJrA==
X-Received: by 2002:a17:907:e94:b0:a99:f746:385 with SMTP id a640c23a62f3a-a9eefebd439mr210008966b.1.1731063041624;
        Fri, 08 Nov 2024 02:50:41 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:50:41 -0800 (PST)
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
Subject: [PATCH v2 12/25] ASoC: sh: rz-ssi: Use readl_poll_timeout_atomic()
Date: Fri,  8 Nov 2024 12:49:45 +0200
Message-Id: <20241108104958.2931943-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
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


