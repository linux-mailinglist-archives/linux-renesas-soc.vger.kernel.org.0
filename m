Return-Path: <linux-renesas-soc+bounces-2250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BD28469FC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 09:00:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADAA628E88B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 08:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E277D18E27;
	Fri,  2 Feb 2024 07:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SkMvOwbB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1B81865C
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Feb 2024 07:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706860750; cv=none; b=Fdk0JHzTZML/uW8BWdmoAlh3xM4g5djJUAwrDvqrzMWWg9lHAZF3b8s/S9/KeHCB+4RGTfzpsjTXIwyVi+JUM9b3Ntt1oURWsebXalUsymX7BtoofmTJbyjqfqDTSEvUILblKYFE/CUUQKx69NEH8kCO3REcOc3tYNgFWnMcjVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706860750; c=relaxed/simple;
	bh=+3HoKrINx8E+isoQN2zUwSYc2xCOP4127guZ+SvOjTM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YhS0f+Dkt3bTksFNKesGvadvMsd6/zYU6WJaP4uIOkVEkhq0ylDbLY1PEtnFEBZLJB0nMma920o1NcoiAVFXxxwkGNdLHeseefgkKf6zgDPdKGxUGfcLQvRba/HHk6HS6crxwHnWYWONdrxHJgLeHeGrhFkX+RygQKM8X6IIWFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SkMvOwbB; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a366ad7ad45so228029966b.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Feb 2024 23:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706860747; x=1707465547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wk2sgSULD2EZlARjAWF2gEN/OqQBx+GrergIKsDdywo=;
        b=SkMvOwbB14SBShezZ2cY30RI+BupSPUNnGnvyWqpJg5wLnNycHqrPxcmWjij4OIM8B
         btS7Vs7ZKOWzXhmZdFBRvrYVqfs99cipXSZetCFt4Pl4Npgtdi5N35+darGsWVS1ohuK
         dr0/2Cq6DHuPIa61JBNMCbWZiDba2+qulOhoskhydh2mdNOcwZg1+YMIDEVofjyVbc8K
         TGK37PGdqjHj4J79x9B0cddS4+0DxWfFwCN8KEk3kEb9eEjdCZfyMkuzXMRYi8Zm7smy
         5cI305xOydpC5dOYKD8IXyNzC/PyyjOE36wO9HwVu86HFfvPvOohTbd4fMt4iHMmiFio
         5xxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706860747; x=1707465547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wk2sgSULD2EZlARjAWF2gEN/OqQBx+GrergIKsDdywo=;
        b=PdzuEekajZX+qrqX3rGXg+Gl5nKmIJU+bSOqFVbgAkSs7Kz1O3rX142PtsLlguJ9ru
         c8j9OusK0s7kOf8IvXQ36u1X06M0xLZ4czgrLNQ6CeseFgps9UUMoOUDpl3pPdZ9jQqx
         7gXWY/fmfAXulWSHcvt4sYSDPMNugP0oP8nra204q/Ggv3QW6s/Qy6E6HS9gZchHpuGh
         gp534nRu1F1MmAaOpJAi+IF1Suse/wq0+ug3hm71lv/U/dTQXpgMPMl5d7wJCK2//ysR
         g/ZlxKIwYSSrB/ELPswJOdMfT/t/Y8AWog5HXVg3Ev2amnEn1zATx1P420mG5Sq/50rc
         DxZQ==
X-Gm-Message-State: AOJu0Yzpx/i6+v0z613DdtoZxcgZER93vTsWSh9Pp22RzBNLovMTD3M5
	y/DWLvXNQINuqEr0Xz+5F2n6eRcspq0CGK43xUYCJEM9FLnKDfwOCZFXMSRBlRo=
X-Google-Smtp-Source: AGHT+IEGRLX6e2VlOIMJl/6ckaySe8jX0eWa5Gc9NV5FY1ylYX+aIhxq/HnIntqB7OOrdaRkPJJ5Zg==
X-Received: by 2002:a17:906:d10a:b0:a31:58fc:bd83 with SMTP id b10-20020a170906d10a00b00a3158fcbd83mr962292ejz.10.1706860747016;
        Thu, 01 Feb 2024 23:59:07 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVLdJx38gMdhqHaunvA3yjh3MJnT8FYni2DoIecRvOOHCKb5u5bSqVX1faQieKPGFlJqn7fMkaZDjiIu26PwX6DKL9lNIWrIdbWeW3IUplBecaSVUzeNrRz8PFs7hrJO5yEnOW6EdiRQKkV/PrH6+kwfgVquXatxu3YfdeY6z0MJIkp2EH8n2rhUJzKVogc0VDpb2leTAUlCYEkUX0voBftLqSL+Y8wj/jfW+arRjuAz/fftt4SfYiyXMjxYJO1mF7zmcJ2oDlovbSelqROCm59Jdb1oHPQLyp5ywBCIs3RLqKA2uQBYxJvk8cTGITv7aDuLywVKc+2soh80q673gDHse9rP0LCuR05bI8UnnS5rwEBaTe9vfRNpspLLw0cO8FElvDSCOF56oHlcF6KtypVZxAvtjurTRXQ/JfHWz80rDrB85JWJp2I5sEXhxtvZVfcKXE1+fSS4MhuW1IRiZcKyvUbsTlYfkY/oiysfMSKzbBsDwuQ3cSkcGEBo93aGoaTEe+Evtt5tw==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id ty13-20020a170907c70d00b00a3715be38c4sm185544ejc.210.2024.02.01.23.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 23:59:06 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 5/8] watchdog: rzg2l_wdt: Remove comparison with zero
Date: Fri,  2 Feb 2024 09:58:46 +0200
Message-Id: <20240202075849.3422380-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240202075849.3422380-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240202075849.3422380-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

devm_add_action_or_reset() could return -ENOMEM or zero. Thus, remove
comparison with zero of the returning value to make code simpler.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- none

 drivers/watchdog/rzg2l_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 93a49fd0c7aa..29eb47bcf984 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -316,7 +316,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&priv->wdev, priv);
 	ret = devm_add_action_or_reset(&pdev->dev, rzg2l_wdt_pm_disable, &priv->wdev);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	watchdog_set_nowayout(&priv->wdev, nowayout);
-- 
2.39.2


