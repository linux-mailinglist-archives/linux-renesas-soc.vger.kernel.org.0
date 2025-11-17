Return-Path: <linux-renesas-soc+bounces-24688-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F27C637FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 11:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 27EA63821B8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 10:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6AF328B65;
	Mon, 17 Nov 2025 10:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BxL+6V2v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2EE30C344
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 10:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763374375; cv=none; b=lrD0es1LVIIiFPIM28gfy4qY3PtGNGViXoLSqYV8dW9D6HxjCrM2AJw1ha22wXTi8K1zxSsAfEq6ULNZsiR8KVLdcG8BDZSbQhOtME1w4g5+f/v87B3GKkPRaOe/k5yjwGiHu2ziExe2ZBVzjbUaOipcKPr8Vkp7HndJan0/SvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763374375; c=relaxed/simple;
	bh=PZ2VgrJLCT6NE6Pefv6XTKPPIj1W5MZjYi6YpoC0I3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B9Y9ywR/dOHRZv17rEHaIhcG+y+PnDPD9DMjGy91tUtCdi4u8K+hZMJ/MZu9Z70ZDMDwW1I/dC4sxkN9fgjHm9Yw41VcURXZqLPTqULmtr7C6wz9ucwVmzxGn5WWNlqfe6Mvvy3G8ekamk2IW9TH6VoJw10WFyCxn06sO11nVTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BxL+6V2v; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so2920609f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 02:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763374372; x=1763979172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4PkvTKq6TDEv7PXnSRVk/VXlyWDyWyNgT0QaQUkpPE=;
        b=BxL+6V2vTTv0cv59rlaM7/PWoFxAAWN/BqoTvWJpzm0ny6SX0TLuYWotBVuk9AFs1o
         ak1EUYaYt0QMKx40WKLdLdlfyC1+x4LaVHPa2qy6spNwf5uQMqNvUFCzkQ11xhlHFleH
         RGnSLFe9X+T3tOvIFc5rBbhYklobA/Ux/WadialhT0ll9YUye4dlacVJHWYK6A0ts9J8
         gC8075xT7AJvMdOntueimG9PCKn44JlRuD3QxwOYm3G6KQOwCsOGz8k5x/7McI0jOA9Q
         VI8+ZbxrRT7gEFh1yhpNQV1HgH/9pVQpe1ps+KRn/tfcYn9b08yb+J9boxBKQ9G1x0GV
         dmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763374372; x=1763979172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e4PkvTKq6TDEv7PXnSRVk/VXlyWDyWyNgT0QaQUkpPE=;
        b=Du0fpM7R93xyd8oSf++VrWriW46NMlS7wHndKcu6WTVBTYB0gdocq0Gx6SJvczAldx
         3TZP6rvpbXYEyTHKGZvOyoPNj33sKn6a2/ZUcxEI3jIFVho+ufjjsOJWuJ4VgxI7EBnC
         qO9sVctVK5WXEj57STg/rPEz/lgKKfcR+qKvV2/Gg8SLJusD73YCfvrWdXM3IjUUIoGG
         Famk1jHneGijk2Htc6Q9TrCwGTxrRE+pSqlzYOV22SszLlYUg06Q2/2SMWVukmrojxe3
         51nZavyCcO/NJQanhaSK+Xc1l2+YU6+9AY06aARGf5LMkORDy8MGlwxUtootHgaUNkF5
         jxOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOHstuL+KTxo9ihXtqZ0LXSHiHNLgvzhNL/1bxAwk9YBucYSib4wtMl4GhKn/77+uzAhxwJ2jUXV3DZkDP1eMwQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFCiJX0KF7KIotobfLJxje011lSUhr8E5A7bWLwP+Xhc3krxug
	Y4kUwc3Huh8oqH17D8cFxBNNZ2R07GaiLAaK/3wvXF20HvXFSSg/1MurdEwAbln1bx0=
X-Gm-Gg: ASbGncsaFyNFnAVpzUezG6YYp88iN35BXgkGxKZUuIr8euztaa6yVyF+bqbBsFM51WB
	AKdc1AxbVTs1e4r3yvt0aooE0BIzDbr7kPyc81beUSyJmhcntTNxD6OxCuYUPc7myM7+6nhYey/
	yErrNbxtyPH596Va7Gu88ukTn6OKxzmPEEcK/l+DqPVYF6trdtTKUlqOa2MKPIIYuLyYXejR9Sc
	8fgJupoulmYHw6pPo47pEAiA+WO1S6AmX6PDlSsotjuVEXf7c+vM3EX80lNxuentR59Y1vSYSVX
	w1jT5dJ8b7+1RlEhTq1fWYOOYOZTyJHglUUteAIoZYnTnQAdlwt91nriEiFCWAa9p7Q1OjBNLsv
	4paXkqhn0XpsV50rOkhDQ2N3sAIpdN+VSjt8cskp2w3mYHXLKRVf7kl3DGjF1Yn3XtyXgbssC5m
	Lyvl1cfsNCGvpbAO7NuZNLqYTFsclunwpfSsciC+l4TGQUdDDqGmE=
X-Google-Smtp-Source: AGHT+IEykh+Wlet8VlkgThLmhCvrSTt1q//BTlZcTgfJl+kE1lU1w4o7mJz5iLJHHZN/1nGc/YYH2w==
X-Received: by 2002:a05:6000:2888:b0:42b:3ab7:b8b9 with SMTP id ffacd0b85a97d-42b5934db2cmr10562830f8f.20.1763374371844;
        Mon, 17 Nov 2025 02:12:51 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f203afsm25806958f8f.39.2025.11.17.02.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 02:12:51 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wsa+renesas@sang-engineering.com,
	ulf.hansson@linaro.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	geert@linux-m68k.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 2/3] mmc: renesas_sdhi: Switch to SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() and pm_ptr()
Date: Mon, 17 Nov 2025 12:12:41 +0200
Message-ID: <20251117101242.4018208-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117101242.4018208-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251117101242.4018208-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

SET_SYSTEM_SLEEP_PM_OPS() and SET_RUNTIME_PM_OPS() require __maybe_unused
or #ifdefs protection against unused function warnings. The usage of
pm_ptr() and SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() allows the compiler to
see the functions, thus suppressing the warning. Drop the #ifdefs.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- adjusted the patch description
- collected tags
- dropped changes from tmio_mmc_core.c

 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 11 +++++------
 drivers/mmc/host/tmio_mmc.h                   |  2 --
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 73c84fd8a2d8..ef06c3a60ae8 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -600,18 +600,17 @@ static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops renesas_sdhi_internal_dmac_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(tmio_mmc_host_runtime_suspend,
-			   tmio_mmc_host_runtime_resume,
-			   NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+	RUNTIME_PM_OPS(tmio_mmc_host_runtime_suspend,
+		       tmio_mmc_host_runtime_resume,
+		       NULL)
 };
 
 static struct platform_driver renesas_internal_dmac_sdhi_driver = {
 	.driver		= {
 		.name	= "renesas_sdhi_internal_dmac",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-		.pm	= &renesas_sdhi_internal_dmac_dev_pm_ops,
+		.pm	= pm_ptr(&renesas_sdhi_internal_dmac_dev_pm_ops),
 		.of_match_table = renesas_sdhi_internal_dmac_of_match,
 	},
 	.probe		= renesas_sdhi_internal_dmac_probe,
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index c8cdb1c0722e..b9de03325c58 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -209,10 +209,8 @@ void tmio_mmc_enable_mmc_irqs(struct tmio_mmc_host *host, u32 i);
 void tmio_mmc_disable_mmc_irqs(struct tmio_mmc_host *host, u32 i);
 irqreturn_t tmio_mmc_irq(int irq, void *devid);
 
-#ifdef CONFIG_PM
 int tmio_mmc_host_runtime_suspend(struct device *dev);
 int tmio_mmc_host_runtime_resume(struct device *dev);
-#endif
 
 static inline u16 sd_ctrl_read16(struct tmio_mmc_host *host, int addr)
 {
-- 
2.43.0


