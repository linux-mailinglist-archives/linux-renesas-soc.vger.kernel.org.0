Return-Path: <linux-renesas-soc+bounces-264-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEB37F9C46
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 10:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBE7E1C20A68
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 09:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6060F13AF6;
	Mon, 27 Nov 2023 09:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Cy84VwcD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3080C189
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Nov 2023 01:04:45 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-54a94e68fb1so7884680a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Nov 2023 01:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1701075883; x=1701680683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SY105oJjqBLJjrNiZ881NJwgu30bKrulY2ZruFXx9EI=;
        b=Cy84VwcD08LovmdeluY81pY4hAxrPC/7PtZXICdWX86mK7rGn5tzGvr/0Dixx9M34c
         PrRrOJPAVkN53uadZIHupv8vw8QrB2kHVuEzz4+QiAqiBGrTLo1Eb/XsNircAQ5wcuTK
         VIaJhxKj5MlCGXgy/5d9FF4SIvYNmyd3Qo7ihEGVwgZCNkhMPEAXtSHgJsfEAyiSeGBB
         9kAvls/FfeXBq00H6X2HYiBiDZYCvjNk3oyG8ytiw0pudB9Ajc0ifHIUIOBBnz6+ofdh
         /3KkXn8vCe8fKYN8w1iFlmaWVSYMof2tr+Ht1Jm9Fs0aflYkcDfB2iO1y5ssYiMI0BGV
         w6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701075883; x=1701680683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SY105oJjqBLJjrNiZ881NJwgu30bKrulY2ZruFXx9EI=;
        b=KzsLNRJORz5AwvP/lA9BfB/ZEca0Ax35SKyoGJlS3ykfzpdTbuzN9aIGhIDwzzY2Vr
         Pfx/GXQ/5/VW0i2Eb7MThh9FGkAlx77F3o71nlWU+5dziIN1HrtfhyOpHKaekuzpb0la
         CUXYfaZ4YxnwAmGiMZ4cBoBp5c0yKqRhwwly+WqYgKkQ8u2HhxXSGBFFFQH8RY3wlfat
         BFFz8LhLWG5ni1eJlI5iIfoMLlUTbpfICV3R015iIsX5pkBSaUPNUJt6L1H4+/6Y15+0
         UyWw5VHHyk+a3DKUwo2xzz83GflX5Xn5kpWolZOh0IPAE/pw9UdMWFHlk7efD2uLFu+P
         6f3A==
X-Gm-Message-State: AOJu0YxRmH3+P9/Xns7h4ceyZTnNlcfgU36ij2ssMCZloyGTFl59Cf56
	rDBZgO8BjUC6AMyMWhXwvyHC5Q==
X-Google-Smtp-Source: AGHT+IE8VvNviNCZfHfu2FY1K+dZrQy6vqtZ9sx52MzgYilOK6puI7wCb7uyJ3cx0P9Jel53TArD0A==
X-Received: by 2002:a17:906:c44:b0:9ff:889c:c2ff with SMTP id t4-20020a1709060c4400b009ff889cc2ffmr12596865ejf.22.1701075883737;
        Mon, 27 Nov 2023 01:04:43 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.125])
        by smtp.gmail.com with ESMTPSA id ay14-20020a170906d28e00b009fad1dfe472sm5456539ejb.153.2023.11.27.01.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 01:04:43 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	yoshihiro.shimoda.uh@renesas.com,
	geert+renesas@glider.be,
	wsa+renesas@sang-engineering.com,
	robh@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	mitsuhiro.kimura.kc@renesas.com,
	masaru.nagai.vx@renesas.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/6] net: ravb: Use pm_runtime_resume_and_get()
Date: Mon, 27 Nov 2023 11:04:22 +0200
Message-Id: <20231127090426.3761729-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127090426.3761729-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231127090426.3761729-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

pm_runtime_get_sync() may return an error. In case it returns with an error
dev->power.usage_count needs to be decremented. pm_runtime_resume_and_get()
takes care of this. Thus use it.

Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes since [1]:
- added goto label for pm_runtime_disable(); with this innecessary
  changes were removed

[1] https://lore.kernel.org/all/20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com/

 drivers/net/ethernet/renesas/ravb_main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 50c4c79be035..cd3474168452 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2650,7 +2650,9 @@ static int ravb_probe(struct platform_device *pdev)
 		goto out_free_netdev;
 
 	pm_runtime_enable(&pdev->dev);
-	pm_runtime_get_sync(&pdev->dev);
+	error = pm_runtime_resume_and_get(&pdev->dev);
+	if (error < 0)
+		goto out_runtime_disable;
 
 	if (info->multi_irqs) {
 		if (info->err_mgmt_irqs)
@@ -2876,6 +2878,7 @@ static int ravb_probe(struct platform_device *pdev)
 	clk_disable_unprepare(priv->refclk);
 out_release:
 	pm_runtime_put(&pdev->dev);
+out_runtime_disable:
 	pm_runtime_disable(&pdev->dev);
 	reset_control_assert(rstc);
 out_free_netdev:
-- 
2.39.2


