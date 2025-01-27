Return-Path: <linux-renesas-soc+bounces-12581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C466BA1D61A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 13:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 693923A5C48
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 12:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB47120013A;
	Mon, 27 Jan 2025 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmQ5F7cz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C012A1FFC58;
	Mon, 27 Jan 2025 12:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982008; cv=none; b=UFZUIs0rfk+BXAwOLxhgZizu1V2DLpP4Va2vK8ER2pwtDea4i69323o/Sb4vT7Sa4QdrAA06XA6FgrthwOz5Yc4moP9UTc4sA7fbLTwLwbQCW21OtkXT8Sj8XVBtSD5qGEEEcTwyqSQ5ffoxQgNw4FS7co5B5CzywZqcWBx14fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982008; c=relaxed/simple;
	bh=BVe5T/T+KyUbuPkxpZh30Ji3hdJ098Bkd+OSL6K5mXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=khCSqKpqP0kV1j31lCNea1r12/iEUhWHTMzsdCpeYNAKxbwPNlD3RIm55i9CuiaRzQXIQ68ihtcTuoPjikjFqM6vlegy47J1O7GyvtjGEp3sK3QBH+pPRNXvX6wCYL/ME28Z0SmldjEFlt/5hXqx2Xke4Mpg4FHc9gr+jGeg5ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmQ5F7cz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4363ae65100so47970905e9.0;
        Mon, 27 Jan 2025 04:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982005; x=1738586805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8oUDNS0fcrx4OaYIBd5riS15Hnp2550FLQmcgRsJgyA=;
        b=TmQ5F7czZWDTIeizqcpNkN9U4GD9lu0YGRP7dr/jCMF23/rbI04RIWIBPhb3RpCWcL
         rPA7PN0QyAPILoaYlUPFrEIMkxCou1AY8a2HObQ8jtDQRQXVRAKaZ4uYI5km/p2TJ5Xq
         a/sToPhGeKbnR5cp+WWOqzTTQ1Pv55eRTA4SicacyQQnYPPm3h9lio6A7hdP2JeL7QAW
         ny4nSfiBcnZoZfBJhm64Qrs0HagF9bDnLpJysmIY/XO4DZkSi+TyOZyUeP1NiwN6MR8j
         o9MRBnQqzcrfDX2WnfVHeOzL8yfqJP8YxyWsAZ7rUyjnlBjnKvE8FsnFZ72GY9XHC2h8
         qoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982005; x=1738586805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8oUDNS0fcrx4OaYIBd5riS15Hnp2550FLQmcgRsJgyA=;
        b=LoY2HPJqGc+HrBkkcA2fJt3cTXQV9OWS3BKKJMStbdj7Qm9X863eLu+oj7B+/0B98v
         PzrIbXPLHf2WO93pO3C3ftUhwN0SC3ALCl0+Im08KKibaQJ2zwVnp5cYBApscMtv53dV
         4l0eXSguRK1LE4fFH0GfGxdnL2CJ9Jguv0t54ysfFaLwgoIl38hB5/XbjeexZ9zhqNqn
         tUaI0xFFLwQnD4YH1tjySpY2ecqIDWp7det7x52A/bQugs78z+E4q64EqMw/aeFYRcii
         8VzjKeos51rHj1wyz+ogIyCRruQt9ARcHVYhRbXvBbdHdQz+CjWOmpRsA796VPrji8km
         td9w==
X-Forwarded-Encrypted: i=1; AJvYcCWQTF+5mhAHNH2y/krsDb8OprA654dcNmSzqUNMyu/yKWQqvvFJO+W1orzF0ed+MrPPmHaQKrq5nYmEOfcd9Xf+0zY=@vger.kernel.org, AJvYcCX8KSEL+Nd5OBS4NZCcKF1VLDktzd9urNydQiJyWi4GAYeLkZ9qQgDZvyWfI8R4tpVwsEoe/soj0QvT/M8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyXOB9kd28l6dAyRqKheQE79cCdvW6UqfhmowzJt9o7Zkv+kya
	qIVmDB6NQZUaJJ7IOzLIN82HotPcbZjqXHQ0NHkHSUCblpoZNvqN
X-Gm-Gg: ASbGnct0XjH2QI86vuMUFwCR+a58PPIZa0zFfyFS2OxJr4D/ypnpfqHDmx6unjfFkjS
	InO6u9GrKkIIUwl94ZTzWelXK1oLTAvwBnYJNJfvPwu3eHV+bshvftVYjuMWnyz0cyWYHuftGwe
	P/FPv04/Nkua918L639TpFb+ZH7xz/RaaxNKQiO6PX1jlSfZOqXFvKiyBI07qtz6w7KzCiAt+wS
	yGgHcxb2MlTOrdfHW8Pk4GIfa1rFS/CRWu/NOdrJkztBlCKECHletAQ7X9NKp6N4068W6gy9ZbT
	bCP7
X-Google-Smtp-Source: AGHT+IGGlOON38G2cwVHy7HWLqeoiprbbsYzb+R2lpZBxzMcoaBGttOdxBgPJKnbhKhubtPPASJM/w==
X-Received: by 2002:a05:600c:4ed4:b0:434:f586:7520 with SMTP id 5b1f17b1804b1-438913c5d53mr370329335e9.6.1737982005060;
        Mon, 27 Jan 2025 04:46:45 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c4212sm10639980f8f.87.2025.01.27.04.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:44 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:03 +0100
Subject: [PATCH RFC 08/14] ahci: qoriq: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-8-f8f50c821a2a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=BVe5T/T+KyUbuPkxpZh30Ji3hdJ098Bkd+OSL6K5mXQ=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4Ar/8OCYLq0jyRBQ+Yjy7zx+LAyAdn2J69PD
 7OGj9QKt02JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKwAKCRDnIYpo1BLC
 tVr7EACtsjKfesgoSAqC8UkGk7ueOpe82d7ckBOhdbGJnRi70fcUJQSY/kkf2Hl4t5wHe/cVsw/
 vS6zV6opL0l5hPIDzCGMq3iWUg/vFwAvE/v8B1UR/yGTY2Bw++rPjRHqaGM324LXK4iroJNLFED
 6uknhnXagzGruwoKVaNdHR2pDsajddGRtyos06fe2FDnaD9SEajOqAyL42qE+SiXTjK5zKoGXYC
 +BDknQG7waEhlDM1cQbUOIS+C1hfS3mD6tfgYBVfg3GZ7sWUxMX36hAKZr8bpChDQf/OPg/oziK
 GvkrPLOT9nGptYxN1bVPuy+RkXFAIEKb6MAC69msd6BhCy8SWKuLiYs8o1VLqYMXVOtsR4hOHY1
 Ijzl8dBxc7zrV6+WoWyRYJX16A59r2Tvn+jxdIh+/ZKtPJ1MIY9o51uahQXNsF2j1aZT4hQzXzj
 0p2crfx2gWw2Bpv+qSu9O6aEqupWvQPhwYT4sgNwrAfrAXo67VlhsIH4JJnSZ8LBUjEyJmqfcSN
 dPV+nN0tafh4c9lsamiWYfZcYj8FwEDttEUyJ0FLlVUwQ7RQcCe+ucPKcOWlT/aB/GcMUDHHo/x
 hTUM5LB+5EnSwNbvi4q3t0QvP77e4p8gjbIlgmjgEvpgcu7yOkvMWVxVeFrfSuVUmnQa+cvQ/Od
 MEUGJsxlPSjYVCg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_qoriq.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/ata/ahci_qoriq.c b/drivers/ata/ahci_qoriq.c
index 30e39885b64edf9cbb1eeca853659582f5296361..5f64bb8cd2e9c8d34403f76e5789fa435dce94ca 100644
--- a/drivers/ata/ahci_qoriq.c
+++ b/drivers/ata/ahci_qoriq.c
@@ -319,7 +319,6 @@ static int ahci_qoriq_probe(struct platform_device *pdev)
 	return rc;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int ahci_qoriq_resume(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
@@ -350,10 +349,10 @@ static int ahci_qoriq_resume(struct device *dev)
 
 	return rc;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(ahci_qoriq_pm_ops, ahci_platform_suspend,
-			 ahci_qoriq_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_qoriq_pm_ops,
+				ahci_platform_suspend,
+				ahci_qoriq_resume);
 
 static struct platform_driver ahci_qoriq_driver = {
 	.probe = ahci_qoriq_probe,
@@ -362,7 +361,7 @@ static struct platform_driver ahci_qoriq_driver = {
 		.name = DRV_NAME,
 		.of_match_table = ahci_qoriq_of_match,
 		.acpi_match_table = ahci_qoriq_acpi_match,
-		.pm = &ahci_qoriq_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_qoriq_pm_ops),
 	},
 };
 module_platform_driver(ahci_qoriq_driver);

-- 
2.48.0


