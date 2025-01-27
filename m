Return-Path: <linux-renesas-soc+bounces-12579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2C0A1D614
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 13:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8427F7A2BA8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 12:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CDE1FF1C9;
	Mon, 27 Jan 2025 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVtaRYRq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592831FF7D5;
	Mon, 27 Jan 2025 12:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982007; cv=none; b=S3/XrvN68XnV75rhouQ4qnSJaa31XdnBGifJddpaxMRDqPVWZhe+HmoBuEHYUmgi3/bRXZKqgfrIHHhnfz4mSQoAy+AFarBs08N663d5m0Vg9eeBMn4+0sT2VeGDus5RERXuZkahy1RmSDSwXdCp3j+yzJkw7c6c7mKFztv4sVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982007; c=relaxed/simple;
	bh=1NlgzpHbgQbix3Tjr1cyaZKDfkb/onDz8/2tsI8b2ZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FAFtSXHhgq7auKZbGNnHYzE0jw0/Sf699r7CTO/zURC4OO58p+tIyiX9s+/ESg1rHUiRGnZATUGFIR2i3yOqJJoW/bbLDSNpKjWCla+OVQIB7dQL5t8+6cJz8YIDSPeH4xV4L2IMFz1bUYYrtgH7z3Ggf7BGKsAGDJ0FVYk0D6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVtaRYRq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361815b96cso28954285e9.1;
        Mon, 27 Jan 2025 04:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982002; x=1738586802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nESEkcTInuMDz2GsfwYxT1TFIHgtEftiPAD53B8tFuM=;
        b=UVtaRYRqQP8skwq8aioKM0Gp6Q74KV1UaStDtomnO8yZqb3FqYRqPILT1aDMeixvWd
         kjqC46/nSasraoa1PVCD976FivhkbYabAcGlYR125rg6oglLOwk20JTsPEM3e73//You
         kYBLIHnKtdq5QL8Dwi72qJweo3RHLKzSM0VnbP7wBK3nnqoZA7OItgzaTs0CcE2B7BtK
         Kaxb5JK6PejGCMn0j4NhWJtxDx6fmtnBVyRSzmBN9+PGtnoVclnnPGThT38tPZuRB9d/
         mYrNXpCuX7v5nGNJk0I/Cotv9H/r6vHmBOtsu+Wp5lX9T1tWYZaTBWrMtp+M/gEQirDy
         EPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982002; x=1738586802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nESEkcTInuMDz2GsfwYxT1TFIHgtEftiPAD53B8tFuM=;
        b=ZLiGt9k53VrL5SGPWklmldp1YnRrgOOYw3+JYVpcWuUL1eEu9BuaTNiq9p4GfHgOpY
         jjYYqByetlWx9VZxgyaJxSf/mtN1+9b6CQ9TzV2/9DBRlynji+r0owWD/vkEom89uias
         pbk2lmOEWIDhm4E01LnN3ZmzhadZshNwVi6bQxbYLOn5NV6eCnvszx3DiIzR+HWHnLsy
         U5Q3dFBIMF2Oz0aZLpSFEuef/D1obUoRlyAp1XPHxi1jpSIwvTGJVsJASnx87a8UJURE
         7KZ5b/XeHt17NnashzUT0yE8D4foaaxjnPMhug3iGTU8Oj8CloxS8e47o7O6z2lPaiRS
         6OkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbfXa1sCt1JINKZVjCzoL6ouGKvdYSG7e0Nc/b/Z1mEPSSnBmI1MtArCGiWphiAE1/JeMHnCbj0qYLGCDQl/XMeJE=@vger.kernel.org, AJvYcCXbC2Cu9O95j1QZ6TYDcIWAHuQf+Lv1VgOf9uO/3uUFT38WPt3wIjN3baSc8O8Hptn16V05zQt3JcZfPyo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4AIr10b44qW4mJxs4t/ETf31u06gOYF+25JqsxAY9vSjLpGfS
	LaXysxV9x1dBzIQTAhZYl1aIKVbl0/3EVWB60wxeLudDzWyhRZ7G
X-Gm-Gg: ASbGnctN5PVdhDckh6Iq8M+TdZrdtQOu4fgyntaXNUgbUEjw3rhUR6Dt+W7MruVbVpf
	T8JfgxkYo1b3s5MziD9/9rHd/jGa6QVPsl1j1E0gQEbhY0/FzKF19NE1b8oTvsIrSEgqkLIMf6r
	GYx4imK8s1JIg0u/fTb5oKyDc+60TBUorp7hNJiHb1f+ahSJEdt4mhNGm6uia0EzCWlth/nG1Pb
	ewuRGTCWPE3Xfm/NKJnNRXEJ+15QQKgjZmNMEaZFVyETdRXbpYTrj7i08y2IT8ZzSl1sTlNkbNg
	c5AK
X-Google-Smtp-Source: AGHT+IHrX173KgA+rgqZHkHs3tuUNpSaSEXjwu22A+m8kddcmuDUjvM5y8f1hco6MglQt+NpNTfPtw==
X-Received: by 2002:a5d:6d86:0:b0:385:e38f:8cc with SMTP id ffacd0b85a97d-38bf59e1e56mr47569296f8f.38.1737982002399;
        Mon, 27 Jan 2025 04:46:42 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d6f8sm10808250f8f.28.2025.01.27.04.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:42 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:00 +0100
Subject: [PATCH RFC 05/14] ahci: imx: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-5-f8f50c821a2a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=1NlgzpHbgQbix3Tjr1cyaZKDfkb/onDz8/2tsI8b2ZE=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4ArlLlDES8G6JKV9p0Op22wBYtl2rLb+V7Ti
 W+1qGzGlf6JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKwAKCRDnIYpo1BLC
 tcRbEACFMbe4lquiTg8wH1+fz/lciO+CSZR8KZFmtd+230WvkforLr5uPcLRedFysFe+Cff1WYs
 np7nr5MxphXZtLMUZSOxyo55mDN/cHAkMS4qWD7moxUnteX2uM2MfdYeAMzLBN9LlTQGscTFfft
 w/1ceUvnn/Np65CvWQbfGNy/BGY4B1IBS9x7cFnExYD49LbBPhU7m5aOi5TG/FabGKZzKAt1Eu/
 09kLqOs/xGogNLtYuEBy81+YCsRy+STuk6e1RP15jI96c3EyEgcXVvT1HBJqtmR5LDFmrzuh54u
 +H49Rc6/zpPai2e5km04GAJbJq1wNG8/ICar4FSN52KQoixJsv3ce9jJD/T4YQHRqt9IwmBv3PM
 FxUU0nSqVpOW2F3v1nehYSCCkTNX8NHdtISGNhtwHPTarAgtssNkuJSetHNJ5Wg1plR1nwUfzFf
 AXYCLS22gsqcHsClW6YseBZUsEX32zXkgL+EceWNozcTjKu9z0KzpRCAnjUPeS3WQE/R+M1abeO
 LJMKdS8C18mKQQ5LCp27eeA09XzI8Uqjvq3tvHyXGazGku36zGm8mGTRn+ppZYn0fa8qYtYd9qM
 hJwdL3XU11O4J0pt7nbGccn4oVSwn7GWba5qhczK5wU2DadFkkkKJn5gyHSPY60Glr/kyI3vYJN
 k/vV81JDW/BJV+w==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_imx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/ahci_imx.c b/drivers/ata/ahci_imx.c
index f01f08048f97aa230877e413ba6e416d79779c1b..ec75a16c630a79ce10ea98b16c44c9a3908f869f 100644
--- a/drivers/ata/ahci_imx.c
+++ b/drivers/ata/ahci_imx.c
@@ -993,7 +993,6 @@ static void ahci_imx_host_stop(struct ata_host *host)
 	clk_disable_unprepare(imxpriv->sata_clk);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int imx_ahci_suspend(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
@@ -1021,9 +1020,8 @@ static int imx_ahci_resume(struct device *dev)
 
 	return ahci_platform_resume_host(dev);
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(ahci_imx_pm_ops, imx_ahci_suspend, imx_ahci_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_imx_pm_ops, imx_ahci_suspend, imx_ahci_resume);
 
 static struct platform_driver imx_ahci_driver = {
 	.probe = imx_ahci_probe,
@@ -1031,7 +1029,7 @@ static struct platform_driver imx_ahci_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = imx_ahci_of_match,
-		.pm = &ahci_imx_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_imx_pm_ops),
 	},
 };
 module_platform_driver(imx_ahci_driver);

-- 
2.48.0


