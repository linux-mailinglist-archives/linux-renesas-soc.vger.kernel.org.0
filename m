Return-Path: <linux-renesas-soc+bounces-22929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A6FBD36AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C42A18852CA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 14:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3712E30B501;
	Mon, 13 Oct 2025 14:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hJTDjea0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A883093B5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364919; cv=none; b=EX1ewXt3P0ddzm+o5zaFy/5COS8ugXifDCiagc7n/HveOmKyvhKKmBVe+0YAbnn2gnq1qym1faF5iurxZ/sP3e2HbzEMbpzhmT55XKvs1u2hAzz9FBBdb5uoKpe+Yt60RjbiycegdPIK1/J0Dxqduqnqz4glUQu66XNe46WoP/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364919; c=relaxed/simple;
	bh=SRU041Bx6qBndiZAXSPZ90z0DuuZmjP7aN/HQli4PfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lzZWoCQpQDbyXU5q7ubsz/5CyzhZfUkSsbB+CkPDUD4owxWth99eZeWMt/A4CTageKSVeaHuG6qwwuslJnRa3RTRPs7TMz2JbAnhf4mXnNDljbg1QEXGHwjq5+Bdt96ccvZEgSVhd2jTwx87hEJMmE8u/WjlEHO3TceABWMCYjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hJTDjea0; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59052926cf9so4496747e87.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364903; x=1760969703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nh8P+yO8NsicwjNOpOoZpCCNOToSmwS7+PssriFBCJo=;
        b=hJTDjea0a36grPn3kcoSCf/zYXD+3RASlDVxY+p5b5CiDf7TPAN9eBwKihyN2eTVbH
         GPzdWthqCSRdyY66Pl8L0GKuBcYYtWWYa8W9HVjV/A1ta55l14SL5LtDaNiJvJdtsXmH
         +QJeAEiN5lparA41FYm1fzX3SIaUO+Za6cHwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364903; x=1760969703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nh8P+yO8NsicwjNOpOoZpCCNOToSmwS7+PssriFBCJo=;
        b=luphbpcLUy5G+PNcGgQd507FG3UQSFa0xlUCD/ZMDdkn2L100SA9yS+KdVSsl5OMtr
         hu58nXkpzYVwg+qogJrVLHD4pQSvLfR1ZXYu9GpwBx4YeQq4MHw0P3JWn2YEVR5RKshb
         T3qQFnoiTtp6j0ou9CtXvwaOPQNRRQuRI9sXAM+0rytwWsNWua+uciR86rWFPW2cEZlv
         SWsqsRZn6KeGJEpBbT66jzl/J9gZRJqDJYLO0uUww6M+yAe7avjhdS8+GQxV+Qx0qecv
         yLiaoWmtPE0JCCE4IJnnBHEQO1liXBvVfzWl/A7eyeYFJrTGe3RTxIyxf6JShYUAWJUw
         0jkg==
X-Forwarded-Encrypted: i=1; AJvYcCVPtj1HNDqh6TCgUYGsJbvEDyH2MUiqH5CmT8ytLxrktg/Pu7hfhauJqitAgYCJaJNAMgAHkGwd6sAJ7btcRx0uDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm8zLxz+y+uC1dAY+VdXOf2XsoqWbbTjMxVDOo5szhr80jjwsg
	HrBlC+dEgj0tA+ZZm/LCZRNVZS0MuVpjX56SjSmh7n+x0/maya+hBUMFaHBh6MUgAw==
X-Gm-Gg: ASbGncuY1i9oFhXUQgy7/o7OZY5MspDdP77HWjTyLT8UQaig69x+y/u8Z5KzJ3rE17G
	MdWhq5lCdI68Q4DnSxLnoetAxzFtrPLNaol8oLlIOfVonGErXGb8zm7bk5RlusWPu2ifMf+WXOL
	BbJpiHZIM6rNseTokyqTZqgLubDFqm4R+pNrpbw7tNdEWhAA5zxo8+Jk2FAVs39roeSn2Ezq6YI
	w1f/PcAy6wbfPSkVsMr59TGiUSBufBHFQ843SKReanje3Hmjz3tGR+ijhTyERCVHn07ip9bLK9B
	0eG1b/FP2kdKc+pSAnVx+JDf+AbTEhaPbyT7ZW2DajHCUCF6No10K+VnvcGPl4mhE9Vj6v/LKKE
	grgI8CuXDl6eyu6gZ15fEYbN+uG8XQ0yO/Xo3IU1xWMCjUarMgeS3zw6y2YRHqcgUoqkS3OiXfb
	TcHuLxIHtmcS/ruxubgQ==
X-Google-Smtp-Source: AGHT+IHTiQ/qP/uDKTsRTktboy2tz6+O6QgpLJK8/qSWk5/9SrQl1mdClJ1AYpOXCltPovAllg1/dg==
X-Received: by 2002:a05:6512:3c87:b0:576:89cc:95e3 with SMTP id 2adb3069b0e04-5906dc12458mr6541046e87.10.1760364903311;
        Mon, 13 Oct 2025 07:15:03 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:03 +0000
Subject: [PATCH 23/32] media: ipu6: isys: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-23-2c5efbd82952@chromium.org>
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
./pci/intel/ipu6/ipu6-isys-csi2.c:91:22-29: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index d1fece6210ab25de4e8c7b5247f049cc1dd1e677..d858976112ba2bfc2907f9b88dc6c6434053f4a3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -87,8 +87,8 @@ s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2)
 	src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
 	if (IS_ERR(src_pad)) {
 		dev_err(&csi2->isys->adev->auxdev.dev,
-			"can't get source pad of %s (%ld)\n",
-			csi2->asd.sd.name, PTR_ERR(src_pad));
+			"can't get source pad of %s (%pe)\n",
+			csi2->asd.sd.name, src_pad);
 		return PTR_ERR(src_pad);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog


