Return-Path: <linux-renesas-soc+bounces-1631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF55783614B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 12:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9853E28B25C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 11:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E50E3F8F8;
	Mon, 22 Jan 2024 11:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="nijsCHoc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3083F8C4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 11:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705921910; cv=none; b=QNIqU/gmBcXsOrzEk3tKx4ZippBMKMNS7l5TW2gNE8GVjPH1FcjwxZU2EKOzS6fEbBgtPqaU65FRxQsPeo3c3LRrBX0GM+p9528sWHOfyNNiViht5UTqkOBYwYTWwf7t1NHSS/jwC/nOZJNcloBdlOL54gCN0aVJIdAsHSlfzRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705921910; c=relaxed/simple;
	bh=NCms0ZLKEiS45wOrj0dlqugM1ADv/GfHrMYyZSUMCAU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F9nsSWO+PWYSR4DBF+ScHnDQnzB7FkcyEv0YHUErj0u6NDca1z2Kkz+6zorjq4qppMNFUq9YneBM1ur4gUDgPep2YfWp7O3iONQuspk+5wqYVBPN0rjUPx/AdamGXib11nw8Lj3R5UO0prMiiWh6EsPyAl3lvkfyJBSMuR/TIXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=nijsCHoc; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-55a035669d5so3452278a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 03:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1705921907; x=1706526707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TiQV2ILDyfuhRtQ7ScYQPUgegRvmagL9x54ZH9Lb49w=;
        b=nijsCHocPE5ZB9iHmVfCjfjAxCX7AeGKT+ddW4PwI+x7M7q/T271ujTfXC60gi8jjW
         mmuUFm/sVZrx0rO10EXAmi6eXGIR0F771uutfiLeR5uFBiPMvJiDd6maM95dWGRk27XV
         5nfBElckZqn+/p1ALOuAUHFjOIyFvXeN/TYqatT3Y720oZ1IzaOYz0uiTvMdQBJhrC7T
         l0TsYVJEZev4uE0dhHb6ZQagKu1Qo92n44N9HeNKTbatdYrk2HwcV4LuQsBL6BEoQIV+
         dcB8gsOb6a9Nu07OzCUqtW3NdKQssCc3a2BYo6COGGrgUQ+YkYcr+eOaAcgWDTVQMvEU
         8nIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705921907; x=1706526707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TiQV2ILDyfuhRtQ7ScYQPUgegRvmagL9x54ZH9Lb49w=;
        b=ZSlMCzPuFCjcVAf4wttH3LB2p78dgIZXM/dPXLAlgMkxpo08eYDcpbHnHVqqlj76P8
         LnoDGzZCAGUz6bONwrfxI3+o9C5L1L4UEKMD/SJ22hg5WunzoJDIkb+kRw0W2z0mewbh
         27DpUb1386ui6dANi4OAC1VZvyqK9iE57ABLi3KsGZD3H/1WyVetPm4pPz4gFgr6hMCb
         a3tRw8t1WGl2SDmujqonBFAPJLJAe1yJJ4pSPNa2p6XgRCJq2E2/aKJD7DnwnYYtXl3a
         lLRyJB7kjCV7/eRkLoINUJrsRw946uc10pQNOQb/Q0YJ3FvWE8kE06cnxe41nwhQTgWU
         Pvtw==
X-Gm-Message-State: AOJu0YzkJqc9sNoaeS5as0fL0oiic69tV5Laj+PjC0JD5GoOY59esBdx
	pDTUpxqpQErXJpXyeHH35Syc/N4L6Fxur1QCViPe0srtwmuobqtHvyjj3pqQaKM=
X-Google-Smtp-Source: AGHT+IEBQpSALgWgMpCRVaKQUN2PBkdeQxBdKtyArpj9r4N9gi82Rg0Lat8sieGJ7DxgQhY15mQeGg==
X-Received: by 2002:a05:6402:4302:b0:55c:4b7:cbe with SMTP id m2-20020a056402430200b0055c04b70cbemr1637215edc.16.1705921906857;
        Mon, 22 Jan 2024 03:11:46 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id t34-20020a056402242200b0055823c2ae17sm14194241eda.64.2024.01.22.03.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:11:46 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 05/10] watchdog: rzg2l_wdt: Remove comparison with zero
Date: Mon, 22 Jan 2024 13:11:10 +0200
Message-Id: <20240122111115.2861835-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240122111115.2861835-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240122111115.2861835-1-claudiu.beznea.uj@bp.renesas.com>
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
 drivers/watchdog/rzg2l_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 988926e50741..38607673e1a5 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -311,7 +311,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&priv->wdev, priv);
 	ret = devm_add_action_or_reset(&pdev->dev, rzg2l_wdt_pm_disable, &priv->wdev);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	watchdog_set_nowayout(&priv->wdev, nowayout);
-- 
2.39.2


