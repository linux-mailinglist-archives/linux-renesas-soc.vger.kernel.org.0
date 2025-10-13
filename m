Return-Path: <linux-renesas-soc+bounces-22934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF2FBD3705
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A5C694F346F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 14:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCB030B51A;
	Mon, 13 Oct 2025 14:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V2fql6D5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9CC3093BF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364922; cv=none; b=GZMyHZrJDi8+mvEVeCvE/uR5GyBP0V9I7vTqo1eqqOa6VF5vj1yJzN1O/tPNsSgWRknj7g14rDmnSEGWWAmzlIRN1ss3v88lPJ2WQhfdSqvjpHAY2WTwV01F1XIi97cH/3zR2lOX3/Xkwu5onkay2QdSJbgFVxUU3JQUFMXomjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364922; c=relaxed/simple;
	bh=8RLalehrPbI0nVV069+gt8p26w3tCNH5+ujATmPll/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TOTMcy18btNeosJXvRRMroc7giVA7j7f92Uj5Sm4K9lxcbjOW/IvlCPcDe38qJj9WRlndSC7DY67gVExhAKFv0yczthXA7snlwrgrPC1y/hUYPsSYMCxyCwmB77jYMUUgFHYCmUhlpAaKb0l++5WLQZntSvZacRxOHAycwHd9ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V2fql6D5; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3737d09d123so32914741fa.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364901; x=1760969701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSJdC/O4+ZsAqBeRWK64BAxaBhpHQ02dQ2HoRNMjbAI=;
        b=V2fql6D5U2BZb/+KU6vl5cEnZ/gS1gTOUzW//ljbqC37R1VI1sE4eqTI9I8mJ2vM24
         vc2PvsrBEAV1In63fqLhTPoy5zQg1MUmUrjyzSKiPS1D4+l3cCk8weIFoGspp67CUkRG
         A2lpZVm+mcIOJasf9/3INfvQf/15M2nrhaHak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364901; x=1760969701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSJdC/O4+ZsAqBeRWK64BAxaBhpHQ02dQ2HoRNMjbAI=;
        b=Z4C39Ch/EBa5Ivr6Hg9n7REpzteTjC+vw0E+lykO3BWuffxK9G46OvhzZi2ODa7RuG
         Iz59OzgwtunUvIFogHeoQCFhd3LslagZiDtMJgHAae0/dyaW8fA2P2XEKxcvkL5HkTgg
         LtWIgdOxkXkkqoZwijpbxYtvU8raa2Px/7GoOOLO7gEIPEQOyRBjgrBSXW585OMABK1l
         KP4XYmrA6+YkttzKMl/uW5J+cc/OOizcomIzr7NHN1jNmEpm8pVAzcarb77qt+GueJpQ
         oVUVc49D5tT6bw+AlV/IjDJtqDQeI6vslP4qm6h92P8vwZmNQvb4zY1I4904r5NIYFOv
         jJgg==
X-Forwarded-Encrypted: i=1; AJvYcCUc8qzAzDq0bFH7LOIfkHZTQbVX6kbLIjAol20ZxIEVT28AqoKsxVQXJn+TC89JPJQpTWO2mLCVHQURp35DKpTV7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsHFXuIp26wThaxF9Uv6ubUkYfla1HsucgV0IkUhxwy6uUfSEn
	+2U9UNR1zGCM+hAN9txX1BWC4a/4cfiG4tkc0V+Xd6gudry27Q+342D0Z3Z+0JC2Fw==
X-Gm-Gg: ASbGncsn3DXX7gcg+Ncq1DABmNHqGhyC6JJK2wv8ZXtEKi1J99giNDOM9y5lVQMe+ko
	icReaLIXeZyVIkVKXeslfT7o3YRLm/bErt/FuliYTV+2Ac9CUpgNhmyTPU1pJfOJUbsy5cr+gW6
	suieKR0ZemnUwUNrxMXBqG16BpQwdTjEGb63ubr2YZGBxxbFWwhKmUYlX0k4TEHosT6vYOnjDlf
	E7NefvNMMghrRDsm8UE8lLgySgXHHq5Ml8l20Pv6DUpahbfwpLKoIbIcKlpoXZWwIP6ePendLVu
	f7U6R5EkiGggVjNePk+ZyiVg2Hl7E+lF3l2H6eTs/7s1aABr7cZJCrdrA8Xo8CuP0BziGAVjTAX
	Bmo7Wtce7IQUldq8XHZaRO+s2TDd7q5wNa3WVATMsp9XTf7FcIy4L1lSOcr8R5Pcc0v1uyE5b2R
	7nb3WONKF4w9OOd27aW02tQsH3CONxYOQsylTaA5g=
X-Google-Smtp-Source: AGHT+IHaXYtEGcC0lCeqZAPaJ1Eba36sEUnGMYsHL1RWVLLcW4i0NjVadIfSh/QN3FLm+/VJwSwBng==
X-Received: by 2002:a05:651c:3617:b0:36d:501:76d8 with SMTP id 38308e7fff4ca-37609e5e0b9mr54139201fa.31.1760364901230;
        Mon, 13 Oct 2025 07:15:01 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:00 +0000
Subject: [PATCH 20/32] media: i2c: st-mipid02: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-20-2c5efbd82952@chromium.org>
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
./i2c/st-mipid02.c:751:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/st-mipid02.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 41ae25b0911f02517f137d6b5307d13154266e07..4675181af5fb00df837c8b796fc32d50e077a480 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -747,8 +747,8 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
 	of_node_put(ep_node);
 
 	if (IS_ERR(asd)) {
-		dev_err(&client->dev, "fail to register asd to notifier %ld",
-			PTR_ERR(asd));
+		dev_err(&client->dev, "fail to register asd to notifier %pe",
+			asd);
 		return PTR_ERR(asd);
 	}
 	bridge->notifier.ops = &mipid02_notifier_ops;

-- 
2.51.0.760.g7b8bcc2412-goog


