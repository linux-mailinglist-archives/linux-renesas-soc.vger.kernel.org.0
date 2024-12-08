Return-Path: <linux-renesas-soc+bounces-11056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA799E8475
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Dec 2024 10:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B31C164B38
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Dec 2024 09:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 144F81487C1;
	Sun,  8 Dec 2024 09:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="VOyNYOcq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270A2144304
	for <linux-renesas-soc@vger.kernel.org>; Sun,  8 Dec 2024 09:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733651416; cv=none; b=Ju+zi4tBwwQieu9H3jhzDGlRb4HzK0T8etE4NHXZXhKA/p23Oviwtmd5W1x358h8ikKS73yU5uRbbMfc/Hmn6+62YG8EST3WEIl6TRvwmgX7ASta7MCIDT2Xixp8cYThWGuOlo/adszeReQKRWyN9w4TazzWTx0jyYJtj4xTQRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733651416; c=relaxed/simple;
	bh=wXdUfPDZdTp7uaCmZH8pm7BfzwNL7Ba4+AgLadvA+oE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hMit8s9mnVp4tSOO2xB6gcqrP35YQXbLjbY3+BAg4+am5jmkuuzehHvc7C2HS2/h4Skyi/0Eco+axJgJmRFSm1r0N0Xo9I2tMSVTKsveeCeD4ziXWrrC7lMzZw08wxeKlZRHzh8NjccJa+NE8uqm1u/ZWFoii5q0J5WaTHeYLmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=VOyNYOcq; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3002c324e7eso24734601fa.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 08 Dec 2024 01:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1733651413; x=1734256213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qJbTipl5jmcN+zl+yZ2AXjrvMRunb990PfhdGFi+FM=;
        b=VOyNYOcqXtcI3aCNYRedaRVcOaFPSgTgnsDW1JqQD3s/C/3NnzJwJVPCd1TkgATPzf
         nt4UwqQWzNDhbwqL3TWfYdICpAb/b2LY+DRvtVlNMAHcaqIjDhwVpc7j/tbuc4czCv7U
         Ju0b31JTSxN7K0l5o/5yspnzzyTYRfYouZLvaKDTAEqJZQyvhtcUJd/Cyq2Jwr7w7JdZ
         K16SFeY0qMdvJ0LH/WDSbPaZZIzp7svCNisKyU1yOm0oCWdyHMX4wLR8FQSDCusp3hHe
         v6pqZ0kbObYDI3a483+JP6zgGJo/DbQ7ztkoD7CrKDTTBsccasIyC554v85uBUGeQzGe
         /8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733651413; x=1734256213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qJbTipl5jmcN+zl+yZ2AXjrvMRunb990PfhdGFi+FM=;
        b=m55AgWNxswtVi7U/j0sX0R5F7ywuS6zxaOY81vl5zEUtAhQlE9VWHeU7RQdb8FmyX8
         lOvl5W2nyfppdo3SR0lQRPYXUYmmLaxa3ZzVkdjsbg1WOK1rrf2ttcZY7MlTQsQO40SN
         dN9QE4rUUFpoIC+ghEK2uaCJpxa9vOfbC1TXCTszVTWwWn95Riza3hPVG6+skG5BUlfH
         1byVRpsRHC92ZubtG/ui57c5MGCWW30oLorGbLdgZTyUznTjrOf8UvfbL1as+GT5kvAq
         zyKuh8IiTki4+127asB8ewZo/g2YAx49OAt5vkn9OxTlJPm2gOlgIvagbiuoxprPtzuW
         BVeg==
X-Forwarded-Encrypted: i=1; AJvYcCUDlQAhhKAdz/0eIXFpFNWNpi4JQRbw9pIlggH2HViN+33kJtMNTZBK1p1RMfrm5kY0l48phCQXjVvPKIRFe1p96A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpdibU60jGz25AxwodPtX75XLpxcE7f9i4Rv41EECMIsyhQPAf
	riWPmaM65LDpYtQ8uFcnkPmLpAzXrKOkAa7XMCQAI0ycvlMWngC8aMR7+HD++EdXmoeSqFIVuRX
	HNEM=
X-Gm-Gg: ASbGncvXHLhGQ+/2t8kK2LiA3EdBZE9Row4iFSjdyt5nx8IybIbpEMCXycg/Q9GGB5R
	NHojbLlZcBelsGeq0d7LqdrgSNsAJzubcjtoeoTydnbldvJbEd7szWZ+94Ya40mF6SAfCwUvZWX
	1YzR4pvA453CFx05REPdhmylhaEfgpSBJje8sqPWfNVtJCmnoMPdVBKDvxY2rcbygsc081iPfOv
	PwVsOjAowolYHq4LKjRUMzYZs+wIroLGoZryl075sUteG56ZeUebgmHQcuGXfAR
X-Google-Smtp-Source: AGHT+IHjfkWlUO9ktjjTWDVzSSef25MV2HxBTpd82UrqbQLyW1H2AFrdbCeLYV2NDHOM5jBn6C1seA==
X-Received: by 2002:a2e:bccb:0:b0:2ff:55f0:ae4b with SMTP id 38308e7fff4ca-3002fc2585amr46517131fa.21.1733651413281;
        Sun, 08 Dec 2024 01:50:13 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30031b80e7fsm6645311fa.120.2024.12.08.01.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 01:50:13 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH net v2 resend 2/4] net: renesas: rswitch: fix race window between tx start and complete
Date: Sun,  8 Dec 2024 14:50:02 +0500
Message-Id: <20241208095004.69468-3-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241208095004.69468-1-nikita.yoush@cogentembedded.com>
References: <20241208095004.69468-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If hardware is already transmitting, it can start handling the
descriptor being written to immediately after it observes updated DT
field, before the queue is kicked by a write to GWTRC.

If the start_xmit() execution is preempted at unfortunate moment, this
transmission can complete, and interrupt handled, before gq->cur gets
updated. With the current implementation of completion, this will cause
the last entry not completed.

Fix that by changing completion loop to check DT values directly, instead
of depending on gq->cur.

Fixes: 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet Switch"")
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 32b32aa7e01f..c251becef6f8 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -862,13 +862,10 @@ static void rswitch_tx_free(struct net_device *ndev)
 	struct rswitch_ext_desc *desc;
 	struct sk_buff *skb;
 
-	for (; rswitch_get_num_cur_queues(gq) > 0;
-	     gq->dirty = rswitch_next_queue_index(gq, false, 1)) {
-		desc = &gq->tx_ring[gq->dirty];
-		if ((desc->desc.die_dt & DT_MASK) != DT_FEMPTY)
-			break;
-
+	desc = &gq->tx_ring[gq->dirty];
+	while ((desc->desc.die_dt & DT_MASK) == DT_FEMPTY) {
 		dma_rmb();
+
 		skb = gq->skbs[gq->dirty];
 		if (skb) {
 			rdev->ndev->stats.tx_packets++;
@@ -879,7 +876,10 @@ static void rswitch_tx_free(struct net_device *ndev)
 			dev_kfree_skb_any(gq->skbs[gq->dirty]);
 			gq->skbs[gq->dirty] = NULL;
 		}
+
 		desc->desc.die_dt = DT_EEMPTY;
+		gq->dirty = rswitch_next_queue_index(gq, false, 1);
+		desc = &gq->tx_ring[gq->dirty];
 	}
 }
 
@@ -1685,6 +1685,8 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
 	gq->skbs[(gq->cur + nr_desc - 1) % gq->ring_size] = skb;
 	gq->unmap_addrs[(gq->cur + nr_desc - 1) % gq->ring_size] = dma_addr_orig;
 
+	dma_wmb();
+
 	/* DT_FSTART should be set at last. So, this is reverse order. */
 	for (i = nr_desc; i-- > 0; ) {
 		desc = &gq->tx_ring[rswitch_next_queue_index(gq, true, i)];
@@ -1695,8 +1697,6 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
 			goto err_unmap;
 	}
 
-	wmb();	/* gq->cur must be incremented after die_dt was set */
-
 	gq->cur = rswitch_next_queue_index(gq, true, nr_desc);
 	rswitch_modify(rdev->addr, GWTRC(gq->index), 0, BIT(gq->index % 32));
 
-- 
2.39.5


