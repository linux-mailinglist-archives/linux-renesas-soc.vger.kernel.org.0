Return-Path: <linux-renesas-soc+bounces-2098-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F88843968
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 09:43:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 234801F235DA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 08:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F29269D0A;
	Wed, 31 Jan 2024 08:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qK9X4mmE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524D16994A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 08:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706690516; cv=none; b=Zwd6l3Z8gCVfNgwUramSybOyDsi918E5ygASJSoCBmfp/kCU+McXesLlMwUI73+Q8VtBSpfQpfkhkAABKaca93xHuG2ijdNA14mMzZIXIZbra9190U0Clnd4GOxZOnFl/vwjwPEDyuyd2RjNBjgvPfUhVqY5glSaGLKPDTeo4rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706690516; c=relaxed/simple;
	bh=F/pQ43TZd0yxTybIVFp9YQ1lJIzC8KcINVjpd5TwZSY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S5avkXc1GkguhdEbQrF6NPeRyab5aEKuq2/KeFl6l2Fa5onfETuTOlAnRzgbNzdWFPaRh1Pd+0w+fmBJ8k24xGdmgErv1BSDgmsKeJslJhkZiX8MxDvbq33pLKdaWUh3DcrhIy7iI2AlJsGUqMXme7rwSSalzcDM2/CT6Fh6e7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qK9X4mmE; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-55ef011e934so4243105a12.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 00:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706690512; x=1707295312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vYE6VGGaC6dDiCeRDs1uRAAsGK/Jz27M4TajzPwZTU=;
        b=qK9X4mmE5DLWMZWhaS9MWU+C2slURJijqI8YhKW/Q+vL34nR15YleS8d9UkD5vYNwO
         Dl0SXDQ3mQyHSj4ZEgq1M60xE9HTv1a2WKluPF9ykz+f0cbYWiFjST2lAnRVsSWLWN1U
         IFICrTWAI24bKUFDqHamoqngpLgPeEWK3T1b9pVqh9kuh5xg+jR5qmTjdiChL0CxOurm
         Crzqdf8HxOZaSe8ZcnBlSBupcU8Jjff0grup1QZPPq0yGZy8+4KBpMfEni3alSa4IdQk
         73UDiT2pJmspsAkoC8hoCb22zfT84OFsVegPNR3wY4zaRBWHCvVWWVuLjjDaKlHaLBjL
         au8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706690512; x=1707295312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vYE6VGGaC6dDiCeRDs1uRAAsGK/Jz27M4TajzPwZTU=;
        b=tmAl/fXiZEAvtF0YPhuyeTIsCaqrOR9PTWFnnRlg6BGjX1cWIeqjbyREISWeIHDvvt
         7DWXDuCJg5s011sgmYJ/stSmobAsy5XWQ1DDszSIX37LMKdUogn5mxFZkbGdLPiIxN81
         nokN34Wv82FzkmaH7tk4lln4vxn7hsyPbIIJEIJE20pSeImEpY2o8VlNHdnzilKOkUso
         z+MknNW4JmPOAPZLsGmNDYZn7MVBzCCI1V3AxbZ7oP7IVtXm0ZJdesPA0+sEGCLUxRF3
         rbBu3EVyJOBwqW0Xk4BawGkzZ+oGidAvKNLYIl9OazjNrWvr87hTRRBL0bvJraBxMzVK
         2M8w==
X-Gm-Message-State: AOJu0Ywcj/vrNGuiEOPfaN9MSP6PsF1Z6bUlHpaInwyob2ixGAFlhY+o
	EpzKa9Qc8U2WMNp4QB34ycyOhzvf377LzF9Ha7hTTWmrroVXYhOo/VgzW7d+xLM=
X-Google-Smtp-Source: AGHT+IHLjjLm2buuFTHLorPXWtx/2gEZscx3uUOOI2BYIpDUfFOz4Fkpbg1fZxfpiKpoVOqiOswEgA==
X-Received: by 2002:a05:6402:64f:b0:55f:3cb:9cfa with SMTP id u15-20020a056402064f00b0055f03cb9cfamr628504edx.30.1706690512682;
        Wed, 31 Jan 2024 00:41:52 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV5j7LOeqH5BmenUWvzCmo2qCBc9iYVyjhYr3FrubKe3iWE6KVctdP7hRDi8vvMV1Q+Z/GBABR1kHRE/19Feaj8Tv5TKj2vG+Y1h7Qg9GWhLxmuK4SOiiCd/fg6jwaqha6DLNmRN3B7cvztCS5qZY7GmEejRWlMPHS1cLsERSl0poDKOuR/jUa+JK041ZemacvNbKxy0yi9aq+MpyN3f2QfeUjTJHHkcP+gTeTEFQEQGCxLgm3sPl03aXZtF/pcb0mVL6FH0Kus3Jouon0yMqSlipCYQlqwZCRx138lUr2e9CO+mP3SSzBkvOGbfyyvrKeKqP7866Ux+DnkG6x5ZCiEOwZ4sp0hg8Trf3Hkn576aEDaxhOZcH4+GtV4+LXf7qVxNfvm7/hiD8YvVxjOImQOYVomJYQu+BmCtsi7zStfwy3cMxo=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id cq16-20020a056402221000b0055f02661ae2sm2863630edb.78.2024.01.31.00.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 00:41:52 -0800 (PST)
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
Subject: [PATCH net-next v5 05/15] net: ravb: Use tabs instead of spaces
Date: Wed, 31 Jan 2024 10:41:23 +0200
Message-Id: <20240131084133.1671440-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131084133.1671440-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240131084133.1671440-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use tabs instead of spaces in the ravb_set_rate_gbeth() function.
This aligns with the coding style requirements.

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/net/ethernet/renesas/ravb_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 7ced5db04f75..c05d4a2664eb 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -96,13 +96,13 @@ static void ravb_set_rate_gbeth(struct net_device *ndev)
 	struct ravb_private *priv = netdev_priv(ndev);
 
 	switch (priv->speed) {
-	case 10:                /* 10BASE */
+	case 10:		/* 10BASE */
 		ravb_write(ndev, GBETH_GECMR_SPEED_10, GECMR);
 		break;
-	case 100:               /* 100BASE */
+	case 100:		/* 100BASE */
 		ravb_write(ndev, GBETH_GECMR_SPEED_100, GECMR);
 		break;
-	case 1000:              /* 1000BASE */
+	case 1000:		/* 1000BASE */
 		ravb_write(ndev, GBETH_GECMR_SPEED_1000, GECMR);
 		break;
 	}
-- 
2.39.2


