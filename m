Return-Path: <linux-renesas-soc+bounces-1705-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E9A838F19
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 14:00:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8B811C23FA8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 13:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE4C5F56F;
	Tue, 23 Jan 2024 12:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fAnmwnkk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1DD5F544
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 12:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706014777; cv=none; b=jkhFqkGJSU5pQEP1ZAtVksfVfwzSFnvrtj1rp+fZSlawyg0LGn0bMXsgnGzlHABlfXqDBMf/nk0otiE14njfWBiCHRlBurBqgZXbuPjNums2ds6rPOZh/7NUKq3okS3z/cZghxN92GTritKiG0GqKKVa1ZDq+cW99TvImPm1VEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706014777; c=relaxed/simple;
	bh=3iydeaPekcZvfbPjBaC8P9XUqRfDRobrZRsArje/jRg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p/0Z2LAu0bqVw+/Y2hPb7Ywre19s063MWCLRZsiJ3HotSmWJ1HlZw6OFkeHqC50yPL4/6vEcOicrHGcMNry1QBpDmcbyep/8I9afZDdML+B7Cf1z3t4QSc/TJPt+4vpPQ4iGArn3aHpW/xdyTBm2o+H4YvWLMMogg7INQ03jytM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fAnmwnkk; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40e913e3f03so54104925e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 04:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706014773; x=1706619573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGSrAGs5vLhtdiutZlV1QBydinRii8oVG9Wb9alDR6M=;
        b=fAnmwnkk0gGC5S3ZhF7RakJgZESQzFM+MiwXol6mxarNWGtGkzEJnS0MqQ2T7x4ddR
         FOFiNQL1ILlxNvh/5Xm5s4WOTFpOE7wjgnHVTTIiVLk/ril038q52povPMUqJiw/g8An
         zFwh1zqGJS89v5+9fdwLI+Fpxk1LGeB3bzWftVFBbHPSfxsAn+CYXefQ4bJuud4AAVcs
         2kSQreGu09jPcExur/U4zWvZyrlosgFjRyl59q8OrDtsF7pLbQ3VCX396taLQgXeHzaL
         nONiAzHmJuqx7RkATgb9Fe3LUFAjZxl7/styHll7vMskFBy/MBegmExrAeUGRkMOyLz0
         eg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706014773; x=1706619573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGSrAGs5vLhtdiutZlV1QBydinRii8oVG9Wb9alDR6M=;
        b=Zo2Su8xZIe2MhPF13bEKWiQZvA8oOKZpamx+KvvxYZ9HGFAsnxk7pKTfMWCqKhcHi5
         nU/wwbZovt3rBcD65UetwA4nCZf7MZYpuyfZmVVsaHnIskvivHbMeuAgPST0shIVAWiT
         2BwgURQ5C72mMg6nMefZjd0gmvDB1HSq6vkHAyFy9vUgSMKz4mqxe5Y1cIZIC244BA8a
         xOMmL1tAi8jXNwxnU2dGw7rQdjHU4Z/RYObHd1JilJjNIVpNq8RLNNnz1XxMqHPP3lol
         mUg01eLmW+aRzF0SqnudWaob2GMvCGmzFmo41KGdmPU2xxwqOhrzXXqtGiQfEtA7d1h4
         Daig==
X-Gm-Message-State: AOJu0YzNuzJIlIYjwdQEV7F1qWT/yqRPMkVOoy1ZRtyXscmBI6KOTEKQ
	EtcHS4inKuKH7NajvQHDRBZQcdX14145uz0w1v+ONo1uTUeZCu4+UINcYhQ2c8D5jt56+zFkBIw
	9
X-Google-Smtp-Source: AGHT+IFXdkk+wHlkX8z4yT7dB+QndSv+eLQbMDWU8L3wYK4WVE/xD6OBwKujfE5sMBHlLW5MHECvyA==
X-Received: by 2002:a05:600c:5027:b0:40e:4870:d2a4 with SMTP id n39-20020a05600c502700b0040e4870d2a4mr130345wmr.59.1706014773264;
        Tue, 23 Jan 2024 04:59:33 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id s4-20020a05600c45c400b0040e6ff60057sm33655711wmo.48.2024.01.23.04.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 04:59:32 -0800 (PST)
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
Subject: [PATCH net-next v4 01/15] net: ravb: Let IP-specific receive function to interrogate descriptors
Date: Tue, 23 Jan 2024 14:58:15 +0200
Message-Id: <20240123125829.3970325-2-claudiu.beznea.uj@bp.renesas.com>
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

ravb_poll() initial code used to interrogate the first descriptor of the
RX queue in case gPTP is false to determine if ravb_rx() should be called.
This is done for non-gPTP IPs. For gPTP IPs the driver PTP-specific
information was used to determine if receive function should be called. As
every IP has its own receive function that interrogates the RX descriptors
list in the same way the ravb_poll() was doing there is no need to double
check this in ravb_poll(). Removing the code from ravb_poll() leads to a
cleaner code.

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
 - none
 
Changes in v3:
- collected Sergey's tag

Changes in v2:
- addressed review comments and keep stale code out of this patch


 drivers/net/ethernet/renesas/ravb_main.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 8649b3e90edb..921f645a7218 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1288,25 +1288,16 @@ static int ravb_poll(struct napi_struct *napi, int budget)
 	struct net_device *ndev = napi->dev;
 	struct ravb_private *priv = netdev_priv(ndev);
 	const struct ravb_hw_info *info = priv->info;
-	bool gptp = info->gptp || info->ccc_gac;
-	struct ravb_rx_desc *desc;
 	unsigned long flags;
 	int q = napi - priv->napi;
 	int mask = BIT(q);
 	int quota = budget;
-	unsigned int entry;
 
-	if (!gptp) {
-		entry = priv->cur_rx[q] % priv->num_rx_ring[q];
-		desc = &priv->gbeth_rx_ring[entry];
-	}
 	/* Processing RX Descriptor Ring */
 	/* Clear RX interrupt */
 	ravb_write(ndev, ~(mask | RIS0_RESERVED), RIS0);
-	if (gptp || desc->die_dt != DT_FEMPTY) {
-		if (ravb_rx(ndev, &quota, q))
-			goto out;
-	}
+	if (ravb_rx(ndev, &quota, q))
+		goto out;
 
 	/* Processing TX Descriptor Ring */
 	spin_lock_irqsave(&priv->lock, flags);
-- 
2.39.2


