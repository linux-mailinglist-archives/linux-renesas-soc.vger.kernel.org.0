Return-Path: <linux-renesas-soc+bounces-11893-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C4FA03A7B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 10:02:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F0133A1A56
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 09:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7BE71E32DD;
	Tue,  7 Jan 2025 09:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eyDX3qTA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7881E25FE
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jan 2025 09:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736240535; cv=none; b=FC604I8bqeXdpx8+q842Zo+whwWRaizlSUre/9zVWrgbiSSdAS1gWCFSNOKb2WPqJu9aN8z2pxmcBjHsCsAEVKtlS1iLtMFaRa16amXwVuTv7OPbcSmNAhsNIKnlH3tKh1hbiYCZxO3LyooDRX/gDD8xydJ6jJGymj7iqWGgE+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736240535; c=relaxed/simple;
	bh=4t42AJm9JUZgPf3saXLPRAI14WanKBxsPVyqgD+WlLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=as/rYub1v99odrNRXDi5foZNSjZechgaQPnS2rOg2JpZQWCnlR8aMP6R1GyFfwDiFbLDPLbyeR0iFrzHavp7SXIh6oBPt3s8NizSbKQCqVT1KSOyAF4o+EFjlo/3yJ+e1YMn/4EClg6AQyr+qAqk0lU9fuNyKX4uNWvC4Xs0nl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eyDX3qTA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Py0DoMMuciEt40Q+z4uuudYOKUnz5ppwQn4+cYx5ojg=; b=eyDX3q
	TAD+n/EOt+u/Mbevq3q8Gsf4GnKSJAJqyKHhz9//jF1GRu+0GsQ7FjIXQc2+ZL7O
	IZQgyoH0KrmN7meBBEEZxpb8fYhgRQvrZQtM9VK/2YoVG4BE5UITV2BWw1nSYGfq
	VNoDCUBhQJoIVfTfQiiTr/5HkdKElOIGZ3fOM6xn+A1e9UCQQBsA6Jk3Z6+sg0yH
	UE8vqVOy/dQD5A4NoP5RnATZAN1H++JHCfUl3aD0GfyF9EMg0DyIi1kkIjmvcbAe
	WKXCrmW4SRcDOd5siPghYn8PRW835Oc8IghjW0Jh9gF6VWkbGox7e3zaJHpaRiQu
	/gxlFH3uD5S4KwHQ==
Received: (qmail 2125336 invoked from network); 7 Jan 2025 10:02:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jan 2025 10:02:09 +0100
X-UD-Smtp-Session: l3s3148p1@hx36/xkrZpMgAwDPXw20AOMQ2KO98fSH
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v4 3/5] i3c: dw: use parity8 helper instead of open coding it
Date: Tue,  7 Jan 2025 10:02:01 +0100
Message-ID: <20250107090204.6593-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
References: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
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


