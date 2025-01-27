Return-Path: <linux-renesas-soc+bounces-12583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5F9A1D620
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 13:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB0DC3A56C0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 12:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83CA620102D;
	Mon, 27 Jan 2025 12:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K34+yqbe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7408720011B;
	Mon, 27 Jan 2025 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982010; cv=none; b=rxYj7eWPAHav8MEoWhdVQilgmMhBVWfZOeTgS1VxEacIxEWAkClshRQhFdSl4Dy98ExtarFabeaTfSjpZEmZOse47Qn8qC5dT5LSR42D9vQdoq8uhgNqf0uruoPtxo93pNJy3BVgLd75og7u5i5PIVrDBctnV9YCemMTxHknoGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982010; c=relaxed/simple;
	bh=3GK2SPKfq0gy3cNILmQ5ZsytwY/PBIweFrsBnfiLWdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dQXNSa9CGDplKS5NBL22e5zbrbZRuFzekY2DGZ4hPS2Cr17EhdqDQLfJwg1KUx11pcsT9JJC6YFiKymnFZ4h23KmxxoKf6T0utP2gsoIKepzszBDeJjCtyIUW2I9y7v/rz2yr+5aRWi0Iyhs0nRYK76Ih4MSUcMxzAm/QPnH2lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K34+yqbe; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-438a39e659cso28279455e9.2;
        Mon, 27 Jan 2025 04:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982007; x=1738586807; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szGjXo1hYYSzRkz6HQhU4uZSzD6xW5bFqhnvJ2ebtpA=;
        b=K34+yqbejY0+G3hHxfJzCNICyVKAmg01VFDzKFMdFMKeHqkwrrbu/5Hk8X9oDGaNB/
         oc9nD30X+5RIxNwfzjyLQEy+VwZVLJOgFsgAdwERAjfetsiYhOpL9qCULugR4A7FKp3H
         3WFwRBw4FMurfaUztj4vb8e98qYqudbNb4OaqpbvXx8euGB+STVE1tsiy2koD532gBu4
         IuNO/DjSTRohIsoCpDMeuTDQN+Yh4ms3g11fd1WK1ymh3eIwGLYD479AbPqFEkGWWytC
         xmz0ka19PtleGSMJHz4TXKDAwlU9VMJiLFXbzuAKZAKctQhgbsjp2CR7v19hpWCt7nrT
         uTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982007; x=1738586807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szGjXo1hYYSzRkz6HQhU4uZSzD6xW5bFqhnvJ2ebtpA=;
        b=XJM3NnRrfO7sADNvjkHLaK/X6jiehyM7wx9WH7uFcmE4oS6tYG197z382c5QaErlFx
         hFj2Z97X1pETvyohlMV7omwqxnxr9D7TMSl1eiEUx459p1AaTuuAsujHdTjVzdoIB2S7
         DBXUKjxNCSO/uy9BMDs8jmeF8CCcL/i1ENuH00olKcBdcsDUKne+d16TQ0UyTmMw1YgL
         ExbKC8VVrQUcOE0GxF/prypwV7/JVhpf2JRMf5JoPqv5i8xYtju9x6aT+cjvNgvh7MhD
         khKbga84L/0pxKlLR+G24UOdvLU7qhg1tnF+6tqsoyz9XMcZpjsdGiOYEZ4nsIujtepy
         PFqg==
X-Forwarded-Encrypted: i=1; AJvYcCWV26ZK58z8KFZB3pA4yanGYg65Tw8JOlECy/9g1DP9xkOiUM+FimKdl6y63RMF/YGu98nKWdffWWKnmoQ=@vger.kernel.org, AJvYcCXkeVQdQeIfSeczrv53ww9bosCfzLhv+HyNO9qIg3rWPn4TNrNElQ612bNyonacOOXern9TFhZOF5FT0NTtBY/h0rk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUe1UuLElGq65Y96mN8+sMsiG0T6TPEU+1kk8Q0O7xi7wEjswY
	zx0BbowurbPZywQdrq37wN1SsHJ64i4vaHUchKXtD2Lc1Ku9Io1u
X-Gm-Gg: ASbGnctsbKdvWK/oe76M24EhzQUH+m1c3N6vWK9vfWIjgKR3gX3wkZaPNLhL8oCWnw+
	sPD2rWg7SqW6R+Bu36cirs0M7Q6SOSKF5P4qxsCnmiAG9xb6UCWKhBQ3xE+5m+kgkybX7L0Xx4q
	Ple2NNExwZf3lmL0+hr3Zk+Re0zpzDaOqvYJ93kYXsEcDxRIBOvzEbsmtzwTF5fn1vqaqLx+DLb
	9jI05WmJUE68L9XNAB2AfXxqBLuWuJogSR15NIqtI0i8kbPXIRO00UbPHqX6RiR3IDHGbLtH+dT
	pT4j
X-Google-Smtp-Source: AGHT+IECyknYFtGMyIOfytVXp9Xpt7MbeLa3f0kkvjGmlt26TzZXV3Ltntm5/VpvvPJ392VzgHnZnw==
X-Received: by 2002:a05:600c:34d0:b0:434:fbda:1f44 with SMTP id 5b1f17b1804b1-4389142e805mr342800575e9.19.1737982006564;
        Mon, 27 Jan 2025 04:46:46 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd501c2dsm129180725e9.13.2025.01.27.04.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:46 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:05 +0100
Subject: [PATCH RFC 10/14] ahci: sunxi: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-10-f8f50c821a2a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1570; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=3GK2SPKfq0gy3cNILmQ5ZsytwY/PBIweFrsBnfiLWdw=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4AsWF329QNvB9AQN3sovNUKToG4hfpVVUhqI
 R8eXTifdn6JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eALAAKCRDnIYpo1BLC
 tSFmD/4tt85mOkwMLGX8cjbjVQfnqOnIgtb1Q2GzEesQ9yxpXI88g4suta0w+UhJqmL3ItTeU1n
 mnbBJgomCc09suTGM53hvjh3KcJfiJa67PyOst0jpmBJ5vxiFLSxQRlnoSKy/R2IwZ8/SpPOVod
 WhvficTrwmPfNlOEAMkbaa/3zdLSkZlYsMfRf2Ociw0zcIKLyvlfWWp0fmx3BjmxKmJIGKOL5lY
 bpU/tz3HDN7BFVy2KKTbpF/I8bOlnD8ZDknqqsSACntMBhStldQI7soe7PfP4dO/BvcYuy1nsXH
 VgGEHYoiZ9i7HFcP7rWJXIe4CXSjPX5Xxl1R2fvT1328vP+dXS3xfkW850n1XvZpYLdZe/43d6a
 PnrMCMRbvxYzpXmNWYsQMDT72C4URY2EBSKf+8huJrX61vLD2SlDOsPC4W8P3z75oYR+3VW6e9y
 L9OElLjmtRdv/4z6x+QN3Xo5KYnaj7NuFs7B3TWjTtrCzA7SmEEwCjlY3BtSSdsDDSGiHfNpFWB
 BqHw7DRbx+ANuEbZvr76T1jgLWfdW5054V/UfJEm12/qGHlE5Mt0FIOLGx2h+rQUktRQn7zlTIg
 im7n/LUh3BM3zBhUVD+w4dSO/PrVycnDTeHnXQfXKYImu4SMzda4AOHhw3KZGew7PY/cYjhJMFZ
 /+uizNvy2xVE0xw==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_sunxi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/ata/ahci_sunxi.c b/drivers/ata/ahci_sunxi.c
index 5d4584570ae013a4e44ca69557cc2c5aa61d32b1..2e86d4c97b822b6a52513dbe55e21851a58385d9 100644
--- a/drivers/ata/ahci_sunxi.c
+++ b/drivers/ata/ahci_sunxi.c
@@ -253,7 +253,6 @@ static int ahci_sunxi_probe(struct platform_device *pdev)
 	return rc;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int ahci_sunxi_resume(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
@@ -278,10 +277,10 @@ static int ahci_sunxi_resume(struct device *dev)
 	ahci_platform_disable_resources(hpriv);
 	return rc;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(ahci_sunxi_pm_ops, ahci_platform_suspend,
-			 ahci_sunxi_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_sunxi_pm_ops,
+				ahci_platform_suspend,
+				ahci_sunxi_resume);
 
 static const struct of_device_id ahci_sunxi_of_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-ahci", },
@@ -296,7 +295,7 @@ static struct platform_driver ahci_sunxi_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = ahci_sunxi_of_match,
-		.pm = &ahci_sunxi_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_sunxi_pm_ops),
 	},
 };
 module_platform_driver(ahci_sunxi_driver);

-- 
2.48.0


