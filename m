Return-Path: <linux-renesas-soc+bounces-6853-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D88391B5F9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 07:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEF1928485A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 05:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB152AF0D;
	Fri, 28 Jun 2024 05:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ezeilidM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D3422EE5;
	Fri, 28 Jun 2024 05:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719552018; cv=none; b=KhraCoq05ZIIwcIZYPwKEPCvwDRpvxsuj2ONNdobDH8zq2lGW+D1Wj9G4tdgXrONmN3UVf+rPJMXW1c0AiJTbYIZbL1iH1UeEFvQAaKyo5z10Cp0sbe3EIL4F7Arvt//JUDZtq6hdQEdZ6BpbF/TVlMRMWQPjjlL2PgkCaMa2Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719552018; c=relaxed/simple;
	bh=uk8lVFe1GMhlZm8thQQUhVGTFYSkxhX0O3YrfzVsaKc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NIJA4e9bS1FfRRid2+V1a3GFEdR7NNaRE5PXACv6KJmER1WAwa7aXhFR4c70IUn85qt4Ky+j/Xg5YKoNopIFr1x0L3gPk0+IE3qdlCvnZRjZHGQOjq1wM+kxAMqoFTJ+HDVV9SSaXOVFNBLzIGTcHKYD+LKwc6Q9BMwGIMAoBeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ezeilidM; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1719552012; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=OnHi57XgkduSSpmmFaQ+BITXaOPXtSLnOYlN1StK5UI=;
	b=ezeilidMNPn4JrHsN+rbJEL4Fqt+6OB4/zQQP1jaVXG7usPlsKnp93nKr96WVZ4/NNiL4apmZ2a5XYVFq7YOTJYNwQ1MeM6jk0RucohwXOUeI8zpqkkBnK2Hm6sZeX5aW8tFEdR0Bf30GhMoxQlkJ3CKYMGP0m7VFoPSuhzeNI8=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067112;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0W9P6E2b_1719552011;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0W9P6E2b_1719552011)
          by smtp.aliyun-inc.com;
          Fri, 28 Jun 2024 13:20:11 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] soc: renesas:  Remove unneeded semicolon
Date: Fri, 28 Jun 2024 13:20:10 +0800
Message-Id: <20240628052010.31856-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

./drivers/soc/renesas/rcar-fuse.c:124:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9441
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/soc/renesas/rcar-fuse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/rcar-fuse.c b/drivers/soc/renesas/rcar-fuse.c
index 8fb2374f919b..cf665f2e4a9d 100644
--- a/drivers/soc/renesas/rcar-fuse.c
+++ b/drivers/soc/renesas/rcar-fuse.c
@@ -121,7 +121,7 @@ static int rcar_fuse_probe(struct platform_device *pdev)
 
 		fuse->offset = data->offset;
 		fuse->nregs = data->nregs;
-	};
+	}
 
 	memset(&nvmem, 0, sizeof(nvmem));
 	nvmem.dev = dev;
-- 
2.20.1.7.g153144c


