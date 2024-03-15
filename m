Return-Path: <linux-renesas-soc+bounces-3819-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F3E87D3CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Mar 2024 19:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD7E32856AA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Mar 2024 18:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89C61F16B;
	Fri, 15 Mar 2024 18:41:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765234F5FA;
	Fri, 15 Mar 2024 18:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710528105; cv=none; b=eZoENi5hu4+o4oQnAvQV8p+bRoK3UYSLbqDYIxhZ7Ex2SYE4660qd2cH6A12Gn96KTkH62rxmVvzvTD61lILukXAauD+8wGHk1SCiPRmfwSZP64kFcjOg3acBt5TQKTMGPd4SQjj9+SLJT/Klr3jaFdbUiuIMqtqOYt8zDsx65A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710528105; c=relaxed/simple;
	bh=3TTfsFW0oRjIM/ny7kCePQLf+iRUVD0NSZl63OG8Xdo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FjrpZ+UXtN+DaI4v8Bf/8NGL6sjhDXo8OFRpkqU7hesoii9HvYD56FdCJOjVu0HdofC6J3g8iixvZoDH4oUWPLreSLgz06xkZho+lq9P6P5W8qM3Vx2fN65DqD4M2OvhwTPO7CkC4LHPJXyg0zIUuEx6lvSccVtSa8y7WuBDM6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,129,1708354800"; 
   d="scan'208";a="197917802"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Mar 2024 03:41:41 +0900
Received: from localhost.localdomain (unknown [10.226.93.102])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C120C40061BF;
	Sat, 16 Mar 2024 03:41:37 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 2/7] usb: renesas_usbhs: Simplify obtaining device data
Date: Fri, 15 Mar 2024 18:41:35 +0000
Message-Id: <20240315184135.375916-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
 * Added Rb tag from Geert.
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


