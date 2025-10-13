Return-Path: <linux-renesas-soc+bounces-22930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FC7BD36E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CB42C4E48EF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 14:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029903093DF;
	Mon, 13 Oct 2025 14:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Jjl7VHg9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D006B269D06
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364919; cv=none; b=ZcvW7AAXsQpbTTyvSI3Mb0WtHuuPblHO4WJf5x4GwAf4MVC2qv73AlzTVxc+bPAPpoB2HGgZA3FlIoiqSCy2vHe4a2+j0O173innMVuHd9RfItb1pNqs03RmCdywUzG0IOTD8JPs303whKYY29eNwA99nvukF2i3IWUg6rN14U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364919; c=relaxed/simple;
	bh=6oC75UBV5kQKcDj22i/SCXI/g3seRGkpC1t1HJaeaO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AngXacbFa1JASMvYZ0PDZO7r2ynSfS+ebbbUlrmTX5WiClrNAMh5ZNexFsD6BuVtRu3Uv1Iwa2u1brvra8p6PEBXXRlOrjFKGogcNe5fElVEL/EaPemBrEzuvZlZRMJfCdcCoDDfISsWeI5/6CMZ3jSmZMJsYP3c91I14htgtoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Jjl7VHg9; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-57f1b88354eso4814531e87.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364904; x=1760969704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PvGrgXxce3b673ZvWJmL2O2P/vGZxGBn/PkoM5SNlqE=;
        b=Jjl7VHg947TD9nYIiNrTYoTl9C6fcT8B5pODDOePLIBOizbupFznj3wKKtUHwPTaPY
         IMfaa47c7xAd2W8gJr7rvjEZDlHP0mm5lVm78Dwe5IGviSyPLuflRWrod8Wxc7OdM/Pt
         WG+TbUwRi6cfa+7kMQNMQHsxI7x7BUF/MFUGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364904; x=1760969704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PvGrgXxce3b673ZvWJmL2O2P/vGZxGBn/PkoM5SNlqE=;
        b=nvzJdzQxX1DVY9cC84QJV31Rg3ZUEi7MsPsbrK3+/jIRnK7Yf6iA0fMqXW1RY4EMWM
         tEioKiaiQ1Lv+m/ICh3X3aTVWgnzqt5tnfbBYMmQXwZB4A+r9lMgWD+63tsQiUkZjSDx
         mAvj/InnZ/itohai5wn+QnmszCmTbVJyKUcYKXmBKeEEeHJjfaBoLb8Jt4HnjtTaJQlx
         EbVaB+AIY8ZX2AVuE/P8lkZpgdbopuRa7YtCF457AzvgCVRRA21KIv9v/q89CNFHdNBg
         2617aY3HKZ3eJ07s+a8TYFW0el19M4eLrM/xO72d9elg+jq1iYk70QLpVAjowNI0xJlo
         Bf+w==
X-Forwarded-Encrypted: i=1; AJvYcCUb+nzt1vgedu0SHMtybR7L2r0q2vTvK5DfgZIRTdZay3JiP5bkGf1QWwSa0lDala8bs8PKo/RY81L6E3dkvyt/dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLSSGAlh9zHwhZz887NB0A86T+Mxpox0MKnaJr+KzwWB/6sqds
	7dy2RW0DwpNVRCxmyVn8DJl76CRVisRnkMW2rWSPMbqa/R5fRB+qZZlFrW9Wt7FtIg==
X-Gm-Gg: ASbGncvTKjZ7kJiZaPLfYxXya6WjT/9zeiqEnhYIEq53m5MFnjk6prrUdXJA5lV2hU4
	HUvutOaBizUaM4Z93A511iqGZG3YoWDQ6MQ6Mee0wJr5TD04LicGqKsn8L13vfp8WTxi1PSlfWG
	rOFPr8YkI79ZI3ASVYzV6YdNLS6BUwRKZTH4XH9H6/jqm3tvnUbGrqW5OW0dg3NdMSq/7unYuxo
	/ZO8rbiQ/7D5jXuS8VDZgPLwkwHeku8AIKCjeuAsAkoY36WcsDGG2NGWfuIPzEG1r+MZ8z5fOCx
	0sX3+4JqgxLAPnXVZmAKsVvRBYTwUKy7SPZ+YSt3hyDOGR81kWeSbF42x2MSVu1ozq5SCI8sZZA
	jrxpQVSgOL6lm66Cb3ZTSIS60OxO5ltJ56aPLPFMOU/9zhLMxxDwLMQjGoCCLnf9LDDqjvAoI93
	h0FAn1zpEcwwa9edEmq6IpT9PYqVfQ
X-Google-Smtp-Source: AGHT+IGGd6j7B+8NL75y4mrJN6TXhWVlixXUpX+LgX1rgjlDHLsFmo3oZTEn3Lq8AvVEZR1xSQXSLQ==
X-Received: by 2002:a05:6512:3b12:b0:576:d217:3f79 with SMTP id 2adb3069b0e04-5906d8b179emr5620261e87.15.1760364903769;
        Mon, 13 Oct 2025 07:15:03 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:03 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:04 +0000
Subject: [PATCH 24/32] media: mediatek: vcodec: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-24-2c5efbd82952@chromium.org>
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
./platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c:187:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
index 5ad3797836db15bb62744d6699cdd2d6f05ad01b..643d6fff088b22dd58c0b05d5699432ccd0bc582 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
@@ -183,8 +183,8 @@ static void mtk_vcodec_dbgfs_vdec_init(struct mtk_vcodec_dec_dev *vcodec_dev)
 
 	vcodec_dev->dbgfs.vcodec_root = debugfs_create_dir("vcodec-dec", NULL);
 	if (IS_ERR(vcodec_dev->dbgfs.vcodec_root))
-		dev_err(&vcodec_dev->plat_dev->dev, "create vcodec dir err:%ld\n",
-			PTR_ERR(vcodec_dev->dbgfs.vcodec_root));
+		dev_err(&vcodec_dev->plat_dev->dev, "create vcodec dir err:%pe\n",
+			vcodec_dev->dbgfs.vcodec_root);
 
 	vcodec_root = vcodec_dev->dbgfs.vcodec_root;
 	debugfs_create_x32("mtk_v4l2_dbg_level", 0644, vcodec_root, &mtk_v4l2_dbg_level);

-- 
2.51.0.760.g7b8bcc2412-goog


