Return-Path: <linux-renesas-soc+bounces-2101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1B184397A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 09:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 842C0283CA8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 08:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D40C7603D;
	Wed, 31 Jan 2024 08:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aWxkgMYt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C0F6EB62
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 08:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706690522; cv=none; b=JckkoYgntEOL4yi5ddyUUdd7ZokKTMH+mpUohBjP+xy/vk3e7LB+kVhSgmG6cqOH3SWjbGpTMIZ26liJGmtfDR6faK98fLgT5m9B45azsOrlGZadlMxuPVGw+99inO6HaGci6uTlgGbicmjtNFFGHzGsbTlaYeF/tmyjWRTHHEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706690522; c=relaxed/simple;
	bh=aLlMQy8HZ3Uodd7EYAzkrNQyWPQI2JPqu4nG0FzkUGE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ORpisKDQyzoiJR3bxSADOpq9iO9lBSrP+m5/DhOPE2k9pNIELCBM5OmoBmOudXSKTW4a7YcRRyuMrCGlOqk8KIjHGnaxIPZO6FSsP7A2pOL752jRW+UuNjBab0ndQFt0ea10//yGx0YJWOm1ZmseJc8CmmXL4CEgpShgiq1xoKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aWxkgMYt; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55eed368b0bso1309972a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 00:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706690518; x=1707295318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQCfrFSxrrf9tRO6HJcq+akjVQCNk3tk3vQzaskg9t8=;
        b=aWxkgMYtVswfmajGy8LMr8yIBEy2/fiC/NfYkxiDIFG7/PCuJXF8b60My06Y8kzefE
         D5Zz8cr0/A4tzST4FRWnB32gBFY3El9OK0hycQXmgFxuBrHfpCoz6eZhJ7Pgvj5JHhmO
         IymlO2KXMEHSKPGvhN1T/8m1zepAgMYjMBFyW90EZvQv0AFNfPySrg2fX2Iys9ketwde
         mTUM7O0D/E5jy3IgoXEx/ici9sUZff7Vyqh++OToD4JBtem1sBSggARD9ctK7hkZ0eQV
         cA4eZct+eUK56UdIUrKfRKYp1BicfopTMAp2p6SpnnqNECyEeIq94fYXyGgvFyLFTM3p
         Hy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706690518; x=1707295318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQCfrFSxrrf9tRO6HJcq+akjVQCNk3tk3vQzaskg9t8=;
        b=Jv2Jv9cPASF5s4w2j+/mD/cKGtKHt+KDhuNSyagrMxbEYq2he+mmBWLnYMbjiIcqI9
         IChh7SXYErGsT0Xd34FzKq4/D8vJj5OidAAeEHb9xYkVnOUL2Z3oXM/WWsrIFnB9PCk7
         ORk4QSCclOmTGA7LTRMXkGq0yIz3RTAW6z9+Vh/FcxS9FrZvz5mUSjJfRo0xBFSwC4rR
         Wguiolevtfg+F5o5Jv7YPsnGvFWb+1r2BVzezrrkKx6a1yVuVctFLv6z30vDL6IflBAs
         jK3nsbVDp5q0XuQf6R6t2ZMhr7jhCPaVODZWcSxiRRp4GX1LQafghYr7JkQJKKjuQlE8
         GKrQ==
X-Gm-Message-State: AOJu0YxwUqZkyE1DqHHhQ+hAvMJs9gcCz2qNJZZD1oIF/spEaIqAVHIG
	q37PN/wGkLKP1TISqU2wNVt37wb8QJQCOUz264I+7Uxtkf5C/gtGk8F3n7+q8Qw=
X-Google-Smtp-Source: AGHT+IHKr0M8p2erIxEMLCxQzd8C2G5HCFys+AO9+35Tn6g57xz7Pk+Ug/GD74zCWV734TpilIa+eA==
X-Received: by 2002:a50:8d54:0:b0:55d:71d7:31c5 with SMTP id t20-20020a508d54000000b0055d71d731c5mr947757edt.6.1706690518298;
        Wed, 31 Jan 2024 00:41:58 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW+fQSw5vPHy6jQbwiRMhmeUpgOaDIs3EZEsRstr6oQ56ilGrJP5dHob+V3YWhuc6t70LJ4sRzNaIRgR4cTmvR0CVyV2aO3qDPvfw8DZBWV0Yt7xZk/aPtjzPgstdLd71FwOGn644TvJh08hVHzpIot+gY5PMyhPdX3iWftXafslOSLbYY/zGATXTlVTjXPTpEPUxBZ3Q4qsneBd7EzqTvSCu0K0hsSVByS2lkY+uofDGreeAM5VR1x60DmJBx3x8fWPDtKeCA7nmlWLvUIuHO7rwlQso3pwWrZ5Jh7kpfFUZcF2MZW1GXC0dBjVXo6PwczjTWpl4u5iQV38vXx81HDWhBw62D1h9n3pIn9wSQNJGGQA3KbegUxSLBBUHa+EG9H0el5zDDizdo74JijFfDldGhpb3bNvV+WisJozn4ccc4ggTg=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id cq16-20020a056402221000b0055f02661ae2sm2863630edb.78.2024.01.31.00.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 00:41:57 -0800 (PST)
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
Subject: [PATCH net-next v5 09/15] net: ravb: Split GTI computation and set operations
Date: Wed, 31 Jan 2024 10:41:27 +0200
Message-Id: <20240131084133.1671440-10-claudiu.beznea.uj@bp.renesas.com>
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

ravb_set_gti() was computing the value of GTI based on the reference clock
rate and then applied it to register. This was done on the driver's probe
function. In order to implement runtime PM for all IP variants (as some IP
variants switches to reset mode (and thus the registers content is lost)
when module standby is configured through clock APIs) the GTI setup was
split in 2 parts: one computing the value of the GTI register (done in the
driver's probe function) and one applying the computed value to register
(done in the driver's ndo_open API).

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- collected tags

Changes in v3:
- fixed typos in patch description
- use u64 instead of uint64_t
- remove ravb_wait() for setting GCCR.LTI

Changes in v2:
- none; this patch is new

 drivers/net/ethernet/renesas/ravb.h      |  2 +
 drivers/net/ethernet/renesas/ravb_main.c | 96 ++++++++++++------------
 2 files changed, 52 insertions(+), 46 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index e3506888cca6..268ccfafe7aa 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -1102,6 +1102,8 @@ struct ravb_private {
 
 	const struct ravb_hw_info *info;
 	struct reset_control *rstc;
+
+	u32 gti_tiv;
 };
 
 static inline u32 ravb_read(struct net_device *ndev, enum ravb_reg reg)
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index f9297224e527..0f7b1d503618 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1756,6 +1756,50 @@ static const struct ethtool_ops ravb_ethtool_ops = {
 	.set_wol		= ravb_set_wol,
 };
 
+static void ravb_set_gti(struct net_device *ndev)
+{
+	struct ravb_private *priv = netdev_priv(ndev);
+	const struct ravb_hw_info *info = priv->info;
+
+	if (!(info->gptp || info->ccc_gac))
+		return;
+
+	ravb_write(ndev, priv->gti_tiv, GTI);
+
+	/* Request GTI loading */
+	ravb_modify(ndev, GCCR, GCCR_LTI, GCCR_LTI);
+}
+
+static int ravb_compute_gti(struct net_device *ndev)
+{
+	struct ravb_private *priv = netdev_priv(ndev);
+	const struct ravb_hw_info *info = priv->info;
+	struct device *dev = ndev->dev.parent;
+	unsigned long rate;
+	u64 inc;
+
+	if (!(info->gptp || info->ccc_gac))
+		return 0;
+
+	if (info->gptp_ref_clk)
+		rate = clk_get_rate(priv->gptp_clk);
+	else
+		rate = clk_get_rate(priv->clk);
+	if (!rate)
+		return -EINVAL;
+
+	inc = div64_ul(1000000000ULL << 20, rate);
+
+	if (inc < GTI_TIV_MIN || inc > GTI_TIV_MAX) {
+		dev_err(dev, "gti.tiv increment 0x%llx is outside the range 0x%x - 0x%x\n",
+			inc, GTI_TIV_MIN, GTI_TIV_MAX);
+		return -EINVAL;
+	}
+	priv->gti_tiv = inc;
+
+	return 0;
+}
+
 /* Network device open function for Ethernet AVB */
 static int ravb_open(struct net_device *ndev)
 {
@@ -1773,6 +1817,8 @@ static int ravb_open(struct net_device *ndev)
 		goto out_napi_off;
 	ravb_emac_init(ndev);
 
+	ravb_set_gti(ndev);
+
 	/* Initialise PTP Clock driver */
 	if (info->gptp)
 		ravb_ptp_init(ndev, priv->pdev);
@@ -2464,34 +2510,6 @@ static const struct of_device_id ravb_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, ravb_match_table);
 
-static int ravb_set_gti(struct net_device *ndev)
-{
-	struct ravb_private *priv = netdev_priv(ndev);
-	const struct ravb_hw_info *info = priv->info;
-	struct device *dev = ndev->dev.parent;
-	unsigned long rate;
-	uint64_t inc;
-
-	if (info->gptp_ref_clk)
-		rate = clk_get_rate(priv->gptp_clk);
-	else
-		rate = clk_get_rate(priv->clk);
-	if (!rate)
-		return -EINVAL;
-
-	inc = div64_ul(1000000000ULL << 20, rate);
-
-	if (inc < GTI_TIV_MIN || inc > GTI_TIV_MAX) {
-		dev_err(dev, "gti.tiv increment 0x%llx is outside the range 0x%x - 0x%x\n",
-			inc, GTI_TIV_MIN, GTI_TIV_MAX);
-		return -EINVAL;
-	}
-
-	ravb_write(ndev, inc, GTI);
-
-	return 0;
-}
-
 static int ravb_set_config_mode(struct net_device *ndev)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
@@ -2763,15 +2781,9 @@ static int ravb_probe(struct platform_device *pdev)
 	if (error)
 		goto out_rpm_put;
 
-	if (info->gptp || info->ccc_gac) {
-		/* Set GTI value */
-		error = ravb_set_gti(ndev);
-		if (error)
-			goto out_rpm_put;
-
-		/* Request GTI loading */
-		ravb_modify(ndev, GCCR, GCCR_LTI, GCCR_LTI);
-	}
+	error = ravb_compute_gti(ndev);
+	if (error)
+		goto out_rpm_put;
 
 	if (info->internal_delay) {
 		ravb_parse_delay_mode(np, ndev);
@@ -2984,15 +2996,7 @@ static int ravb_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (info->gptp || info->ccc_gac) {
-		/* Set GTI value */
-		ret = ravb_set_gti(ndev);
-		if (ret)
-			return ret;
-
-		/* Request GTI loading */
-		ravb_modify(ndev, GCCR, GCCR_LTI, GCCR_LTI);
-	}
+	ravb_set_gti(ndev);
 
 	if (info->internal_delay)
 		ravb_set_delay_mode(ndev);
-- 
2.39.2


