Return-Path: <linux-renesas-soc+bounces-14361-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC38DA60E61
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 11:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E6584602CC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 10:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9CE1F584E;
	Fri, 14 Mar 2025 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gOkoCSjL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CBB1F5858
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Mar 2025 10:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741947079; cv=none; b=j3dd2uOANN9qrzG4vh1G5+yxDfyClKEXBHVFmxonXpm2MRK0bqAQCyorzy+K12K2nYTrtSulaCrnFn3Tpl4JE08uWs5iL1i4QrJG493/4PwfrZAAR9YFHCK+GD8I8DIYQqvBEMzCiC+kURWvoBsFWWqd9whZy2HcZTiRxlJAxiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741947079; c=relaxed/simple;
	bh=3ahzH7sLMBPla+F2Y8AvwvjAYSJ5VvM8xfAY5mAjYis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oGe0s2SX1yKN6bIapxUS7X+esTdMLB+DTBMF/YU+G9GzapgB/VeRGiZGqDNsUp3AVFP9xBwTl+RHtRzBikYFaE+SpE+kBwmLTUf7JpYqVmuvxa+1iPFd5le4v5mrm9UgUHQJAZzE4snRovtAulLpm37LoytqIkgviaE2WdIWnno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gOkoCSjL; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39129fc51f8so1687941f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Mar 2025 03:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741947073; x=1742551873; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yaoaIY6mq6HjtY7Y1s7vhYdY4pp2YI7DLVfhzEAcBtQ=;
        b=gOkoCSjLCUWrZCYIPDCFuPq6s46O0vg4d/nytOiZPDRT4J3ICCqWSAfZ/WPR8/yGT5
         TGg4s+e9tunM0nqgtEcR17YMz5PPc+AuwiaefWKJVrZag+J2oH4BAHOf7HD2SY0Wlg62
         YZcTvJXidf5tAPZbjA242Tua4dDNlX9F06ML9wUwcnklDOTGhxGqdZ9jABC+qmBM+Gld
         NoSiV3/XaN6AA5u4vCei+SenXswKKAI+pwJ8VWouTQmdA0X7T4/Pi5aAtBJfwBr/wzr8
         T8uWEBJTq/yetlU5ePGAMnaVnaBy8N1QHJWxouXs+QsOmDBmJ+5A2l6vjGpenDtSxF3H
         bGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741947073; x=1742551873;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yaoaIY6mq6HjtY7Y1s7vhYdY4pp2YI7DLVfhzEAcBtQ=;
        b=H7EOH+wVpp+oCkxy1otgw7umw21W4ly7M5pWIgpp7WV/0yPZbkpMLBxlHPyLaOYWMU
         3nxqNGg2efwjzeF58Q05j1agCI8EI6Itp3iDQ2dLOsHMdj15h8/V5DZfpKWbr83ctaJV
         XVYXYlhSPJJuaVjX12nqDYlWgmjLGqsviBSqP4g8U0lXKD+rtCGMVq3DyGKOrgy91aeQ
         QcmBIC9r8h8dy7rDR5ASfRt4qGf4sQToIWK9KgMIY+ecQGXs5LYTmZVff1zlVQAfWGQH
         JlqhpbQbgEEfV5IeXgn9ctzloO/AD+fwg67jG5mCEWukk4yLlT86sf4rHandt5rbIpin
         j4eg==
X-Forwarded-Encrypted: i=1; AJvYcCXYLgoPRx0xiiFeeuPVndEuzafyETb+oYkuQb0SaZFrvXha1vtw5IHh0A3jk74rNSozKHO8rYmV+mwQly4zsXBrmg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywye2MVhDdauyERf+BlaSctwlghvkqJ+XFY+aEhv/2Dm3lkD19v
	MzFapoySXshgYp+IVPcjIBa1VOZqmIEEq7bai5NCMyRPDEJ4MKeuqarRbou63Hb8Uu900Pt1We4
	7
X-Gm-Gg: ASbGncuGVTW9kSw8w8/MY5BIjPx2vxnHua+PSMKyrh8MzwvEfReql7bEcSydnojj1D+
	v/SzDZ3IEm0ePIv5Jh0ZCjIWWIK85Po7coQ+2Gr7bfb4ExJ83UoKlTi2CkdP3B65gCYlG6wY41H
	EAOWO5rU/FqbGv5TdarJ7nFtwcXs0q01FfzXAVsXPM+ss8X8ccQqVe5UI9ngHljxgMt+nn9mNg6
	OZgzKentPW5SDa5BEkeB4WNCAD3qjmALRmUlfVjaPvVLoclCX7BvSxbJlzrQvkj1Jjt5FHknmij
	unmOZYmYDcufvFZl8ctA7F55ltezt4AbPnaIvohnZilpLd+Kng==
X-Google-Smtp-Source: AGHT+IEZV7Q1QnjasExKNihgSsImAvSjr+KfxLj4uhGOe3kxwV0Balcqir0mcbZRaWbeyfUh4B2wSQ==
X-Received: by 2002:a5d:64cf:0:b0:38f:2efb:b829 with SMTP id ffacd0b85a97d-3971f5113f7mr2060911f8f.50.1741947072761;
        Fri, 14 Mar 2025 03:11:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395cb40fa30sm5082312f8f.68.2025.03.14.03.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 03:11:12 -0700 (PDT)
Date: Fri, 14 Mar 2025 13:11:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] mmc: renesas_sdhi: fix error code in
 renesas_sdhi_probe()
Message-ID: <dc39e555-8ef7-4a39-9253-65bcf3e50c01@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If devm_regulator_register() fails then propagate the error code.  Don't
return success.

Fixes: fae80a99dc03 ("mmc: renesas_sdhi: Add support for RZ/G3E SoC")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mmc/host/renesas_sdhi_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 396fa2816a15..fa6526be3638 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1178,6 +1178,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		of_node_put(rcfg.of_node);
 		if (IS_ERR(rdev)) {
 			dev_err(dev, "regulator register failed err=%ld", PTR_ERR(rdev));
+			ret = PTR_ERR(rdev);
 			goto efree;
 		}
 		priv->rdev = rdev;
-- 
2.47.2


