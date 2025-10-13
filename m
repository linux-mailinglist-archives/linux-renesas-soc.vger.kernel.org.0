Return-Path: <linux-renesas-soc+bounces-22914-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 97053BD35FC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:15:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A8CD64E76EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 14:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F6C2EB5D2;
	Mon, 13 Oct 2025 14:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NgAZ0gvM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39F9265CB2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364896; cv=none; b=pOg2klaDRLJRRnP2YLW03GPIi2NgRqlmvdUPwt15ih3O7uvCL73I6y5aPrTk2EaC52732AEKyjAx+f2M8OW4F1UMYXXiEEMO5pzwERWCnCIAZYzCzkDwjiHL6m8lC8qkJt3TLc2zrpSXw67VnV9AiY7XppF6PyLoAMk/WCtBfz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364896; c=relaxed/simple;
	bh=L4Qw/JWLTT0dmHppUcAHgP693zq94oqrBxXz4v7GMl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ARluemX5i+BLlrN9AJPS4Dh1mjwizvVP2dFqNw7v5ohjGkGiuFPSiOuMBqB/AAQ8EB5tXtfBmhMjMXmGXzXRIW1Zs7aPq63QweztUZvW/6hpejU/OSSGX54FeQfUx3Ye2qpoK5luDmVoDcmmVEIHVoIIu4iv/Px/eFsGCItTiIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NgAZ0gvM; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57da66e0dc9so4294420e87.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364891; x=1760969691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9K2/B5MPGejpyktnrayd2M4OnjFiC4FIJq+++ipUzUw=;
        b=NgAZ0gvMQr7mfoyTPzzReUMoF0Hpjr5XCfsqa+JU8aYmztaJMLVui81N9rOUW23l9d
         h6JpM/j3VkWEgHBHtLrDMbWDsu9g4FNTZIqymAwAKHsXWiDQidcZcK+6uJAuMdhL3Hxv
         LUxkyp+FPtZLXrLeSP4s8EVkp6W2QBqC4rwLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364891; x=1760969691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9K2/B5MPGejpyktnrayd2M4OnjFiC4FIJq+++ipUzUw=;
        b=tBfzkgUbR9BG3h6w5zxczqadOPYXSjVhjpNJvxBqrHx1FCMAv9A5Q7P/eAE7OLGe+M
         TA2OnXgRoB+NvVMJ8MjtuR3VufsGuVb/tmsNm7ak0S0GvDk9wVy5FHTYL7iUGcy5r4wX
         QHmT8uS6xI6WiZfV+vnehycn3mvICu0AwHVDqm+lEIibgKrr5h2mgYoYF/zNuUruhvfX
         LXXYNOgMjuGBBzcFrWqiruLL3e5QzPo9iRg73JZLxBM+E7zROoGvf5ZnM8c5+oxqrjms
         v/huRdbXguToLdP8w8vFMJyWKZTciG1k9BVmJX32XClL0FstjptWtt5DDlmYRTW7G5dP
         NgCw==
X-Forwarded-Encrypted: i=1; AJvYcCVPp2IokcmCndeyiVXxVewN10UzMR+RJklb00ikCEMPbDQ0j6Mod/bRh75nn8unQPwBaO7FGUQYDW20328Esr/yBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi3jjFzptKF2AT1iTc8aAN6ywfokChVRHP6qUO+31HpazD8mF+
	gZj0yz79OVVBx+N+4QvdXq+SjylfQTf+kN41xM2Btym38LkNVu818nMolglyfpjbaw==
X-Gm-Gg: ASbGncvFI/YBn60EqUClF7MIXoH4jr4DKCq67QcKTJfKBycU4otDVD4snNm0Ox6BCsJ
	/oS4FbV34oxgwp4Ew4v67sQz0eK1fn1SWljdQLP2FPY+EFJ6xDSI++OiNRqa53c2a4UTDBXZxDa
	EYKNOhcz4Ft8DynqKcjnUmOe2oFR2XfLrsiVAgkziWtxv/j2fOYK81hesPWA4LZvcMEdzz2BnjN
	kRrHvmxAyUu7WebmtQpbB+1CekaH8YUYoO3oSql3WWV3rEzS+05ezQg8VLCwgOrw3BRr2VSUsf+
	FEkYtkPO+ksq1y/8L4rXVf4VBZp3SJN8RUB23F3ksXY+ZyeOnil8dRvfTyiiKcyEZTclBFHP8Fi
	tLWipfo1H8itL5NgyAPUBGLzP8oBLlxDgfMSu6oCzbPLFCzewJJBqKswp/aH9+FhiW0KQ4GQnpK
	xjmUzx7ow80eeS9kCJPghz6NKTZQvN
X-Google-Smtp-Source: AGHT+IG5qmXDx4UbLHB42EHlB1t6C5RYlcWqyFNneQm/x2WKvXaXI+FP3no4d6C9H/LUJRdom0BMRw==
X-Received: by 2002:a05:6512:12c9:b0:57b:c798:9edf with SMTP id 2adb3069b0e04-5906dfa81aemr5323251e87.56.1760364891242;
        Mon, 13 Oct 2025 07:14:51 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:42 +0000
Subject: [PATCH 02/32] media: dvbdev: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-2-2c5efbd82952@chromium.org>
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
omitting PTR_ERR()

This patch fixes this cocci report:
./dvb-core/dvbdev.c:575:48-55: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-core/dvbdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 9df7c213716aec54bab7fde2c94ac030696fe25f..8b980d371a45e4fec5368a7e90d4c42518b72e72 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -571,8 +571,8 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 			       MKDEV(DVB_MAJOR, minor),
 			       dvbdev, "dvb%d.%s%d", adap->num, dnames[type], id);
 	if (IS_ERR(clsdev)) {
-		pr_err("%s: failed to create device dvb%d.%s%d (%ld)\n",
-		       __func__, adap->num, dnames[type], id, PTR_ERR(clsdev));
+		pr_err("%s: failed to create device dvb%d.%s%d (%pe)\n",
+		       __func__, adap->num, dnames[type], id, clsdev);
 		if (new_node) {
 			list_del(&new_node->list_head);
 			kfree(dvbdevfops);

-- 
2.51.0.760.g7b8bcc2412-goog


