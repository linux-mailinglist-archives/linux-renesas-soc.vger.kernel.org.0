Return-Path: <linux-renesas-soc+bounces-21841-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C49CB5627F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Sep 2025 20:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF21E5624B5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Sep 2025 18:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C12A218AD4;
	Sat, 13 Sep 2025 18:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKngJ2y9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C542E1EF091
	for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Sep 2025 18:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757787231; cv=none; b=jD7usfk5QFuSWRU0SyatbMT8pL9OHcfD1hgKYAbztCDrJVVsZP6SDWH1NrTXjZXhTNyb7zFpVKFDrLwPDbqpwwFC5jEo2QFbtVm3UG6ZfP5BEbrCUtTRtrh8tF4xQsmF8+SHtrcinvC5CB/0TZkGOhSLFBBQD7Dlwy5RwDjlvJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757787231; c=relaxed/simple;
	bh=3rzaM2X/zFTxRZBZgEHTS2j0+xkHtGU3DGTzIAZHWIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pTk2q1HTO+BgnkQHrqexabVn2Sp3n5PHkO2h4nuN1yYXsErfDEjphduA7XXqJA5GEMed/l9Q7AWjDaW4P/xCpukj7QL1Y1wDr1AQSkbHzl3oU6nSVnAms6Y26nxwKMX3/8DjpD5LtjtN5qPUN/YeKjCJqf4M4ncm0R/nONXjWlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKngJ2y9; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-71d6014810fso22356847b3.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Sep 2025 11:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757787228; x=1758392028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MqC6tk+ZfLggMyonbV+QWYHVZPiMQwp/bc2dZEheebg=;
        b=FKngJ2y9BuPcidAcNLHInK8z3ZE40mdZbhYHrjtZLqW8NRmjkc0bYkNvW2xtKq4U8x
         FaqhGRiNRqhTxNder2f1gUXu5+oapnqXyxRBNAzzhrmCwl7l0MsL1jaxEsCoCMkGjd/E
         NcRWrJXaV6Ki/0cx4nR80Q58QiOgk0y26x94RhuZOpJmvq9qZ2v+tvEevtzyINmNK2qV
         IMGF2sefTS+xM07Yz1TqnhGxGvmXGjUBnYTJLIa2k+UwMrtQwY5g1mvcgPtxAHBVaair
         rxGUsNVTzoTiO1kfK7xyMD0vC78D87eB5c5apSd8pDHcUeL8zSgD9bgoI5r225bfciF2
         A/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757787228; x=1758392028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqC6tk+ZfLggMyonbV+QWYHVZPiMQwp/bc2dZEheebg=;
        b=LSoE9cXx2cWP0rt/mxM3w7e2Fw8f2ntLoIY+q7SuK9EBfI1dEqAQV9prLo3h1zWq/H
         q2PQrxXZt2g/XIyif295cDFVM1PfMiTLXDkjpbmhXuXHCcUPalTfrED8HH7YXL4sSLMc
         oeAqRUXze60kMeG9wM5USm9+lw6sKzu0nadsdS9wvvcju1bJFDozmSuWAibNZpipEXGT
         A4hPnYLvJilhUrcmPYqF2s50S8/YXrXocYYNYQPJn7wizjFxRHGBUJiUcgUuh+IjBnug
         sYSXy5qBW73dNkRRErh885FrzM6y7WGGMX3rUz7xstAqKOqwaA9mQRYhpTNPAVHDyGxs
         OEsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM+gxl+ZSVknSpawpkWMENiTAtCx9CxRcm6pn2fgAg7c1wEtP61h3LzfBYT0NT+6OemMUrIFSEF93imEpIQ4iBUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTifw0DiY1PvBN/1/nSyrUsPD7LSXAG4Xin7ZNiUBuyN6Lpzi7
	afIKOljTgo9DVasQP+t5NmuH1QTWUldTPsBbdOENaYUtCyzaZBHDhX0h
X-Gm-Gg: ASbGncsVQH25EzgnvqLmqlD/SWETNTF9yFhNx8Yt6QIdMpcFV9aMHPZ9zjmxDk22C1q
	8Seh9vCuddpBl3rIkkTsHS/wc9yWZBt7/A2maS/9hO9tTB+UnCsWKXEXSQ1/yC/m+0gtLqiWW2/
	7hBQfvyjo+5TLq036pVgbMqgdA0Z7/k4+zYm2jUyV24fCireoJRIJIHgp0wQasv7Xzzi7dj1IR8
	k0TOBzcyLHDUMJDIdiQmZoG0O7tXSieCYHzy+AXVVbwvTD6ypObqJHYTKpvR5U4l+EGktwFnmAH
	qxjEnJMdIvrj7n7dylit6mfaOyf6Xr2PISUoO2pkSiBxFCAKzwbVvN6froJIA3eoCzMC5u9tDfR
	QdTJVXheHx3UDiLItg3JLMAMZ1YlzhWhPHty6JtG1UvKY/+Bt9+q8yIQMy92c6FU0WJ7It11mYR
	Sb39I=
X-Google-Smtp-Source: AGHT+IGXmfP8lhQsAEr8A4H+juDqXUoD1IEZHDk4WG2eYBTmnl9v+NYkqBaumyp94fhbs4FlMP4+2w==
X-Received: by 2002:a05:690c:610e:b0:71f:e5c5:5134 with SMTP id 00721157ae682-730645316f8mr70119117b3.33.1757787227704;
        Sat, 13 Sep 2025 11:13:47 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f76928fe2sm19907537b3.25.2025.09.13.11.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 11:13:47 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	"Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: renesas: rswitch: simplify rswitch_stop()
Date: Sat, 13 Sep 2025 14:13:45 -0400
Message-ID: <20250913181345.204344-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rswitch_stop() opencodes for_each_set_bit().

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index aba772e14555..9497c738b828 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1627,9 +1627,7 @@ static int rswitch_stop(struct net_device *ndev)
 	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
 		iowrite32(GWCA_TS_IRQ_BIT, rdev->priv->addr + GWTSDID);
 
-	for (tag = find_first_bit(rdev->ts_skb_used, TS_TAGS_PER_PORT);
-	     tag < TS_TAGS_PER_PORT;
-	     tag = find_next_bit(rdev->ts_skb_used, TS_TAGS_PER_PORT, tag + 1)) {
+	for_each_set_bit(tag, rdev->ts_skb_used, TS_TAGS_PER_PORT) {
 		ts_skb = xchg(&rdev->ts_skb[tag], NULL);
 		clear_bit(tag, rdev->ts_skb_used);
 		if (ts_skb)
-- 
2.43.0


