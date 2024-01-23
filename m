Return-Path: <linux-renesas-soc+bounces-1707-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE342838F1E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 14:01:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A49661F26EE7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 13:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3903B5FB81;
	Tue, 23 Jan 2024 12:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LYUpW+br"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810E05F572
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 12:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706014779; cv=none; b=LMrKAmEA1GqmfRLUxuvT1EOeyrwwnDTKDpPKHAM/HW5UdyIhMSQKIzWD5rII1IWN+RSXaqPCsZV81nesbWB0NrdyE9ZZ4oT1hApuEr8ic/Nvhq+LblJLwNlDnSm6bIs70xPdXA2jME8V2F+kVxl1bR8Lmp2Hdvx7AJmqR7/79EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706014779; c=relaxed/simple;
	bh=aQEUzVmBmgrV4xyXQ2IY7U2P3nF6SC9PEWGu5NpN9FI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uVEr4gxJ0B+8872/yJ6f9Hp/4xeGADTJvRY+AezThFIti1y2bfeRnt9nq9Q7RN2uebEIWPnU4QY4q0avkFbJTGFaJ3v0HNm7VKeWLkZKFSl41p3/JXuX8BSTMDykaWRQYQXWKV778Chr5x2fcb9vwqsWzP8wRNELaZ9cglf+4Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LYUpW+br; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e7e2e04f0so47333625e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 04:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706014776; x=1706619576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQVKGToeNaPe1F035XCNIF5gNVWAFGIwMD7/cf8Gc4w=;
        b=LYUpW+brANXsIeLV/iryRFZrZ3AXT3VuvjUPLmhEGXcqwRoYaQBFXYTE1bEPjGPIt0
         3VqN933n87RdPdiBF4PpE5n4w4aUYFlc73R4xNyNdlWHOiy8rT9V6zz1ZD0Ck6d4crhk
         TKAB43Ac9EqRq+RtgycUxm9a/vHxnqcr63vA71Zsu51aWpy7bDVP4lpwXXbanDyXX1UF
         rXWMP5ZY7YlSBL/jZH2o4DN2pkJ9mC4ge3g1zoWnpjijwj65swaNtrnFzydE3LyTXr7E
         B0ehBP/XyYYAMKzRBfeTsLLfrS45RlPcw3wVAUzO6IihpiokUrl/wXoZa0t2Oc+/VqKy
         9PAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706014776; x=1706619576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQVKGToeNaPe1F035XCNIF5gNVWAFGIwMD7/cf8Gc4w=;
        b=VZzG4d8NOuDYPXIhQ2Fw0MbszAmTKjlU2f+wBVIYDXFo5FBvDnT5nOonCynVcj2DZe
         ORHh1clksP2r63D09yVVddvtPSbhQ3Ck4+CFE7yhRaE7X2+3vk9thEX+B+se+x8uP8Xj
         MQ8TxJpTaSA+5dC/vLAErtXIUOaz+Ouaofs6Jh1Bvl89cUu2Je/CuZ4lWvWqSzS6nWwu
         LFwQOvJEL4xGoIb3+m/gpAn+6JXd/p1Wq12ouQBSKmQ5WGvqeIIKn1CV6u7yJqLEZF/S
         ZLtDEmJg7Gf5ijsRgJN9DBcab941Js9aY8I4altHHahETI7lgrjB1+bMhN31QJ75qT2E
         Ugcw==
X-Gm-Message-State: AOJu0YwQRU1s1BXRwvwID3OsPxsDt/wLIZ1iBH9Z3Zhzkl6Lcwe8QfXY
	X/aEzeK3eryWwGm8TrITq7jpU40Bg7INCji9e027/6LCQGiub3xvauvlCoFaJ30=
X-Google-Smtp-Source: AGHT+IFPfmmQdwvol8pjr8QLxC02Ethsp9G7xgVXycjOae9Jh2hT6EBa1zQZEKQsrT84fHsQSS18LQ==
X-Received: by 2002:a05:600c:91e:b0:40e:96df:35de with SMTP id m30-20020a05600c091e00b0040e96df35demr551360wmp.86.1706014775872;
        Tue, 23 Jan 2024 04:59:35 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id s4-20020a05600c45c400b0040e6ff60057sm33655711wmo.48.2024.01.23.04.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 04:59:35 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v4 03/15] net: ravb: Make reset controller support mandatory
Date: Tue, 23 Jan 2024 14:58:17 +0200
Message-Id: <20240123125829.3970325-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240123125829.3970325-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240123125829.3970325-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On the RZ/G3S SoC the reset controller is mandatory for the IP to work.
The device tree binding documentation for the ravb driver specifies that
the resets are mandatory. Based on this, make the resets mandatory also in
driver for all ravb devices.

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- select RESET_CONTROLLER
- dropped Geert Rb as I changed the patch again according to his
  indication
  
Changes in v3:
- none

Changes in v2:
- collected tags


 drivers/net/ethernet/renesas/Kconfig     | 1 +
 drivers/net/ethernet/renesas/ravb_main.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/Kconfig b/drivers/net/ethernet/renesas/Kconfig
index d6136fe5c206..b03fae7a0f72 100644
--- a/drivers/net/ethernet/renesas/Kconfig
+++ b/drivers/net/ethernet/renesas/Kconfig
@@ -34,6 +34,7 @@ config RAVB
 	select MII
 	select MDIO_BITBANG
 	select PHYLIB
+	select RESET_CONTROLLER
 	help
 	  Renesas Ethernet AVB device driver.
 
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 636da4f558f8..65b084778b93 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2645,7 +2645,7 @@ static int ravb_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
+	rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(rstc))
 		return dev_err_probe(&pdev->dev, PTR_ERR(rstc),
 				     "failed to get cpg reset\n");
-- 
2.39.2


