Return-Path: <linux-renesas-soc+bounces-22921-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4ABBD3668
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:16:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A1E404F2FC0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 14:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29CE3093AC;
	Mon, 13 Oct 2025 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NnY5/nQK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3D2306B17
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364904; cv=none; b=muiZspugSC+GXBOUu+Yi65IcaY6dbdGrTwG+OCw1TJghK1sNKaG1SGBestrIQ9uzNFm4wHWtj2FnQUCxdNzCsjwJ5THe2reVfWRxFFC0BOkweyx9QOzcmreNJgGw+PR5c/epCCo07sL2IK+J4jZKKoI55TC43+tyM17UoDG0Is8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364904; c=relaxed/simple;
	bh=WDrjkEkP4ilF+TE+CToBnzSz7Z1VpjDMiO15zLgsPrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t60CIgElztw00qHdxXcdT3XqOHzk8ueDW2R+dDmHdcVyLzZ0j4GPJEBA1UmyA6LjVUCcPqRTZWn1k4errvmvgrct318udAJBIDZHQl6Hmbw4/pp6w5PI6bLOR1bVglTy0ZuMH3wC1uDJHujDbFMPucigsYz2cmjpXk6ZqqGvwW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NnY5/nQK; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-586883eb9fbso5711503e87.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364896; x=1760969696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxwItL4tz8pq3Mzmh9A8flAtdwuQ+oH3jrE+Iyzt0C8=;
        b=NnY5/nQK0GQNwo7L3DyKxl5JWRuCtJLmvEwsUp7+d3aHV4XCEECynsTZr/b/GROeEO
         hnbIsFSp/iULr0uwBHswBG8Nm5vDRCmBPbQlDn1mrzCDBjOJvwKGyKaGaGsyZ6Oeqvn9
         j511y1phO7mAR9hy7YJdoMv0+DpC9c8qD4FCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364896; x=1760969696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxwItL4tz8pq3Mzmh9A8flAtdwuQ+oH3jrE+Iyzt0C8=;
        b=KBD91OwYwtm17PzGMhgbWBoWM2VP++mvCxRr/jmXEMR0ZzmfyIa2zuMppuRxgjoljH
         HKsVF3UcJQXYfZB3mYLQCvSWAHhaGlao1yUyUy9pCsQ9kcOxR+c7z8PhzbmVAv/6zMNY
         ZiJm6EWgiZvD2vzbYzKjgOBIG5b/EKQaqaHu2aNkrxauif8V3ikoeyOPEDnvZVDKxCVf
         O8v/vQcB9xOWXHyXfpq0d5bUsC3LvZF7ozDWvPxq+cOLRoAPvZwrZ4tCylXFVJZigmYP
         Rir7mGjQN765/bbsLsGYapQ8xPiDgx/tbhUFOhFoH2tvLt5m41q6uncPib07FIm03J44
         waRg==
X-Forwarded-Encrypted: i=1; AJvYcCVeeHoTbDWqSPExBCpyg44Ynr9iqdevdTVyxUz/FlkN/7YFv1CYIocwguZ95y/WtjBpuJiOIyBvgxjJoZ/dbJ9oXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc4YGwrf77cYmJyH6kcfYKrfUaIUPQ6qpy86iYk7eazZqoS87a
	EsoOxibaU3zEOdwZtnhUZObtcSzIFyF+9J9i+fRIUc/GzowVYc88nbyOL6JbMym1BQ==
X-Gm-Gg: ASbGncvbz+BaQzgji+NAQgfxbTtAOyCSkhJ8bmGd5t4grJuWBdmfoXDl3fs7Cau+2zw
	nHJBT/Gemdqw2cMwSy1nyrfueUOdZjJ27QJtoK7Zm54NixfVEeDQNiuNGl4iDEIsSdFcxbyAAAb
	XG/xLpp9J/7qv4pR0Myejv0+Ef8TQz6bXTfSpmhMb+jvQ2UeKJIqUSM3JYG6h441WkpdJMi338I
	kY/qITnp69/8j5mMO0wq7cOxBh6XSf1ytPLckC/DRzzlq6UmvpkeivW8Rd/amjRppjv7i7/7li9
	AKc6YNgzCQ/OqmtThPDsK+Sj1OAui//Fxf3W14Gr1LLRKWc3hN9sqc6Kjlcjp3xISmwal5Iqwjk
	o/zlVKe6BNgFZ/uf9KAHCkwJzfQtBKjwkHoNStgDJr2gQ8HTPxtd3IRjo6D+b586w0PI0GuhpLN
	Y1Exby/INX8AvDYi32rw==
X-Google-Smtp-Source: AGHT+IHRStcb5/UNrBSpVyOQrSmM6wvY4Sq5I8E4EibgafKAtbziLGF8qFxpeqrq8sYvK0QOKhdKZw==
X-Received: by 2002:a05:6512:308d:b0:579:ec3a:ada2 with SMTP id 2adb3069b0e04-5906d7738b2mr6908772e87.4.1760364895693;
        Mon, 13 Oct 2025 07:14:55 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:50 +0000
Subject: [PATCH 10/32] media: i2c: imx335: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-10-2c5efbd82952@chromium.org>
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
./i2c/imx335.c:1013:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/imx335.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index c043df2f15fb25b3a56422092f99a1fd9a508fa9..71ed9a0d84a252ee362621c4d38001508fb86d28 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -1009,8 +1009,8 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
 	imx335->reset_gpio = devm_gpiod_get_optional(imx335->dev, "reset",
 						     GPIOD_OUT_HIGH);
 	if (IS_ERR(imx335->reset_gpio)) {
-		dev_err(imx335->dev, "failed to get reset gpio %ld\n",
-			PTR_ERR(imx335->reset_gpio));
+		dev_err(imx335->dev, "failed to get reset gpio %pe\n",
+			imx335->reset_gpio);
 		return PTR_ERR(imx335->reset_gpio);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog


