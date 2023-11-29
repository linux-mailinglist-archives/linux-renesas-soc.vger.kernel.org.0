Return-Path: <linux-renesas-soc+bounces-404-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8EB7FD97F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Nov 2023 15:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE67FB20FAD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Nov 2023 14:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8D832C7E;
	Wed, 29 Nov 2023 14:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RixMxYKO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id D6D5219A;
	Wed, 29 Nov 2023 06:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=5srYGa010zaXPgeYMU
	4ezpiryKXspoRb2NGozsAbp6M=; b=RixMxYKO/qJUdWCkylWy7m/RrTLJBq9eJj
	aXSL4WVeIjysSLrAZh0qTpmO7IaUu5XXTf3QFwR+I/QRqkbaPGmz4M76jKReCB8p
	cmynjGx3JagnSaslOPwFtPxDC7zAG8R2VbdXD89oPT5LcPDDf39X+t1ABWBztoFb
	SlWR2Kygg=
Received: from localhost.localdomain (unknown [39.144.190.126])
	by zwqz-smtp-mta-g1-2 (Coremail) with SMTP id _____wCn7274S2dl2svTAQ--.48522S2;
	Wed, 29 Nov 2023 22:34:34 +0800 (CST)
From: Haoran Liu <liuhaoran14@163.com>
To: geert+renesas@glider.be
Cc: magnus.damm@gmail.com,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoran Liu <liuhaoran14@163.com>
Subject: [PATCH] [soc/renesas] renesas-soc: Add error handling in renesas_soc_init
Date: Wed, 29 Nov 2023 06:34:31 -0800
Message-Id: <20231129143431.34459-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wCn7274S2dl2svTAQ--.48522S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF17KFy8ZrW7GryfKr4DJwb_yoW8WFWrpa
	1kCws8AryUG3WxZ39xGa1xZ3WSya18KrWSkr1DKwn7u3WrXFyUtF12vFyY9r1UWFWv93WY
	qF4Uu345Ar1UCFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR9a9xUUUUU=
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/xtbBcgM3gletj5Wr-wAAsw
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

This patch enhances the renesas_soc_init function in
drivers/soc/renesas/renesas-soc.c by adding error handling for the
of_property_read_string call. Previously, the function did not check
for failure cases of of_property_read_string, which could lead to
improper behavior if the required device tree properties were missing
or incorrect.

Although the error addressed by this patch may not occur in the current
environment, I still suggest implementing these error handling routines
if the function is not highly time-sensitive. As the environment evolves
or the code gets reused in different contexts, there's a possibility that
these errors might occur. Addressing them now can prevent potential
debugging efforts in the future, which could be quite resource-intensive.

Signed-off-by: Haoran Liu <liuhaoran14@163.com>
---
 drivers/soc/renesas/renesas-soc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index c732d4a5b26a..7a5f5c426118 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -487,7 +487,13 @@ static int __init renesas_soc_init(void)
 	}
 
 	np = of_find_node_by_path("/");
-	of_property_read_string(np, "model", &soc_dev_attr->machine);
+	ret = of_property_read_string(np, "model", &soc_dev_attr->machine);
+	if (ret) {
+		dev_err(dev, "Failed to read model property: %d\n", ret);
+		kfree(soc_dev_attr);
+		return ret;
+	}
+
 	of_node_put(np);
 
 	soc_dev_attr->family = kstrdup_const(family->name, GFP_KERNEL);
-- 
2.17.1


