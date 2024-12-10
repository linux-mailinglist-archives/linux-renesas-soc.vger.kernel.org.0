Return-Path: <linux-renesas-soc+bounces-11185-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7505C9EB7B9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 18:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FE25281971
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA12122FADD;
	Tue, 10 Dec 2024 17:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MAZVe3e8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4332046B0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 17:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850639; cv=none; b=J6cQ0d5fI0Le53/h/zmRaY5VVPs65CxGSAEHyUrcK5li2H2xKAj8qkNyk1H3N9XqhaAbhVzTitIE2jMLLCSmOZ1q0octLbkaTbd8SFiPkKR6NH/MmAYRAR95PJaevBqo188o4djLI/qpkrt0h81dm80BDgBActM0d/tnfjG5zt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850639; c=relaxed/simple;
	bh=Yz055MkA+pxfsMjRAkbTxtMOq7knGNv3D+SNR/Ylrow=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JEYQb/GafdVcWQ4ezU2tn4HzI778cbiI2LYqNxhXKMBWhsRdorNZD3Fp0CiXSsXY9czdrh/PZqtKb90YtkyqT9ZwcHsPz8bTUZzbXLj2aQAl+OABPnEITe6m1kPuF3VApLXqLYlLY4vwrfgUJ4FW+rqPgdicIRPUt1V+rJLO4X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MAZVe3e8; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d122cf8dd1so9452021a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 09:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850636; x=1734455436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGFKtP/kqhSYwKWsXVqygeaqizf9KcZRKhKS1yEgkJI=;
        b=MAZVe3e8PZ9TTx9ehV1VXTuqvgGeoAxTuyx9+A38aNUVRkXEKeLwn9Ymx8AlYr7KEA
         XzfhBuBq0J82ZudgH2v0irugxF7G8Sp5KHxi3oJ+SVDxdIJkODXb+sosZfCyJVETG8cr
         m6RgsIiCkPfi3WDf6R89tMfTjzfoXW/bi/x2/UdJ+094drqSMGNYS/MHdxslkiu99U9y
         y78IP21BpxYyHQe3A480mWyYY7FAPrAsc4U1CgpBtvxo1h82JPvVOmfVbUcMrqjzv/zB
         xbCsj8tbDx/7y/RYIFSsIlDTFapOTNpr94fzJXcss63Sn7FoYv65qKP5d6PuKM89CRJv
         KuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850636; x=1734455436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGFKtP/kqhSYwKWsXVqygeaqizf9KcZRKhKS1yEgkJI=;
        b=qfsERnXJYuE06qj79NoB4bG6mb5bi06LTGYAeS/ueykTHC/McUthLEJ5SCy607HDG0
         V8JncOsj0I6/NJyUaXGPwesj1NtZUm937VjfG8iwaMubUYGr4w/JtKbG+tn3azZTzWnj
         WyFvad/pUS14Akml72aCfJM35UO6/0IiT8ORqNsbZN/OPgo9sWqc+X2f8pLk+LcbFazX
         6y19sn0rpVWhQ4/qxUkN2Pc7lsqTOx5Q/A6IXJ0pn5wuNcDYYR3PDx7VYg+mPuvzqXOD
         lmPIHiLU6Ez+xxMdTp9SXiulDhIvDd14LDmgvtZQ/5aQ8rQJbi3QUFNM6M2nnkDHD092
         c31Q==
X-Forwarded-Encrypted: i=1; AJvYcCUobvS+TTOEH/XRHKLytc2E/f8hEKruL5eGTTKUAOM3FQ7YJQ/CTnB8LLvz4J/ugtnnokMRmDMHjWSv5INdiNnHNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMPrTUE3cVjRIrBNQr+NLsaSUVf8p8t6DLQkCuPEoG2Azwfo2T
	Ox6XaysYYggNdtDgmp7Tn8935K2DeEo5U359dnLRGATwZN7NM/LxtE5/TUCnXoE=
X-Gm-Gg: ASbGncugx+g9TaRE9m1atf7EgH+5cQiilXyfP/L8rKSFVp41Ryu1wyT/eT15AhjEwmf
	x/jN5gPKb/pPhzNJQGDFCkDdv/1E0ICQNYZhAS8V1QKRGB0ZmJwmfqAY2iMLc8rws82HP1CYRGy
	BFuPfcmfHfwyqAEQxzZZzKp/U7qHlLI/5JnKfshKp3lq67yHqnpLHMr9CNPRUhJAQ1sjGLT/rrf
	a6jepFdW1Qph6uNxLWgEgO6ZHoEzUij4ZVzKpqS7lMiRcTVN7INNoc5WYYitB4tEO9572PwLe9O
	0obp4swH
X-Google-Smtp-Source: AGHT+IEC55JYbSGMCcanrVtAVCn++NmOM5lxtdpdi4NfwxaJizcleFUS/sRGsmrPp5CnJom5vv0rQw==
X-Received: by 2002:a05:6402:43c5:b0:5d0:b51c:8479 with SMTP id 4fb4d7f45d1cf-5d3be680125mr18546630a12.10.1733850636238;
        Tue, 10 Dec 2024 09:10:36 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:34 -0800 (PST)
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
Subject: [PATCH v4 13/24] ASoC: renesas: rz-ssi: Rely on the ASoC subsystem to runtime resume/suspend the SSI
Date: Tue, 10 Dec 2024 19:09:42 +0200
Message-Id: <20241210170953.2936724-14-claudiu.beznea.uj@bp.renesas.com>
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

The ASoC subsystem takes care of runtime resume/suspend the audio
devices when needed. Just enable the runtime PM on the SSI driver and
let the subsystem runtime resume/suspend it. While at it use directly
the devm_pm_runtime_enable().

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 209b5b8827e5..878158344f88 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1140,11 +1140,10 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	}
 
 	reset_control_deassert(ssi->rstc);
-	pm_runtime_enable(dev);
-	ret = pm_runtime_resume_and_get(dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		goto err_pm;
+		dev_err(dev, "Failed to enable runtime PM!\n");
+		goto err_reset;
 	}
 
 	ret = devm_snd_soc_register_component(dev, &rz_ssi_soc_component,
@@ -1152,15 +1151,12 @@ static int rz_ssi_probe(struct platform_device *pdev)
 					      ARRAY_SIZE(rz_ssi_soc_dai));
 	if (ret < 0) {
 		dev_err(dev, "failed to register snd component\n");
-		goto err_pm_put;
+		goto err_reset;
 	}
 
 	return 0;
 
-err_pm_put:
-	pm_runtime_put(dev);
-err_pm:
-	pm_runtime_disable(dev);
+err_reset:
 	reset_control_assert(ssi->rstc);
 err_release_dma_chs:
 	rz_ssi_release_dma_channels(ssi);
@@ -1174,8 +1170,6 @@ static void rz_ssi_remove(struct platform_device *pdev)
 
 	rz_ssi_release_dma_channels(ssi);
 
-	pm_runtime_put(ssi->dev);
-	pm_runtime_disable(ssi->dev);
 	reset_control_assert(ssi->rstc);
 }
 
-- 
2.39.2


