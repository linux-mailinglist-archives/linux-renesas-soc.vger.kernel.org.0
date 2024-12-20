Return-Path: <linux-renesas-soc+bounces-11637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 387489F9162
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 12:32:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEEF616C37F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 11:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41C71C5F39;
	Fri, 20 Dec 2024 11:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kwlhKMAN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817ED1C5F03
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 11:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734694231; cv=none; b=ub26slQMZtq1iRhU3DYLKnS4opHpv4ENPAl9M4g3wrU6Yopp4OPete3hq5EDVI/HBpvLHgWNstgVu7iSdf350UyXOwh9BahjSc75/s0vIJaPlKS/es6bmrXPqOkOlQgbJgE0l4FCq8eUnp6aan1CIo4f/PofCoTUvbjSZG76NmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734694231; c=relaxed/simple;
	bh=+r130rckWcX6jYdn+Ln3jDvzy6JOxhEl+3WKkuSt1qw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n/lJXNIRgBQJexpAZC7tB39rFXXEnRrNg5MiWEbyjkeVNFwXgOjRKTdCfzATIPUPPbKSoHs1VYnrwtF1g7hlaC2NpMwuk+NFsfzS2KwyJ4tOqsiu9w9krgrDvusfPoUDNWjGHkqqahAxZkbu6TTCyvdhrtAxtXV+5voo9zY0tFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kwlhKMAN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=JTVYffu7bObqCnm7BryRbyhmBYXN9UAwW1f5OWePOno=; b=kwlhKM
	AN3DbBvDjh703OIGKen6f2vvMi0WWJR+pV3xIf5N3tjLc9GN9hrflnww6AKhLtR3
	tuhnlxFnb0DP2HEe/ikJMnYxuSCZNYnpEZiro5fm1+goDLf7Lqt8xypxv08XWBeD
	b1XMWwe/3ktGrHppyVnBW+MI0ysPYkJ43l68koEe2dJkHfqzV0d/hO93Rtsa3AaW
	GSWPE23CNwgiLT/F33nTB4oSTuuWRnr/PEJmFN+ZXjwfixpXwobiOi+RjVEDyGrL
	voVKiW2CXx1KRcO7AmEzxkqOScfV9Gr/xipmdPj9nQB3PLk7mWknVJQ+j7QzVrA2
	pKn7FyPtdx3tf85g==
Received: (qmail 989755 invoked from network); 20 Dec 2024 12:30:20 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 12:30:20 +0100
X-UD-Smtp-Session: l3s3148p1@NOjP+LEpDJ8ujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH RFT 3/5] i3c: dw: use get_parity8 helper instead of open coding it
Date: Fri, 20 Dec 2024 12:29:57 +0100
Message-Id: <20241220113000.17537-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241220113000.17537-1-wsa+renesas@sang-engineering.com>
References: <20241220113000.17537-1-wsa+renesas@sang-engineering.com>
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
index d4b80eb8cecd..a6d7fade5007 100644
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
+		ret |= get_parity8(ret) ? 0 : BIT(7);
 
 		writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(ret),
 		       master->regs +
-- 
2.39.2


