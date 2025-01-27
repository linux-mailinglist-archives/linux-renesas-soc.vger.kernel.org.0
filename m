Return-Path: <linux-renesas-soc+bounces-12575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3A7A1D607
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 13:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACAE13A569E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 12:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC1F1FF60B;
	Mon, 27 Jan 2025 12:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUSlVUrp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC0E1FF1AA;
	Mon, 27 Jan 2025 12:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982003; cv=none; b=AuZLfXO6X9sWnvN2LrA1kSevLxrVJFL1NXLHlGtT4xuDQ+KNCRFyqIG45wJzZRa149sfvW61yBQ1lC7xhZ5ngciZrazhTgl73qgux89SgfcsWt5X4rTPzgTHelGsyFPNeIsP1Q1V+k6k7R6VcFcuCK2CuCapWp+9XDXnY4pFY50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982003; c=relaxed/simple;
	bh=LQrJh1cj1U0MJFZHGoCZeLdGKBz6XSkjoRXJQp9xyoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PV56FOBXw+R1PJIKceonxRzUUHzuilrCnJgv4PwQDdbfS1dC4gFLWMYukm2C6owiSYAVA3iNH3vdzGhSTtafSrCkuzrqyZIJZvAYwRg9yIvU+0Ky/+CY5isaIv5X/6YiVpwo5guDJCZjW49xMZphx5aMmh6dudiOTWYBVaDBxqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUSlVUrp; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43635796b48so27913455e9.0;
        Mon, 27 Jan 2025 04:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982000; x=1738586800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=neEI1yakl6Xdd18M2E+K/Ks+Ljapr5chXpNCjeaLAxQ=;
        b=TUSlVUrpELIXQRpxV3FP+6Z/+Wsc4qaHtbNGAnUcqLb7xsMEAN7liCfjFClMgrhn7V
         FEW+sZBa4psVisB9QxD+i74KnU/CUJ2ysnzbF23EFJ4VOx6KQsONtUarVfJb/ubnCRWM
         jY7gduU3xXcqPe4nbZFpPA8ib7Icu/Ex7gj6kiy8lwdD5gB7S7bAbH6mdqQBxQLE91Ns
         wyrpqVoB7ptgRb4exJ2dAe6J79od5ORI1a4BLHXS5smpsADuqj9sgfGacjPXxGPgj6hv
         PAdwqE+JOv1fXn59IdWLt7dNbWYwd+iz7rrtU+qBOurNYgDzrlHnf/2/hrFEfa6+O+jE
         ns2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982000; x=1738586800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=neEI1yakl6Xdd18M2E+K/Ks+Ljapr5chXpNCjeaLAxQ=;
        b=TSm1OsrHrxZj4lscJ63ABI/K7hz58p6VgxqE6u1kduPfNHo4VJdUvDfBbEtcxPAt+3
         08CBbwklyUsNxWnv4Ev47h9OwfQ1XRuy4Lox/+YtQ32P3O+k9weKcBao9IBu7iasYOE1
         7PihnTKDG/23I92QNlj/6mPyKVFTggxQYH93iwKZUIVDQCNxvLWlN+UF7rk5kAl/uCaT
         dmEn9QZCu8/uEl+geikvqVfbieb/KLeVSF28yMeKiNoH7qlHcmJlTLGKuc2LOnrGCFQ/
         VIhMGiWLgOF+KQJhoC+0dYf1V1B/88Pnh4LPQ9XppbenyA67VHefchwloF8ovRPcLT6c
         PyXA==
X-Forwarded-Encrypted: i=1; AJvYcCVtKDx9wI4mDzdZmY2+NP4sxLQFRqplEqmGBDbinsbYKaKXeKQzEke5P785XPq93GN103hyPWlCnyr4gkiV9QM+Bpw=@vger.kernel.org, AJvYcCXCzZ+Oh5p63/RL+g/hhQNcw3rZINUeBFqxvS6v2RSsaBToufSNUGdOaGSTiAl1ac7wUSmqRO/wNIZZVtY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQFLhSylMs2y0XnjvOkTeGniuR+txt1exq6Hl47n5zVOc39u07
	R23QL0/sW5IidJpni05WmTGxchK/7pUndRQcvc7eUTeG1ElUgs+D
X-Gm-Gg: ASbGncvoS3TGl3CCEMlaPHgGDaFHWyFS7BS/59ez9pahyVdKvTrZKvREV+eZuwQqD0X
	5DdgRCHxNPOSoeyzujC4q5kfCRLU3uEO07oNLR2h+olT5J01nHge9w0KsOYuaxOcFWAg7JFcJBp
	0FfK38BtVBUkimmjSlfiqijr0EpkCfzECHVkHriwS2WfFnjpzl/L6foN7h6POTKdxBHoc5K4kzN
	qW9RIgNWYoi58dzUmwYL85IFmMC8yXhFWDN4EyQiRHRzl6eMOxNV2GgHx+8laNehwHTAEiI7qHa
	x7Xd
X-Google-Smtp-Source: AGHT+IE4B3ZWBvjonvFeGkuLk5blZCAjtvZWvPZJwKJKIySnT1AS6AlcYkd8YzGAqRr1xASJxsefPQ==
X-Received: by 2002:a05:600c:1c14:b0:434:fddf:5c06 with SMTP id 5b1f17b1804b1-438b8841d5amr149069615e9.1.1737981999987;
        Mon, 27 Jan 2025 04:46:39 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd501c38sm128625445e9.11.2025.01.27.04.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:39 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:45:57 +0100
Subject: [PATCH RFC 02/14] ahci: ceva: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-2-f8f50c821a2a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1737; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=LQrJh1cj1U0MJFZHGoCZeLdGKBz6XSkjoRXJQp9xyoI=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4ArRFwGWZoghduZ5MsMtU5JP/K/knP54RrlJ
 u3CYrMYTkSJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKwAKCRDnIYpo1BLC
 tY/5D/4h8WBFOd6bLxfcgBA6HQZSQVHtRe/MmxwQhqArKIu3NAzo6IvI5unGAIVRFfP8J/6taIZ
 coTadHR6BS25WGCU/geH+pL7tlRftPl7w2KPA53Ty2vLyAcXhjTak2OjFJbepzYKyLGfcFm8Enk
 mvYUOXom9+osUVVZGr2Umi9NzesNQHW4+NmAk0BxAXY/v8/ABC1Pkv8T6gcvM2vbB5Tt4CqugXU
 LnC6yqpRf4bZH34M69d+iT+0cZayAlqbS5E8AMrICLI3tvOT69hALbx8n2VSfVFcho3CbJsZ2/m
 WFrLEpDUSjJMZ+PUCkuo2m6pUQHo/2qFKhd2RD6Jp2g6QGthqal4+J5pkGeN8ctZMPEydKW5Vj2
 qhHjVovjhbYqaJUQZRw1hDF3lWToR4EFOQfsYk1CizgHiUnYxjOscVH59b7EpvgbRh0oihBWtN4
 deMGS+5dEVI3fcGE15tDralQuwpz9z4nE57mq7OCGIPgMyTEh6rf5PCRQuF5tnM0P5k1oyeovBO
 hLm7yrCPsLqTSZej/Ngu6KMJBv/kP9z8TFv0kDKTp4Y4kqzsUNb5kK/qxEliK3qAEW5AaS3Q5jh
 7JaDUx+YgJ2Veym0I/RZ9xlsUejgS8M/P3b8++OXTFiu6Ou1Gh/QDgZusSKawfMHCMOReT43FBy
 Rz4SB+DJyzfb7og==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_ceva.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/ahci_ceva.c b/drivers/ata/ahci_ceva.c
index 2d6a08c23d6ad5d1d11a7de7fbe2968201d6095a..76e55f1f7db1f8349d696e92d8964af609532186 100644
--- a/drivers/ata/ahci_ceva.c
+++ b/drivers/ata/ahci_ceva.c
@@ -363,12 +363,12 @@ static int ceva_ahci_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int __maybe_unused ceva_ahci_suspend(struct device *dev)
+static int ceva_ahci_suspend(struct device *dev)
 {
 	return ahci_platform_suspend(dev);
 }
 
-static int __maybe_unused ceva_ahci_resume(struct device *dev)
+static int ceva_ahci_resume(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
 	struct ahci_host_priv *hpriv = host->private_data;
@@ -398,7 +398,7 @@ static int __maybe_unused ceva_ahci_resume(struct device *dev)
 	return rc;
 }
 
-static SIMPLE_DEV_PM_OPS(ahci_ceva_pm_ops, ceva_ahci_suspend, ceva_ahci_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_ceva_pm_ops, ceva_ahci_suspend, ceva_ahci_resume);
 
 static const struct of_device_id ceva_ahci_of_match[] = {
 	{ .compatible = "ceva,ahci-1v84" },
@@ -412,7 +412,7 @@ static struct platform_driver ceva_ahci_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = ceva_ahci_of_match,
-		.pm = &ahci_ceva_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_ceva_pm_ops),
 	},
 };
 module_platform_driver(ceva_ahci_driver);

-- 
2.48.0


