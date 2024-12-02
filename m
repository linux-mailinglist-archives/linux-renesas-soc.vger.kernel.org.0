Return-Path: <linux-renesas-soc+bounces-10773-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AEB9E03FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 14:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6810E2823F1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 13:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A36202F7B;
	Mon,  2 Dec 2024 13:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="qTVpSCx6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7658A200BB7
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Dec 2024 13:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733147370; cv=none; b=sXmuWgy68GZaUx0eWi5Bz2LtkX37G4NQmE2sSxvC1b7yZiBN4aR4kToeCfxSY5YUnh9yRQZYEN4bL+Bjoxhjn323Eb/BcUmKfcYj6DQsV8ldeh657/po41AAH6LfEiyPNJyd5SEx4hbNdsO4ueJdYKX4fTrEk6Hwkyzx4yZDAQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733147370; c=relaxed/simple;
	bh=SI27lQ6ouPyc6VSvj6mijRBvLjbpSdfHHV2X5cxHAlw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SklG54h4bsPggluJuhTcuS+TQJzWuMFE/XWVBSROdYOVBxYa8/X+7tgn+drFCXhnmTctYnG8C8WFg3u6dYQ59AJSuWDi0qq1VAccGeIMLUzz4Fj9ItTVyzxps2Oz5c+4QOpRynwwups269NLjP5YysFyfDIZdJtWqWmojqeGz0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=qTVpSCx6; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ffd6882dcbso33554721fa.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Dec 2024 05:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1733147367; x=1733752167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cynV8pOJrKJvNaQFqaJO/JMUBstzgBuJjjWcaNQed4I=;
        b=qTVpSCx6nDrSBxfGPmm8KRQIza1xs8O+P2CMhuBLjzwZ+1/K+LOyRjrwf31ALA5B0Z
         fV2pN9Ro5NwmhF5Ow5oK5q78qT5YOkCWs5luj5egPC6fSomWZikC8qxVI/LpP/ZCF5Kn
         k+gvMiMkYG0LQqzPY5oWD6UwwQ9tUJDbQ40mo59KN/zFeQhqSYurkShbpQ4FoLUnwXSn
         RCFtJnFymsFKpwyiqbuYVmbKnwjra+6Ycq2QoME9r6li75Gnw697/b+XV3vF0yPw5oTF
         2qogEYnGPaZZjvQaBh1CEtzVtD9dujafXPdnZmV1O3e8srVM79RcprWWHpvGJIKb6tmK
         122w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733147367; x=1733752167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cynV8pOJrKJvNaQFqaJO/JMUBstzgBuJjjWcaNQed4I=;
        b=n3//j/ehhquqJ3Wf+Gdh/38IT5g6RGJdFgg6SHaFQwI4iGgschROwIkp780/PNRXF3
         WwE1z5IiP87aPT42A9IPDb898BR9/RRp5sy8U+ffOCAV7oDdI9Q3ouakQHoTmHbBMl40
         WLVZjtELzwiK1TGLKULGulZl7pONYGjkV9ggPEIBqe9E8jaIT0mX07ev3zQSYZ6bjFqG
         Mz6HC4zhVmas9wKERoImQcIEuBpDlvuV+g0EWhPhT15rtY5zNfylFd6w6cxG58NHp7iD
         e7iFgIAbTG5nMIAMAHvbJNmJdZEh/uMakhfwMh5meR+oPbwY/3Zid+xehtzWUYYve1sX
         HtvA==
X-Forwarded-Encrypted: i=1; AJvYcCVuvcSG7EpZtEgshn2hnsvyAEASMadZsIDsODR2Fv4fSN6iu3xw2Gcx/LnaT6ASNea7OyxielKkKaLijZ0tGBGRyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUG/+GwrbMVV7B6UVd0BhWPgXkQzNqmQPuFjEpB5xSbGQ+C2dL
	llz51tZW//ePQPdkHdSLcvvPZMGwW1pWsa5Lu4OJmEqwOvplQdisLvDxOy9Ij0A=
X-Gm-Gg: ASbGncshyKwNHFats9FIGRuMCZMd7xHw9mARm2c+Df5xNVIm39QDrGFupiGMiSOVI8H
	0lSG6taM57r7gnFcUH760IdyQwVj2AQpSexemfISypcpqkQCzVVitJ17AxfcOPWMzfT3MBiNowr
	W7oT5tdoWG4fI69pLQfpr62ruNu3bPNDEpxXKS5zBGYBF0NF8qC117xP3RohGeaJCcTFztBwrZ5
	1ulF5LIqS2uuX66dY4lKRCtLcOYMdWzZsr+wag3Y9RlKplPHXNXDXvaSL7L1avt
X-Google-Smtp-Source: AGHT+IGMSwQqN8YQrvqohBJn4xVh/kPUa6r3akG6CJKNWLEOJ8q9gtd0peH+hJ9kwJ7mo6G0r5fDTQ==
X-Received: by 2002:a05:651c:1547:b0:2ff:8f5f:1adf with SMTP id 38308e7fff4ca-2ffd5fcc1bemr59514231fa.5.1733147366620;
        Mon, 02 Dec 2024 05:49:26 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfbb8f2csm12972661fa.15.2024.12.02.05.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:49:26 -0800 (PST)
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
Subject: [PATCH 1/5] net: renesas: rswitch: fix possible early skb release
Date: Mon,  2 Dec 2024 18:49:00 +0500
Message-Id: <20241202134904.3882317-2-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241202134904.3882317-1-nikita.yoush@cogentembedded.com>
References: <20241202134904.3882317-1-nikita.yoush@cogentembedded.com>
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


