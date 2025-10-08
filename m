Return-Path: <linux-renesas-soc+bounces-22778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 714A1BC34C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Oct 2025 06:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5797E3BBF60
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Oct 2025 04:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EEA92BF3F4;
	Wed,  8 Oct 2025 04:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="R0gPE6xM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E152BEFE1
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 04:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759897540; cv=none; b=ghgH1b1YLAZU3Frd5tQoVRscKRHJ0fCNME5D8Mh4g8JQ+tLbYQRRXwRomBwn8pJavCuIoj0ziNcW+rvmeaH+LFPOK8IdzjTg7oTokADQc+A9eEcbKCEW2KFJC+YfffhyQh8wuHpm96W0GToIVfLULtShUEjv3l0ibJYOxL5UAB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759897540; c=relaxed/simple;
	bh=/cwkr9llp/mR6slfiaeDTI1dTaMIIZN5Dk0EHahwG00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R71/y5t4rJK3U0AFcK2BjoLwXlX9Cmw1pDfTwLr/PAwBS02o9SGy2xP8dijlhjaVQT2edKdxaWDJ6zg8JNe+jdE7plpWzguVE0tu72rpdjdTd3ACD3QxgCuDVNH+oWD8gsBoKZjimotr43Fh95tXF7mXvTL1xBxrhVCxUTmcTuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=R0gPE6xM; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6394b4ff908so11406707a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Oct 2025 21:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1759897536; x=1760502336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iosQWc3K2vVa/XAvobbGpvWGWDlaRdHniq3qdqd8DhM=;
        b=R0gPE6xM8Pg5WRAWPEV3gWgeEpFQpa0w+WHJmWhCxBpGyKCAQPjMQHL/kOqZyrlacK
         bzIFP95kO0wdB+5Fh5GQ9rVsu+oEDdFJDITcBYl3fObG9Xs5cxBnXJpqooc9jCcEZb/m
         547CO7TdlJZyUyTwU6yc/SMRW/5mPWNTzgaon/3HljFlFZOWYetiXS0Y6Fj/8lp5tc7g
         7hZSrLZsEmSrLHfVo1+DSjvxYIqmLwf/01fMd4q8mt3Ui3MlUvnfYhCqZUoOEnw+QVCm
         GRSAxzt/iVnRBXcaFFhL2BreynV6BCejZ6iZ4BDJGuTA2aU1Qaj9/nDr7ZAGlp6bW9TG
         XqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759897536; x=1760502336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iosQWc3K2vVa/XAvobbGpvWGWDlaRdHniq3qdqd8DhM=;
        b=XGBhO2+vNgKKQePx+ozry7+MyPRwzWD7OIyNoWhXIcZbkbM3yC2jtPBRBNRUOW4hiA
         D3aDZa6VSCSgS1Xmh7qaF0HFliQxs08MOEgL+c2tDscOeM5D4SNl0cNZy7eS6BjCMvBl
         ESeih6EKi/wq6v9U/tRO85ppuYowNyB9hk7s0EqaKZVg83HaAhdLFrbj/vsFiuxUdRSM
         j3l4/3JNvAHwgyi5k0Kkx+XnDvBlJJVbRNrSvan/wGCCwlSA4QuEWUnIhFtkBSSItFw1
         VElQFzUq6gC/Ee7ky1p6KR5va44hPolNxKPgJrPY4CkeIOy9EhWScLtet3ErK+0HM3CH
         D3fg==
X-Forwarded-Encrypted: i=1; AJvYcCU61rOKV9OthUTvUaVCjdt1fsWbr4f84HFirAZvMS93Sr93EBRKwyQ5QHNbo9S6BYZYbiqljJnj5ygKiayc9zKGKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxB62iGfajpFQTyFgzx1h8bA+eSXtaYamU+iz4VjJWF3SfcNxZ6
	V4G9d/9iqvU/QSC140o+cM1s238I7OSdUIzT61GU7TUodDFHtzbxZdsZAUC36VMNkto=
X-Gm-Gg: ASbGncvk2t7djq5NkZCa1T5IaMJZxEx+gmWb1g1POm7PmOCZXjHcrkobugiI6MgrukM
	LSL8HoMpWSdr7991pcKFFuO7Tw5oP+7AEQ10s+jLIVxNEuYj5Wr9MvYxhx6BAsxqmwFBkqFvdvZ
	GD23yUPHJz9Ou8Kyz32BBseM6IzgcT6whxLFKIcfwklHptmwsivmgzU012OUA9Ep05kM9bgHjI4
	k4uF+FkvC4Adxpp1KneiDZzxD/Hj/zMvvGipCEodQyutJ51xUW2VgGTGRW51g9lxsvNm8s4zEkq
	+Isne60SToWwSIYbKYZe4Raw2CW2Nzn/GdvBwtq8Hj5NrkHcV6VJpQwRAkVapYvLzwjfItMVq5k
	+gr2p1zKsJ+5ISR5uKW0eKOAe68iXaqfKhvLWzulDrMbvQUjNhKzVa/6LIdNFm2DxQrTwbaJ+Oo
	E=
X-Google-Smtp-Source: AGHT+IGeUnd2/6aVeIDKjhrDUfDyL/wkoJPBTkCJVt+SNcjIJPmnFTJLzgMbr2ZsLUVCNbNaLjPvlQ==
X-Received: by 2002:a17:907:3e92:b0:b4d:2ac5:81b4 with SMTP id a640c23a62f3a-b50aa48fc85mr225136266b.19.1759897536567;
        Tue, 07 Oct 2025 21:25:36 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.59])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e77427sm1583124466b.36.2025.10.07.21.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 21:25:35 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wsa+renesas@sang-engineering.com,
	ulf.hansson@linaro.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 3/3] mmc: renesas_sdhi: Add suspend/resume hooks
Date: Wed,  8 Oct 2025 07:25:25 +0300
Message-ID: <20251008042526.3312597-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008042526.3312597-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251008042526.3312597-1-claudiu.beznea.uj@bp.renesas.com>
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
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
index 7ceb7b977a0b..9347017d47c4 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -18,7 +18,6 @@
 #include <linux/pagemap.h>
 #include <linux/platform_data/tmio.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/sys_soc.h>
 
@@ -599,7 +598,7 @@ static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops renesas_sdhi_internal_dmac_dev_pm_ops = {
-	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+	SYSTEM_SLEEP_PM_OPS(renesas_sdhi_suspend, renesas_sdhi_resume)
 	RUNTIME_PM_OPS(tmio_mmc_host_runtime_suspend,
 		       tmio_mmc_host_runtime_resume,
 		       NULL)
-- 
2.43.0


