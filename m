Return-Path: <linux-renesas-soc+bounces-2267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2F1846B0C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 09:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48334B2284F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 08:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3127428C;
	Fri,  2 Feb 2024 08:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="hXfRRiV1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCF25FDBC
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Feb 2024 08:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706863334; cv=none; b=NDkuHR1EmHBH+EdweEYX5QE6Hid6rlF9SEoc9B1SVj6Os9Db3DRBVjcYZq46vsYXl4UPwqjK5JCvzkXMHEhMVxcf9vJZc4omAFh026pvfLwRxtSAiwEpRxdhujnmgCUYmfRZcxMzymqfmxHSXsTPwkE5gycHYo55/md7I2/wILc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706863334; c=relaxed/simple;
	bh=dNRRDz4Bb1OuEmu+nW58AzscDhcZ6X/B2WLvdreri+I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s3L1LWuSF2XhNgMvRXNYAzHnCOBwcBoqfqYJWoy+bG+QDe67HHJ+jqyVkSzJvjXvhrVhmH6jjcSw2FC0TVsfErxnZGB7e6POVOLET7GEzOY+92rnOfEr0frIfpp/1iUySZdc1xGNRLwdY58ySZvNcbJMqArOyC4NnaoalsOGoEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=hXfRRiV1; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a26fa294e56so262968566b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Feb 2024 00:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706863330; x=1707468130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9vMwV3T8fFvP4He6TN+KQoGt+DXHpVsSkF7+oq3d2E=;
        b=hXfRRiV1uPJZILQmyJZPJsPfhx3ceUzq8dojDPZ8se8I6nlNSRwceCxJ3xCDScA1da
         T8wyA6guspb0Vn3lC2xkzssz8sEX6UYdVKhrH3JsLJXDGkzovTfJWBND4sMWx2vRzc30
         u8a6P74A2f4rlO6yfIFq+OPLt7wGPHah/7yNxZ6QuKNfn6zEdOaNxQZTBEh+seKCjm8y
         4akoECkQByqZpMX9DoEsr8DPQImTsfApzaW8qXV0QGydASS3AfbSxg4bpQ9J+OStkqrB
         kvL6cwgdzy8/ZAWx3ZwtVpir3oGeF0MEOI4CgNISrXActHDC16syPdQbd2R6Td8GheVN
         ARDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706863330; x=1707468130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9vMwV3T8fFvP4He6TN+KQoGt+DXHpVsSkF7+oq3d2E=;
        b=QH4tO1hQb5DZvYX9xUXKK/+R4Pk9aSECanlR5RmNAKEu3CWWsjJTBlYxrpS9zflJiO
         Q/CkNJij03ajpPFpsk9paaKA9tixooYG0MRFmfwpLAx8XL2edKKXvqEQT/KtpAq+NJk/
         z8GWPYydGkZEQEw2ctvYBr7xNQnTEelELbW1zZpbP2QbwcEJnHo1fwhYXZXNuPYOEBQU
         kU910im5DIQZMYT++bEi7sL3P+LHr6khi++bbINcVkUH9E7LQOL8QH9aJ+UhioGBjyiy
         MgEN5Ix5R6kja1iiGXz1Hqq2kIX3sih/xWPmuW8X2zN7CJ2o0we0ENVTmtOscfHfyuCV
         LfQw==
X-Gm-Message-State: AOJu0YyX/P0k97DuML7jkjVPi4tVg4BGAXHIWmICSAPPob0hBMthMNSa
	bSarGwrEpHtU2gSLjuYoAwCIj17dCX49raAty9dXLN8dbi56SiD+FjTFi3T03hk=
X-Google-Smtp-Source: AGHT+IGcZDQLgAPHlrsmpjdwNWSIXKaFglLjExIZhzctjGT2ucyxHzXDlA7vTs3IPQ3L3VDiGu16Ow==
X-Received: by 2002:a17:906:1b1b:b0:a35:ffaa:b43 with SMTP id o27-20020a1709061b1b00b00a35ffaa0b43mr5930556ejg.50.1706863329810;
        Fri, 02 Feb 2024 00:42:09 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXKtPmK9JI1MfbzVeUDD6l0aAiiWl+UkcL4YTXG1dEy1rC8w8n19IPMPtZm8F5+viRxHIKFD53zgyVNHje6dUgFJPtt5x19GeIkNY/Rl1TEtTh434mzTOT7rE5Wo6oFin2CIXTz9WnENMqQh5uQeKSMb9IGSUnNTdfVzuc48Uuu8voqlWEiEQd94GoQsAR9LWAVOpwfpyufpjHP+N6mZe+tn47sZTTXxASyD+trZEhh2OuY5cSGaf9niC2HMGOanqXaEV+LL/VGOO8Z0Id53uTzyVNMfvtdtCwG5kLB6n6XNTpcNHbc3Gv88o5soSDDwtDw/qB7uFkK5FqXDY6rLcKR9unGAx5v/dB2ug/FtePddNTkh1B9sOlQw+h08mkz/nVIZRhnLAZytoCrWQ==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id oz35-20020a1709077da300b00a361c1375absm631642ejc.133.2024.02.02.00.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 00:42:08 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v6 09/15] net: ravb: Split GTI computation and set operations
Date: Fri,  2 Feb 2024 10:41:30 +0200
Message-Id: <20240202084136.3426492-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240202084136.3426492-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240202084136.3426492-1-claudiu.beznea.uj@bp.renesas.com>
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---

Changes in v6:
- re-arranged the tags as my b4 am/shazam placed the Rb tags
  before author's Sob tag

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


