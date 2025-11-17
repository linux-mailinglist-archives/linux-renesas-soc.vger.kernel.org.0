Return-Path: <linux-renesas-soc+bounces-24687-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A7FC637F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 11:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9C924357564
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 10:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7657E3271F0;
	Mon, 17 Nov 2025 10:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="O0P8vykF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC0531D756
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 10:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763374374; cv=none; b=te/D/gvj6wfk2jtR+AP91RQhzeiNJPuAEBIzTX1Iln9WXEFYVMxORDyQhgSYJzQmuiXJN0asMpaXYYbmULqp/CeC6Ots5G30zYuFrnZuXSS9m06vxlr0CTGt/IArb8O0VG2Dxl0qg93s1bqb4G4S1ibUIDfbK1N9Pqn+taooeDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763374374; c=relaxed/simple;
	bh=+QKT/Rg2f4P02LTHnSwMEDGtEvvt3JIbEpU9JM+I3wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U3GRADTPPSQpjE00IsAAvK2pdP2XFKLAMQOEh+aWlPfS4u/dCGDF5SKEV8A9qbnYvrRP2DNyazGgwDlJbaAeCRJ6vU4era9wRlMbfOusw+w2vzkP4iBPRYhY1uGeVu0Jnq9kDYJnZLOsEn5lpco08CKzao358D8qPKj6CNmbgb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=O0P8vykF; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4774f41628bso26610505e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 02:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763374370; x=1763979170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ex+tMUFuY0anS2wKRB4rpwClxxfgy66lMucIP/0+dJM=;
        b=O0P8vykFqyijNX+8PRgwSwVy8SGmTJjERDtSeDYyIqBNVhmn5BQIv855HI/ukaQDUe
         sgzphdHlqfGQuGKff23Fomrkf3ZTZA/oA2ZcvZ8D/QBdtNeHemr2+qwxd4niltEnnwxw
         fBmtExLRUW2Uxh4/Tu1gYSh0tQTE1rUqizXHOLI2G5Sly0ZT/rg2XR3jpyN4Sn830GXV
         YTLvrNgKRZr+47EJ56/pIzAiSKVtkJontZRCIyzu4+BJ9QV+k37//qgEWB5aIWDOaCVn
         2d8eTslM6L/hjXfTrdvNDjI0PRIIj/BmhkjS/Xk6H574/7bzaDNPwL+23gV4fwtjd3Ly
         1SZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763374370; x=1763979170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ex+tMUFuY0anS2wKRB4rpwClxxfgy66lMucIP/0+dJM=;
        b=e0V3Bcz+Q43/xTetz20+Rc1mLFg8pt8aGIuZl33TRrF9CIDhksBei/+FqNFnJOu8P5
         xD6k1raCpYPs3X2L/bfYn6u5L0VmqkryBTVbT7by1mDBeG3FVXauDYVE9Iaqu8nvyGuA
         NJZNk0rr0gPo9MPsR/DNBbXgXOKMgDsJx+R9kasZw2gC18qr0D3zLzFu4t/z14TddnoC
         Pt2xzxKCihylGQAiHGRsUViNjyDhJ9KOskL/QTFe8cquZX0nb4h5FTsXZA6elZWgiRv3
         /xy8hBPmLrr/6dEgdLknT/PdIA/lWg8WRrtGVX6i/O68fhKk2k3nhPj52hwPuYj1oD/C
         PJ9A==
X-Forwarded-Encrypted: i=1; AJvYcCVtW4c5wJ/pj+YPGm6EDLya77+j2pWCalR4bVrx+/FP+V4oWhiC0Zi36MQg/ppjKm6WYuioApgnTqyyxDqn0+TU7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTwWviUrFtLzcQ2B9vEbQWuSNbsPCGWDOlG1CbGfZl9uHaBSRp
	6VguaAwSJyUO0DqegnHkF5ODHNosJlcohS7trXpwfcc25eCMz1DypiD40XJiVh3dGGo=
X-Gm-Gg: ASbGnctl+Z3RHzpgoMnBO/o7sFsSho52z09qyN/ky+Y1hUEoyt62I4uIvKJaRKP11RP
	BDUpMe3SzuC5rVENswelnXj2n8zd2m1Jv1936gPtVh7BRkSv8JEU5Noj3QQ26EoqXW34DAyRRdx
	FYT4nsfR81N/1K925dcnUZwqlkNrJa0eLlH50LBjUw2hMVRG7q5xgx2Jj8/FdIYox2Y4mydd2cV
	TUqJ5y0YCuWKZWJAiToN8c8CcZ7mV32jfk3Z75ES2HUlZb90W8E4/pkI7k0oaqr0JKq/xXCXyQ9
	RyNFJ3lMHC51wgr4Jln4JLk4KYankW4HPs9mlDJLn0i4bjRcj80lKAOLdGPvNlnlYaTgQpuQam3
	dE/kWZw1rqArB7htuePrabdK7VhoO7tPZ8wTkBRL0FhlnPQXh2oqPdfA2qI9W6XA7duEODrWlex
	J33JhkKDBjC3JDlH7jEzclXXDSdnqX82cgu3YO5pM3
X-Google-Smtp-Source: AGHT+IGT3sI+SDQvPoR+/Dl9yuK/0OOqHu7g4j98kCKQbIXtBdBya/HNJnhQ695H2TFveadrG52AIg==
X-Received: by 2002:a05:6000:200e:b0:429:58f:26f with SMTP id ffacd0b85a97d-42b58dc1eb4mr12029768f8f.24.1763374370366;
        Mon, 17 Nov 2025 02:12:50 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f203afsm25806958f8f.39.2025.11.17.02.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 02:12:49 -0800 (PST)
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
Subject: [PATCH v2 1/3] mmc: renesas_sdhi: Deassert the reset signal on probe
Date: Mon, 17 Nov 2025 12:12:40 +0200
Message-ID: <20251117101242.4018208-2-claudiu.beznea.uj@bp.renesas.com>
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

Deassert the reset signal of the SDHI controller during probe to avoid
relying on the previous bootloaders. Without deasserting the reset signal,
the SDHI controller will not function.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 drivers/mmc/host/renesas_sdhi_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index f56fa2cd208d..c4aaf534868c 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1103,7 +1103,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (IS_ERR(priv->clk_cd))
 		return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk_cd), "cannot get cd clock");
 
-	priv->rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
+	priv->rstc = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, NULL);
 	if (IS_ERR(priv->rstc))
 		return PTR_ERR(priv->rstc);
 
-- 
2.43.0


