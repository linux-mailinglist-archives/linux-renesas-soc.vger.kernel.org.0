Return-Path: <linux-renesas-soc+bounces-1048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79594812F2D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 12:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 718B41C215D0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 11:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320154AF62;
	Thu, 14 Dec 2023 11:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="afNLmCDo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C4E1AB
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:34 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a1d93da3eb7so928383266b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702554393; x=1703159193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyI1qtZFZcgDtG22qwfuXsbXZVe5eXhdPaWlE8gTXKo=;
        b=afNLmCDoJRxkUHNdlGGFw1CwSqctb3GiQWNg7AxoSZjnEUce426nKHYivo+n2l5jed
         Te/TW6i7VH34ZEOJ4lPq7JbRjsw+FbJ3eTdNEGsSbOK95fiLPef7oDmEnU8+10EMwpuW
         nC8qpsiIvCMokiQULb329ppIq35FgZkqufRQbrZbliYk6mNxqvLwmQjvWXQXSp7oE79z
         W4zHPz3QgHOvRoo4RiPBr/Z+C3UloXcWlLqEKGLQkvT/DMYpBphZFgUN9vpbNI2UPL9/
         Vn0S8R5mLHISzbX2PB2U+IS2yAfg1WxQ/oQMFKSN95m3Qr0cNwLrIodCyJ/c6pM7Bpi2
         O36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702554393; x=1703159193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YyI1qtZFZcgDtG22qwfuXsbXZVe5eXhdPaWlE8gTXKo=;
        b=V0yziX3Ks6o9NJCPrMJjSbVjurhK3McWjKym4vzEmASvK97J5rmmlbUEltpvtgMZpF
         riGg0WcGle49h01cKJ1CFM8hFZ3xiG5AivbzVqDGd8TtQIdUJarrITlHDtJDcKZaJMq9
         J5Jt7k7k6KqzVDUQeVQ2hsUvyFDU59sCLaC/WzTDqoIIfHgQmPwC5eLIYR9YKVsYb2MH
         T1KVYtFYbjG9qV/Wzg82gco+QttY2I7HtCkF1de1ZXcRxvBEoVSWR4N5lHMvVNKo6O/S
         nOTBV5z5J+YXqvPuI4RzPWpiqezqYMAB9Frd+JMUxnUy1dOn8mXI8iK3inv8shd/BmPW
         u6yA==
X-Gm-Message-State: AOJu0YzcNae46Vk+D8T7BXqUzmxRXZ0LwzALd9jel8c8TLqcUejqIbOP
	HUQ2HrdljE7LNSQVnAcVLrl+fw==
X-Google-Smtp-Source: AGHT+IH9hM6E8wlCul1HJ/7okzFNjCrfqFi/Oe3i2fnJoRVgpavpdhWPnxBeFos40NXvLSmFMhssBA==
X-Received: by 2002:a17:906:20d6:b0:a22:fe3c:49c9 with SMTP id c22-20020a17090620d600b00a22fe3c49c9mr1251684ejc.27.1702554392844;
        Thu, 14 Dec 2023 03:46:32 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id ll9-20020a170907190900b00a1da2f7c1d8sm9240877ejc.77.2023.12.14.03.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 03:46:32 -0800 (PST)
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
	wsa+renesas@sang-engineering.com,
	geert+renesas@glider.be
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v2 09/21] net: ravb: Split GTI computation and set operations
Date: Thu, 14 Dec 2023 13:45:48 +0200
Message-Id: <20231214114600.2451162-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231214114600.2451162-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231214114600.2451162-1-claudiu.beznea.uj@bp.renesas.com>
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
variants switches to reset operation mode (and thus the register's content
is lost) when module standby is configured through clock APIs) the GTI was
split in 2 parts: one computing the value of the GTI register (done in the
driver's probe function) and one applying the computed value to register
(done in the driver's ndo_open API).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this patch is new

 drivers/net/ethernet/renesas/ravb.h      |   2 +
 drivers/net/ethernet/renesas/ravb_main.c | 110 ++++++++++++-----------
 2 files changed, 58 insertions(+), 54 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index e0f8276cffed..76202395b68d 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -1106,6 +1106,8 @@ struct ravb_private {
 
 	const struct ravb_hw_info *info;
 	struct reset_control *rstc;
+
+	uint64_t gti_tiv;
 };
 
 static inline u32 ravb_read(struct net_device *ndev, enum ravb_reg reg)
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index d7f6e8ea8e79..5e01e03e1b43 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1750,6 +1750,51 @@ static int ravb_set_reset_mode(struct net_device *ndev)
 	return error;
 }
 
+static int ravb_set_gti(struct net_device *ndev)
+{
+	struct ravb_private *priv = netdev_priv(ndev);
+	const struct ravb_hw_info *info = priv->info;
+
+	if (!(info->gptp || info->ccc_gac))
+		return 0;
+
+	ravb_write(ndev, priv->gti_tiv, GTI);
+
+	/* Request GTI loading */
+	ravb_modify(ndev, GCCR, GCCR_LTI, GCCR_LTI);
+
+	/* Check completion status. */
+	return ravb_wait(ndev, GCCR, GCCR_LTI, 0);
+}
+
+static int ravb_compute_gti(struct net_device *ndev)
+{
+	struct ravb_private *priv = netdev_priv(ndev);
+	const struct ravb_hw_info *info = priv->info;
+	struct device *dev = ndev->dev.parent;
+	unsigned long rate;
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
+	priv->gti_tiv = div64_ul(1000000000ULL << 20, rate);
+
+	if (priv->gti_tiv < GTI_TIV_MIN || priv->gti_tiv > GTI_TIV_MAX) {
+		dev_err(dev, "gti.tiv increment 0x%llx is outside the range 0x%x - 0x%x\n",
+			priv->gti_tiv, GTI_TIV_MIN, GTI_TIV_MAX);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /* Network device open function for Ethernet AVB */
 static int ravb_open(struct net_device *ndev)
 {
@@ -1767,6 +1812,10 @@ static int ravb_open(struct net_device *ndev)
 		goto out_napi_off;
 	ravb_emac_init(ndev);
 
+	error = ravb_set_gti(ndev);
+	if (error)
+		goto out_dma_stop;
+
 	/* Initialise PTP Clock driver */
 	if (info->gptp)
 		ravb_ptp_init(ndev, priv->pdev);
@@ -1784,6 +1833,7 @@ static int ravb_open(struct net_device *ndev)
 	/* Stop PTP Clock driver */
 	if (info->gptp)
 		ravb_ptp_stop(ndev);
+out_dma_stop:
 	ravb_stop_dma(ndev);
 out_napi_off:
 	if (info->nc_queues)
@@ -2449,34 +2499,6 @@ static const struct of_device_id ravb_match_table[] = {
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
@@ -2792,19 +2814,9 @@ static int ravb_probe(struct platform_device *pdev)
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
-		/* Check completion status. */
-		error = ravb_wait(ndev, GCCR, GCCR_LTI, 0);
-		if (error)
-			goto out_rpm_put;
-	}
+	error = ravb_compute_gti(ndev);
+	if (error)
+		goto out_rpm_put;
 
 	if (info->internal_delay) {
 		ravb_parse_delay_mode(np, ndev);
@@ -3020,19 +3032,9 @@ static int ravb_resume(struct device *dev)
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
-		/* Check completion status. */
-		ret = ravb_wait(ndev, GCCR, GCCR_LTI, 0);
-		if (ret)
-			return ret;
-	}
+	ret = ravb_set_gti(ndev);
+	if (ret)
+		return ret;
 
 	if (info->internal_delay)
 		ravb_set_delay_mode(ndev);
-- 
2.39.2


