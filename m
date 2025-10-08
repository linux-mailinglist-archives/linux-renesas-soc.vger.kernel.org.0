Return-Path: <linux-renesas-soc+bounces-22775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 408DDBC34A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Oct 2025 06:25:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 44B804E9F3D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Oct 2025 04:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7492BEC53;
	Wed,  8 Oct 2025 04:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qMHa/TXN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90DA2BE035
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 04:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759897537; cv=none; b=Ya8PAsfq1RdOV52sW6BPdqCkioEG0vZMDFT5AWwMv6CXQfTCGWbevG21KJ7xOkOL+FQjbssSHf2cv6WjR4aB/NxaPEdEMnPGnkRg71UcqEBy4Ibbq6CyJppzHuxKBdASjbDH7sGuAVz663i0lCDoJa70c9nJ6mRC9Ad1c2GIhn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759897537; c=relaxed/simple;
	bh=D76b8g5MMMam1XG5CeoG+dRqRhsn10Qo6IX3BhaGdcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tseALdnO0nq+rFJEXaNH2XAymLUeeD6kEJ1GdX9GE4SG+OFOgaM3Z+/OMIKjkHcbTWUG42Jf5nmxFBtqGu1lpQk017etXrhRE5wyxPCtvRzFeipuPsqBYRPUIs/dfbUTysSGa1J+nG9Cw2pD54ou8N7OF+nWHZvCeVTATx8j0qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qMHa/TXN; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-63963066fb0so9432561a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Oct 2025 21:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1759897534; x=1760502334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZ9SuUW1UzNO7L8W8R87ast4mEdS/6k2/bbpjsln1KA=;
        b=qMHa/TXN8ASIciEhpmYTr7YPe+zB/Hi5L70iBuruZMTa2P5FF/EA6JxGS8wRNGk1Fz
         zhtp21naDkOWSgf4bO3TKsV9KD9zy4mQWbkEwRebo8226TzxgFRecu2DrFW35BOkr3Ml
         h/SGbe1aUSLtNsrG0wSc4bvtaFSl5tzy7CC8Bw7sv/1B79JBn3j3EyaBb0xbVsHOBS9R
         JHh9cbVDSUDdDDc2lSi76zWlAtdrnSKwu1L8Zv+isJ8HGm40+5EfFevMM98rEQPbQyNQ
         FVvBKuSpziHjlNl6iWMcviEO3zChVrOTd2+TFVP8F8IHUxI+irLRQVfJUumflkD30Hjg
         elaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759897534; x=1760502334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZ9SuUW1UzNO7L8W8R87ast4mEdS/6k2/bbpjsln1KA=;
        b=IuK1NfvPnPpqa+l/7tHE01eKWhA7a8toIqcZcRF8Qfiu4d5hqAk1gKYZKkmQPRQZgi
         UZYMX1SQjk+Go10nGC9s++MfD/tgG3zPaq7lMs7q6KpOAFYPnV1hfYZeoZXcoHmux3u7
         9zZzCLHYEc5M1Xm918LUuSdsTrdb3MzEY+YcHms2SyVuUlPwb0zV0zP9Mjmla05QZSb+
         s3/dqbUnpazNerYhfKmppuH38I/lG1l/YLYJ68EzuPXyaf6UzbVIG0tQTzJ5cxzd0noy
         2cwZSfu1556Ee6t+N8MDL6KhlAfr3d4/79Qu9Rjye2F/SEHkc9qSIXSTsGKNi5wcEgvC
         LsgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXqrsZQERLZrH8Yzv/1sCMqipH+poY7DFW4VpjclpoeIL8Tua9crCiCSiIKQ+XbHn654kczLVK4V755aj16Ir/fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf74RNXWXkd2RusXLiCZmWLN9MgFVbhsdVkMtwEOnTk/H2XB1l
	m7UOPsV3B4qPPXbMM089fjgzNljmRvNzOggKBPFQVNtgvD/1lxr2tt5a3erZgX50lkg=
X-Gm-Gg: ASbGnctoA7KOHyEHBNfTEP5JTbDCDVE/09xTEyDzISesiNeUpdOSK3QEP205YVVEhxT
	joSNmRDfOgj8jssNZ4/B7utGLE07He2Sa2fSn/3uPmvsdys9m9SxuNB0MguITm3Q03vELOpYuZg
	7exZgh/vHXwXyxgFHx5DaPbZUW4cGzoRlKtPMEaOeiOxnEUWf+FQJJqlk4jIKcUHnEnr0WCa2uq
	3H+tHi+Kpwniuk50altSXRobCn8FEIp5SJIIVPlFMdazwn9g7u9ie+DjUZmt3SgRuZdWfwQJxDd
	SATDunan/dIkU+wNAmUx8yKL8LbfHv7BnJb96SP0I5DByIcPNpJAEd+v5cYpH33r6z3LbBnsdfv
	9ExEHBSs6mb9JpCdOf6PSAYaYjii/MVnABvty8Ksg2qSbVs9cfXC6NLZ9ouOlF5drblgUo1V2F5
	k=
X-Google-Smtp-Source: AGHT+IEZSlz/EKrFkQ8tGzGGZjHV3u81jhu2PpcsjCGbnFA9tn7eJ3yvjQACOpvp1GYcqUvP3wSQMQ==
X-Received: by 2002:a17:907:2d8a:b0:b09:2331:f14d with SMTP id a640c23a62f3a-b50acb0e556mr182268866b.64.1759897534049;
        Tue, 07 Oct 2025 21:25:34 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.59])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e77427sm1583124466b.36.2025.10.07.21.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 21:25:33 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wsa+renesas@sang-engineering.com,
	ulf.hansson@linaro.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 1/3] mmc: renesas_sdhi: Deassert the reset signal on probe
Date: Wed,  8 Oct 2025 07:25:23 +0300
Message-ID: <20251008042526.3312597-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008042526.3312597-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251008042526.3312597-1-claudiu.beznea.uj@bp.renesas.com>
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
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


