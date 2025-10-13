Return-Path: <linux-renesas-soc+bounces-22925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 13948BD3687
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 553F94F3741
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 14:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DFE309EF5;
	Mon, 13 Oct 2025 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F0MXKH8X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC8B2F5479
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364911; cv=none; b=fYFswu8R6fAawEWKFQWzTNCjnsvG8tu+HfG3UdGDL7IjgUbb/JgmIBHgEWFDoFNVqX0dXPlQaRzXwOWSrRkXxT4eMizyFvZu0fN7XB3FtDUNhj6YoRAuMmwSW4z72YFBd2bHwItyIeKz8fxLibWHp8BBFUHmh8vOgSOs4lEabh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364911; c=relaxed/simple;
	bh=IYbyVo3NUXYVIwRmrClYpoFVDSCS8PA6N1mE0EyDE2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VFcjYRqQqoMWCRldg6syoLI2FIqGSdHSDV+LcyWIJ6+ji+UQMfQ9fpAKeVuIu9qhhqx4JTCJgqqiw/2VHxC7XAfTgAwC/vjvm92l0x1uiFrdDnhSWfXjk9fnufXpM4HVm+h3dArEXFtmEBC/aYjxlSHRCRM2kK2phMeEttGXYw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F0MXKH8X; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59093864727so2839252e87.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364898; x=1760969698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+HlSqes1yCsLkQoWVAYYhek4ZxMIKlt6Lo2LEEYk1o=;
        b=F0MXKH8XD/+Omkozp3JvPJdc/BgEySnoAcDXLAi0YqPufXrNDmTdixfngz/T3eZE4T
         xqAc86uhTwvo8VZTjgsPwJsZYxVrNylI8VWVHmxHFR1axK1LoY0M3mQoupHyntlc0nQH
         xRuqav9bqa1CWcf/RF+DFzOH2dFH9//jHYxR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364898; x=1760969698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+HlSqes1yCsLkQoWVAYYhek4ZxMIKlt6Lo2LEEYk1o=;
        b=Y1rrVbbboQMyuDn7rCiF0L0lNkPVdnpeT53oaF3SiXsNYWKjzZNaBzo90lmZnKyVa8
         f4jWJ8vzcHMilZm6dXOdJVcFtHmz14ookdgDgLk3z/cHRCylFNggY0jWv/AvUxQyLHdQ
         dVcgnO/LNdALIyTmMh9x5WbZzhOM6gfpxGRCNWcR5n+T0h1qNqC0RaUSovBAApbpNUpa
         gfIEqPR5rjdFIxXyDV6+KiDsGAYzsWgPBSRKj87S7KTsqRdY+qbb0yYORaKShb04PvYn
         p6+o+dqir/1nFs1AbenqfVMZyhCSdB85TYsS/B2hgdSCGMv/dPe1hcfWpq+ZJBSrY6Hm
         SPAg==
X-Forwarded-Encrypted: i=1; AJvYcCVmvlf7x0YPr326VMTnEqSvxhJ1gNrPVsQn23MCX1ucrvLPxjHmOJRU+AT1WV7qJQVXH1sUbmqTWwqEd5Mka35DtA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2tArd5zEB8DovRZBQxDnE60IgOaS/KUjSX530/04i2UW9qTwq
	y9K0LyCfm1YVLt0FN/Zmr+FMvary6j4uqulPqTMP+618scq9JGSV8QB6EwJ1ZN/2ig==
X-Gm-Gg: ASbGncsppNJpd90JSA8QYiZTJOhLo3Aa89Rm/f1zgX2iNiKu52+FpHiw4DE4+h1aeRF
	CuZkMWZzWDawe5yFZIw4+5Rj8l6cDSnu2Uua8LRW/LRJED9nDvN4i7Zr5xqZH2O3FlPFG2FEGvj
	lo2+GwwtycJwRs5OKvran45cXD3DCeFdfdrasdo7SNMVAuWfMWVx/K/QBDKvxCqeWW4iZXBVy0+
	RkWU+t2YELp6FpahqZMwgzm2+20hi7nvIXKhwXrKaT7nv0omPvkpwF6+Z3MKHaOGhCPRc9AWnE0
	Pv5ECszN16yOu/lX1MGHSqmp87ksGRlPJLi5K6UMOvkm2PLs7BgnZ7Nnc2WCjkz5U0trIB/3smR
	EVW48V+DPKXScZJkj+Zd1t90x3kcNjDy8EQHf9U7lrAFllJP+dgxF5Rwy8J8JwU//HQG8c0Hk23
	CO3hb5UwEIsWdticOnhg==
X-Google-Smtp-Source: AGHT+IH27CfYjloqEXA5bxWZfYaU4LA1SVwbUAxn03k9AIO/MXhXvYZJr7Cls4Tsp0u6mygHRedkXg==
X-Received: by 2002:a05:6512:3d94:b0:579:d89:20c7 with SMTP id 2adb3069b0e04-5906d896e12mr6073927e87.9.1760364898078;
        Mon, 13 Oct 2025 07:14:58 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:54 +0000
Subject: [PATCH 14/32] media: i2c: mt9m111: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-14-2c5efbd82952@chromium.org>
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
./i2c/mt9m111.c:1290:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/mt9m111.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index 05dcf37c6f013b1cefb5d85f893af08f4533c7b4..3532c7c38becc21df88957f8f323c77033026a81 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -1286,8 +1286,8 @@ static int mt9m111_probe(struct i2c_client *client)
 
 	mt9m111->regulator = devm_regulator_get(&client->dev, "vdd");
 	if (IS_ERR(mt9m111->regulator)) {
-		dev_err(&client->dev, "regulator not found: %ld\n",
-			PTR_ERR(mt9m111->regulator));
+		dev_err(&client->dev, "regulator not found: %pe\n",
+			mt9m111->regulator);
 		return PTR_ERR(mt9m111->regulator);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog


