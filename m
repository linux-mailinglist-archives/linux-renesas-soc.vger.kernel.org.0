Return-Path: <linux-renesas-soc+bounces-8304-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F99695F4B8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 17:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C42E281A85
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 15:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5CDF197A77;
	Mon, 26 Aug 2024 15:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="P2muHxu4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CCF1946C1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Aug 2024 15:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724684933; cv=none; b=lIdAN3M4FqDpaj1MaeYZx1aWkgoKDvDHCikmDpSbX5siJ/HvdlVIxODyNw3Svs/MIzBxq38I0cpfdcU41Vki5FSIUcQAtEn6Fo5SBjQsaglB9zdGfDN3c/3VGINx2YyDPUUSETmXx3Gx2Xj5FIeDt18T32SZDjkilX2Mzo1pL0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724684933; c=relaxed/simple;
	bh=tLrQkOTVMyigkp+9FM6i1ow/+j5HpmACL+GziLUezs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cUcFemdeQdHnNQAXIx3+QQgTU5VABfr4k0Ek/ARH0adihF7e6++FHxgHjmrcoqMpTPA+3Xmuq/5wLCQYwf9sYlts0d7C5c3YyRxjkYlh4hiACoOX6Z3cHENluniNmj5ieBHgPjg7TJzYQpewQR9mMLzTjhNarvbBTEIGv3ZFh3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=P2muHxu4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=XQ3eV9eUNljQ6D/g5Ix4xKZhArY144Fzzyo1pRqyUeA=; b=P2muHx
	u4TKzt0dIvxUqlW96y5vb/yDLmZAw7Ut1JsqZkiUXlf2BX/wjSyVvTtwWmqNiiP4
	JfyjHtKH7Nq7yyq7np+fbtG/QuJC4LbPJ2FwlzfjUwBDxtwwgUXyHXBVMCkm2KJs
	HzXZSn3ZHm5NdfK1ArDL1S/fM3Do1FO913AYXBF64RWZAHf1gMppMW52jchM3vqC
	muftG8xVCVQp5cbcuPJfqeDCCeFyg24LyvtvQRZ1aJxL95Lkod7V7FToI5kF9bO4
	nWj8CTkQ3zv4I/VF/w75QYPt65JUw43StHQGBY+BoCWnwEGxilo27p35s4wuT+ny
	xQufnczdcADCb/Hw==
Received: (qmail 2032517 invoked from network); 26 Aug 2024 17:08:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Aug 2024 17:08:47 +0200
X-UD-Smtp-Session: l3s3148p1@Ig5ogJcggI0gAwDPXwdRANgvu6DX4+2c
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [RFC PATCH 2/2] i2c: rcar: support named interrupts
Date: Mon, 26 Aug 2024 17:08:43 +0200
Message-ID: <20240826150840.25497-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826150840.25497-4-wsa+renesas@sang-engineering.com>
References: <20240826150840.25497-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 1104aafe4433..1a232bc88bed 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1192,10 +1192,13 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 			goto out_pm_put;
 	}
 
-	ret = platform_get_irq(pdev, 0);
-	if (ret < 0)
-		goto out_pm_put;
-	priv->irq = ret;
+	priv->irq = platform_get_irq_byname_optional(pdev, "main");
+	if (priv->irq < 0) {
+		priv->irq = platform_get_irq(pdev, 0);
+		if (priv->irq < 0)
+			goto out_pm_put;
+	}
+
 	ret = devm_request_irq(dev, priv->irq, irqhandler, irqflags, dev_name(dev), priv);
 	if (ret < 0) {
 		dev_err(dev, "cannot get irq %d\n", priv->irq);
-- 
2.43.0


