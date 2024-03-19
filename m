Return-Path: <linux-renesas-soc+bounces-3886-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DB787FC3E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 11:54:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDDE51F22E11
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 10:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FC27E599;
	Tue, 19 Mar 2024 10:54:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E31E7E57A;
	Tue, 19 Mar 2024 10:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710845659; cv=none; b=XIhl02UENQaIVBYtqLSiF/4C48INwNxpOmoPzkHyIam72y8Fog18VwxVgOpPyhjpVy6qTOBVW8g8aGcDhRqE1jbQHJntV6XP9xJ4zmQj4d4omZjGQJLx/Br4QTkZfRy3ZU9mJsWjE0cvcIOgxOjRzk+kT9dtpQjF3uqXL9458w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710845659; c=relaxed/simple;
	bh=EujaVnC/lwpcadYy18mVrRLsg9qlMrJKnWS7bBtX5Vk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jyz/9blG0+AU7jKOkp7StZpp65qNb+BsgCgoPz2ZUXXWhRHd0Hhqh4HCJJkvdmGIk7Dn29ruI9Z+f+ScYvRLZLrqVUs+JPPZSxJDRmbj3ySTHqzh80DmXwdHInkOntMbxmQmEPMvjtW8w3grQSOluMJQVNdRJl6sYsLANhR+UBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="198343202"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 19 Mar 2024 19:54:11 +0900
Received: from localhost.localdomain (unknown [10.226.92.214])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0B5504006DFB;
	Tue, 19 Mar 2024 19:54:07 +0900 (JST)
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
Subject: [PATCH v5 2/6] usb: renesas_usbhs: Simplify obtaining device data
Date: Tue, 19 Mar 2024 10:53:52 +0000
Message-Id: <20240319105356.87287-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240319105356.87287-1-biju.das.jz@bp.renesas.com>
References: <20240319105356.87287-1-biju.das.jz@bp.renesas.com>
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
v4->v5:
 * No change.
v3->v4:
 * No change.
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


