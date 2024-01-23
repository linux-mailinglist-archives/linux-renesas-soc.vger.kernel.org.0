Return-Path: <linux-renesas-soc+bounces-1718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C777A838F45
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 14:05:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68A431F29B45
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 13:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91363612CC;
	Tue, 23 Jan 2024 12:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YmC4zG0j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC67860DCC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 12:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706014793; cv=none; b=tFfnMUGmOAqNtTS7tqCamO6CNQ0rECC5mBbPTQG81UoZrU8BVNYHAGbvKvNPxyeWb/RSflVM6bW//5xmH6BPvw7gYsmmnm2V4w6RauyA6CL+KC618q91c+TtshETcNbxKM+gAUpoOs1YSggkxQ8azceODwb2U1ZqMDAsSWomDGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706014793; c=relaxed/simple;
	bh=hqR1Fnpsr1zfZ4XXcoXvlX+RpLOUELhZTTBjGjxL0o8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GXW1fu0LyX+sLdJGeeLTA4yVbhhpuQg17uu8yMO84aHsqBwq9JTE4Dtw/kmijQ7KNF4X3rgwnKdaQGe34Uim/ua0gwii8YvsbsANTh+HZ7DsiGFvsmLMcuVKzVZNzIREL0L5bxvCg/XE2DDeaIC/U2fkj0p88F2NOKcdxKLPQBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YmC4zG0j; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e7e2e04f0so47335975e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 04:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706014790; x=1706619590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5b1oLq4gou76iDcjhTA1HtV5RCuNVpeTpFhZ4OqPYQ0=;
        b=YmC4zG0jTksQVPjkb92HEunVFQCS4/NAb56zj2Sr1S7O+ZPbIwM01q48AXCmKPow+p
         WOoDbAebfh8w44pyUwWL7FiyeIjh8EWW3I8AnAOd7MH/KsoJabUvmgcBOqBZrmbnTlim
         dziiqJvFhEcWDA+znKAcNYWCuRABQ61biSjsWSWyeFq4NMi2PHF8akXMDd+e1K7ApElc
         7yNRJz82gq6p9qNqoWDEBn7h+PhYB7w08gAfMT8ZN/Ip5WkMAjwgObcMjMLTh4DCq8aZ
         MpbO7frsAWo0jdIUB4I2K6drBwMLJIosdKsd+kK+Yu3+1PO8TggsC0k/yUPWHxqke9k8
         +K8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706014790; x=1706619590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5b1oLq4gou76iDcjhTA1HtV5RCuNVpeTpFhZ4OqPYQ0=;
        b=KqJddM8df1ReYQ9FzMX3A9ZAg9ufUQtp5Dgn8WUG7hxJUh8MLVcBc5SLdum8OwXiGi
         rcrKzQGzll9XcbDoARRmyXy5VUgEQa6YAvPv1Wn2YiaQX0ge8L0Q3e6dReAk1nlEzo5r
         0KYV48lJcSwDQEfBKG3Zy9rqGRzgcPE5MHezv2Hry7zLygVwDpN/szuFJBfBApuxAUXS
         IlLLVRlTu8P02Lh5cIvYBEPqlFLHxK/VI7bkjbZCFwRzlMKYySDTi0ZXOCS2XMylaG9W
         m4Fd3fAXHFPBZ9nQlGeqLXkDMLLGy/eS5wp3hasgYtiCQpMzBFPA9UZaB5cr6/gPws5e
         2p4A==
X-Gm-Message-State: AOJu0YwKkS0rY3V/lp6wuA6cICbRo4/JT6vKd25vTwS7mB5CAXYGOg6j
	0bXAGcVmhZ2KPg/VNuvI89HpHnGRd/R+emHaBhx+bYRiB6ntI9ABG0sFQbx7tzIIxoke2sENWnO
	6
X-Google-Smtp-Source: AGHT+IF4h3c/kZ2AbFArDi40SsQW4e3/TwvabAGd1gvGbT6W6M1Bu1YIY/SyyeZZuovyDQ8aMHobCA==
X-Received: by 2002:a05:600c:4509:b0:40e:b244:1be3 with SMTP id t9-20020a05600c450900b0040eb2441be3mr490190wmo.175.1706014790203;
        Tue, 23 Jan 2024 04:59:50 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id s4-20020a05600c45c400b0040e6ff60057sm33655711wmo.48.2024.01.23.04.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 04:59:49 -0800 (PST)
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
Subject: [PATCH net-next v4 14/15] net: ravb: Simplify ravb_suspend()
Date: Tue, 23 Jan 2024 14:58:28 +0200
Message-Id: <20240123125829.3970325-15-claudiu.beznea.uj@bp.renesas.com>
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

As ravb_close() contains now the call to ravb_ptp_stop() for both ccc_gac
and gPTP aware platforms, there is no need to keep the separate call in
ravb_suspend(). Instead, move it to ravb_wol_setup(). In this way the
resulting code is cleaner.

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- fixed typos in patch description
- collected tags

Changes in v2:
- none; this patch is new

 drivers/net/ethernet/renesas/ravb_main.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index e22760b91a97..74568c836468 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2929,6 +2929,9 @@ static int ravb_wol_setup(struct net_device *ndev)
 	/* Enable MagicPacket */
 	ravb_modify(ndev, ECMR, ECMR_MPDE, ECMR_MPDE);
 
+	if (priv->info->ccc_gac)
+		ravb_ptp_stop(ndev);
+
 	return enable_irq_wake(priv->emac_irq);
 }
 
@@ -2961,14 +2964,10 @@ static int ravb_suspend(struct device *dev)
 	netif_device_detach(ndev);
 
 	if (priv->wol_enabled)
-		ret = ravb_wol_setup(ndev);
-	else
-		ret = ravb_close(ndev);
+		return ravb_wol_setup(ndev);
 
-	if (priv->info->ccc_gac)
-		ravb_ptp_stop(ndev);
-
-	if (priv->wol_enabled)
+	ret = ravb_close(ndev);
+	if (ret)
 		return ret;
 
 reset_assert:
-- 
2.39.2


