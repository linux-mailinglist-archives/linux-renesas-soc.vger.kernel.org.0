Return-Path: <linux-renesas-soc+bounces-21803-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B22B54A3F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 12:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 891521D60484
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 10:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5BE2FE590;
	Fri, 12 Sep 2025 10:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNcVc/IG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029212FDC5B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 10:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757674061; cv=none; b=PBTXV1mxRgE5ySPkdFffV7B4TFJ/AK81Gu5ftkkTs+dPR0TtuIOepMHvq9S8bL2f9v5Qo+tUVVs3tEwD+bhhKOlNnHuZiEDKeCuIn5bTmBLWqnUEICC9mlsTmsNr34j6xHuwIbcIfAE5hnEA48Z56jBgy1pwWb+c/PnVrUcV2Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757674061; c=relaxed/simple;
	bh=KA+sI7ufjFyPZYwEYQoZfZGFYRielFswFPXUoh/FBo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IDZ4d5prnuWqQ99Tj8sMlsejKZOZ/c3nUG6zNoQ96jSWS0xyXz2OU++KjK5onehVS1MHYYOSuij2fKYmci9q/hEkQXmCp87WbfrVNKoagNS3NM6nhPVlikfalZcMQHtf3exS/nD/72Fj1ajY/UNHn7ycYcOVDUV8Vyh3yzXSmEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNcVc/IG; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3d19699240dso1617998f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 03:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757674057; x=1758278857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x7yeEcm3Ced8ELUFuY76TaeRPtauHExqRBxvtKmA4Mc=;
        b=KNcVc/IGshwKGIDvMMrPcgnA/b/rIjGQ2gG77A/GvQzblWZbQHG6+ZL2delpTf2fvN
         TNSyTmLauk9bWoP8e7elMneJU+eaFuCWOZRNQwJq3ehYIbqvkcd7LlnxgEjqTjS2PVRJ
         fuYco0vYc8zbR5V/Qvpr7639vxFarPDXRMg6mrxJAnmOTA3nx23ihcOhcgJthVC9qG68
         qBrmZfHY7+DRzpsLawfAgkeArXqihShoLscbza4wmzdCuYRW+QvyLFaobmbqLsfTx8Zt
         odhBciwyNZTuU1o7p1waaVUaxT3gtSBDXiRBbovjLfcZd9uyOJH+0vai8s1lzGWPV2pr
         dI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757674057; x=1758278857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x7yeEcm3Ced8ELUFuY76TaeRPtauHExqRBxvtKmA4Mc=;
        b=LyVoeqFACHF7GPJYjmZgizHI8mKOgknwUvpQNZ8u5wPNLmCcdIIMVal6+XXpqsibtq
         t91qJf4H5wV0ezlITqj+5m8YcOaT5qf9HQLAFgkDROeRH8o1X12BsbWi4Om1/6GutZTH
         0vTgh3rwsIxRyIW6MQeDxbwJ7p0NwSLuK1+KlpTnET9xRMgrQlIuERKIi6jjd1CJjgp6
         nAYkvNwqRxCGE+PIA/oCfXBmPxn8HcQRGOPl6L33TDxQF6CdVmrXOOqDvTg6QrnnJ041
         SkK1oQo7o0QbP3+EBgIH18QjLveVtb3xS3qmCrMdAKlIFKb6c85KdXAouSxmLlZjbScJ
         BnYg==
X-Forwarded-Encrypted: i=1; AJvYcCVuvaCHpPl+lNlE1nNhkWKFDlNN5xd86ggWn40+RGxU1b659sfNHcTq1WTuv/q2vP0O5KVk92yF7OQGTSeD7UlY4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSbABuIM0jI3p8OP7po1eMGvTW2Ygcu0dX8Le4mDEVLCV8bFCU
	ibrcBKNbSAy7m6HNiwEi+WkyUb9bVSF9M0+HCADv8Bse17HiSbHPiYY3
X-Gm-Gg: ASbGncu4LBFga1r5NPAwP86xVrsoNkwSLVMiXe2+w2oIAT6uRSMMm843E2iT1W1OwN6
	wtNhUW8CLEbpnrkUsaI4KvUSeg00H1gPZaLdIeSMwluHEVgl4Kw+RBLN2DZ03mqgWFWLkFlfmyp
	0UeOimWPujvBcHpNMM3cHafKZVoA9u8kIKIl9Y+obuXPNPZknnI5ljSChGmHFL3G9tL3G9KXvsk
	t4acJi81TCLeHwiBl6U4YnLaEtwhYbIcq8Ik7vdzU8RTD9EPkSRwj+MzxqNrVPeZfO2XOTaa8YK
	24+UB43M2OnaZ2lIylS9ufF/VRwRpefkykr5w4ECFme7wrLn7PBKJFMDUZsTLeKy+Rxpp35iAoH
	y+zv+iPkRaznyrktFFaS7/g/ccMVlbzWOcaqVUbTxnsw1ic5UiH01rzkRR0o12m+DXAJlUe2+Jk
	XHjQ==
X-Google-Smtp-Source: AGHT+IGrhgEWEAy/UQRry9eO3Ixag9/wrNC8n1JxqWbGRYDy8gImXUuDgETKAkJ8vsUGzKh4KDII4Q==
X-Received: by 2002:a05:6000:22c5:b0:3df:9ba8:21a3 with SMTP id ffacd0b85a97d-3e7659f3385mr1834367f8f.18.1757674057078;
        Fri, 12 Sep 2025 03:47:37 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd329sm6197316f8f.31.2025.09.12.03.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:47:36 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-can@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 3/7] can: rcar_canfd: Move enabling of RAM clk from probe()
Date: Fri, 12 Sep 2025 11:47:21 +0100
Message-ID: <20250912104733.173281-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912104733.173281-1-biju.das.jz@bp.renesas.com>
References: <20250912104733.173281-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RAM clk needs to be enabled in resume for proper operation in STR mode
for RZ/G3E SoC. This change also result in less power consumption.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch.
---
 drivers/net/can/rcar/rcar_canfd.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index 460bb62bbd08..da469595be74 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -468,6 +468,7 @@ struct rcar_canfd_global {
 	struct platform_device *pdev;	/* Respective platform device */
 	struct clk *clkp;		/* Peripheral clock */
 	struct clk *can_clk;		/* fCAN clock */
+	struct clk *clk_ram;		/* Clock RAM */
 	unsigned long channels_mask;	/* Enabled channels mask */
 	bool extclk;			/* CANFD or Ext clock */
 	bool fdmode;			/* CAN FD or Classical CAN only mode */
@@ -1975,7 +1976,6 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 	u32 rule_entry = 0;
 	bool fdmode = true;			/* CAN FD only mode - default */
 	char name[9] = "channelX";
-	struct clk *clk_ram;
 	int i;
 
 	info = of_device_get_match_data(dev);
@@ -2065,10 +2065,10 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 		gpriv->extclk = gpriv->info->external_clk;
 	}
 
-	clk_ram = devm_clk_get_optional_enabled(dev, "ram_clk");
-	if (IS_ERR(clk_ram))
-		return dev_err_probe(dev, PTR_ERR(clk_ram),
-				     "cannot get enabled ram clock\n");
+	gpriv->clk_ram = devm_clk_get_optional(dev, "ram_clk");
+	if (IS_ERR(gpriv->clk_ram))
+		return dev_err_probe(dev, PTR_ERR(gpriv->clk_ram),
+				     "cannot get ram clock\n");
 
 	addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(addr)) {
@@ -2134,10 +2134,18 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 		goto fail_reset;
 	}
 
+	/* Enable RAM clock  */
+	err = clk_prepare_enable(gpriv->clk_ram);
+	if (err) {
+		dev_err(dev, "failed to enable RAM clock: %pe\n",
+			ERR_PTR(err));
+		goto fail_clk;
+	}
+
 	err = rcar_canfd_reset_controller(gpriv);
 	if (err) {
 		dev_err(dev, "reset controller failed: %pe\n", ERR_PTR(err));
-		goto fail_clk;
+		goto fail_ram_clk;
 	}
 
 	/* Controller in Global reset & Channel reset mode */
@@ -2189,6 +2197,8 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 		rcar_canfd_channel_remove(gpriv, ch);
 fail_mode:
 	rcar_canfd_disable_global_interrupts(gpriv);
+fail_ram_clk:
+	clk_disable_unprepare(gpriv->clk_ram);
 fail_clk:
 	clk_disable_unprepare(gpriv->clkp);
 fail_reset:
@@ -2213,6 +2223,7 @@ static void rcar_canfd_remove(struct platform_device *pdev)
 
 	/* Enter global sleep mode */
 	rcar_canfd_set_bit(gpriv->base, RCANFD_GCTR, RCANFD_GCTR_GSLPR);
+	clk_disable_unprepare(gpriv->clk_ram);
 	clk_disable_unprepare(gpriv->clkp);
 	reset_control_assert(gpriv->rstc2);
 	reset_control_assert(gpriv->rstc1);
-- 
2.43.0


