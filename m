Return-Path: <linux-renesas-soc+bounces-14898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8ABA7226F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Mar 2025 23:08:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6C95171134
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Mar 2025 22:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADAA71B043E;
	Wed, 26 Mar 2025 22:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gteqSKsO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC561ACECB;
	Wed, 26 Mar 2025 22:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743026902; cv=none; b=YEYXUcgQdKI6xKK1noskHNzkPUdvSd/9KfqmhuIjqht1KAV+h06nUyCwBVuOlkQtfpbBN8oCRpPdiq5jIfPTjYDU+8dO9OXduVktUmHpYz+wPglMrNKMSKtFJ51b0OxtsQ2ZOhjG6s+EfbVXuhDYS+/PeZOdIY89HoSopdbMnNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743026902; c=relaxed/simple;
	bh=kLOlkXjCw1Rz9e4ReVflPmCb9SWGd7poFDkwJw2RJxc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O4GbF2iYQ+h9NHrrOZRrGYY/QnU1dUl442Yoc20qFiLk4f/yY5BfC9E7Ph4CkU5OC2ZfZrCGYKXm4+1c3vUFjKGhB0GANjEvtAAjMHg+ev6mLt6BO7s6jJ3q8BeQYo/SLSoBHhyru1dTS3gfNveSulLrcbI0NjU3rud0l8XBXYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gteqSKsO; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-390f5f48eafso160066f8f.0;
        Wed, 26 Mar 2025 15:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743026899; x=1743631699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h6oiZH5gcZ7BMvTrr6/43qzGYdLE3CzxYnGqiADPdlg=;
        b=gteqSKsOPvo6XptD2859IRzNseTw1XXz0WqgmpULo7fIb/oB/zBbdUvc5SWS8pAzih
         Uwa5wWNBwjKZyKsE0aGLPo0q5Rf289Dg+brv5Y3aGNC4mw958MBOLMgAu5ia2mH3UTi6
         5bMNiUzFMOAaiXmXaxrdZDL7ryI6ETOLf9OtQ7MTDhtdwG0zV4wzj0WCOMilILnCdlf3
         TifiUjt9C94SKbRkHYNwFn3sGgZLLhu58mZ1HXG3OyOZKgXPO+X/DHAeyeXtYOwErTV3
         GrLgLzrb4NoSIu50iYv8+GzDE4+76ZpOhVyP+Q0oNjCOaDeTl/Fc9HkAQAqabLL5FOgM
         6jkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743026899; x=1743631699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h6oiZH5gcZ7BMvTrr6/43qzGYdLE3CzxYnGqiADPdlg=;
        b=xOpUKtONYzOC0z5VNZj/ysNYfV2xWZDI1+7VsUrzSNM2Nw/AP+BGdwst4zFn2cTSj5
         kR2FFgFqiyfjq1bUj2YEIgcH93ec5gR2wz68ra8lboRgt8zuO2pGfh4EalK0xpV+Crg5
         COjIU766tTT2bHplqw0LW/Jia15brBNQRxUkQdTfW9DSOAHLnXMRmtF0gs/atWNKHo/Z
         L7k3hphiHtcFSIIsMcj51pm/ZRmqCZQsRmPN5hQj6F0ZrSHiVt5IDcRVXEMGz3Dy9pS3
         yD8RrfnllXP6pu51G7b1sqo/1LBct9nDFG57o6Erd4XzhYZ1uDzSfSaam7nnk8HDtsLm
         5JKA==
X-Forwarded-Encrypted: i=1; AJvYcCW773ckP6o6z+f2G0G1xVuywXuDOYfnnWAYtoQQ/lTnUh/905qklo9iU8vnZ33RZsJQ//3J5ko5a8KLxkUmZPuWVas=@vger.kernel.org, AJvYcCWc+8hptAvMvcRxdzD5gUoedJT/LEOjCN0TftvejUijpH0T4TWVvzyHyQY0GdzAd8d2h0yobaQqez36SD0=@vger.kernel.org, AJvYcCXkFZYC8G2zqrDeKIDIhOYtcjNcEEda4dcQY6Wf9/svz8Wint00ZCGO/PQgbOYThUlS6Qcak2ZuiKt4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz49JuE5Xz+APWe+k6ha6hVaD7Es1bhSBNf5gVwnDhrLrOE2kGa
	rgwVKpmrgeRWTpqsNu/6qCGiaVK6bmHdsqb5s6cOd1vhP/zOAM0y+NR5fS/4Qe4=
X-Gm-Gg: ASbGncuzJyi2KrCytDbUCAS7Bh5dOFvWbNhRZUCGacwttcleQ2POckkM6A1Oiwh2TnP
	d3u9GdaZ+CV3awtPR6DRIMefsJ3kedtXGQnYaTpxLcjvdQmwYhpOhYRaFv11HTspxZ+3vhvVqkx
	IhmMrBBqqwo2eI1fRnKAjspv+iKJ06FuctPHWc06pgDCsFivVdtsvxDbZlSTIDW9xX3B21tiwzA
	Kh4CzQXdvdvJ1tPTvoFpBT7uZ33VxXO4Oo9LSpgc2NQrenRnCndvuEiUsAACrgINSVc4afY5zWM
	DSM+YR9eU9z6u3kbNeZk3sqZ+7sYq1qFD3CMEP0yQDP82uocBs2nK3W98i7x7GSEsA==
X-Google-Smtp-Source: AGHT+IEBtC2HcAgrMzjhUYPtK2LyFmuRfaHNPj31mlpJYmz3Dr5XZRrGjmIwHllevGUhb5qjRIFVnA==
X-Received: by 2002:a5d:47c1:0:b0:391:952:c728 with SMTP id ffacd0b85a97d-39ad1740184mr841026f8f.4.1743026898974;
        Wed, 26 Mar 2025 15:08:18 -0700 (PDT)
Received: from sikorsky.fritz.box ([2001:a61:3520:1701:ab0b:8a05:b05e:8738])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efdffdsm15649315e9.18.2025.03.26.15.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 15:08:18 -0700 (PDT)
From: Ruslan Piasetskyi <ruslan.piasetskyi@gmail.com>
To: wsa+renesas@sang-engineering.com
Cc: ulf.hansson@linaro.org,
	salauyou.ihar@gmail.com,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruslan Piasetskyi <ruslan.piasetskyi@gmail.com>
Subject: [PATCH] mmc: renesas_sdhi: Fix error handling in renesas_sdhi_probe
Date: Wed, 26 Mar 2025 23:06:38 +0100
Message-Id: <20250326220638.460083-1-ruslan.piasetskyi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After moving tmio_mmc_host_probe down, error handling has to be
adjusted.

Fixes: 74f45de394d9 ("mmc: renesas_sdhi: register irqs before registering controller")
Reviewed-by: Ihar Salauyou <salauyou.ihar@gmail.com>
Signed-off-by: Ruslan Piasetskyi <ruslan.piasetskyi@gmail.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index f73b84bae0c4..6ebb3d1eeb4d 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1112,26 +1112,26 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	num_irqs = platform_irq_count(pdev);
 	if (num_irqs < 0) {
 		ret = num_irqs;
-		goto eirq;
+		goto edisclk;
 	}
 
 	/* There must be at least one IRQ source */
 	if (!num_irqs) {
 		ret = -ENXIO;
-		goto eirq;
+		goto edisclk;
 	}
 
 	for (i = 0; i < num_irqs; i++) {
 		irq = platform_get_irq(pdev, i);
 		if (irq < 0) {
 			ret = irq;
-			goto eirq;
+			goto edisclk;
 		}
 
 		ret = devm_request_irq(&pdev->dev, irq, tmio_mmc_irq, 0,
 				       dev_name(&pdev->dev), host);
 		if (ret)
-			goto eirq;
+			goto edisclk;
 	}
 
 	ret = tmio_mmc_host_probe(host);
@@ -1143,8 +1143,6 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 
 	return ret;
 
-eirq:
-	tmio_mmc_host_remove(host);
 edisclk:
 	renesas_sdhi_clk_disable(host);
 efree:
-- 
2.34.1


