Return-Path: <linux-renesas-soc+bounces-12573-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB2BA1D603
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 13:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 353C81664DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 12:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7157D1FF1C9;
	Mon, 27 Jan 2025 12:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3lENvnn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAFF1FECBE;
	Mon, 27 Jan 2025 12:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982002; cv=none; b=DxzQHtbBYgekWbrlWBa1EBB1X1gLIFIbno5U8t9/hIkWuX2HYg5B1L9dJfyvYHA7py/cw28pzfFRgl7Vr8LNNi6x4Y3DqnbG6H+kVFldTChWTEgqXkqCoDDCrhyGDiZbIvrcaLnEMZorqnFcNs/VdKXL/ECFVOnu5fjGfnWGa2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982002; c=relaxed/simple;
	bh=4mWrBHSk0HW6moMZXG5yPVWArdrATyoEJrN0gimIFl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EZw0g66N/0antDSDJgDo7tAJ1rKaz5rNP1jub5R2rRgwCsEYAAgaz5mH6jFfLnDrAomgOsgZCoeBoUrT3O8s+udvUPXsmZRfGWDDJmfiyf/pm8TmwWU7NruSgtssDDvCjGPzvilPZwCekKYDsOf+IFCoGsSE2gXOI3G1mVd9FKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3lENvnn; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436a03197b2so28897395e9.2;
        Mon, 27 Jan 2025 04:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737981999; x=1738586799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5UXpQLaAZHWEyD0pxCkPC9tyYvCIT3KFA3QpJPSo0x8=;
        b=F3lENvnnyIdBXJiRuyenMBlDOFUYRotmz4NYSF3Lvod3+HJPsvpjEyWRXg2f9SHFVt
         DEQtC4qlTlYK2sDilwEDRUt25hmsp33HQo49Bb2DcZTMFZvjrOMwuTbY2k+W+2lxx/sT
         SDGS13Vb5F4PAs3ljRAayhrg/z8JKai1Wp6NgrY+OEJXVTQWQ4zwAfbDy7WRJjP8szSs
         kWik1XLTT9+Pefai6YkMYmu8lYxTAIImYTiO/1AyxatFNm/wR2kmLPTfDNd5U5uVNHWo
         /VmaXDP5nE+fk/JtMmRsFaRi1T3HUepKn0J8fu6JJ+3nel51Ex4yMu8lWgGd4oF2mKAv
         3/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737981999; x=1738586799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UXpQLaAZHWEyD0pxCkPC9tyYvCIT3KFA3QpJPSo0x8=;
        b=sP7OZmjqna7do7mbyWcNtxt7hj/rQtZEyQ2lOGY4hrTHJRy/wOlEOEOXmdovU9FHH/
         DIiot6ITKNPqjHqHG1T7WozgmK0DjH3nyv2YulT1MFRK3hB5i71Ll+CR43IlYqsezNtg
         eerKKDMNC+aB99LFwkge5/79SQRy11jh+hIAwlRfXowAEHCYBRnX6Eq5gvypPJzbU4mK
         xiCSUcpWgSqO9qQoGAt3i7ZiBsW66WR+Z0rBirsp/MlIRA4Bi3GdcyfHlldthwr+so7u
         sWautuKObrrHeZ4zrBDTOhmSkp+fOs2u/PhRJaZkoRrX+hIkn8+cPv0YR0ieCAuUbrxU
         eypg==
X-Forwarded-Encrypted: i=1; AJvYcCUB2haBoRrUbeEJgSDnCVmd43AG4ZzZ2MfMdxPzhO48phGnCdiiPnYmf8iAuKAWFnTW+iHpBfTxKHX6yjQI87wlYOo=@vger.kernel.org, AJvYcCUdkyDJIaUpo3TkahO7mcFF6VYhD2w0E9f4ayTkT1i2XtMb3Lp7nWlnVVGsVqRIV51dY15QpdGB1jvv04A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqpDTxh/S9NwSdcsSSEAyBpMKK7OKWYag+raXlxTCbOJsZ+VVu
	XLN30NVw6xGQeYUUFRVkMpSIq2ifBVvqKt+f4hlOFuLDHhkctnl1
X-Gm-Gg: ASbGncvwAs1SiQFPNRA/BQijdnqgUTKBcvnEHWakK31hR88d+DdKe+8R9YhscnBwhGZ
	TCFePU484EhLy8uNH1lvIqEt6apDBQmntCqU8/K3Rt4OZbrITWxzLtX9Z8Rn8r5szT+0075W3IC
	0UeaMqAi+66tlpcuXyiUT+whoVgvIwyQB6gqkK1DOtAfLkvI2E7O5O0JDwAGIV4+Vqm17Ar7t3d
	GLUgcOV/rkpcs7Ib+kD5UP8cN18Y7p+fHbmltUd7MxiQSkH1mQDuIcC95K4OQx352g9ovBAv3OG
	brPN
X-Google-Smtp-Source: AGHT+IFcpebGZaqOLXYWPaGFtndOOwU8Vjebxht6JbYpi1k2FlAk2skEDPVNNfLGXRNNRoy7L722kw==
X-Received: by 2002:a05:600c:b8a:b0:431:5e3c:2ff0 with SMTP id 5b1f17b1804b1-438913c9f66mr357781595e9.8.1737981998728;
        Mon, 27 Jan 2025 04:46:38 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd501c2dsm129176715e9.13.2025.01.27.04.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:38 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:45:56 +0100
Subject: [PATCH RFC 01/14] ahci: brcm: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-1-f8f50c821a2a@gmail.com>
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
In-Reply-To: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=4mWrBHSk0HW6moMZXG5yPVWArdrATyoEJrN0gimIFl0=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4AqwZw5/RPua7LmhyMMUY1qD4nk4fuWdEjvn
 fkcBz0A+ICJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKgAKCRDnIYpo1BLC
 tZSMD/9QFx/Dg/L9PZ311iYUySiZ5aaWZQ+jU5ysXXdpxQh+9iGpTrscQRBVfUbxFgoRJOSW2Kz
 /LxP0K7C6laA7kH3NsToFv20OKKvAo8JE/WrsxBNU2jNxzXaaIq/qRjOFJFXOGqFduVyTxASc/D
 rtGK8zEksr6Ulazfl5E0iRx1TPrAR9NlKBvV0KAVSkAlDV+MZQ+S7Ym6ZmXk+6ilwUZeFANJY6V
 gEdR88tKc1CpsaswbsvubsiNYIoES3v4zcEGFWVJ87Zfe9Z9wqmEHrgB6G4DExJA1BkUzMDNKOt
 jCw1z1SJ05MeOeoDOaTWUKNBLjXsa9aqII8RXNQG+DQIlHq8ucSEbgEtYkhspqDfet8IBpPo/Gn
 lsRRuzRsrL/BthLog1m9OUJ7ex7384StiA+Xk1HgskC6pid6pOIUUEXB0irM3UvKWfAmCtvCiW9
 o2eReO7PMqmkdf98ZwYMiP51i6TTly7NcLNSJOvYsQL0RqJaXTx3DMrb76yAQMCgex5b35hVK+7
 wIY8Mvcvf+Qf+TOMoGYpx0AYeDw08fHub0truLO8SjYyrgmQh9QK+uF5pbweufGV/RxBxMjiAAs
 WoIUly+qQrUHuAK8PEwzjqcw1LDHLo4xd+sDE3Y55CJrne0v2nDd0QTopi3kcz7woJeJWjG8b0i
 wvyJKOEETeFoxvQ==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_brcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/ahci_brcm.c b/drivers/ata/ahci_brcm.c
index 29be74fedcf01934e436481c66cb8d329284d599..3d43ed5db6078b3f07440f21aae6edf73d1da7f2 100644
--- a/drivers/ata/ahci_brcm.c
+++ b/drivers/ata/ahci_brcm.c
@@ -362,7 +362,7 @@ static int brcm_ahci_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused brcm_ahci_resume(struct device *dev)
+static int brcm_ahci_resume(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
 	struct ahci_host_priv *hpriv = host->private_data;
@@ -570,7 +570,7 @@ static void brcm_ahci_shutdown(struct platform_device *pdev)
 		dev_err(&pdev->dev, "failed to shutdown\n");
 }
 
-static SIMPLE_DEV_PM_OPS(ahci_brcm_pm_ops, brcm_ahci_suspend, brcm_ahci_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_brcm_pm_ops, brcm_ahci_suspend, brcm_ahci_resume);
 
 static struct platform_driver brcm_ahci_driver = {
 	.probe = brcm_ahci_probe,
@@ -579,7 +579,7 @@ static struct platform_driver brcm_ahci_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = ahci_of_match,
-		.pm = &ahci_brcm_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_brcm_pm_ops),
 	},
 };
 module_platform_driver(brcm_ahci_driver);

-- 
2.48.0


