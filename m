Return-Path: <linux-renesas-soc+bounces-2107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F6F843996
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 09:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4B93B27BBF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 08:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C9A97D414;
	Wed, 31 Jan 2024 08:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="IpHUfG7v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30597B3E3
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 08:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706690530; cv=none; b=HHycTnreTkkFI+myss0WFtxq1HkG9mqXoG2+t/VNhD7Np4MFGaM57JUduoWId2hX8sfuQ0A7jtt9J4igLCNpWsE/yvL8Y5t5r+3AwuROiBKtm8NSTdgsWljlZfmKPgTlYRob4SN2ZIwtBajZkHvqwMCfB1pe7AclnTo1qif/Opg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706690530; c=relaxed/simple;
	bh=M4XElsAbkAPToo3ZEnKBpvLmehS5jEZzhlJpMuxS2lc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MxJa2kEjmc9SZhkvsoluAxuAeIpZ9gv1GchK4SqSh2aSK/SOU1P0/9o+CbAsJmYcIMv0fbCHPHCOUUPKfxcMMGMEA4Or7yp+HW/kswoj4FM+afTso+MjPZ4Qi+FWRWK6gOPaHRDLQuSew52ToKtjpwACCcvD0fSKfIm+ByKwC/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=IpHUfG7v; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-55c2cf644f3so5036705a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 00:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706690526; x=1707295326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1XrNomjmra/GM8RS/lknacwokF475kMeMhwWZ3EcPk=;
        b=IpHUfG7vGrYoMGri/XmbloOWvDcKQ9AFzDYOQ92wu4KCpW1cbM2Px27HrdVYIJd+Eq
         zHLXboJ+ZgY/cRoPLGoKEHiymO2GtyH9RJkdHWzVo050pyjLp434PA7uQp3kf6RNLLbX
         uaL14BScifZSILXbfD2M0fKUvvodRjAB5Qsv+S3Vab4tKL7tgqMJWwOO/AJsQ5kxvIrA
         gYE8nOo/BCrlmVU15EKn/iEBtGpRJidIa+h3spZQNZFZ4CJQ6lv8LSkzSZqkep8FgXwf
         lgJJZuuYBONWGxdrPHdtVy6U4xY53qFUJTDnk0fYHTWY078LMZFVoTBUoOOUA5mdSs+o
         rs9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706690526; x=1707295326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1XrNomjmra/GM8RS/lknacwokF475kMeMhwWZ3EcPk=;
        b=H9OV1d30r2F42L30NGELq7SaBl1Ouq3E0AZ9+OaMD5dCZxzVBsdThCi9wE7UALooMs
         9tnXknOMgqIuYcwiVGoNBs1FUbBrrQHGtlR8yR8DNNo/k1TBP/pFk0W+46tXc4receiU
         WF58eRx6hC78/gNKXYiIarLocNY60Yd4zgn4u5moXuXmY50x/E20kgup2yKOJDh21j5m
         j+GXN6lGtNU1NiGqRr0OT6Q0qqekQwhgdpMV17O2XinrIwa+uhBfWjrkM9wckHWddF6J
         5m29/h21SXYmMp7wSqf+J4yfloOb7zwlryg3DpcAvvql1sBw4zp+ZhsAQYwdsepQowTN
         hLEw==
X-Gm-Message-State: AOJu0YyHXtCJQhon7V9IVOVE8wITRidUybbTeNScdQsYhdTx5C1tgiBn
	Iv8/b6rvmYs9x4nkdhzCPJdSyLETaoR/Q6cmbOZxlDpV9LZEa+JzkkK2mKM4hhI=
X-Google-Smtp-Source: AGHT+IEYcNtSIIzLCU/TMm9w1bEGYlnXRZN3KzRwiFoYa83jrAWMHaIWWxOlkyinI5M2+MzKlTNT+g==
X-Received: by 2002:a05:6402:1cad:b0:55f:82b:2da3 with SMTP id cz13-20020a0564021cad00b0055f082b2da3mr561401edb.22.1706690525968;
        Wed, 31 Jan 2024 00:42:05 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXIkeN+/q/7fkLe7PzMiRTrGGYp00Bgy3bQ1jPEuKPEBJVX0h37D/hMWLvhlSkSi/f13QSgf+r+BRMOgXxH2a6200kHM1DYhsUJAYuPrh+rbrACpP24O0qT5nlfxcDfkhTSEYigBHk9WPIqNVGzy9itC6VRSD6ZM1TfbPIlUSq3J48kjLfI4HMJy0NaWMPPtGVnHq8NwXx8klz1JZY0Q3wBlpSgklAgzL1FuUmw9Dk+JQnTPWmfWMRX4x6r5HlVt1p4uNCk2AwybR+1C1+9FID1AXV+1CbZiZQhaYKIfgfSUJXhmrQHcocU6CSpuKjHJENER11RspvZ3awkm5ws8gSx+02Joy+fx4+IfcaVqF2QmJ8kX2UsBRZQXPGQYRlqCKdibrNBG1lMKzAyZkHH6xN444BHhbTPURQnrRaOj4AcTId80Hw=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id cq16-20020a056402221000b0055f02661ae2sm2863630edb.78.2024.01.31.00.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 00:42:05 -0800 (PST)
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
Subject: [PATCH net-next v5 14/15] net: ravb: Simplify ravb_suspend()
Date: Wed, 31 Jan 2024 10:41:32 +0200
Message-Id: <20240131084133.1671440-15-claudiu.beznea.uj@bp.renesas.com>
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

As ravb_close() contains now the call to ravb_ptp_stop() for both ccc_gac
and gPTP aware platforms, there is no need to keep the separate call in
ravb_suspend(). Instead, move it to ravb_wol_setup(). In this way the
resulting code is cleaner.

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- fixed typos in patch description
- collected tags

Changes in v2:
- none; this patch is new

 drivers/net/ethernet/renesas/ravb_main.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 0dab98ea615a..661236affa5b 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2929,6 +2929,9 @@ static int ravb_wol_setup(struct net_device *ndev)
 	/* Enable MagicPacket */
 	ravb_modify(ndev, ECMR, ECMR_MPDE, ECMR_MPDE);
 
+	if (priv->info->ccc_gac)
+		ravb_ptp_stop(ndev);
+
 	return enable_irq_wake(priv->emac_irq);
 }
 
@@ -2961,14 +2964,10 @@ static int ravb_suspend(struct device *dev)
 	netif_device_detach(ndev);
 
 	if (priv->wol_enabled)
-		ret = ravb_wol_setup(ndev);
-	else
-		ret = ravb_close(ndev);
+		return ravb_wol_setup(ndev);
 
-	if (priv->info->ccc_gac)
-		ravb_ptp_stop(ndev);
-
-	if (priv->wol_enabled)
+	ret = ravb_close(ndev);
+	if (ret)
 		return ret;
 
 reset_assert:
-- 
2.39.2


