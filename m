Return-Path: <linux-renesas-soc+bounces-2436-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F0584CB1E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 14:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CA8B1C253A2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 13:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9527D41A;
	Wed,  7 Feb 2024 13:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="hIR+Jquk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EA17CF23
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Feb 2024 13:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707311302; cv=none; b=TEOqkuH2gHsVcVSDScFYY4g7sMoJqtB8pGT6zRqWqtmn/7YxPK+VNVWd/jrzaVxFDM5//WbDVppimxrf2NysJ2RVpZ33Q/x3RVW5Me5LvG3FZLARXvO5gKcK91DBM7SdoNxG14goTLUGEvv7RLi3YvHVXF3ZpO/i42tT6amXvAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707311302; c=relaxed/simple;
	bh=9wS2DKxIpXZhnyOIVOsE8hyO2NTVWLU6eAkpl9TOTpM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZrEVITDqjbJsEXy4y/WZVJnjz95iosH672E7JfvyrWky76vEwA6i/aBqPjuvPDaR0g/3Rm78Wa2Y9rwwTpGdOklTyhk76GwjjauZ58p16lgoNaYWNe5w8xsamfHmczHdO5wvAdJ9zmSU3lfeO71FZam1RZtytz2milkEckDcq8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=hIR+Jquk; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-68c495ba558so2946626d6.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Feb 2024 05:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707311298; x=1707916098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIX4JII7//m3ujlODU2g6bbKkBor3h7MnzjAzhCkf0M=;
        b=hIR+JqukmlM1F+MW/mWPROlIJ6qkgHNmXeLnBL2xc71t1roP3w1XNrpSvK9boQ0TH3
         O1TbuiHBzYoNth621jFbNlGvs6+Lx/AcsBMmfDmUUbB+VKq8TrMR223H6ZqyxO7TEPW5
         pubvLP0+f8kLz37mfpeGs9D8M4bHvNdW5EaBgAIc+VnnK8magnwd9QLavvAFiR4mNKTT
         c3VmdGpSZVZINW8tWHOIXWrxcizo0L8iviBTY1YCLv+7qcHM5ooD/BjdqJXSQx5mL0MB
         rJIj5MlnCZiKL9lqO+aRN2vDwuK6G3oF19n5AkMlRqoKRbQqqHXBRi7UGhesogEkjcpz
         hxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707311298; x=1707916098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HIX4JII7//m3ujlODU2g6bbKkBor3h7MnzjAzhCkf0M=;
        b=EDnN70+5WpKW3uheYd9uL5GkRYDzBBXNuQtWgJRhu9jY51m4+qQrTvA1LzSWD9qeJR
         pl+9LbsoyR/BEtXqS+fdSGZtK29DWYdunLjfmWnDk1d1PFbK5wBP4SdZOluFNmVBeaRO
         wRL4BqtFuzba7Bh9Ey402fApG6saW28OuRpTTS1dusvTcSv0N0Bn0mVoXR1L30aiFf+v
         bMfdTsOvSYSVcD5V0leZeLJ3tdrsVmnWXCNmWYxp3F4phY5Q4RT6FhC9rq5n6xicgyyv
         B678iIPwAHpozZi6UrgBSJkFujOek4uTQBYB7TTveDIqRvo7PgJz715ws0mZcua41icY
         2XLQ==
X-Gm-Message-State: AOJu0YzAtrYasyF+AGcqQpEOL05oFMH+3bhp42cOI3gU5xP/7eqSae6q
	UQAc3H2p/Scy6PnLzwKmFpsZ7vKc4nfadjYTfHQ2qHsYRVTP0QNc+k+j/0VQRFM=
X-Google-Smtp-Source: AGHT+IE2SLCbzDbMCN3K6w7LjQKQsGpnuSx7DocEqt/K+UgUCJmCKDSOyuQ+LkedyJErZoZI2HaM5Q==
X-Received: by 2002:a05:6214:20ea:b0:68c:9109:b5e2 with SMTP id 10-20020a05621420ea00b0068c9109b5e2mr5782448qvk.30.1707311298353;
        Wed, 07 Feb 2024 05:08:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV6ptxpV1OEftg89HCU//c0Yxt5d4zmgA0bWR5RZrL3VW0RJQXzal09gnKPvPQ/w6iHcH9Ib7xN6djFzSkhaE5vY7RU5L6VGGVkGvucos/RLQItJlGmaIF33B3CCpaoElVdtvRQUFxGFnwHUP/EloH6NS1BZDFaY5ze9MYMj7mZfkgyjgQ6HMcPdbkzLXuDLiBWUojJuaAHGQFLl7TDBtW/VerIBTuouCkhO4X9GdL2BaHsmBwD1W1FEvwiDz4eBFpta3edICWM/fjZTqeBWUrwqukZ6mbSL0V2CFYKzGSr7zUovd+pCG0BPP2D674DeZxa/5BCjH33TwyjGQVTfbua99D/CJ/73ZjQdKjRVji/EdnhaZMXrzWx9IVn+zmDJvdUhcImc3n8wx91kGdsCnZLgC0Saa7BBYwtfYlz+elux3iSNlKeCqv0nwddZEqha0BfQLURE4lScw9qWuX4KXQII9INiRSMZ4/K/S6TKYyaGkPXynOc2fwMGoQjSWw4cNmOAcrZcwEYTQ==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id a17-20020a0ca991000000b0068c9cd2cf88sm565455qvb.60.2024.02.07.05.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 05:08:17 -0800 (PST)
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
Subject: [PATCH v5 6/9] watchdog: rzg2l_wdt: Remove comparison with zero
Date: Wed,  7 Feb 2024 15:07:42 +0200
Message-Id: <20240207130745.1783198-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240207130745.1783198-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240207130745.1783198-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v5:
- none

Changes in v4:
- none

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


