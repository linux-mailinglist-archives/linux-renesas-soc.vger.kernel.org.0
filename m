Return-Path: <linux-renesas-soc+bounces-23490-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7758C00B1B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 13:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E4753A48D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 11:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A106E30CDBA;
	Thu, 23 Oct 2025 11:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEU+NiH4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA7B30DEC1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 11:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761218502; cv=none; b=se3Kpe2Wgfi4KO0Rz+Jf5mz3n1OJDjUk0ody+gZyTztpC5kIMLe/B/6tbXeTE5L096S3tcdGMHtW2uAvHIveaYaPQtcmONlgvlSA3t3d2437aq3IQbV5xyYW6eUzO6sIKzYYVaR9jsxCMQeWQ8zJZKqj4NAWhdUF3cRIA4nPNAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761218502; c=relaxed/simple;
	bh=RjE+kSOTS/IiW9MLEPxrKjF6SoubNJTDr9T4H60naJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LqU6acN1X7Y5ocG6X4wvVQOLCVsBeqVdgb5WndjbH69L0TNH79rA7Khr56ycMT2zUmMfugyZuhJ9sKC3Sob6UMYFBLSJEG7PkGk0wOUncpMPQsHdcrefjs+k6ofhVPQFTbdu2l4WjEAX2dKmWBkI8cJQ8HVWaVeKwixhvVrG9qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEU+NiH4; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-290b48e09a7so8622455ad.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 04:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761218500; x=1761823300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ajYhoORHhWFBc8HqyGQt4ZFGixfkx5nJ2hdJSz5FZA=;
        b=LEU+NiH4zX4xYRXMXM9GaR4bi4TP4mdxgdEQQjelXjj9FIDM1+p0W4f1VrZl3uCV/L
         VAwbKn3jYvOwB89W0aDGlUpSbeR+5Iefc2dxKJs6n0Z4jqfwIRH4yzZTb0JP4o0sOGtH
         b+MfUGbdXJ2I3TYch71ZvcmAb3AQimNGwF3wBelgQIxVr17wwfjmQb2VcpXo9E8EqxW2
         nkNfBChdXrMcxBMt0pe8inc+GvOXHFc1PfFB4Eg6IjVkUn+ie6X2JnRzTxxBSDdycVOu
         GrKx4du3G6vT2MkifR1osmVOm5xPBVQiSjffwRNqU5VXKmVNRc8FOSAbLmD9hFtvfQge
         cCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761218500; x=1761823300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ajYhoORHhWFBc8HqyGQt4ZFGixfkx5nJ2hdJSz5FZA=;
        b=BpmZT+0u6GxpFHR5NyGpYvkhOMnle5nXoWDHT2Il8RZWyEsOWfKf/q1D/JQkvt4j9A
         n7U2IvmrzUx87GQvlC0Uzd1Z7XrD2gl5yaEv+bP2okxnPybVu7IpR0ia/0MTav6WL6gs
         XjdiGDbl4cFzAX4FckinT+oE6cFoe7ztddw7NEVX1oh526h1yFAbDl7UR++1jmb26xMn
         r83YA51T8uvt4/Pb7zAXV5qpF00CKq17xFvsnPENbWkn50PGPKz1D2tNjUva6khf0uyP
         KH4rWWSk/5RB1ZX3o6FDEfrmqzY+/O30LyNCUotfLB+eTzxkNW2lN6YLZ72UQxBosLVM
         +70A==
X-Forwarded-Encrypted: i=1; AJvYcCVxU/UnhBXlS6L9fM7vEEV/JLOKEaLWiktwTpxsqUqab+m1H2s9KZx0hRS9+pQZ1sCWNAmedSl1N+TsDs9zsUbnVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+X6t/tV13VwogAvVtVBTVGzyYErjPIlM80MslpsKDu7dEmTLg
	FYvJGi+nQiIb3CJvEWqm2UweZoSbm61WENU6B/ZwHfopiXVtdYjilOzW
X-Gm-Gg: ASbGncuxvUVBhz6jcLYrWl5MV+7c41l0TQyrW0utHs15vRm0yHkwIb/Wn7jhb+OyJo6
	1dOdEE+YbzNP2NmF1ELij/JD7VKGctBUxx1GAU5UhnZLchTT20IFkD5MuV8ueDTuT/Rda8CFLvv
	zdKR6LQyPBadVXxRJCguu3fXmAHbzzkP79rxNL8wR7SE8rcQih0S4dAY9EGf74uzsqZo8NdNn83
	gpMkUEqqhpIFWQZpkQav1Icha4J7leFr/disa15CFVz+r9TQg0npmO/z0DOUbNAlRc1OmT3upie
	j8OSgYwzPcUPZ0fJCEgiNW6Bp12HfHIZw8lcFd6+baoXzlZVWSI7mtiGatFZnjUH1pbx+RRqVqN
	LoxwGIzj2a6lBgNRRmQG9vbCADcdoQ/tAi6k3jUGayNR9uQrV19K7En2I8pJD4kKOhELHMe4BVl
	W68HcMixpfN7c6heOE5zAuzUYnueoDMg==
X-Google-Smtp-Source: AGHT+IG70LMDucQ/v+ZD8r8xVVgqwdpVy8r9nkjL/iPjUWjvVho9/jKVj6iNLo9FQk+xdUIb+ldKdQ==
X-Received: by 2002:a17:903:1d1:b0:290:2a14:2ed5 with SMTP id d9443c01a7336-290c9c89fd2mr259763605ad.4.1761218499912;
        Thu, 23 Oct 2025 04:21:39 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:ef2:36b5:9454:6fa:e888])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dded613sm20226885ad.37.2025.10.23.04.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:21:39 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH net-next v3 2/2] net: ravb: Allocate correct number of queues based on SoC support
Date: Thu, 23 Oct 2025 12:21:11 +0100
Message-ID: <20251023112111.215198-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023112111.215198-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251023112111.215198-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use the per-SoC match data flag `nc_queues` to decide how many TX/RX
queues to allocate. If the SoC does not provide a network-control queue,
fall back to a single TX/RX queue. Obtain the match data before calling
alloc_etherdev_mqs() so the allocation is sized correctly.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
v2->v3:
- Reworded commit message for clarity.

v1->v2:
- Added Reviewed-by tag from Niklas.
---
 drivers/net/ethernet/renesas/ravb_main.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 69d382e8757d..a200e205825a 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2926,13 +2926,14 @@ static int ravb_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(rstc),
 				     "failed to get cpg reset\n");
 
+	info = of_device_get_match_data(&pdev->dev);
+
 	ndev = alloc_etherdev_mqs(sizeof(struct ravb_private),
-				  NUM_TX_QUEUE, NUM_RX_QUEUE);
+				  info->nc_queues ? NUM_TX_QUEUE : 1,
+				  info->nc_queues ? NUM_RX_QUEUE : 1);
 	if (!ndev)
 		return -ENOMEM;
 
-	info = of_device_get_match_data(&pdev->dev);
-
 	ndev->features = info->net_features;
 	ndev->hw_features = info->net_hw_features;
 	ndev->vlan_features = info->vlan_features;
-- 
2.43.0


