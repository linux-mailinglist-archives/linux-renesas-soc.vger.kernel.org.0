Return-Path: <linux-renesas-soc+bounces-10500-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7D99C7100
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2024 14:41:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1FBC286BE5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2024 13:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356C02076C5;
	Wed, 13 Nov 2024 13:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Lg2nHTUS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC542071F9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Nov 2024 13:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504982; cv=none; b=IyDCxmLdsDCJ7H0A4mhasycvMhv2CLnZBG7ziRV+qY8EUy7bdiNc5LePhKL5HGKyLr1SCsSTCG/lHu3vbHEVT4z/AG/0dxO2ZVam6RMjUfv3KTS6lNH8Zh4nDjTBDb+wAKwNk/jGWJYS0KsSLOHCGyTcxVh0/hwWCpPOIYcp/Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504982; c=relaxed/simple;
	bh=Nwa5tU9ge+ha32axCmqAFJJx3a1SKQtHpFrD+Jt2N0M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eUdPQI17WPNwf+ff2Ga1Tw3qOYmvBrIzkNoYx7oOzVIKU3s/XTp+AZeJd+gj9L/ISnFSLAEJyMBg8a4NPWIzNvMszsHxJlLexyrrH5fGbJi5cBrukZtYwnZA10cWm/7oi5B1eXxkZC9AGGkvLzllkhql3E/kk2IlU69B409J90Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Lg2nHTUS; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-432d86a3085so2376505e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Nov 2024 05:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504978; x=1732109778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iza1JOliQMrfP3y3T/HI+dDynre3jA8VDWxaN7OUd5E=;
        b=Lg2nHTUSQk2rhskUiRqJgN3z9tDNxnj0nLDGzkmTtKI8l40/WkeDpAn24q4V4ldcjn
         DEd2xnbv5n0MwGf4v/HWd+EeF/79fPHvkT1yNzAn1y19xa9g4O0d7ZuMQ/LFzo/eRoYb
         ODb8iesgJxqZIE/y3zPHszFHLDO13Q2yAVaB6T884zlPDpWcuHSlPEv6cOEP355FxQFk
         xqoseCyoP5QDPC1d4EA8AD8XF62dRhc0WjQXuDhgG5VAyr76RDcy6m2o6y4iutKO0Lzz
         NWka7n6qyV3FsYpuzwpUuIxof2rs6jeHg0wZyBs245hQw5j8VGJiEeYeNfnOZP8q/Tk3
         7Wuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504978; x=1732109778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iza1JOliQMrfP3y3T/HI+dDynre3jA8VDWxaN7OUd5E=;
        b=rqFTsPZwKud7NjgpJZ+gs9ReG+CMLyHRDxv9tcGrM4BOvIIoz8RRJ/tZlWUZ81HlmG
         mTiqyTqej9V7Ydb0TJd1sivqSMA+TLnxvlSyLSYdYRxhX2ZzMpAtvhhQKdE5cL5Ye2hM
         iBVwvMJ64Zi1/f6W73ibESl8PIyDwosM8bKNTZXBLktS1BMLZO0ZIsZ8gZ9dBq3/6vhE
         zoE1u0mWq0iKsRbZ0N1bP9dpV0cIPSdH+Kou6wcMshaftQkYoVK8+RdOmvU/oNTXGIXM
         kMAT9c5lxZW8wAvmKKiwr/+wnEPnxsuuFpkkIPZO6meX4QXjl8QH9JT9yLs+PHRuziKc
         94cg==
X-Gm-Message-State: AOJu0Yx6DFjw3uoNdnlLO7+LAgkrbg7BGm5Orrg3aarYWnthNr13bE6T
	ykKMEG0lzhQJz2lvcnmQSCQlkhxb9BKfLnTRr397uQ0XTQaxOUIWzJEZXS0qO8M=
X-Google-Smtp-Source: AGHT+IG/NyJfeYX1HuuK3oZ/Ai/1DWZbgLB8aHPe00TzOnEC1V13R9/k6Quq4GU2FwVHIy+pxSTdBw==
X-Received: by 2002:a05:600c:35d5:b0:431:5f8c:ccbd with SMTP id 5b1f17b1804b1-432b74fda62mr182794785e9.4.1731504977765;
        Wed, 13 Nov 2024 05:36:17 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:36:17 -0800 (PST)
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
Subject: [PATCH v3 16/25] ASoC: renesas: rz-ssi: Enable runtime PM autosuspend support
Date: Wed, 13 Nov 2024 15:35:31 +0200
Message-Id: <20241113133540.2005850-17-claudiu.beznea.uj@bp.renesas.com>
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

Enable runtime PM autosuspend support. The chosen autosuspend delay is
zero for immediate autosuspend. In case there are users that need a
different autosuspend delay, it can be adjusted through sysfs.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 35172630be8b..01e8b6a4e8a8 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1140,6 +1140,9 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	}
 
 	reset_control_deassert(ssi->rstc);
+	/* Default 0 for power saving. Can be overridden via sysfs. */
+	pm_runtime_set_autosuspend_delay(dev, 0);
+	pm_runtime_use_autosuspend(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable runtime PM!\n");
-- 
2.39.2


