Return-Path: <linux-renesas-soc+bounces-3750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C9C87B0EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 20:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 029691C262EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 19:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127536BFBF;
	Wed, 13 Mar 2024 18:16:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39CA36086F;
	Wed, 13 Mar 2024 18:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710353781; cv=none; b=KOrWSIg5he7UGjboMsHnIrhaC7IJDOmOhBS88tbtugJR2leNq1ZNbsnOVWEOErIVYwSXA1ZOAMhOpL3KLfzVGyVJzqQ9336beNaWx8+PYBN6yzvzkjeW2Oq9L0AztXhnyarnaHfilCMsGz4RGpIHFeN7wE7bF0RkRmy743V14fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710353781; c=relaxed/simple;
	bh=/tcqNHiWxgduBt6Z+Z99X4L2QBHn9k1t/eZ32gco68U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TcySq+TCUhkRJ/tFwR1hf6i64ivvbvD3+mXI2GRv41JSk96ZTLBL+70ykXZ008sAyje2ajKYFhOiNAthSl7hjRanO3S09B22K6Ahm/O3czHcB40LG5ftYBCNIkuqDeiOQwppyZO+TpsBs2gZ+3vM6zqiDsNQqDnBaecExSogax0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,123,1708354800"; 
   d="scan'208";a="197599019"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Mar 2024 03:16:17 +0900
Received: from localhost.localdomain (unknown [10.226.92.104])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E8AF84045874;
	Thu, 14 Mar 2024 03:16:13 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Huy Nguyen <huy.nguyen.wh@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 2/5] usb: renesas_usbhs: Simplify obtaining device data
Date: Wed, 13 Mar 2024 18:15:59 +0000
Message-Id: <20240313181602.156840-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240313181602.156840-1-biju.das.jz@bp.renesas.com>
References: <20240313181602.156840-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify probe() by removing redundant dev->of_node check.

While at it, replace dev_err->dev_err_probe for error path.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch.
---
 drivers/usb/renesas_usbhs/common.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index dd1c17542439..0c62e4c6c88d 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -595,16 +595,11 @@ static int usbhs_probe(struct platform_device *pdev)
 	u32 tmp;
 	int irq;
 
-	/* check device node */
-	if (dev_of_node(dev))
-		info = of_device_get_match_data(dev);
-	else
-		info = renesas_usbhs_get_info(pdev);
-
-	/* check platform information */
+	info = of_device_get_match_data(dev);
 	if (!info) {
-		dev_err(dev, "no platform information\n");
-		return -EINVAL;
+		info = renesas_usbhs_get_info(pdev);
+		if (!info)
+			return dev_err_probe(dev, -EINVAL, "no platform info\n");
 	}
 
 	/* platform data */
-- 
2.25.1


