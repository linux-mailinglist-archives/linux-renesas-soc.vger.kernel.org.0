Return-Path: <linux-renesas-soc+bounces-12576-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C639FA1D60C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 13:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A36F5166684
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 12:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A935B1FF7B3;
	Mon, 27 Jan 2025 12:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJooTlxn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09F21FF1DB;
	Mon, 27 Jan 2025 12:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982004; cv=none; b=n3Q8j16+QPUpXygaZjY3G2lX+iueBCL/cHPesoyIQ95zOb693HCNW8qdogjp796xG0RpgKflRcQH18SuZz6ku76hNbJqOWggBLyKm9fQS2QmrNPML1EKSGDdKXiZbD4A8rP5OMy1UCySjeMFX0JhL7/CAVuO3FsHJ4wwx3TehWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982004; c=relaxed/simple;
	bh=JYTAGA6KLOpq1lfyYvO54YfNSto58DDQ8IbvFm0AQbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TBZhb5z2ylbcAgJV4dwzw5ERVNdSCh8t/MWAY/2vjkjJV66NVm/BUh2WyLfXeiYAaChhYv5LpvYOOeoIHQuUDF7S5n8gG3SW7te4AfGT6UyXMN+uyWnMRKvTQe6WnMUImrqlk4JSr548zUQNsS8VINlP8NQ5dtaQDUXhvGYI7Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJooTlxn; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43621d27adeso28990895e9.2;
        Mon, 27 Jan 2025 04:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982001; x=1738586801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PqAXhIk6/9U92F97+2iMV3noNDyf/KAzFHUwKQrXPko=;
        b=AJooTlxnhUmHA8Ly3w0D/Kg9STmMJ0dEUYoCbwniG+xNPgROKdlnp1pcH2O1UJ+2qu
         MqnYnbdg5Nz7pgNMteLTqA3aFe3h0qeH08ZbNJlhmUASQV6ujr/Vwj8qRV0jI3uWgRQB
         QcWtZV+E75gWX5Qb2GFLl7JK1/e3IswDMp6Uh2+jr+UIO7LdlW3Vj22SBmImA+7B9DsS
         VVAcNk7itnGO94eZz0OxCOTcuGlNxl0++UelKaE9ebox47qtd4zabcJJde8B5/xIgMwY
         y1Uux++o9OCKRezeHd56OhgIv0VjbdSVge0k0HLR+utM86UxEPLk049hfq+UFQaszdaf
         R2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982001; x=1738586801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PqAXhIk6/9U92F97+2iMV3noNDyf/KAzFHUwKQrXPko=;
        b=I4yO8gmh81V+espIkeNytYeNZicXBJb8Ntqpp7WxRPC/vqVOhMneUOkMRnV/RW3e8M
         1FTyC40tpu+CX4xF/vdyFSQyHL2cUmB1EU3F4XoEGOhOnCMygKW9la8HLocC3RSZJTIB
         e316Zhsw5mS4xx7DFaZYMsrJW+5MSr7dprq2KTKOU9yR7tUw5Jqj0bKE4CRWNn5hfaTJ
         +Cre3nY+d7zCYaSOkZWLuBzE0vaJfjE5KBksRuDi40qVy5wdNTv52egy3DsGD1RIQ8JR
         lT8NJDzbJGSTemHbfAKxGmfWYqsta8ToCBf6HFRBZ+d9UTI+gxduQPZuwqpkQs2GBoLF
         F4OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQOw8AsUSM/Yx1jydxedFvCcaClgxRcPJCfpqCyqV566hh3RZcUrDMX6YbK8U1SF/rt528jKFTBHvUhIE=@vger.kernel.org, AJvYcCWd92Tl5+TMr9Hj9Cv/OgXhzlM0EOFCHawl8x7WPt7EqiQDjx8/OiDZx25vycFYr9awK0xIrd7T5NLGrSVlRdFnIc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEqed5z015qUZMH6f+TwQeFVxFz2FY/lpb5Zs3MykMDDQIjYVU
	Z8Smg9Cx/x8yekKRznzrmSOxVDh3BTw9eecvHK1QXw8kVv8zyQzm
X-Gm-Gg: ASbGncvMpGWrBMA31b/Dy22EBRkcDLwbcoxOiqBa7RAp4OZlG91KieRWUEPt4Plx/Nu
	aG23ySsOYGOpK3Bx1IMhjxDCTfsmEkulCHhuBEsfkCO/VcRwie3awfmyOlQfYdHpcmH4NVkfB/5
	PI4CC+t2fhyQl+4G4wPDJv5OcAXrT6/2hWFoO8WkNPmtP6SDohRYRTJvxXLH/7H4cgo+9WCyRuH
	xv+MfZtoyuxeSEFyi/ApMkGyQCis66f2SwTI/rAk4k2juIlQS8Hwax3RBEytlczMBqxAIU2dwjF
	YFkR
X-Google-Smtp-Source: AGHT+IHpARUyFT0W0Y2128Q/x2wbxMx49MWeGsOuOnwEQsnLMO4O10VSBaMiBE+MwkR8ginshDZ66Q==
X-Received: by 2002:a05:600c:5101:b0:434:f925:f5c9 with SMTP id 5b1f17b1804b1-438913c85e0mr362999315e9.6.1737982000814;
        Mon, 27 Jan 2025 04:46:40 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd48b11esm134149285e9.19.2025.01.27.04.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:40 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:45:58 +0100
Subject: [PATCH RFC 03/14] ahci: da850: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-3-f8f50c821a2a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=JYTAGA6KLOpq1lfyYvO54YfNSto58DDQ8IbvFm0AQbU=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4Ar7H3XRvBHkCDJtwncEn6hACRSaM/B9MM3j
 TUlZmcdsxuJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKwAKCRDnIYpo1BLC
 td/kD/9fRfNqFvH78A73Xd9ZGCO8XYqGGm4sadBSeVvFoAPKLlbostOLn0qrxKrBKAASdfHqsaj
 T/2jrg0tSmdNVfMU8W/4oUg5coJHOYRBw7F2NCVWhufeBLqKUxlOIn41IvdoXEMhVGczp7x66HA
 eVtALOskcYztnLiGnh3dG4UHpgI9zcbAuZZvVqr+NeCFLzMTrINpprX+Kwplsd5vfjrcLkEkCxK
 ZXedZ9qdyxy8+UWffwJRw5YJIIKc0sB+dv6k+vY7Man1vO/kjVwnqgaa1SyziRV4+TIkNO7oUuE
 7JZgVZR/5Ziu/eHN9Tuih4WuzF7wLEC+iPdGS8n/8LFu4ox5bCJFQb5iw0RzrZ+lbcp3HWBxddH
 5Tr1VGbsnJF2G82s1MqRFeVz3D3Bi3WUU/Ms0i8NcIkjH7LpkT1lHh1Ab6R4wDkWuG9/vI4D3Xj
 QC5Omh1e+vXMm1xxQxa6hak4AiSlSrswqIikBW2TebydWVHYF9i2ql4uqij/pkDMj0cKkacwNIR
 LYhGQXC9ScWUnTz34+qUc3wODdoz3WA246fpAvohnH9YEGmac6ra73KaPeidcuF9k3vZErcQIX8
 wN8mk7rbta1YD1fblRlqH0liNKjhbZcZZdQjjwbhmQ9jSgzP0S35D2ySR5Wa4+kTKrZ4c1JHODj
 zO3u5VfhG1/FLcA==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_da850.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/ahci_da850.c b/drivers/ata/ahci_da850.c
index ca0924dc5bd26ba424b26bd040bf83720c96b56f..698b0c30de0d65423f932ab3c3d95787b692cb37 100644
--- a/drivers/ata/ahci_da850.c
+++ b/drivers/ata/ahci_da850.c
@@ -227,8 +227,9 @@ static int ahci_da850_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static SIMPLE_DEV_PM_OPS(ahci_da850_pm_ops, ahci_platform_suspend,
-			 ahci_platform_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_da850_pm_ops,
+				ahci_platform_suspend,
+				ahci_platform_resume);
 
 static const struct of_device_id ahci_da850_of_match[] = {
 	{ .compatible = "ti,da850-ahci", },
@@ -242,7 +243,7 @@ static struct platform_driver ahci_da850_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = ahci_da850_of_match,
-		.pm = &ahci_da850_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_da850_pm_ops),
 	},
 };
 module_platform_driver(ahci_da850_driver);

-- 
2.48.0


