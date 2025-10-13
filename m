Return-Path: <linux-renesas-soc+bounces-22936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A0EBD3729
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 57F5A4F31E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 14:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C604273D6B;
	Mon, 13 Oct 2025 14:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fdZB/LPY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC4827814A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364922; cv=none; b=Jz+vbSmMzovlepQ6QjZQZTUg3PCD4KWdCTzE6O/LmETtU1e4BkshGWVjebDfSQSHysnifeDCYtsrJwsKClmYgzlsohangeQZhyMVNoSNfj3zGGdhzId2ChyRPrwZ4IhrY7GOorlAPpZjzO6uaRL7pFc7/kxrwCn5Hn8xq2KafQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364922; c=relaxed/simple;
	bh=ERfT447rtvaR+wf88k95vj4wStZVfwDMtZt0ytTxV+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D/fY2pqK1NeNUmj0dv5x0E/xrys/WFko0lxkwdXOC5kJL7QRlnxhdP9EyZ519wwMXSmT0LenFUqpzOV3MFJMwnEgiz0VfKxvdVF6u9SOfCxRPauxrBcAdIxfhwj+YuTdDU+1GQNgSMonFdhSh+A07qWJTYZza2jK67ysrZug6rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fdZB/LPY; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-586883eb9fbso5711760e87.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364905; x=1760969705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPyzKdSQgEFTOs6vrnV72MjIpSFJDGoFOT83Au3htUM=;
        b=fdZB/LPYDTqAgmoK9RgXWW2qARG7f7n6iOtTFu9JTzlANYl6jP6FkFxkAu9ft2LXvo
         qrtXpiWpao5RWeQ4k1uN+T/HOEdl4PYR06nZRvwkzhuOXNNQmOBSapqlKcNFg+3ggEn3
         ga7E9bDQ+2cwdMofj6s9cOWOxgE18lHLjpyxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364905; x=1760969705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPyzKdSQgEFTOs6vrnV72MjIpSFJDGoFOT83Au3htUM=;
        b=E5qC7t8ll38E/+aZxaJamgfi8e1em9FEM7B1JG7yamBErD8Uz4k9V2WMopaM9Vcz8v
         KSLgB8vRKM+sLgraSCzV231LfRMB/9+p63kNolMXtnvqeKmceNwdt6OulzMx7FM7q7Ow
         lJysddrTNbC5gxasQ53OpARgRdVUDrx7bvv8TXyOj+oaH+j+ZQOgi8GTahQYkb3mfLRE
         k1LCUKetP1+x4hBzAq7HIfpQ7eT/1awVcmJZZAAHIal/t+YyJbc+mrabF6fLG3MSSolD
         iKrtf0+/dOdMau/OAybN3XqDE6fLM2p6iaSYqju5x9Ehl/UmnAAD+gK+/bCmLkyvuD3C
         l2WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt8tUADShIbKn3IuTxa1S/QJKnpIsQvtzWLzyDrlo1K3DjQ8Iu7FJQ2Ot3/ZCoFvoIdD4DWHQF2ASZ9wRWQsgHew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa3IBkb++gFbVCejmQHtwYXYRmoiu6IXGmkKfP/dxe7qJme+80
	j3Gn7tIy7HuTOz0Q+f9EJB9LnwQWiIGcLhU/5uSY+zt0qx9nIF0hBvGBdDn4P7lvbw==
X-Gm-Gg: ASbGnctJRW94iEWjNziuzFFvHa20xlhlaif80PhRBVZxzIAZvgRuDHPn3tr7jw/88ey
	skP8o0rQLgtbCRD1tZWlMfTn3DNSpQm/l4KpmbFXLKTZq6XrCHCzwvv29U8TtgOnNmVq9bKW30q
	Glr+mdOT5RJibCbkyI6+Ga8vmRhFR4rBf7p/JRz/iSPkdpkvSVHp6rxbQ5TuCe9n0sasmQ/rWDb
	wIxJ2YVpXg6R14cxzv7PruOVFKS7/4q3b/uhUa9Lo0etGt147Bm/KeBaeaJ99IFLt6kBODkU8Ub
	QkrcHo8yr4Kk3UvCC0p+UPmTodfnbeUaRpH9HQx3tfA40xOd3j0fW6RhaxcMKahWNc1C7aJkjld
	v1cKm7jVcdJIGkGRIOZ2PNhitnMbT0OqF/zFc5PP1aF7s1SPqEPznR5JiMkgtTSdey2+yPZUEok
	zFecUTbLuy3Hc9uYsRP9htRwecJR0+
X-Google-Smtp-Source: AGHT+IHCybNyNMb0drsyz0aREmcwI4Uni6luvsP458rJiLZIzoW/QcUDGoAA5wmoQMp1unUYu7EgCQ==
X-Received: by 2002:a05:6512:2c06:b0:58a:92cc:581d with SMTP id 2adb3069b0e04-5906dafd171mr5060480e87.50.1760364904884;
        Mon, 13 Oct 2025 07:15:04 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:06 +0000
Subject: [PATCH 26/32] media: platform: rzg2l-cru: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-26-2c5efbd82952@chromium.org>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
In-Reply-To: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Leon Luo <leonl@leopardimaging.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The %pe format specifier is designed to print error pointers. It prints
a symbolic error name (eg. -EINVAL) and it makes the code simpler by
omitting PTR_ERR().

This patch fixes this cocci report:
./platform/renesas/rzg2l-cru/rzg2l-csi2.c:307:30-37: WARNING: Consider using %pe to print PTR_ERR()
./platform/renesas/rzg2l-cru/rzg2l-csi2.c:726:30-37: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 1520211e74185fea3bca85f36239254f6b4651db..0fbdae280fdc49f963269a4bdaea38ff2e51884e 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -303,8 +303,8 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
 
 	remote_pad = media_pad_remote_pad_unique(&csi2->pads[RZG2L_CSI2_SINK]);
 	if (IS_ERR(remote_pad)) {
-		dev_err(csi2->dev, "can't get source pad of %s (%ld)\n",
-			csi2->remote_source->name, PTR_ERR(remote_pad));
+		dev_err(csi2->dev, "can't get source pad of %s (%pe)\n",
+			csi2->remote_source->name, remote_pad);
 		return PTR_ERR(remote_pad);
 	}
 
@@ -722,8 +722,8 @@ static int rzg2l_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	remote_pad = media_pad_remote_pad_unique(&csi2->pads[RZG2L_CSI2_SINK]);
 	if (IS_ERR(remote_pad)) {
-		dev_err(csi2->dev, "can't get source pad of %s (%ld)\n",
-			csi2->remote_source->name, PTR_ERR(remote_pad));
+		dev_err(csi2->dev, "can't get source pad of %s (%pe)\n",
+			csi2->remote_source->name, remote_pad);
 		return PTR_ERR(remote_pad);
 	}
 	return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc,

-- 
2.51.0.760.g7b8bcc2412-goog


