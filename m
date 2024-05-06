Return-Path: <linux-renesas-soc+bounces-5177-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 444718BD311
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 18:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74B9A1C2131D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 16:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCF2156C69;
	Mon,  6 May 2024 16:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="noeIdUTZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD70155757;
	Mon,  6 May 2024 16:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715014200; cv=none; b=MaolFBhpApeM3d87I5rhmHCro5bv5qFm5QweC8/oftoWBB5IKAqdCPmrw4OHXChxqKEWuze8yZuSPnen8iPba7rMwoFLdeFOw4XsnNuaSSThmEjxyLAxzOKdRoREzVstJmkMEvmBgh4liiXI1L+pmHuT+PeTNjfvHDz96vBNojk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715014200; c=relaxed/simple;
	bh=Kf9ekvYwsXfLH5MGqjADtexp3rKNxwGeTcT4H/ltmfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pRZmHRzRDWJ8+lj3IE5VGKzZlQUu3nw6DqFUDp8uQi1teiDWipL45avh7hssNXNFH0rf5ndpBrokGFxDQA0DvV5pg793Dx4vE/PluWNYW3nzXnMyNn42KT2PyOSeME3wfu/UEy3UENapcoLl9TwUD0hfZBCS8Y8WYYfHjWmohKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=noeIdUTZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6348A114D;
	Mon,  6 May 2024 18:49:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715014194;
	bh=Kf9ekvYwsXfLH5MGqjADtexp3rKNxwGeTcT4H/ltmfc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=noeIdUTZcR0CHrklfDBT5d1eZqL/ErRbESdBmawHFoJ7HQMxMj+Mxw7n+0DRKUuyx
	 JXghte59w7z/Wnx0FMC1wviR7sMlPY7+hmNycgOZiqNJVYT6L1DXrnCC/+hd2PHgzs
	 kXA2yJNPYP3xZysqZ+V8wDoIDXuVRkzpuavkMjuk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 01/11] media: rcar-vin: Fix YUYV8_1X16 handling for CSI-2
Date: Mon,  6 May 2024 18:49:29 +0200
Message-ID: <20240506164941.110389-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240506164941.110389-1-jacopo.mondi@ideasonboard.com>
References: <20240506164941.110389-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The YUYV8_1X16 and UYVY8_1X16 formats are treated as 'ITU-R
BT.601/BT.1358 16-bit YCbCr-422 input' (YUV16 - 0x5) in the R-Car VIN
driver and are thus disallowed when capturing frames from the R-Car
CSI-2 interface according to the hardware manual.

As the 1X16 format variants are meant to be used with serial busses they
have to be treated as 'YCbCr-422 8-bit data input' (0x1) when capturing
from CSI-2, which is a valid setting for CSI-2.

Commit 78b3f9d75a62 ("media: rcar-vin: Add check that input interface
and format are valid") disallowed capturing YUV16 when using the CSI-2
interface. Fix this by using YUV8_BT601 for YCbCr422 when CSI-2 is in
use.

Fixes: 78b3f9d75a62 ("media: rcar-vin: Add check that input interface and format are valid")
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/rcar-vin/rcar-dma.c   | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index e2c40abc6d3d..21d5b2815e86 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -742,12 +742,22 @@ static int rvin_setup(struct rvin_dev *vin)
 	 */
 	switch (vin->mbus_code) {
 	case MEDIA_BUS_FMT_YUYV8_1X16:
-		/* BT.601/BT.1358 16bit YCbCr422 */
-		vnmc |= VNMC_INF_YUV16;
+		if (vin->is_csi)
+			/* YCbCr422 8-bit */
+			vnmc |= VNMC_INF_YUV8_BT601;
+		else
+			/* BT.601/BT.1358 16bit YCbCr422 */
+			vnmc |= VNMC_INF_YUV16;
 		input_is_yuv = true;
 		break;
 	case MEDIA_BUS_FMT_UYVY8_1X16:
-		vnmc |= VNMC_INF_YUV16 | VNMC_YCAL;
+		if (vin->is_csi)
+			/* YCbCr422 8-bit */
+			vnmc |= VNMC_INF_YUV8_BT601;
+		else
+			/* BT.601/BT.1358 16bit YCbCr422 */
+			vnmc |= VNMC_INF_YUV16;
+		vnmc |= VNMC_YCAL;
 		input_is_yuv = true;
 		break;
 	case MEDIA_BUS_FMT_UYVY8_2X8:
-- 
2.44.0


