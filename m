Return-Path: <linux-renesas-soc+bounces-1706-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA943838F1C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 14:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EABB21C24319
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 13:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B135F861;
	Tue, 23 Jan 2024 12:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ZLtD6fei"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A805F54A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 12:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706014778; cv=none; b=pY2MWORHLkMOyVxYC/Yj40mUGrkIpQXt2GWoRzFhtdzMC4d8g9sWa5jPnxaj2YuiC4Y+JiA2h2poDxPpk7vc1BBHlzns5pGA7GcFIjTkaVNJqxhjmP9b7HYFD4EzvzGi84HsiVmaX0nsTwX7XjXEU0WmYkfvAUubiUGyqRWzJD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706014778; c=relaxed/simple;
	bh=RUARXouDDyL8sNyIiDfa6P6mjzbYSnHZWR+e8Fo7oYY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ttrlHrwhUOdh542GS6u2ns1ZJGOgBoh4OUWEwM6awsM2rBunN9D8kIsp/Doe8bVB7fSashodoeo4k5QrWxW2HNFsyKkLDS6RkoakVx3ysV50vNi/y0+DSiGUhw4QwH8tbXbkmSWLRgMtt3ri43Q3qSFsMCBor+QU+QLlZCRXlgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ZLtD6fei; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40e76109cdeso48082645e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 04:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706014774; x=1706619574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fu1OoD2WTtLNepo9qF+sp6H3mVig2UJn6Is7b5DZCbg=;
        b=ZLtD6feiP3tECRxtfz+GD1DfCaHUO0Dq0LOdb81+BPrlaHdsM/Vb+c2Co2ebARMAYF
         uSxl29Hl/TDu10bhtD3IDB+sNyzLNG3fTy8AgeW1+2tjdk92o/j3aC2NwYQkjMyTOWIs
         JTiLeW89KuMdAkRh7ka1RAackT4Z8kELnv0HC+Fi809a5RZ7D9ZwVoS9T3Wvb5G3+Vow
         Qff3zmEX3Ghb5IdnlfQG5xt8zqDWnVuBN0QGx2ekLvHlINI2l+WLwy8eIgHiBT1Mcv+o
         QkgP7GQDZe3KeevnNBoLqrT5R+QBfE0FJOO2COjdrV5KFd+Z0h6Wmu3Ej9ZWwOYXaBJA
         HvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706014774; x=1706619574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fu1OoD2WTtLNepo9qF+sp6H3mVig2UJn6Is7b5DZCbg=;
        b=Q/IIbD0120cmHsuLOxJIogD700pVJiL75VaoPNPMvGaNg48P6yRfPrJmqKDXZ3jSUH
         hlHX6A7io0al3JY5C22ipdTX5a7qunA5c3ul85/BpM/yYe/K5y4rwgosnuIM9rEgoneX
         4Syj67tYlEWZfyKRXLAsRs56ZA/aKQ5K/qSY8AJGB2gqDoVUD34cKC38vAWpJmMTQeXK
         s/5LwcFBRqFZJHRw61I2XB4dGS1qzs5eflhtgOKmLVDcq9Zv/QUAmRFNHY/c4amNsL3F
         1f4W8xpK8hVlN5l8enLhjBFwwBkxTaYVzDcl/VXHevHpISMCdQNwQ5mSVSQZAnhFATuL
         MKeg==
X-Gm-Message-State: AOJu0YyE6odBG29RTibngMeh1gBkHG8TV1ze3HjzK07Vvoi/+bd1W43n
	DnPh1+vOdC1tlcQNbyRpU8CX4YvwzymD/8UPRbwZc5+vla6tKCGVJJQEpFEcPyM=
X-Google-Smtp-Source: AGHT+IG0gG8LoVF44N3Atals4IIP/MwfIOwh59rYgjT+iafAT761qahl+00TFcfDA6a6+vv7SqODPQ==
X-Received: by 2002:a05:600c:35ca:b0:40e:c2b8:ad3c with SMTP id r10-20020a05600c35ca00b0040ec2b8ad3cmr112266wmq.32.1706014774502;
        Tue, 23 Jan 2024 04:59:34 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id s4-20020a05600c45c400b0040e6ff60057sm33655711wmo.48.2024.01.23.04.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 04:59:34 -0800 (PST)
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
Subject: [PATCH net-next v4 02/15] net: ravb: Rely on PM domain to enable gptp_clk
Date: Tue, 23 Jan 2024 14:58:16 +0200
Message-Id: <20240123125829.3970325-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240123125829.3970325-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240123125829.3970325-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

ravb_rzv2m_hw_info::gptp_ref_clk is enabled only for RZ/V2M. RZ/V2M
is an ARM64-based device which selects power domains by default and
CONFIG_PM. The RZ/V2M Ethernet DT node has proper power-domain binding
available in device tree from the commit that added the Ethernet node.
(4872ca1f92b0 ("arm64: dts: renesas: r9a09g011: Add ethernet nodes")).

Power domain support was available in the rzg2l-cpg.c driver when the
Ethernet DT node has been enabled in RZ/V2M device tree.
(ef3c613ccd68 ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")).

Thus, remove the explicit clock enable for gptp_clk (and treat it as the
other clocks are treated) as it is not needed and removing it doesn't
break the ABI according to the above explanations.

By removing the enable/disable operation from the driver we can add
runtime PM support (which operates on clocks) w/o the need to handle
the gptp_clk in the Ethernet driver functions like ravb_runtime_nop().
PM domain does all that is needed.

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags


 drivers/net/ethernet/renesas/ravb_main.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 921f645a7218..636da4f558f8 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2780,7 +2780,6 @@ static int ravb_probe(struct platform_device *pdev)
 			error = PTR_ERR(priv->gptp_clk);
 			goto out_disable_refclk;
 		}
-		clk_prepare_enable(priv->gptp_clk);
 	}
 
 	ndev->max_mtu = info->rx_max_buf_size - (ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN);
@@ -2800,13 +2799,13 @@ static int ravb_probe(struct platform_device *pdev)
 	/* Set AVB config mode */
 	error = ravb_set_config_mode(ndev);
 	if (error)
-		goto out_disable_gptp_clk;
+		goto out_disable_refclk;
 
 	if (info->gptp || info->ccc_gac) {
 		/* Set GTI value */
 		error = ravb_set_gti(ndev);
 		if (error)
-			goto out_disable_gptp_clk;
+			goto out_disable_refclk;
 
 		/* Request GTI loading */
 		ravb_modify(ndev, GCCR, GCCR_LTI, GCCR_LTI);
@@ -2826,7 +2825,7 @@ static int ravb_probe(struct platform_device *pdev)
 			"Cannot allocate desc base address table (size %d bytes)\n",
 			priv->desc_bat_size);
 		error = -ENOMEM;
-		goto out_disable_gptp_clk;
+		goto out_disable_refclk;
 	}
 	for (q = RAVB_BE; q < DBAT_ENTRY_NUM; q++)
 		priv->desc_bat[q].die_dt = DT_EOS;
@@ -2889,8 +2888,6 @@ static int ravb_probe(struct platform_device *pdev)
 	/* Stop PTP Clock driver */
 	if (info->ccc_gac)
 		ravb_ptp_stop(ndev);
-out_disable_gptp_clk:
-	clk_disable_unprepare(priv->gptp_clk);
 out_disable_refclk:
 	clk_disable_unprepare(priv->refclk);
 out_release:
@@ -2925,7 +2922,6 @@ static void ravb_remove(struct platform_device *pdev)
 
 	ravb_set_opmode(ndev, CCC_OPC_RESET);
 
-	clk_disable_unprepare(priv->gptp_clk);
 	clk_disable_unprepare(priv->refclk);
 
 	pm_runtime_put_sync(&pdev->dev);
-- 
2.39.2


