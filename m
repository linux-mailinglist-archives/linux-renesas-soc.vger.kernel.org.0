Return-Path: <linux-renesas-soc+bounces-12585-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF750A1D625
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 13:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDBE718874C5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 12:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F6F202C22;
	Mon, 27 Jan 2025 12:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUV0P5y8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CF8201024;
	Mon, 27 Jan 2025 12:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982012; cv=none; b=VxL3BNfg3dqQu55XxkjbQli4nUQUFMW/SaSDuKU1I5LnEOm5wVT5kP992LFXoxNni7ZpbEp3rO5cZE0iqphCF19tKWpvfHlQGonXBeiy23EtwaHat1ZTbCnnqB5F3iQiG+YkRiZT8BYSAtDN2/LGLBqADFXArPZ6eF9FZ5awEko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982012; c=relaxed/simple;
	bh=RduU4fzm2S8yXhoNskJ0+TWDY47QJ0ZCJVc8mKi6Q6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s6NnS8dCO21qWcwuGsgaIRBNLWfkIPY+N9sU+gJidF6Lmbf4hrMG3Em59wYjkCQ4toO6JKAmCVePzahJ6AnVWxUzCmylX3CnFV7p8oK4iqsyBfQLW7SzTag/RTCPlCJjT2BUNsMC9jG3r672M4/lxeL03g6cPM1MtWfWPun0H14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUV0P5y8; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-386329da1d9so2220925f8f.1;
        Mon, 27 Jan 2025 04:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982008; x=1738586808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2I/g6DzNEY6MLWNE45x2+A3Pg81FAkaF8xBvQmIiUUk=;
        b=fUV0P5y8jHTVpkDGn132oYA1mQKC44Pi6S1aNxxdkXy37xa2bYbVHrGk37PRKUzx8f
         HtK6a4YBrsZpVsXOrUB7WPIZfIccSjNpPAWhM+0l5IbJkOUyWCp85tuPAFHGtU9w2nVS
         CcFoGOlP4pweJOn8Y0IYBTEnZQW3nlepKVyUgapN6gpA/0cdqnwS7Dx4Hi+eG+LZLiI0
         bwL8UiXnvPKOfhzCHhFPTwr3SGBxZJK5ypoMeSOQujiYxSNkF0TeKC9ApGYJJIgWwpc9
         S/oV7F5KJFQam+n7ZWf4bzqLdJvpOxO7lUE/Zv0XFDEZUYB5fwdznIAfizO4gy46lxhp
         pydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982008; x=1738586808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2I/g6DzNEY6MLWNE45x2+A3Pg81FAkaF8xBvQmIiUUk=;
        b=szbHWL6Lh7ppxD2xl+YZ21Uyofqd3PVGjVCoPDJdLGTrMfNy32lNvRHY+PRiOhnrsr
         zcxoXAPBeT0xS8Vpu1a3Y1S5X9F+wdsB6jvNyP+lyhUhM+vaCzKIowyvIDT67iBVy4Xh
         ukkr8/O+dgS1O+p8MRuZA2e+0KYzUy8QdrlGYL8y9/C7egN3wVBaRWSbDc1vQYfXFCF/
         HHa/0jTpk2LF5Bksch1ZaFZTRoaFfb2HP45jNDjUDnfGe3KkapOanGF8RFfypkn9X5jk
         QBgV6087raaa2aWdgKgzcx++7pNLc+22jDG9muB3YQpxPcArBNOeh8QDsFyWpYDx+FZH
         QeWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0BMpAF7e+v4u+FKs4tFROgdYjla5u3s+YIcgzsykIbU5ktiy7K8wAw7/BoydctblIN8SQyviv2qfKMOb6ICfShe0=@vger.kernel.org, AJvYcCWzGoiU0i7WAqOJQRPclHBrM5OSogK0BkXj5MeWkuucWdBRoSe4SBsZ2Xn9qDlbBSxnC8PXpPcwp2pt8ig=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3H9T//EqVPU7U6N0QpaD9s/FwpjqmQNzVg4NXpc5gZZ7AvTkE
	4hs7sYv+cIHVPHJK7vqzOd5eyDET/1SwpHsXaTADKwEZUjrtWGxY
X-Gm-Gg: ASbGncv8gAFWe37x5Q2VftImIWCQux+ZqUiedo0wQ4p8CGgoBOE0bubZYJ0aAxEKkfO
	Xrx/ZCJvLh1cq4xWrZ+ZqYVq9bxxJkYCFOXaLh1ItPY4vLmYRdRGnp/xjDKbAis3bk1pqGBjU1i
	n90xJqTJ1wZ54GZaKyNuj8vUWrN0H0QJhzcx7lyON2flRi2ZCCmHHEnp8YEHNPKr8NIAynwA2Cx
	fIjf2dTP5Z4CAQjckeR4nP8OTi3THaJwOV7yvVeGUbZEqmsGnx4eiRj03xZ5B0knOhjSujVZnoA
	N4k2
X-Google-Smtp-Source: AGHT+IHsX9fH6pHzf3bCE6qbXfxbIlFTpPyDWWHgJOqmqyR1gPb9ILP3sU12vqEYpKUdafd4H6jDhg==
X-Received: by 2002:a05:6000:2c2:b0:385:e8ff:b9c9 with SMTP id ffacd0b85a97d-38bf57a9599mr31959724f8f.42.1737982008403;
        Mon, 27 Jan 2025 04:46:48 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a176538sm10795823f8f.8.2025.01.27.04.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:48 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:07 +0100
Subject: [PATCH RFC 12/14] ahci: pata_imx: Switch from CONFIG_PM_SLEEP
 guards to pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-12-f8f50c821a2a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=RduU4fzm2S8yXhoNskJ0+TWDY47QJ0ZCJVc8mKi6Q6E=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4Asu66s73cxW3afxzdcBdIOeskJ4QvLePjmL
 oaiUlkSOWqJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eALAAKCRDnIYpo1BLC
 tS73EACMRajQZc8Z1sdLWV/SZIXg7nYvK964ydiGMezg7pqnDcMaSYXnamkue4xk8YysWf76r6q
 rAIFBZxGxVa72BcdpYNyoxdGNBJ5f1QW+OTmmg9LRSUVFNAeA13SfgT3pIw7CTNB1dnliTzbSR5
 GS4aD7UnS0Dh3GpOdzcGelDLJtR+sc/OXaK1viecqgLA7ZJ3++U/18rFhwQzukJSzGdjNkKaTse
 sxLzAtXw9ol/+193Zcxih/qbp72pO6avHOcSiZh4LQYHDSxTxQ1hdD91bLM3lx7CwuUU5SbCMqe
 EE4ztvnAjkzJrPcixcsE3l1WLe9bZ5xwYSGUj9Rdw46fwKSObdpfCMcZEoaL6lc4axzOoAxfDVU
 hCBda18r0bikrIbRH64hrz5s//Evqw1DgvyqglLbLNHTxkhXCd1ge+4KqHDqizV/kHtTQBzHdV9
 Qq01VP9o4MFgfHJZmAFp0wHEmo3MlL5C9u/irRELaCBV2FXJ3sa93XxO6SWDALiWzv0dbJ7sXgL
 P/oB4FwJKL+02n0knMyZWDG0Hb4bG+1N1i7GipLIzXLx4YaivcE4dX0nzXPZWx0PHQrTcPNIeaX
 r+U1dlYiTSU4v+XAjGJTkDKy9N8YZVv4PJkrbfgrLQzZ0Kmxjrqu7nMTaeAqdUYlqeK/8YjAelw
 FUg+FQ0FzBVVD6w==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/pata_imx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/pata_imx.c b/drivers/ata/pata_imx.c
index b37682b0578f48ea9d51a103d19e40fe91c4729f..533de2782c37fb21bba4e4b8361c48c0f2878175 100644
--- a/drivers/ata/pata_imx.c
+++ b/drivers/ata/pata_imx.c
@@ -201,7 +201,6 @@ static void pata_imx_remove(struct platform_device *pdev)
 	__raw_writel(0, priv->host_regs + PATA_IMX_ATA_INT_EN);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int pata_imx_suspend(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
@@ -234,9 +233,8 @@ static int pata_imx_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(pata_imx_pm_ops, pata_imx_suspend, pata_imx_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(pata_imx_pm_ops, pata_imx_suspend, pata_imx_resume);
 
 static const struct of_device_id imx_pata_dt_ids[] = {
 	{
@@ -253,7 +251,7 @@ static struct platform_driver pata_imx_driver = {
 	.driver = {
 		.name		= DRV_NAME,
 		.of_match_table	= imx_pata_dt_ids,
-		.pm		= &pata_imx_pm_ops,
+		.pm		= pm_sleep_ptr(&pata_imx_pm_ops),
 	},
 };
 

-- 
2.48.0


