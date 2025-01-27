Return-Path: <linux-renesas-soc+bounces-12586-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD80A1D629
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 13:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E81F118841D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 12:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2E01FF609;
	Mon, 27 Jan 2025 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Goef9FWy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B779E20125C;
	Mon, 27 Jan 2025 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982013; cv=none; b=iG5RId1qzqXzrcTHFFYNlbAgYTRtwOZ9DXl32WMnmJTrX00kSsAYt5EWK0pps/2l2RTZ9b2mLKY8tZ7i5eCoqt7A6xZyKlEntxnyNbVEib/JqPqhW0PvpnOiVSkBCNllvE6AGRtpDiMuFtm+o9+Mw7bzz1/6STm5kHdA2OS85yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982013; c=relaxed/simple;
	bh=1sjh2+ve+pLpl+qs4JFyeDCujvbM9xUUKhOAy+ucg7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jcGP9F+7Cm7HGH6iIT7yiSiFpuqjmSsZj8W2WFJMSk4XjnUzWekULd/8StcLnEYXUSNFFkuwttKJhCF8iGeBi7HIzjCf18VgUqbQhrb9zz8xvDDbi4mUw1HhbJEMiIRtXaW6Jp9i3ik6rEXz2IKMRDRcSSGOdSaX5I7ldSWhibM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Goef9FWy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso27756605e9.1;
        Mon, 27 Jan 2025 04:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982010; x=1738586810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VcoOAINXi+2TT4WH3C7O8RVypx2rPa3EoGFaB3IYNWM=;
        b=Goef9FWySChN6AeujbQ/sG2PFYn7zQs21nGNKKb6yx5VRl+1GRhHuaJiVuVvT5hBGD
         Fe/eSF80+9Vzz5J7kZ4HXpFEkA1CnUBFKa3z8rhYVlzitHGhXOVa6h5WQCHoGMgY5vpY
         L0kKg5V1zMLB9i1NVxRK3sqJRT9Me/v/Zp16NNZ3Hzmdz7RLcFlILkTZoQ83ZboidCbO
         MbZGSUV5cf7KgGIxG2P2NufHDcWOckcA0s+V2QPjTSB3DVMIiX8QJGsWjsQInvaoVcWo
         4RUwsdNg/F8CM1BqaDTFR0Mht7zAQAyuwiRF2C3vTVf0BKtTf0J2A/r/XpdRuHmh9zBs
         97OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982010; x=1738586810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcoOAINXi+2TT4WH3C7O8RVypx2rPa3EoGFaB3IYNWM=;
        b=Gu2/aVJ9Z7T81Y0j15e1LsQa2vNViiQH+IfRufaRWWmlTOy9IgoUtXY9pJB7qaBdj1
         KCU5EHtNelFs68u/q3vYS6s7GsTyVqB/y47oWXmSKhoor07KBCzYDJ/TdIoRvFfIlX8s
         DzOXvhZW2AwofRM3v5caWVBeV+SXneHFQUKotjrUi2YFYN2vnFLEu240DPAS+I21sQEW
         bRieQXlR5dGwXY6USUgLWD4dECVs8vg0X01+FlLIDW1HZJJzy6eqX5gsb3PRv7RrFoFS
         +CjAezcsyZPJKSXAq6FLeuWDq8OzemFu5Hb3YdsSMDva00+/Q31/3G6lDqblAHKB74yx
         tnhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbZGONNKYsshphcwZKTjyL32J/BX91sKWGQdshk9OYh8oWYZSpnEGGUAAH2hccsHMAvvAXxXNwhI/7uI6n5Ky5opI=@vger.kernel.org, AJvYcCViH4quWauXHLdD6SAWlVBqvn+GVYKNhRkUgAASjnhfpghCFg7Qj/V4EyFctgDFa8AuUvwKUDC2JU7uEqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL6dBqln6sszNfOchVwxe70i4e3L8dHJTSLM92X4mIna383FuH
	7le7gCIGdEMIVUrWqo4fI78hVo2zjVK9q1NEV77LcehX4pnpZ/XJ
X-Gm-Gg: ASbGnct506CYy/doo79RgnCLIucMPbYJdhV/TBfC21DxR9+t/F8gHEs/QVldYXtUQ7p
	/QFsK+mPo+DREwMmvBGmDIn5kyjenejmvrq3Wm5hZeqy3cg/b3EqSCTUt5/XWaOxu2bwJHP1t4J
	KoVZ1gAO8jCsyrqBSrbpGrZeDhTsmMT0q0QBp/fP/EN3kaQIdQ+SHYmuAK6Nad/suF76RD2mHGh
	95U/kWbp4Yw5LvNWqzcD+3F9iDZqrrGIw9r2muhsKUnvyWZy5KNP0gGDPUMUpwqLreVb27r3CYS
	1ILv
X-Google-Smtp-Source: AGHT+IGhmYg12Hp8C0sebLYNbpYEvgc+ZIGcISfxxuByIVWp5JGbDaNxubM4KFeyOPfLyoSuuyFpOg==
X-Received: by 2002:a05:600c:4fcf:b0:434:e892:1033 with SMTP id 5b1f17b1804b1-438bd052fedmr122721625e9.2.1737982009910;
        Mon, 27 Jan 2025 04:46:49 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c4199sm10751183f8f.89.2025.01.27.04.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:49 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:08 +0100
Subject: [PATCH RFC 13/14] ahci: sata_highbank: Switch from CONFIG_PM_SLEEP
 guards to pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-13-f8f50c821a2a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1472; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=1sjh2+ve+pLpl+qs4JFyeDCujvbM9xUUKhOAy+ucg7E=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4AsVMoZcFzlRd2JDEQ88PbQqwdNE+u1+HM/7
 InzrdmEGLCJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eALAAKCRDnIYpo1BLC
 tYfgD/9CwqCJAL0ulfW78Tlar3+UngP9sSkslf0UBkWDJnt4X7LIk87zcfAI5d3iefV2cAxTmK6
 ao6wf5Y/ide4fMP3fOjap2jpht64DGEZavpEL8GrI/Bo7gf2DlChRJcjBUsqxnebyIiPeS58kwA
 4Ydddyz1Zp+F6Bqr2PqKRcpDrdblMuBUrblp4S6RITvqSIv9IZSBj8yLj2z/WfMhBaIv4ISIXiK
 C+n0JjmBLFqa7Pk7CSLczgOHh1qLfy60JwWNpIIZFmBbZONE1M6m2UZVNss/7xARXhfAKEzrx6L
 DK8pVWyDBJVOyvBet3rdvhuYkOqcea3nzmwMoZ0lg4cb6fBT5cUpo1bcyt+E/zs09IfK+sNOoGa
 iDWuOLdAluiRBtMpbYuqK/ldHaIkS8ranmgpAtvOTHP95HRNUuaMJaNz2oHDqrNFJ8oVLbIC7UT
 CNgM6tRXgfLK9nXJ39KBzBHAXflILB/eoTLEgykEpIctgdzntr7A3xjhnHFlk93/KGogBdIzft4
 PgQjO5+3/+TzxWIlVGJv7uUky1Ai0/n6KWK33bcRt6qpdzx+EwZD4/lwARWR4W6PO6E0LvwEvBo
 gHHRkONnnXc77U0KFLN01MFF/quoo7+Cj09FU+f4Fh5Yxil+Jsh5XooE0uhQRLYhEWxBWKPATpI
 QwAKsZ+clVVBIXA==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/sata_highbank.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/ata/sata_highbank.c b/drivers/ata/sata_highbank.c
index c8c817c51230a74df721016eb80238c188d96d01..c387e50485b974fa2f2defc0bd1ea8cd43dc14bb 100644
--- a/drivers/ata/sata_highbank.c
+++ b/drivers/ata/sata_highbank.c
@@ -565,7 +565,6 @@ static int ahci_highbank_probe(struct platform_device *pdev)
 	return rc;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int ahci_highbank_suspend(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
@@ -609,17 +608,17 @@ static int ahci_highbank_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(ahci_highbank_pm_ops,
-		  ahci_highbank_suspend, ahci_highbank_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_highbank_pm_ops,
+				ahci_highbank_suspend,
+				ahci_highbank_resume);
 
 static struct platform_driver ahci_highbank_driver = {
 	.remove = ata_platform_remove_one,
 	.driver = {
 		.name = "highbank-ahci",
 		.of_match_table = ahci_of_match,
-		.pm = &ahci_highbank_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_highbank_pm_ops),
 	},
 	.probe = ahci_highbank_probe,
 };

-- 
2.48.0


