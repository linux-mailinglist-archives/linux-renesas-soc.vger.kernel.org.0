Return-Path: <linux-renesas-soc+bounces-12578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5631EA1D612
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 13:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A108C7A2B03
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 12:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB941FFC5E;
	Mon, 27 Jan 2025 12:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="je0cDuZZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9561FF7BB;
	Mon, 27 Jan 2025 12:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982006; cv=none; b=K92UzvPgz8NX8F832YLqUKo97N3G0UJRRptKBtUAxrQ0SrhxZkyN/LJNHxw/ZZeZHGbwH5iEoITbwj6AsIonR/MiZigerep4B2N7qJ/uWhqYChnJOPvPvWexLh3Lb8QPDCpnEvhTIPIq/jgB+H9j6l4BPTxAq57rZdiPEh/RcHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982006; c=relaxed/simple;
	bh=uk7o4XEuCDy+1MRV3EDgkqSFL3eYMvAL/KrkBwR1yb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AJjf3wUy2uqErGVWDyvvGOXpSY0N4jMwCiZ9tZvyloVXUdhhr3JoilgHeQPZPXMvC82Tu6awk5E/xis8HLHUMCCAc2sDcj6X/Pkf6MY7Os12+O5HgY1EYqIb8inf+VWe9vMc8IJ4KxwGHPt2wx1ADOCqno8psIe0SClln9/MF5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=je0cDuZZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43618283d48so30768195e9.1;
        Mon, 27 Jan 2025 04:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982003; x=1738586803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sjKGQCjlxoKyHC3MWupm0EMlVBTxZVB63YoUYqEoKt0=;
        b=je0cDuZZTjTm/KV3AH3zz8tJK8kHg4eVOZ5DtCio6kAR7O5WN2gDapUiCVtXEzO9Fp
         aBYHCpjUvNUoPjeBAF0h4Uc7OgZy6U3GKiC0ffrq2hyGpaWp9YiPGQ0twQlA388vWeX2
         C1TrxZTpgbr2hnnLz1wQLqcO4LbN/+EOKZe/TDTfEeTs6OUv3LEGAv1eBXXuA4rsdfJc
         K1LATBOpjzr1DHZy8KXvCLMwLMpvj3/xmEEkX2YRtTT0r8Arc84XDks6PpyUF1FC3UtO
         0JlidD99I1t0HeB28YuFkW+lKyduO44QoX9DTVN5NhToQaP6LIm3d6SX4NkwMttUQDOu
         YuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982003; x=1738586803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjKGQCjlxoKyHC3MWupm0EMlVBTxZVB63YoUYqEoKt0=;
        b=AA72RRiSsiBUCM9LECYJE6f6FDcQgaS0Ww+aRAfxm6htFQIugsWtFqGgUd7yM+pHNY
         FYfm1xgNC2yKTTrwq/gx5+xC2jHnLVFMCy+cR2lSxpNaFF9uNYeXJ/7x0b0XQoqYFEuz
         TM0n111pA44WRRuUnIHttVdXuxwltApf/CdYvxSn+6bekvjZj3kRhdZkN72BemTOpmaS
         XStIuXx0UYjCl+xGFylzD6fNvItn1G+nRvJsvi0x3jiqtTttLklUcfLE9bjFEPZ+lowp
         qyf9+uD4ccSEAjp5wVHoJSE3vqQbDnKUQ1d6R3zCEQUNQbCorDLR0GOGPozuR1P0+/j+
         zzSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzozax703xjsMo4eUKxbZrfpNc6QSh5Pq6CKtb0E/3EddhmyqCgl97wZiAPbqZwHGoAE8ns0uNvM55ZII=@vger.kernel.org, AJvYcCXmTImqt/CTjknLoQ6fU8BYb23YISMYYPDAstDZ472reyf2psH3I5febXfhx92MfBEyfPYm8GvOR9x5zSn7IXSMVTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YypW2OKWUqvfhOnLrLGbzx9bvHlC6CyvBs6PePhOR0K0YMAgiv4
	BOUud9xI1girVYX8AK6+qFaKoA816AX+K3RHp22OJspwUzjJVnKV
X-Gm-Gg: ASbGncuqN0BnoyqEj58jga8ZuRvFzGnMEZd2ZAVfUQVsLB0NPR5Lf7WE7SwzNeO1G8j
	VuuA5UncxDatBjv/hRRT8dmGfb6jM1lPYzUqL7gamT3L8nst38+bZlZYi7ZJJn+a14qfMrk3fw2
	45bGUiTsEbFWwNagZkMK19CFQbNBMT1HazWnQkfeVSNIFxGsEinTB3Yy3g3YjWnQYNl48FhG57r
	nMjfa6pjxv1JYQJ9V4GiWYWxNqePIoGckXPxISqA5xZdisYIVz0B6eZxg46qg5zA7jH94fIf3N/
	cEWu
X-Google-Smtp-Source: AGHT+IGprEO5pdaTEpJfI5A74FsQo9nZOJ84uFe/gZrOTEtv5xh0dMQj1A1tPsGDBpxW+UvsnKe8cQ==
X-Received: by 2002:a05:600c:1c84:b0:436:1b08:4c78 with SMTP id 5b1f17b1804b1-4389144fd70mr439685205e9.31.1737982003114;
        Mon, 27 Jan 2025 04:46:43 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f367sm130542655e9.7.2025.01.27.04.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:42 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:01 +0100
Subject: [PATCH RFC 06/14] ahci: mtk: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-6-f8f50c821a2a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=uk7o4XEuCDy+1MRV3EDgkqSFL3eYMvAL/KrkBwR1yb8=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4ArP/dXj2VF2FWcstEGtxvysjudHRVgQcMUd
 svatcZOwv+JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKwAKCRDnIYpo1BLC
 tZl1EACcS6SONQyqCW76vwJqLeVZij81JJC6Lc6vlKZCqpF4aZfAWFaEhJwoQq2lvvaUkhxVbdn
 tI7F6zVdj6qTx/f+C8UiuT/NXdG2SAOS+vNLfh0lESSQq5FpO6z7T9iuAZa0QYI6qvoX6E39MHT
 1hoEBquSExHROVnPh9jmPhMC9YCbZ3lLDh67T+Q+xxvLw7OSbRqZ1JYlxJHQhBXhj4YPle8ZhH7
 Hlzjaishlt+hW8zL1qz6E4ERE/kXUFe5NGXeMTbCHVPfQcM7EktMEsJdLikHP3JSWz23Apabe8+
 3/Toun6cZcuUJxBFaAUrKSqGJhN6ujljWR6PTCIJMdR3IQ55grzKXm8Ydvu5vb0ifeOc/sN5JRV
 LooLjdM9domNcQM2schcY9SveR8a+DUDNbgZQYDEiUtzm1y5ZZu5Yi78yfFFvnRFfio8LOkVkd3
 G1OfRNEeXzIKVj6dL95ruGiZ5C1xwqkSxgVlhFW3TxilnrbMb1M0jkO3sUpLa7WEWy4YDclUr93
 tRAJ/feyNqI/3Yg7YwiG/RTxiL1PM4dDzWa02BTU/BebkeK9ECvVK/a+W4Apgsb8UfKOTQU+5jj
 nuBWGDhFl5Rr0H1L/nXncvlVYG2RQZFmzn8IwfcHbBca4T36PelFvgNiALqkjPJi3s4PkzzqfOY
 +XkNBgmtI5tEOXQ==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_mtk.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/ahci_mtk.c b/drivers/ata/ahci_mtk.c
index 7295b9066ae213a72a8c180a66ecfac8c2f46ff9..4afcf5e90e3b660f17b2eb0b1e3df446bef470da 100644
--- a/drivers/ata/ahci_mtk.c
+++ b/drivers/ata/ahci_mtk.c
@@ -163,8 +163,9 @@ static int mtk_ahci_probe(struct platform_device *pdev)
 	return err;
 }
 
-static SIMPLE_DEV_PM_OPS(ahci_pm_ops, ahci_platform_suspend,
-			 ahci_platform_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_pm_ops,
+				ahci_platform_suspend,
+				ahci_platform_resume);
 
 static const struct of_device_id ahci_of_match[] = {
 	{ .compatible = "mediatek,mtk-ahci", },
@@ -178,7 +179,7 @@ static struct platform_driver mtk_ahci_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = ahci_of_match,
-		.pm = &ahci_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_pm_ops),
 	},
 };
 module_platform_driver(mtk_ahci_driver);

-- 
2.48.0


