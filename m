Return-Path: <linux-renesas-soc+bounces-11031-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 065DC9E7875
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 20:01:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41FB01887EEB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 19:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70DF8203D41;
	Fri,  6 Dec 2024 19:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="An9K38cC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD41198A06
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Dec 2024 19:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733511647; cv=none; b=Ursxlu4AgNtga2znKmUg4+A9W9GQmrtVvufwMFCWlNMMfAo1K0B7SeBZqJbS4tfH3718jJMDlzpU959KwoCEi+hZST4gjzr7zBTZJriY1bz3j9T3qRDyg/g7mH4s8Wrf8+ULPinV1ah7N2/Ru00WBJMFPqfj6AKDa5vsmIcB5EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733511647; c=relaxed/simple;
	bh=SI27lQ6ouPyc6VSvj6mijRBvLjbpSdfHHV2X5cxHAlw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k6hzoH4bxGV5uQvLDTf2JK9g48knKwfp0nOorOPSTLhqxWQM+jvwTXHUuwO4gImJmFt4P07+k4zrgrdhiMVpTic21PwHPBOIyfN9ahRCvgtDk53ri21E9gB8ZHh7MvYInWM+4iyNi92vTGFz6YGLpEhooogVPOXvJtbInzRaDWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=An9K38cC; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ffc7a2c5d5so24244431fa.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Dec 2024 11:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1733511643; x=1734116443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cynV8pOJrKJvNaQFqaJO/JMUBstzgBuJjjWcaNQed4I=;
        b=An9K38cCeebXwLpU8bCqmEJrBomOqrqLyAEbSNfU5B1LcVFGHGcoTePkagOr9EooU+
         ztKAPCweLgsy27AP1Rzz64gf2Iy8pl8uUv+1twRJ2O+gKY+a0jYaHQ++Fn/yBikwAtjM
         vFuwi5irPwKRVd9L+4pAP2HcCv1J5uwFjkwLEXQVvq5bs1T27WiWPfs6AXPLWDEutQLP
         SJwpsErk307MnFV/g+wN3GtDb4f3G5h/FUHjfj/Wlqx2v9DifPtQGBCbikm7iIJQX1gw
         fxGRuw1sAsPHw6Tqq4OiLETw+ewIj4h76o1dUXpdTVxZnUjBVCdCQN6A5Sx5z7LLnbAD
         d4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733511643; x=1734116443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cynV8pOJrKJvNaQFqaJO/JMUBstzgBuJjjWcaNQed4I=;
        b=jT5VI0Iv/Jq96t78QSsENGEmNhZ7xE/g+ErJYgtjkZp616EogUHFvsi48MEk5vsrkp
         wx0M9Mtx9XQu62e/uz6n3SRIGqa8RHLrunpzcWyhYcQDPV9vX8edIaeVjyOdOSuFh2C5
         MAjjIpAwvHL+lD5kgjRpyTGELDGB1Ib962G3dyl3IZz4PLgql8QOypbm5Ruj2EDfQkyi
         bTB7eO7/DFtOSeLp/lbEG8UFNIN7OsbKVQArcr6QeGL4Nks2KwRfuThOe7SStp3Y67Z1
         YtnKS6RYe/61+sWiWcMQllArbGpXHbN4DMUvmm4bVPw1f5Bhxi74AxhIXZBqx0+L8KbM
         yGkg==
X-Forwarded-Encrypted: i=1; AJvYcCVgNhgDPqWOIehIhcIm63TKAuGmaFEhbdwKm6S6/1PRiWWpL+qqxeuRTXaHEIAeG8kh8InvRZ2gyArBB+PdYfUoQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv/Wyo31Fmb2DZoxfJUaRJSZME9AI7R4Ak74YiBToXCBSAu+tB
	Xrn8RSSBcSF9w5SWIucoSABAMAwvdlLPxpkeqGF+nRHV9iZcVgVEovfYmq3GX6c=
X-Gm-Gg: ASbGncspBv2PSHJVjeME8zF8m1ZVXrOHh2TT2VcElA8uGD7+vja0Rb88EC85tsLBphX
	z8D3cFnXMNZ6sHVtpdnL5o6MWUqaEmOd1zCPLGVYg8o/jCUggSrfy/3Xrszao3BSgcbwHAd26qJ
	EldFMLLTHstOey2tgDa8Ri2CASNX8PN5/fs3UjnSH6obp9zXUcNi1rExDhw8AhKaZfeVlYnj++0
	lZpZgX50aUm5fwK5epcy59V6c0F7YaDE+pbiH1NLUWt7S6Kp0ibDYeeXgR/+9Cc
X-Google-Smtp-Source: AGHT+IEW2UU+jTNoTOcEYuuCfhMKM2BI21VZcY54iVxmn2QTSlWVK53wH/yWJXy8oWjj5yDpAga4hA==
X-Received: by 2002:a2e:a98e:0:b0:2ff:8f5f:1adf with SMTP id 38308e7fff4ca-3002f795a90mr13121781fa.5.1733511643070;
        Fri, 06 Dec 2024 11:00:43 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020e58200sm5523201fa.113.2024.12.06.11.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 11:00:42 -0800 (PST)
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
Subject: [PATCH net v2 1/4] net: renesas: rswitch: fix possible early skb release
Date: Sat,  7 Dec 2024 00:00:12 +0500
Message-Id: <20241206190015.4194153-2-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241206190015.4194153-1-nikita.yoush@cogentembedded.com>
References: <20241206190015.4194153-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When sending frame split into multiple descriptors, hardware processes
descriptors one by one, including writing back DT values. The first
descriptor could be already marked as completed when processing of
next descriptors for the same frame is still in progress.

Although only the last descriptor is configured to generate interrupt,
completion of the first descriptor could be noticed by the driver when
handling interrupt for the previous frame.

Currently, driver stores skb in the entry that corresponds to the first
descriptor. This results into skb could be unmapped and freed when
hardware did not complete the send yet. This opens a window for
corrupting the data being sent.

Fix this by saving skb in the entry that corresponds to the last
descriptor used to send the frame.

Fixes: d2c96b9d5f83 ("net: rswitch: Add jumbo frames handling for TX")
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index b80aa27a7214..32b32aa7e01f 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1681,8 +1681,9 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
 	if (dma_mapping_error(ndev->dev.parent, dma_addr_orig))
 		goto err_kfree;
 
-	gq->skbs[gq->cur] = skb;
-	gq->unmap_addrs[gq->cur] = dma_addr_orig;
+	/* Stored the skb at the last descriptor to avoid skb free before hardware completes send */
+	gq->skbs[(gq->cur + nr_desc - 1) % gq->ring_size] = skb;
+	gq->unmap_addrs[(gq->cur + nr_desc - 1) % gq->ring_size] = dma_addr_orig;
 
 	/* DT_FSTART should be set at last. So, this is reverse order. */
 	for (i = nr_desc; i-- > 0; ) {
-- 
2.39.5


