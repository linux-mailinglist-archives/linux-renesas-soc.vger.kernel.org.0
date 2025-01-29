Return-Path: <linux-renesas-soc+bounces-12688-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA0FA21A63
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 10:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 333C81888D52
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 09:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152FA1B4246;
	Wed, 29 Jan 2025 09:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MclPon4d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002B51ACEC2;
	Wed, 29 Jan 2025 09:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738144266; cv=none; b=ru/2DP9kIS2JhPT5NNrBDr1PddUXCzhZF7U7E00tvtUj1CXBhW8q5U/Y3RMUxfh2/rbPnYVMsxXYbYr+Kp4eS/1pyY3Gq6k+1T1SVtSfnKnIqAlqaHu6QpGvXPxTRRld4Yvrpn3a476s2QhZHL+3uHs80x2j8aYHqREWYywT9yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738144266; c=relaxed/simple;
	bh=WJIOirS4NfRBxnd17RVtI7uhPHobYgknVkBuym75zXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JGZi2i4jL/HfNWbrK3vr1eXPvuqHpkdHflcopdBM+Jz89p56bJTldibf40FzXlD5DlAsk/f8Ds28wX/XjIZ+JlQNSET1RGAg5LDyvEsyvtUBjtPzta5H2CuQNl33U/E+hqIGlBJjff/GC9L26Mf+rGnxg30ZxMEJiiqNhh9sUIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MclPon4d; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A837443160;
	Wed, 29 Jan 2025 09:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738144260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dCT7Wfx+rQPn7xMLFJVZnOU4kMMXieZuPB/RHqItue0=;
	b=MclPon4dJkNH3qvR4z68NE4/KkdVRi9AOu9BKenUOt5J30TbkCvoi03yvPe044tuSTSvjP
	bZWw7cbYtREw///V2ZWnoHkN52YeK3qIsxT57m5R5MLgql0pYh47I8jOqvA9x/A76ojrZO
	LRKPn4Pww6A2jXmwhNptKCetHSL9A/ypILmNL4bbFRyRtRco+lKq2N7zfzOW5PS9v+aeUX
	zgGNYCVoU5/iWX9Lb84sulOUxVpCKQgoL2j+Lg7XuHAdUJIb1m4BdGpz+x4xsXT6cB33EX
	MptF0xFzIWelsQ1aSy2D1JGSECC4NiY8w1zTma1S2PQUOW7H3FgHi7y45CCW/g==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Wed, 29 Jan 2025 10:50:47 +0100
Subject: [PATCH net v3 2/2] net: sh_eth: Fix missing rtnl lock in
 suspend/resume path
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250129-fix_missing_rtnl_lock_phy_disconnect-v3-2-24c4ba185a92@bootlin.com>
References: <20250129-fix_missing_rtnl_lock_phy_disconnect-v3-0-24c4ba185a92@bootlin.com>
In-Reply-To: <20250129-fix_missing_rtnl_lock_phy_disconnect-v3-0-24c4ba185a92@bootlin.com>
To: Paul Barker <paul.barker.ct@bp.renesas.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, netdev@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeikefgjedvkedugfeiheffgeeflefgteduleeuvdeitdfgtddvleetieekffffkeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduhedprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgdruhhjsegsphdrrhgvnhgvshgrshdrtghomhdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdgsrghrkhgvrhdrtghtsegsphdrrhgvnhgvshgrshdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepn
 hhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhm
X-GND-Sasl: kory.maincent@bootlin.com

Fix the suspend/resume path by ensuring the rtnl lock is held where
required. Calls to sh_eth_close, sh_eth_open and wol operations must be
performed under the rtnl lock to prevent conflicts with ongoing ndo
operations.

Fixes: b71af04676e9 ("sh_eth: add more PM methods")
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 drivers/net/ethernet/renesas/sh_eth.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index 8887b8921009..5fc8027c92c7 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -3494,10 +3494,12 @@ static int sh_eth_suspend(struct device *dev)
 
 	netif_device_detach(ndev);
 
+	rtnl_lock();
 	if (mdp->wol_enabled)
 		ret = sh_eth_wol_setup(ndev);
 	else
 		ret = sh_eth_close(ndev);
+	rtnl_unlock();
 
 	return ret;
 }
@@ -3511,10 +3513,12 @@ static int sh_eth_resume(struct device *dev)
 	if (!netif_running(ndev))
 		return 0;
 
+	rtnl_lock();
 	if (mdp->wol_enabled)
 		ret = sh_eth_wol_restore(ndev);
 	else
 		ret = sh_eth_open(ndev);
+	rtnl_unlock();
 
 	if (ret < 0)
 		return ret;

-- 
2.34.1


