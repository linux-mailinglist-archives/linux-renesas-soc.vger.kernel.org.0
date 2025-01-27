Return-Path: <linux-renesas-soc+bounces-12582-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB257A1D61C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 13:48:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 240F67A2C55
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 12:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD864201002;
	Mon, 27 Jan 2025 12:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mk6whEi8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6D91FFC76;
	Mon, 27 Jan 2025 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982009; cv=none; b=NwGktwKovUpoNJrkE45j1Nb4tqRcriOVfpmjGzn/yvu0YPIG5/cobPFXd/Yn+wvriLZeWJhv7BHpZE4NpRWSy3PGXfZSsS292S2+jwh2LgXA6SKmqVX/AVWzideiR/PF+xLPIEK2L/C71Z+TeZovairufI+VeeTyfDWzF46KBVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982009; c=relaxed/simple;
	bh=4ewGqTecw9fB2ZWQrXC3ww6+O0Pce0mhF6dQFMkMaFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZCiHDWIgP4wBHNFoZNaTnrCxPUiRK52runEmS8etg9n1Ssqgnh6oGerXf+WwC/Fw4Cxk1im6zumsNgwT3e2O1gJqbA77on2naHU3I/9TpGIiWzm723Kmd8frvLdkthpA1DCBIyV1WFOODwztxGbyXE8UT4QNQ9/TFNUJHlSjlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mk6whEi8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so45272755e9.3;
        Mon, 27 Jan 2025 04:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982006; x=1738586806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXNi3EOoOoj09C+mWJNSCmBp9EDVd6qCUzZ8imkNOb4=;
        b=mk6whEi8uhxmGai/JTOeafaWkWyD5L5wJg5NF50N7I/+11pEk/cZyrWKpD4JgtVfEG
         dsrkYJ5gbl2I9do0Wxzd4mVnLWoEBrBt0iLbuEJd0qgNNbtQ4XZ7hLoGQrgYYSj1DA9L
         SkFDSH2Lul/aWIrLP+uRosAhuMK5Row97e0TTymg7/gvWx0KcPWdhmjiTzoX6+4Z6FqP
         QJVh0h/fq9h1AcXAW1AHQGkaC39Gu2GROQ+5d9lzG/21dR3SbHg8vx5z1rPkdy8NzXLe
         G8imuAvYFDXlBh4oWp6zaUyA4ep/JTe1CKPJMEKlTOzxO2iuVrZXGxcgMj9C4ZxluVy7
         /lBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982006; x=1738586806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXNi3EOoOoj09C+mWJNSCmBp9EDVd6qCUzZ8imkNOb4=;
        b=TF8Jwdyb6BxKb7YtfsoOb2+cAqYLuGB1BhxZ4q9B8rcy8zUIf3Lerlq3S1mdaKza1N
         ZPpsoRGxw+oEmbydfQ1vADSiGxcjJvnwrc+IXFmSDdcShdTqXKDJp20dhH7wiUAhz+2J
         UNK/hRYJFuMrJKsKK8Ph4DgXdKUUpLWglxtv3oCFxxoi3fIIwPGp0BAQlDYcDDBIcrdx
         RLyApulVoPWOZcDb84osuMXZ58Hif4n9+j3pDrmZWIOEXD7aB+JoOIjSkDXqIQ46dKpe
         7x2CaY8hsA/p8PlNm/dqbWOwo2kX4eyA5To80POm8F6J+5E9cy4esQWf4MVSW46JKiBC
         InTw==
X-Forwarded-Encrypted: i=1; AJvYcCW8m34HX1iUK3OHYi2uXLuxo/loW2FHTfl1EQ/k5s6LkGEBHtuYXUZQrJR3u2jQJ+XDiv5cXnOQ5uIxAPj68Ulf2t0=@vger.kernel.org, AJvYcCWjnhPnaqcJwfoK9SK+ae538TbBbRIiOyWOsZlK63bb2HJJhupY9qnlpWD/NyZTYQtjSuEL8wIfrPJgkDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYB0rMYmiaIgzh/LWWHixe/zS6vmTrZrsSG2fEWGmogLlsRH8+
	9c3Jcj9lcJGiGglZ5sBQBV5F1HxuT/wBAZkK+H4TIFmhjSFEiuyb
X-Gm-Gg: ASbGncv7L2mISqRzRR6WGm4Oxp0h1IkfI2Az7xPhnJFg04pliewcm/LansnYFJ8WMiA
	ki8OPd/GwnumjuXouAK83CaGqyx1MIckZt01ltSPs3uY6ujrypBkKsQd0acGzdjnR4bR4Jb73wC
	2uQMNolaoNEPDz0BiKGz+B6Pau/0d/IuVv5jWZB5I/asKmeLx4VVQ/JW5DGVMTOpAwx+gUv8N8D
	ocvx/08N0XhfXpxQTxKh4F0EuhEwQ2gmrMWFbZgishf6gxE8VlaxdiRlyyChcIY4m0rclDftIbs
	dELa
X-Google-Smtp-Source: AGHT+IEAjBouqDFRRxREIp+llJfmCSrig9ltB26U/3ZnCQ2AVFGrx3mRWJPMehdo1wr/ju3fkhOnbw==
X-Received: by 2002:a05:600c:a45:b0:436:faeb:2a0b with SMTP id 5b1f17b1804b1-438913e32bemr392457615e9.15.1737982005836;
        Mon, 27 Jan 2025 04:46:45 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4857b8sm129474675e9.15.2025.01.27.04.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:45 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:04 +0100
Subject: [PATCH RFC 09/14] ahci: seattle: Switch from CONFIG_PM_SLEEP
 guards to pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-9-f8f50c821a2a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=4ewGqTecw9fB2ZWQrXC3ww6+O0Pce0mhF6dQFMkMaFA=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4AsXoc9CTFQybRCbZpaLcS7DyP9PPRpr3K/f
 7ALURRpv46JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eALAAKCRDnIYpo1BLC
 tcAeD/4+rRt217wlEAkj+zo4D1LMo+fJcoATk6JOdCwjeGtexKKz6F9bpW6+T9FpMEJkOyevd60
 iaqxz3f/TQ6Kc/vLiCrfAw02zyzvVW1bmI2vr6XRy33K3GYx65AN5MzmInaKwZuP27yx3FoCEob
 Fq84oTZcaoRCOteJdcfabhn1WzmnWa1bFqTVInQ8rrVzds723AZtiJeU2MCURZaofqq6K2DEFoR
 6CBVFgMGxgQuoDByUrb1SjmmissVuqdRtPQYnY4w+7Lb5CsyVNasfoa9IzmEpYFj07JYeqr8KVF
 c4wIM1JMg15XUKNN7Vu6riEMnpiQJePD3TjaSjJziXPkCw5+LATokEW01/ElnQCnqz1EPKSwk5A
 7cTrnEAdX0Xrtu911/9qHXoi490oklQqvbkcs4d6rGYCfn0dyRBAEyXhgK1sFXGjFg4lahWO3AB
 E0uEEl3kf1fg89jgW3cHATh7pSdhxuVO02VKELQS49Jg3XBSvqHDsbk1L/dSuoGig44rYsLnGMl
 J9rTAyJzfpdbcjtzhyLeej+OkYVXhXluhO/C3/gz+C8nESIR9+rKjwJv7yPz3VJkdveQRoLj8Ei
 clkKmuOelYUGxSjj8X3LxYfnNEI0pkLiZ5bdxTdrlbUKRiPJ61CB6WK/cwmunp2Wt8p307RtmTA
 gS8bW2aVFjdIBWg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_seattle.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/ahci_seattle.c b/drivers/ata/ahci_seattle.c
index 3f16c167840222e0de935f7fe44b3d83b95bc16c..4b67f3aa5787de433c8bcc1bb4965a887709aa9c 100644
--- a/drivers/ata/ahci_seattle.c
+++ b/drivers/ata/ahci_seattle.c
@@ -174,8 +174,9 @@ static int ahci_seattle_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static SIMPLE_DEV_PM_OPS(ahci_pm_ops, ahci_platform_suspend,
-			 ahci_platform_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_pm_ops,
+				ahci_platform_suspend,
+				ahci_platform_resume);
 
 static const struct acpi_device_id ahci_acpi_match[] = {
 	{ "AMDI0600", 0 },
@@ -189,7 +190,7 @@ static struct platform_driver ahci_seattle_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.acpi_match_table = ahci_acpi_match,
-		.pm = &ahci_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_pm_ops),
 	},
 };
 module_platform_driver(ahci_seattle_driver);

-- 
2.48.0


