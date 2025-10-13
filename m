Return-Path: <linux-renesas-soc+bounces-22941-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C86BBD3711
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDAA4189EB13
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 14:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03013093BD;
	Mon, 13 Oct 2025 14:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Km69erHe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7853081CF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364929; cv=none; b=G5FLAK/taprbtJPYUcKqnKF+F82TSlnb9hYSkZK7mWhopgpxScSmufvKPR+MmH6ZAHyODgrX7vhgHCpikUCvB5dPDxhGkILqkIXt4DKnLgy9um9iiFNtk/oR8nz0zWzlDW4EC1t+dJpvnx6K5FxAqkaMHcGC3loq7eEuXYfncoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364929; c=relaxed/simple;
	bh=GaYybwTc4NMu8YoQTyNOoa9jWFCzwJu0zC9otJ25O90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gMZU/h0vfrQzG/YMyK76I6+P1kdfuxdY8YaGZosMLmDyBZzYm317lOvwwFH5ne6g7tEDaYgM++EOH9T8P0+ZggVs93ZSeU891zcNtvm6EGkkebkkAvoeVFdAFzO55GTdOf2sPVrO5NYFr2dKukovFdQaJLyb6/AzIi5cLVFl8aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Km69erHe; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-58afb2f42e3so5098515e87.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 07:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364908; x=1760969708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVsYamtIjQUiQyb/41UVrEZvV/AHr8CKvvGfsgypkrk=;
        b=Km69erHeXAoPWuNxrlssNsRB1gmru4/w/FFcXNri4xpB/pwAMm+H2/mYmbFWtned63
         KSwx+OgwhDg1op1JUNd3nyEQlFLYjqc9BsJ40Cb5Z5+yFWymCHElp1GjMdIhJCLnwp1k
         QiFLc7h1A0yxC2FjlFojyDAglIyDdXy+yv4nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364908; x=1760969708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZVsYamtIjQUiQyb/41UVrEZvV/AHr8CKvvGfsgypkrk=;
        b=j9s32cfcjfhvzNQXY8myEPS6BRCqDxW4tyCZHnDakA166yUFk7RFNBVG8MmGt27g+N
         8mQ2Q209lKHyjA94TqUjvRVE5f1EWURreKbwPUdd+Ri8meKLQQac4pk2gVo2H6EXIGDi
         mK2rPvkDJ1A+zR8YNDSp321BA/WQ2UVoTNbPyR0XmLnaGiz3q8rQBZPOfjWFMvle+RLE
         NZSUicSzosTYP2/T21JsJaCXUFwJj1nmFzRBHCaddDFluzrj6EHwy4YV/zY3yy4n03Ob
         Zgj47SGtU2VNI5C+PO3ozLhXY0t9oZdYLHIqwBqEcgY4ix7xLDDn7GxCCuFRlwNG9suS
         NOrA==
X-Forwarded-Encrypted: i=1; AJvYcCWg8SBRzHHXwycyup2zDyKrdhu5Pvs/Pv9/Pigl8A8S8gp1tc6VaWjpTKahuFFbDX1WBHTqS3AFE/z/0uC0/0/lqw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0nQPejK6AT7q6hQ5ZBai3kqDAj58HrtS/OBnq8fK4OvCpZbQ7
	vsMAwLVUPYAqKmNtLriekpZkqGctjRm9Tu0ZeRs/5JqeVQeW0IoBkX8obLtnc/rmWw==
X-Gm-Gg: ASbGncsb1M45ge/k6tf/f8KaDmhp1nbj/xFX/fM9UBOggbUPg4XvbhFhja/85MRI2NS
	+XrWhjEZ8ab2E0+j4boSHaFcH2wfYW6udXtGNhmmXc2bohyRsuG5/5IfXbXRzfi/JyBX87Czn2e
	kEUNm1Ir9te6T3BPxvJs6iB6VJs5trTnnDiQQFuwddH4ClUU27spInBtG1wkHIM075qTcNpWB4C
	0oZb/1ZkjeVLJiLtmSmow/IRBeezTZ+dh6mOE8+bnkedIsBwdXrTq1U1EVpfPd5Mlkseg6sarA0
	aLb5MWiLfijbjM7DsIx67gBif0vz6Q0KXtV7/TdjijHTLO0LA3Ok04BTJEOsWeKlZ1CCoziZLoC
	kaIcWiYj5gWqEim+E3FuUt+v4sKMngYCFWARdbwbW4YZtz7q26X7w+4hyt5yE/EeSNSkfPHP/tr
	EPYoSRNwhFi+RVoiq/U1o0fFsMXVSU
X-Google-Smtp-Source: AGHT+IHnTH3divp7fqt3s0C0bL0Y26kzFRRxIkA6dzGRmTI5xBy5IO/jgX2PIUsKvH8Kkie5THLlbg==
X-Received: by 2002:a05:6512:63d9:b0:590:9a11:9c23 with SMTP id 2adb3069b0e04-5909a119ec4mr1624042e87.55.1760364907731;
        Mon, 13 Oct 2025 07:15:07 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:07 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:11 +0000
Subject: [PATCH 31/32] media: staging: ipu3-imgu: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-31-2c5efbd82952@chromium.org>
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
./ipu3/ipu3.c:534:5-12: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu3/ipu3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index e22a9c0921957ef2fbf7b8a11fab28e6d78c60eb..bdf5a457752b24bf35e38491d63fc1e059a1e058 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -530,8 +530,7 @@ static irqreturn_t imgu_isr_threaded(int irq, void *imgu_ptr)
 		if (IS_ERR(b)) {
 			if (PTR_ERR(b) != -EBUSY)	/* All done */
 				dev_err(&imgu->pci_dev->dev,
-					"failed to dequeue buffers (%ld)\n",
-					PTR_ERR(b));
+					"failed to dequeue buffers (%pe)\n", b);
 			break;
 		}
 

-- 
2.51.0.760.g7b8bcc2412-goog


