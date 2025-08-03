Return-Path: <linux-renesas-soc+bounces-19951-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 694A9B19572
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Aug 2025 23:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0938A189341E
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Aug 2025 21:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940DE1078F;
	Sun,  3 Aug 2025 21:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jLGCNK/1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF364EEA6
	for <linux-renesas-soc@vger.kernel.org>; Sun,  3 Aug 2025 21:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754255595; cv=none; b=b78C1gMvXpGr7wvKzbTS/A0cE9lqFSf2B5H2h1mkDdCvDg3zMYt/3KddRIQF25q3ot7lqOr72buoMYWl/TA02l3vJguiCkibC4Yg1jV4s0PkKFA/E4Os0khv8eqoiz4VXcjAX22S3eETmNYC6s3+gsjHSUhRQShM20Ss8sp5LM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754255595; c=relaxed/simple;
	bh=Jl8n8QshAmQCvRvO91A3VN5DtXtEIJ99q9ia7L1qezw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LEmfEZ6OUUsR4lMRbYdM/BJCut/SNo7G+m/r4hlyaPzxP1Hq2hxomrOkQsg6s8FR8CNN5pOlhtTPtMEbhcCDED3RZnU0vy5ZhuA3JUsA9V4Igv8CtY9TjMMrgTX0t40iK17iGXhwdM3mCiYX1o1AX7gAyM8j+k1EqCkMK61sFnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jLGCNK/1; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=IMz6qALhfrcjJq
	J5FJBc1SrL8IelYDvgWwujMn3maHk=; b=jLGCNK/1kIggt0ya/OigdWnMD6UhU6
	GsCENvy3TCIPn+ITsFO0qTeOLiuQoMooH4N6gpjP5zgDuLWRowK0NFv9Z+j1w9eh
	vFx7StWDIuamd8KQ13IywfnMKyGnq4sN89tr6pjmubglEKEa43G5T4zje2a1HnDM
	pS1HCqPJk+j5EuB1wBfbL/NU3I6xW+Elkls/RXG4Z7I9Rx7dlKEdgbmTRJ43WqYD
	X7WAKNZSKyn4JkmMvKs3dTPlb40i08/j/FfuLupN1BtlbzZt6QwtiBN500QjYa6f
	y3HAsIW/56wFm+CXs/24kCcwvuG/6Kj2t37dmYuFUzBa97uQ1meO8lEw==
Received: (qmail 1653775 invoked from network); 3 Aug 2025 23:13:10 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Aug 2025 23:13:10 +0200
X-UD-Smtp-Session: l3s3148p1@bupMdXw7dIcujntd
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: renesas: Simplify return statement in 'renesas_i3c_daa'
Date: Sun,  3 Aug 2025 23:12:57 +0200
Message-ID: <20250803211256.18513-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There was already a bail out for 'ret < 0', so we can always return
success at the end of the function.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/aIyzJ7HOENL1qp1l@stanley.mountain
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/master/renesas-i3c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 174d3dc5d276..275f7b924288 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -679,7 +679,7 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 			i3c_master_add_i3c_dev_locked(m, i3c->addrs[pos]);
 	}
 
-	return ret < 0 ? ret : 0;
+	return 0;
 }
 
 static bool renesas_i3c_supports_ccc_cmd(struct i3c_master_controller *m,
-- 
2.47.2


