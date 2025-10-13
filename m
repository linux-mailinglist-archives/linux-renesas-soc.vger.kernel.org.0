Return-Path: <linux-renesas-soc+bounces-22939-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DDCBD3747
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 55D4D4F2BB6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 14:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2CB278158;
	Mon, 13 Oct 2025 14:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SFdqfhh3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D821C309EF1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364925; cv=none; b=Zd7+lIZEzEEtehjwQslSH2CswFIPEa2UJHdXQX4VJPZ11AIKC9dfGL4sVAaxvFvSypQe1Rymk/q+Ciq6ed2bnApBAgXK8kY/J4woaqPjEyZgjznmqERNmwhQ32ORdM4aYcx6O2FEatfNvwaec+jkcMSKXbJRGYF9KVX9DbCjGno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364925; c=relaxed/simple;
	bh=/OmRUoPBoEYkKTL+GrsA3lQ6tTfUILZu4X7YtVySLKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QDCNkvLZhyuZejXpIyrmpbSts4J/wLTQfWmcRgASRBZFWbTllbKEsz6F5THHwakP+XAvsn0vyi2UToTiOpOCqevPUY0Rvw5Sw42qQlkq+gA6Jp0yBqmuQGH8wm1vpPlZDJZNTZn63SMuO56Y/NpTolFrHqtSFtI4V2xWOs3zOi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SFdqfhh3; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57d8ff3944dso4608889e87.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364906; x=1760969706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VLNzWiaaayGbLPJ+CR/kQopGEdhcg7BnTJUn+bNJDA=;
        b=SFdqfhh3bczcf41j5XUUtuiDMCkMAMYAetRyTM+H84dwbdWGACADRM4A9KxOSvn06q
         3qhYDRbdXb/EtD9N8ilQPL9LPSwbTUFAj6Y2lkLNERqX4mhLjSb4kjxvC7wPgGJjZbK1
         em6Tndb17CQMg0HeViCsEF2XeNQZvWvKqbk90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364906; x=1760969706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VLNzWiaaayGbLPJ+CR/kQopGEdhcg7BnTJUn+bNJDA=;
        b=SFBQYc6X3fDX9wNFCL74YSX8xLokZsLnhCkCuO/DKZwL45k8+eYtnTQmrVHMek4sR5
         vjgOSXv7sLnZxtvHpP7L+86OdWnSt5yZ9rS8SnPEH697yOCptPNgBKB1LFmGFOi499I3
         kTQ+o3H9Py/shfP2DUIBZjzlk4JEmadzbpugTPpNLrJmbwW0QiiL6d2rWHdmMZJsDL2Z
         DWhVOT5gxBM0njLqxp3cDz3Kx4OZxCLRhinNOBiZjrUaDm29bqGonLBabJzwi4jcyKK+
         yAtlrwDyzRB2S9oSaTMN/mOpRHxfYAUBo51PutQh9AIavbOnBSkP4yRUebw/tyYq+E9s
         xqtw==
X-Forwarded-Encrypted: i=1; AJvYcCXVCorG6UTqe4M6adObME4tN2JmYX8FK9a42lWPZtrq37zV3qlDaabhtlzIRpRO/MNhe5uFwy7RmORSA7XF/Gjj3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoeffcQtimGe9x9HTBrzoL0hDfkpyvsrrVROEW2HK4DuaWK8Qh
	TV65+KLVZBXCk1+LP6jMc5s4xI8YKwQPRfefU7r5uyZgt/XQxv/aF/7JCMvYzWCxQg==
X-Gm-Gg: ASbGncsEiDdmwvhCUwYh5/KZAxxk7ZNPsK22r0X/iRRjtCdhmQtCDQlf8sG06OAZiCk
	flKkUpKBGISCYe/BBHPo4PNg9QkfEd3MoGOLJuZZ0KqqPOK0jT9d8njqpD11KFyI70rCnSBQY7S
	nfRIZXspL6hoC1zsz4H0BUEGcn6L7/dy4Z8bvWT50YMeP6yZT83QqUhDO8Aa7BjIMqCNQ8T4ttD
	/Yla0HDDSB8DxLzhd5VXO+UGi8HfgF/PcRkr/xJC2+h9nk0b9DDgBksE0Qy1zlHO6nsjarCclCC
	i97E4nplE7bhbKq+xBoMHllreYA0/nM2X/ZbGzbrUGgFvsLk6B1AHSDVr+704X9HyOce3SrUEf6
	j4aWTcYu7TRIeLYGOOgYtlW5zlnFB2/I/TGJseqCF25qN2ATWzapfrsphRckwMjRis8M4PPlqyv
	2j8Lnwa5H7M79eagadLA==
X-Google-Smtp-Source: AGHT+IHgQ/WMhPa6rwn8Aka868vYVRu77lc4adXi44XLWG27weltH/9eVYPP+kQHy8I85fd7fOXyWw==
X-Received: by 2002:a05:6512:3c87:b0:58b:23e:5ec with SMTP id 2adb3069b0e04-5906d8e5b43mr6011775e87.26.1760364906103;
        Mon, 13 Oct 2025 07:15:06 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:05 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:08 +0000
Subject: [PATCH 28/32] media: rkisp1: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-28-2c5efbd82952@chromium.org>
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
./platform/rockchip/rkisp1/rkisp1-isp.c:940:3-10: WARNING: Consider using %pe to print PTR_ERR()
./platform/rockchip/rkisp1/rkisp1-csi.c:372:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c | 4 ++--
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index 841e58c20f7fcb484643138627413425a049d1fa..ddc6182f3e4bdacdd1962c86f6259334b16aa505 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
@@ -368,8 +368,8 @@ static int rkisp1_csi_s_stream(struct v4l2_subdev *sd, int enable)
 
 	source_pad = media_entity_remote_source_pad_unique(&sd->entity);
 	if (IS_ERR(source_pad)) {
-		dev_dbg(rkisp1->dev, "Failed to get source for CSI: %ld\n",
-			PTR_ERR(source_pad));
+		dev_dbg(rkisp1->dev, "Failed to get source for CSI: %pe\n",
+			source_pad);
 		return -EPIPE;
 	}
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 8c29a1c9309a846152d212dcb50b7bf991d4f422..147d33eb6ee0d975b257c5df2997b811ba3a62e1 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -936,8 +936,8 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 	sink_pad = &isp->pads[RKISP1_ISP_PAD_SINK_VIDEO];
 	source_pad = media_pad_remote_pad_unique(sink_pad);
 	if (IS_ERR(source_pad)) {
-		dev_dbg(rkisp1->dev, "Failed to get source for ISP: %ld\n",
-			PTR_ERR(source_pad));
+		dev_dbg(rkisp1->dev, "Failed to get source for ISP: %pe\n",
+			source_pad);
 		return -EPIPE;
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog


