Return-Path: <linux-renesas-soc+bounces-1301-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC48824FB5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 09:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C8311C22BA3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 08:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEAFC21A1E;
	Fri,  5 Jan 2024 08:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="l74xefE6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBBE219F7
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jan 2024 08:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a294295dda3so29812866b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jan 2024 00:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1704443047; x=1705047847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+tjNoHjZQ1yXHRb/ulbcR3/2aD9RiH4l3tk8kImOzo=;
        b=l74xefE6EIja6pmePL2sMlf9yaK+OV8WMikYVjLK84Y9Q9xwmL47Smpq6lJNbN1Iv/
         OphuOt80nK1O6wW3SmMVe4tDy5vgmrorxvmgvTGb3e8QAUSMZkmoeSZUIZeSpR5AgFdk
         1/9OuKZV008UPT3RRWpkF0ldSzVltgCooBMqQhsWtLkUoBTnOP1hiqIl3wh+x1BchMgr
         8VNhLTpsiwS/+w5XVzpP9PD1fLEzm6HAmrFaH/zJOdGBNjfC39i+5dOJ0z39w/ockvfP
         zwfyr77lpnMkQVRpEc4Ml/ucyST2n+Z+bOf1pKNKrwYzA4UjQCOGrsBQac1r7G5Tg5Ov
         fW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704443047; x=1705047847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+tjNoHjZQ1yXHRb/ulbcR3/2aD9RiH4l3tk8kImOzo=;
        b=oQBA5Nkco3h9y0Cb6HWmAK4N9HD/1TfiKiLHP4l9QvjspOSINqcc8UBgPk/5T35z4y
         04pmAf89C+i1H/7Nxhw+N9No8U3Jtnqfztt9PejQVg084LZUIbLw2NDDgQ8Ijqt+7C3f
         WMZggsaYGuMw6m32S3dtTAb3PLZ4J0Re0ZR4w92DcmVIDkrcev0iwq31+mvWQuanzUJi
         4jTfARaSh0CYPUJQBT15GqwysXdBh/wCOtU0MLZiDoiG8TLJca2Ax6n2aorXGoCKOOIl
         IxSU4HEI59JYeMn6RHGNK0k+8zYk4/VlH1TZoW2cT4SMXBHAihmepETol++DDxlfOtil
         K+Bg==
X-Gm-Message-State: AOJu0YzyG/dK5ddCAmtKLSivSgihfAU+VyKfbxqCYAxbjC6+RbZhlLf2
	ZC6aOHnDp1d5AEkLQ+9trYZtOMZaKiJk4w==
X-Google-Smtp-Source: AGHT+IFu43cEUHi2olH/xc/efhtJRFjv1UfnnTnd/Q0rFtHfJ/1Gl7JhyUOUP+QQytzuQ3XmiXhGww==
X-Received: by 2002:a17:906:57d8:b0:a27:b676:a603 with SMTP id u24-20020a17090657d800b00a27b676a603mr456149ejr.269.1704443047364;
        Fri, 05 Jan 2024 00:24:07 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.5])
        by smtp.gmail.com with ESMTPSA id j15-20020a1709064b4f00b00a28e759a447sm596198ejv.213.2024.01.05.00.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 00:24:07 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	yoshihiro.shimoda.uh@renesas.com,
	wsa+renesas@sang-engineering.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	geert+renesas@glider.be,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v3 01/19] net: ravb: Let IP-specific receive function to interrogate descriptors
Date: Fri,  5 Jan 2024 10:23:21 +0200
Message-Id: <20240105082339.1468817-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240105082339.1468817-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240105082339.1468817-1-claudiu.beznea.uj@bp.renesas.com>
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


