Return-Path: <linux-renesas-soc+bounces-11057-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 240F19E8477
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Dec 2024 10:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D967F2817EC
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Dec 2024 09:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7679F14A4C1;
	Sun,  8 Dec 2024 09:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="sPCwhCBd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B905D147C71
	for <linux-renesas-soc@vger.kernel.org>; Sun,  8 Dec 2024 09:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733651418; cv=none; b=k+jYa637A5kjXpRd8KNb9kuItKjd62BqHMptVNhDV+l/4OcKYTrQQeFCmh+FzU+cIYFRfDVyDzSUQp9tSYTmN1Em1gvzSjEYjPkvyXT29rYWA+eyvkx9+bV7wQysPcpTOUKxWSklv1tVttQQ6+UFG2xL9g3lnFfb4Zb7gl7cQso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733651418; c=relaxed/simple;
	bh=K2M2L/ZAYcnrWJuH8IzCe8Rtu47EQV2npWezrC5CH+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PN3NqcyUynjEsidC8dqIVeqoeftd8V4rzMvaLVSZWNWW4DC9ANIeLqX6p9dTzO/UW4HT2otdW0QENUgoba5xgM2uRfLrHV5EDsRMDlvoyCah9cW8Xw0xWZDz3YCX1S6TFpddxO5hnw6bdhUtQJsOwdn24IhtBF/enXaSLWcZBmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=sPCwhCBd; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53de92be287so3364221e87.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 08 Dec 2024 01:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1733651415; x=1734256215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJZ/cFgyayhBFYtEHeJoPJb1EWnv+22CKraiiow1EcU=;
        b=sPCwhCBdc6YMouvWYQ8hlPL3wknNBTqsfqp9NwAgaK4KIJ1VwbGcdu4fBlrTxG4z/z
         fGcVGMYcjb5364NRPfSkbz5+NGH2dMugSZ+Wctq0DV6IEZnH9zZD4ke5b6YllYRVUXuh
         ErUqENNfOBpO7MuuLuUMVE9Js0gVdeDL5xd05lnxsrhneTCzWFHo6to+ah6NjlT0f2f1
         L5uzKOaA0qc5g5uB0yU1lUG4dnIEY9SOBj1G4lZdL6z4VWaGpuFL4vwchdcNPlMnyLsP
         jLUJg2TyiR2ByUOgq8wczKAqPzjtXhwJc/xXrbrb7eYm1Ab0bTM6vT3b6YSQR2BGgAUh
         LFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733651415; x=1734256215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJZ/cFgyayhBFYtEHeJoPJb1EWnv+22CKraiiow1EcU=;
        b=mBSD7nvI0Ig7H/LQ/Vt/pEDzfhhqGG5YUs4Caw6D8QImzARC8lid7i+T5Ad0fdIbo7
         cuuqDFfVnWJ3aCCIjRPmJaeP4hXgkEingIjBjujVbCvaUGGz8R2Gcj0KOfe2I9hp0T1Z
         RPV1FX7x3Np5ZiGzukN1fMPY1zRkx3xMSqf5dw2Tv4YZtDfgTFfIZajq/T+oAUHrPycn
         IBAJKQi8smlhBF1nUs+wBOQsuLh1TtmloNjLSoJqMkXpfC4kxvnHYLE7X3M6YJYu2qIL
         sGS7LYylskzZp0Ia0PiE9F/uTYgB39ijS/yl4PkTMQ5vovMSesi5l43Ik13zQLgS9HcV
         8/hA==
X-Forwarded-Encrypted: i=1; AJvYcCVZaG1yQYY5g+Ibo5KgqD29VplRB/wBx9V3xbSvRR2qnGAa1O5fws9Pc3Sec1dWHSvO8XLYOOc+sV2D11yXTET08w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+4JkDaXO2I9wdVa8fG0sJsJ0zgGaumJZauT1Z+uWp9balB8Ts
	IqbGWtRRYCfB4wqmxs7qhDV5Zlf1gwQyVhMOzqwd7GP5Tuv9uBem/7B1m8aMzm8=
X-Gm-Gg: ASbGncsKW/s/MOHs6Woprgvq9c7Y4kY6lAlQWZpHby1UnCv4rmWwgoPic749gQ8ijj2
	jS/IFimqdPwK3ztSnBItEIci9PzCgeq23Xu1gqvtU+md6O45Razs/3p2SWqwMOVInT9OP1ivBIa
	H2ZXx6BJF8AvUSpBqUD5WQJN7yHBlKeTqlUsxB/zLi6VPeE7nXTKoUBEoFRHJYABRkT/EPku/Pd
	smxXMbEYVgre/wnUgriwYobuMnLUXOJFzZyh88KyeZST2awAL2vuFXtFLyAZoDi
X-Google-Smtp-Source: AGHT+IEg2JUCxfsh/bJ+hiKC7kKcxPI03So5n7bJFcOp4QMs6n7AD95qHIYMZq9Fveaz33U6ohLDAg==
X-Received: by 2002:a2e:b88e:0:b0:302:1d24:8db9 with SMTP id 38308e7fff4ca-3021d249048mr4578011fa.20.1733651414953;
        Sun, 08 Dec 2024 01:50:14 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30031b80e7fsm6645311fa.120.2024.12.08.01.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 01:50:14 -0800 (PST)
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
Subject: [PATCH net v2 resend 3/4] net: renesas: rswitch: fix leaked pointer on error path
Date: Sun,  8 Dec 2024 14:50:03 +0500
Message-Id: <20241208095004.69468-4-nikita.yoush@cogentembedded.com>
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

If error path is taken while filling descriptor for a frame, skb
pointer is left in the entry. Later, on the ring entry reuse, the
same entry could be used as a part of a multi-descriptor frame,
and skb for that new frame could be stored in a different entry.

Then, the stale pointer will reach the completion routine, and passed
to the release operation.

Fix that by clearing the saved skb pointer at the error path.

Fixes: d2c96b9d5f83 ("net: rswitch: Add jumbo frames handling for TX")
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index c251becef6f8..af0bc95ad6ae 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1703,6 +1703,7 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
 	return ret;
 
 err_unmap:
+	gq->skbs[(gq->cur + nr_desc - 1) % gq->ring_size] = NULL;
 	dma_unmap_single(ndev->dev.parent, dma_addr_orig, skb->len, DMA_TO_DEVICE);
 
 err_kfree:
-- 
2.39.5


