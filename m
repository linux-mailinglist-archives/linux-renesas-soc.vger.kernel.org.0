Return-Path: <linux-renesas-soc+bounces-22923-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5684BD366B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39EE9189A0A7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 14:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DC4309EE5;
	Mon, 13 Oct 2025 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I21vI3yq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870D425782D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364909; cv=none; b=qpl4DzpzPCuFzr+ltdFF5EWAz69dMaCIkmqCBmPCSkV2GXfLFCJdBupc6gBabxz3SdG62UxC1Hf92EYSC8qKaKCWLBq0lyZ+W+gCTz+iBivrrA0nrCoBv3sAkqkHIViEJARqRs+1E6N0BuCIXiLda3c9tptRDbAoKO6MY91EHiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364909; c=relaxed/simple;
	bh=cjTbphg5ydQRNNF0zGsMKQ9PfRKUomJXS0y++m9uD5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tp1WRxGpZJxCcobZ1aiOnaagX1dDTjEDAIYcd/iidmv0Scmy/dtBCIq0EjUeT/XPIXMQ8OThh9f1YrnmxEzxVDGVUuB1+lW7FfwGoWIcy+qCx3kRF4twUth+afkVkBYpP6mZ2D3eL3t+iA22sPjoQ+I8cGkR5dHiWw8qKI57nz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I21vI3yq; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-57f0aa38aadso4965148e87.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364897; x=1760969697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gx2Nk8bbTBBYhN943GhcMzv342eYq6Mo/xpbKyZ7/rI=;
        b=I21vI3yqWJ+gtAKtphPU+0JVrvViANfW5mf7L1y2jKwRfe8+LAbSDJdgyax9+zc1X3
         aYbxt50wlnvFbEXRcU6PpMxCoTQ3zjnfvkapF1fDFUvXKG7Do/kyA0UDAB6LY7php88G
         iLoxBG/lO3qezExPedC2mANEKRhnDJjks4JFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364897; x=1760969697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gx2Nk8bbTBBYhN943GhcMzv342eYq6Mo/xpbKyZ7/rI=;
        b=jyFP3g+JgfpmWRrk/4MpqD5qVqYMZouWBSJ28dh6I+RCRkZe2Q+7Kp0WuhhXauGJA5
         zjou9nkywpZAvgaXBi1rlJKJXjaFS7pGJP80foP9KOhm2jMef8edOqzuimDemlfyC6JV
         RIYqZcGLKkpq5+N2NPHGYIxvRbZwRm8S3Q27TsNm6Ux7hw/NpVGiMo/rO7C2lU8JimBx
         /TWCduZvxEX/bAhirdtZx3BhBKJYPXJd/6mNXnk1ya52IJViI95xdL+1GJTAVQc5K5wr
         G7dQosomkSsrQ9fVjBQwaCHToG4wLOim/0VjCXbsbZUuUnK2hw9KBXZXLMIZI5bSBj7S
         3lOw==
X-Forwarded-Encrypted: i=1; AJvYcCX7TcfEqudYw8tBNyZ8h3GqCu6zyCkRfjO7CkZkJcuWkh8mF7STfpe/130dy77Rg9lZ0rz2QKD0hv65CJdEbGMW/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEHrvCDyAKb0Tej2ZOzT5yHf81dJ5nMk18uq7/2qeDReNsh0Qh
	1rMLjc2247NvF7MxuFUG3YCM9NX+e2ngruUOV6nMSUvJBvastaZ4hdlbKGg0GqrhxQ==
X-Gm-Gg: ASbGncu7yB9W4z5J5iM3AXjYFOh9ooAJkATN5bgc20b9EyrWvHxPh/AZna89MFY3a3t
	BbXgDSoJ/jwxB5CReE8NVAPSDVi/Mm1KnlccwdR7HgiOViKT5IHcdpKM66SVZC/nFnGKodtkRT/
	C+BA+RjLBrTJFwF6vmLScm8HAI05YzS3mjsK+84estgZUt/WnVhBogS6c5N62o86QMkTjDhZaGl
	SAEsjc0XqgjM9VqiVXqbliv8bBEbYKyda7G2MKHbD6QWPXuXD9MV6qcF+3Yy5OiATc/Tshi0eml
	+Z9QuI8Vh+ZMvRwESpckqFu69HbPDmANHnFCvV09pvGSsuF21baNJ0xnXmmi9oAC6fxA0pRxnx1
	A5masqgnOl+s2mMwafN67c3lsdC4ASfoey7q2sKd16vJ5l4OXoZTYr/XFJDFXj5wfWexRxp1eW+
	jaLi5Ei+IgRv34n/DlhnAnWDjWJpjb8vU3CEvPY68=
X-Google-Smtp-Source: AGHT+IGza3WB72u87Qc/jc2dtqKhHQX3673S999Ht+Uo4ar3zMBnJvEIFFWeIrwIdWwBJ84BunwKvw==
X-Received: by 2002:ac2:4c45:0:b0:57e:9865:d6a5 with SMTP id 2adb3069b0e04-5906d9e7318mr6028332e87.40.1760364896522;
        Mon, 13 Oct 2025 07:14:56 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:51 +0000
Subject: [PATCH 11/32] media: i2c: imx412: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-11-2c5efbd82952@chromium.org>
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
./i2c/imx412.c:931:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/imx412.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index 7bbd639a9ddfa7fa76d3a4594be1e1c4d002c98a..b3826f80354703b17b416dc233854da3f5736e38 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -927,8 +927,8 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
 	imx412->reset_gpio = devm_gpiod_get_optional(imx412->dev, "reset",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(imx412->reset_gpio)) {
-		dev_err(imx412->dev, "failed to get reset gpio %ld\n",
-			PTR_ERR(imx412->reset_gpio));
+		dev_err(imx412->dev, "failed to get reset gpio %pe\n",
+			imx412->reset_gpio);
 		return PTR_ERR(imx412->reset_gpio);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog


