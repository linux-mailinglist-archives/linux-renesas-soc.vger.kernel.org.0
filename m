Return-Path: <linux-renesas-soc+bounces-24689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E46DC637BE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 11:19:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4747B4EF38D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 10:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80B4329389;
	Mon, 17 Nov 2025 10:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MwZ5N0Xf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E3832720F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 10:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763374376; cv=none; b=uN377NDbB3ft/A5McgM+L7yWikCuFp9UHHnJ/9XBvocwwtRUaDvzkFBdD/TKdVVef+QkMRU3jZpAsUXlUmfRFS3dVvxs+p9frZtupDISGcoPiAg53vWvf5GMxYP2yrDneaX4RTDAWy/nQMrMvONqwvWyZZWxH+n8T255Yw60CN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763374376; c=relaxed/simple;
	bh=7RSvUg07B051gI8sV9lF8JjJS0uQZ25LyvxGhWGnduk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qrF3FuUKIgaE+IeTJsm44yJr/MYH3cCc1ab6wDbj17ml9YZZ83GufI+EwcdgSABH5+4umFB+xB1JBOR4UHgJNy9vMy+tnZE9BvGVGDHxIAnrt/nhAmVNxODDSz+oTPxKu8sOvFtavUrduG7VJPe0jcaWnLCu4O0HwH0V78wjzyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MwZ5N0Xf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477632d9326so27986025e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 02:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763374373; x=1763979173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6Y4uKk4uuv0qQmAW/uNPWxDPdMDZQqesObvwQQomkI=;
        b=MwZ5N0XfJn9A+LWg5TglrO+5CHtX+P9gY52T8Yk/B78PMEuZ89HRcKOXHSnjSHv0Is
         YfqmToqGzzL+V72kBCmlBdMCNatSz845ctUCsZHnAXq0cdC+Kk0Q3s6BbLna16GRBdi0
         7jLiZDVcjhGRr9rq381ONopu72ob1l3okaaInTQHSD4XFAw4CE8JZHW322CsfslZSd2G
         b67ToiuOfDAuSofBwRtX+lzlwJQQ6+ePi9lRGwGOp5uIlzCkzmpoRf6MWNdh6v0CwNTh
         P+JTzGNjXRYmVOjSWH+mMw1NaTl3D8ZoW9SJXTm4oOduRPOZToae5/LZjE6cxbkBPJ2h
         s2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763374373; x=1763979173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C6Y4uKk4uuv0qQmAW/uNPWxDPdMDZQqesObvwQQomkI=;
        b=GjGAEjl3e2KlJaQwgV/CipXp5rKrtkAok7PEQ8gvd86q0ILoW3vf7cpz2SIbz6BdoK
         SLLR7Xe3FwicldfzPhB4wNiw6dyv1JjjmzHikb/3QzneSEdWbGaCmEPX9T2244Ac7Slx
         N9Ee4+3wfnZL11XlGiEy9dhjU7pE6evhE0+mXkCI60jIt1jzfIkJaFAxrKrpCfHfz9Yr
         42IlSiQLfEk6vKHu9lgyFmW6IYN6v1aONSgJA1/V5t18EpdZl3H051UwymAo9v70n9tY
         +mYQZSywy12vMmyDhN10c1Qg6pVj1c2oez7Z/76lUJITItY2ePmWSf9BRDZrZ9ERLAOP
         eWBg==
X-Forwarded-Encrypted: i=1; AJvYcCUQYyun7kOSoOhAGLaxnxB7s46NbI3UT9a7MuhY4uiYGeqYM9oe+hAwcYhrBP4B1d54AWPr2Cux2f7suhlK+jjDag==@vger.kernel.org
X-Gm-Message-State: AOJu0YymXhQRKGsl+FMLEhWi/NvpygbeBqY/EpFkXJg0IzJ5Iw9fHusZ
	hOEj45KeRWbAGSyWv1mKfmHe5+2k0JvvRL3luW7ZizQQms2SfBmrUQ9/ocPE5FGi1VA=
X-Gm-Gg: ASbGncs889Z3GriBEx69Xq+AjZUtKIGIi36e8haXwWIWXkE7fnh4XiRPxFYS2zuSOzs
	SERJEc6x5We2nP3igp9QzFXFUaYchemChWzYJSaT9i6QB4Sxx4eabAXOuB8bq3rvRcNMJe5yd5f
	bSy4mRHXxEcPBJnydpvdu0orWh2vh/6t/Cz0U2TDh5VciqWROpcgZSnNPLaP3Tan+3mwZBtca3g
	Z6gbGGVreVOqbDegb0FtSLvue59XaIfuff5k6JI8nKozCtz0CkU9WqgluPRTGccEdtlZiTOdYWz
	b2VXUiUjfgHp14a7VayT+dAyFEy49HqJT3vgDcU/yD+Ns3yLqvuIetWfqm34ZFcYzPzD+mIv+98
	7vqG/v5LtAilX6+ArcI4a4KVKMNf3crTAhT7Zh7VfXdr9MONkQdb/liZ/yiQowUbaJkCrlOBA35
	ULWnjsKhClAncXibQxr2X19Tug/2fR0g==
X-Google-Smtp-Source: AGHT+IFFRowjM4rREb/274yZWIOOnY5X22zM8BYH6Kif2+IeH9srIQ869aWcEjTvttZZrUzgfTu6Pg==
X-Received: by 2002:a05:600c:8b22:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-4778fe553a5mr108959175e9.7.1763374373104;
        Mon, 17 Nov 2025 02:12:53 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f203afsm25806958f8f.39.2025.11.17.02.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 02:12:52 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wsa+renesas@sang-engineering.com,
	ulf.hansson@linaro.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	geert@linux-m68k.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 3/3] mmc: renesas_sdhi: Add suspend/resume hooks
Date: Mon, 17 Nov 2025 12:12:42 +0200
Message-ID: <20251117101242.4018208-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117101242.4018208-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251117101242.4018208-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add suspend/resume hooks which assert/deassert the reset signals, along
with forcing runtime suspend/resume. This allows using the driver in
scenarios where the resume is done with the help of bootloader and the
bootloader disables the SDHI clocks, resets, IRQs before passing execution
to Linux.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 drivers/mmc/host/renesas_sdhi.h               |  3 ++
 drivers/mmc/host/renesas_sdhi_core.c          | 37 +++++++++++++++++++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  3 +-
 3 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 084964cecf9d..afc36a407c2c 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -9,6 +9,7 @@
 #ifndef RENESAS_SDHI_H
 #define RENESAS_SDHI_H
 
+#include <linux/device.h>
 #include <linux/dmaengine.h>
 #include <linux/platform_device.h>
 #include <linux/workqueue.h>
@@ -107,4 +108,6 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		       const struct renesas_sdhi_of_data *of_data,
 		       const struct renesas_sdhi_quirks *quirks);
 void renesas_sdhi_remove(struct platform_device *pdev);
+int renesas_sdhi_suspend(struct device *dev);
+int renesas_sdhi_resume(struct device *dev);
 #endif
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index c4aaf534868c..2a310a145785 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -31,6 +31,7 @@
 #include <linux/platform_data/tmio.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/of_regulator.h>
@@ -1317,5 +1318,41 @@ void renesas_sdhi_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(renesas_sdhi_remove);
 
+int renesas_sdhi_suspend(struct device *dev)
+{
+	struct tmio_mmc_host *host = dev_get_drvdata(dev);
+	struct renesas_sdhi *priv = host_to_priv(host);
+	int ret;
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		return ret;
+
+	ret = reset_control_assert(priv->rstc);
+	if (ret)
+		pm_runtime_force_resume(dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(renesas_sdhi_suspend);
+
+int renesas_sdhi_resume(struct device *dev)
+{
+	struct tmio_mmc_host *host = dev_get_drvdata(dev);
+	struct renesas_sdhi *priv = host_to_priv(host);
+	int ret;
+
+	ret = reset_control_deassert(priv->rstc);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		reset_control_assert(priv->rstc);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(renesas_sdhi_resume);
+
 MODULE_DESCRIPTION("Renesas SDHI core driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index ef06c3a60ae8..f6ebb7bc7ede 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -18,7 +18,6 @@
 #include <linux/pagemap.h>
 #include <linux/platform_data/tmio.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/sys_soc.h>
 
@@ -600,7 +599,7 @@ static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops renesas_sdhi_internal_dmac_dev_pm_ops = {
-	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+	SYSTEM_SLEEP_PM_OPS(renesas_sdhi_suspend, renesas_sdhi_resume)
 	RUNTIME_PM_OPS(tmio_mmc_host_runtime_suspend,
 		       tmio_mmc_host_runtime_resume,
 		       NULL)
-- 
2.43.0


