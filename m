Return-Path: <linux-renesas-soc+bounces-12139-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0857A11A2C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 07:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA3D81888E68
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 06:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D3B22F85A;
	Wed, 15 Jan 2025 06:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tiwZg4eN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D4822F3B6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jan 2025 06:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736924119; cv=none; b=Ymrd5PyuBeSj3wmjaxSjPFxc6FvgqXycs1B8nDb2UWAfen9l4z/NxtoLDOuicOuhEONw/UJewLo2IJ0kQPSZX9JBgQdu/9m15NorJNPYxyMdETQzzrBFxU5yNyz4F1/i3WD5X+Qczlz9eSBjUwRDmE0yrVSbOW/gtSDsHKCCx+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736924119; c=relaxed/simple;
	bh=93Zf6r6djTsOLjTwFwQbsL4xCusRovQNhv2ba7R6CRg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g5NmIo3LYKaPVu2ewc02WRvJO5xtMkcDeEYxvf9obT1z01aR/mw7ZyRm9+2QlZqM2lyvAUHP5fcb/c9jHb4NsB4wQ+d7xKHdCUug0GSJNtUlnQp8Bwl6MaKEMyILNRwfpj8E9xJ0t1wCQuELQI3kWxnDbx5Wd/xBcPPoceeQYdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tiwZg4eN; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaef00ab172so1001395566b.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jan 2025 22:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736924116; x=1737528916; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XKBt5/R3U0Riotc/EXMrk2lAFncNvsaicQi2el/Oz1E=;
        b=tiwZg4eNkMCQTIuLSSaWe8AFU4NrkteMjU1mRT6lcKvRz4vY+smtNulsSNIWk1tQix
         MPcclIgP+smcS6d/QrKT+gBn4eHFMp1UguEPXQXbQIxcSmdekVdql4H2Ss/mzG/3m7I8
         l8WEA0EE+lmzImzcKVY8jzPm6/wwkJ6VpoBioszN4Me+KXYqFQrMVa8YRIMIMhDGpIBD
         SwsY3N68xcIfrKnoaILDdV6VXgRLEaKEauMmnDPhShd2V3Jy7/dzBfk4oNK9vAP4QzHX
         4Fi1YhwydsBYK8RL1E1KaKWzVkIdQHgFYSu+1b/xPhoC+MvQjZb5Hgpeb5vl5ESbN6Dy
         +RyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736924116; x=1737528916;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XKBt5/R3U0Riotc/EXMrk2lAFncNvsaicQi2el/Oz1E=;
        b=HydP/a1xWeOtC+gW5G/KO9svoy2OvBgrW6kJwd+kO3DW/TZAZXVrFz0qiQtzzwu+QG
         e4o6Vg19QaVyqM01MzJf7i7T3B4iTyjmN+Gear1l3rtsqGelWMe/4aOTVdhVOC2IBIVv
         KN8FXHDI+fbF3IyDyc1gI0X8SehFebnis4Zqu9qMrm57bvFBJhZFXsoII3wY/sK/F3DG
         WYOAfvHOoW8jG086wo7VJjwVcYkzqhQLeOAPTp58rvCuCFKUHajTDjOJQEwnllzrXX3C
         VfTPb6/HFGl5XG1d1dJcuwbTEtbvoHkk19XrXj0weOnGgAOPMEDGQ+3wzxTu1DtkRt9s
         M40g==
X-Forwarded-Encrypted: i=1; AJvYcCXkjYCHagZqTynYBvlLHfCqZPh5G3PZixNgVHEFlQa2pqR1y5YEX5dZjuUXlOsVY+XCUHZ+TbqmUG0MNL395IHFDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy79IVjyQS5jf5nuXWMtQUcYxC2nMloKwIuNmCthJX88XYAXaAF
	mFmBXCYXKCrEL0uMOb03/oe+TGCViNCq70jXjZ7MesaDA60hQbA+lrWBEumSdtM=
X-Gm-Gg: ASbGncscjZm8zE/4jrvO7RQJID2IHmqh7CdShRp7n6WkwveCdl7tcbW1FO22/IHGEba
	hLcq6YxGpiWg5GBJK1Jq9I0czl5SxR6PjE69GpCw1gs8uauAWcrpbUcGr8IomGm20zjpkImOS2v
	GlF3CAESxdpfLXavT6otFf4jNybNhAztqj+dINmFySUUDsi8f+OyXpHj3kFyBKZwcsppWpZrk7K
	g/3AtxVUMYFyzvhlrAeIzcb55l17rx2rg5dl5EdA2YSbsWCOP6gTKaNr4NFLA==
X-Google-Smtp-Source: AGHT+IExCD1XX9izJi90Kdc42+9qhGwcjFZAxBY7JMxh2yX9I9+lBRCI+6LTlP3SWrBy5me6fxhpIw==
X-Received: by 2002:a05:6402:354a:b0:5d2:7396:b0ed with SMTP id 4fb4d7f45d1cf-5d972e0e3abmr58693927a12.14.1736924115733;
        Tue, 14 Jan 2025 22:55:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90da11esm726930166b.69.2025.01.14.22.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 22:55:15 -0800 (PST)
Date: Wed, 15 Jan 2025 09:55:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: renesas: rz-ssi: Clean up on error in probe()
Message-ID: <14864a18-c256-4c7d-b064-ba1400bed894@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call rz_ssi_release_dma_channels() on these error paths to clean up from
rz_ssi_dma_request().

Fixes: 26ac471c5354 ("ASoC: sh: rz-ssi: Add SSI DMAC support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/renesas/rz-ssi.c | 42 ++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 3a0af4ca7ab6..4b3016282717 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1150,35 +1150,47 @@ static int rz_ssi_probe(struct platform_device *pdev)
 		ssi->irq_rx = platform_get_irq_byname(pdev, "dma_rx");
 		if (ssi->irq_tx == -ENXIO && ssi->irq_rx == -ENXIO) {
 			ssi->irq_rt = platform_get_irq_byname(pdev, "dma_rt");
-			if (ssi->irq_rt < 0)
-				return ssi->irq_rt;
+			if (ssi->irq_rt < 0) {
+				ret = ssi->irq_rt;
+				goto err_release_dma_chs;
+			}
 
 			ret = devm_request_irq(dev, ssi->irq_rt,
 					       &rz_ssi_interrupt, 0,
 					       dev_name(dev), ssi);
-			if (ret < 0)
-				return dev_err_probe(dev, ret,
-						     "irq request error (dma_rt)\n");
+			if (ret < 0) {
+				dev_err_probe(dev, ret,
+					      "irq request error (dma_rt)\n");
+				goto err_release_dma_chs;
+			}
 		} else {
-			if (ssi->irq_tx < 0)
-				return ssi->irq_tx;
+			if (ssi->irq_tx < 0) {
+				ret = ssi->irq_tx;
+				goto err_release_dma_chs;
+			}
 
-			if (ssi->irq_rx < 0)
-				return ssi->irq_rx;
+			if (ssi->irq_rx < 0) {
+				ret = ssi->irq_rx;
+				goto err_release_dma_chs;
+			}
 
 			ret = devm_request_irq(dev, ssi->irq_tx,
 					       &rz_ssi_interrupt, 0,
 					       dev_name(dev), ssi);
-			if (ret < 0)
-				return dev_err_probe(dev, ret,
-						"irq request error (dma_tx)\n");
+			if (ret < 0) {
+				dev_err_probe(dev, ret,
+					      "irq request error (dma_tx)\n");
+				goto err_release_dma_chs;
+			}
 
 			ret = devm_request_irq(dev, ssi->irq_rx,
 					       &rz_ssi_interrupt, 0,
 					       dev_name(dev), ssi);
-			if (ret < 0)
-				return dev_err_probe(dev, ret,
-						"irq request error (dma_rx)\n");
+			if (ret < 0) {
+				dev_err_probe(dev, ret,
+					      "irq request error (dma_rx)\n");
+				goto err_release_dma_chs;
+			}
 		}
 	}
 
-- 
2.45.2


