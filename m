Return-Path: <linux-renesas-soc+bounces-11865-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F61BA021C2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 10:27:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B084D1883F01
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 09:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AFC51D90B9;
	Mon,  6 Jan 2025 09:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ML7o2oqV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89021D90C8
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jan 2025 09:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736155658; cv=none; b=RcxaCdT0QHuuyV5O5KUvfDC/52f2XY53oU0YzMW6OLYcD+iip5L0CLzg58QH2BDMZa9GjHy5fUzLoww2++OCbg/4QtMYNwbOWB+mGVuOjX4fwJKZweRipA+UOlf2851n/sf3XgmAm419LsF3sOvDsrcS4qF1pTBM9YXzFvP9CL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736155658; c=relaxed/simple;
	bh=4t42AJm9JUZgPf3saXLPRAI14WanKBxsPVyqgD+WlLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BY0K/TopJ74Xqvo3LjjKu4/o6eRf36GtNmJI2Z61zduKxLNyubMPt6lcLzTq2Wc/jUZm49NbDMni4GE1uzS6xFX6DHoBQmoCkGim4spj0FqQ3PJtk2HAbj4JiEuD5G1DumeK+ueY2zb/nNXkofjl/vMJWRL9e731WW8hBgt0iX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ML7o2oqV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Py0DoMMuciEt40Q+z4uuudYOKUnz5ppwQn4+cYx5ojg=; b=ML7o2o
	qVJwx3q7djO/yb2b86sLOlJ2pUI46fIRp/mydZLpsbWK7ylHCePmQY13F+DqlbTH
	S7tEr/+/FUn+dPMSfpfjFSSwfY2dxDa4w93ME+kI9Unm8vNeGQtVKo/Fb4Zj8q1V
	M7u2cdiij9yKIPezD3rUDStvbYdjowtmu6VXupZVhdqJRsy8YWmvqxhtoUqQ8oXr
	kZPzgLS+w05Dw9FhtIvnY0ECpDhqE/20Rus0BgflpVKKQfVluptdoIIPZYJpnlcU
	UfZPnJk2rdycGX/Fpww5BXDB+byjbKQMgT6HL+aRQe3O1lgkRGaruiHltMOUvS8D
	xta28EwTyR+Wp26Q==
Received: (qmail 1727908 invoked from network); 6 Jan 2025 10:27:28 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jan 2025 10:27:28 +0100
X-UD-Smtp-Session: l3s3148p1@r9avPAYr7JsgAwDPXw20AOMQ2KO98fSH
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 3/5] i3c: dw: use parity8 helper instead of open coding it
Date: Mon,  6 Jan 2025 10:27:21 +0100
Message-ID: <20250106092725.22869-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250106092725.22869-1-wsa+renesas@sang-engineering.com>
References: <20250106092725.22869-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel has now a generic helper for getting parity with easier to
understand semantics. Make use of it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/master/dw-i3c-master.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d4b80eb8cecd..0d4d44458c11 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -251,14 +251,6 @@ struct dw_i3c_i2c_dev_data {
 	struct i3c_generic_ibi_pool *ibi_pool;
 };
 
-static u8 even_parity(u8 p)
-{
-	p ^= p >> 4;
-	p &= 0xf;
-
-	return (0x9669 >> p) & 1;
-}
-
 static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
 					   const struct i3c_ccc_cmd *cmd)
 {
@@ -848,7 +840,7 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 	struct dw_i3c_xfer *xfer;
 	struct dw_i3c_cmd *cmd;
 	u32 olddevs, newdevs;
-	u8 p, last_addr = 0;
+	u8 last_addr = 0;
 	int ret, pos;
 
 	ret = pm_runtime_resume_and_get(master->dev);
@@ -873,9 +865,9 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 		}
 
 		master->devs[pos].addr = ret;
-		p = even_parity(ret);
 		last_addr = ret;
-		ret |= (p << 7);
+
+		ret |= parity8(ret) ? 0 : BIT(7);
 
 		writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(ret),
 		       master->regs +
-- 
2.45.2


