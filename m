Return-Path: <linux-renesas-soc+bounces-12687-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 517E8A21A60
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 10:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 098881888BEC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 09:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723C41B043F;
	Wed, 29 Jan 2025 09:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mI4suG2p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1571ACEB7;
	Wed, 29 Jan 2025 09:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738144264; cv=none; b=mwWxrqgIazza8et2PJXrfc5MBxdJyOTBfkPuCE2JZQ+lg36yqibrsunRChuKIt9BhqBYtvkBhQJlxIGhcDP1zcLvHGT+QitHxFI0t2FQH1x4Lg9COA3fI2wBTJAyKzJMwpGaISUStmuL1HDDtkVy1SVFFEWikJJ2LKLGmTl2lmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738144264; c=relaxed/simple;
	bh=LFoNR57kERcXzPXyALKXnVrKZ9qSOpABs0qd6fo3wK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a8FtXq9YIsM29EJub5WELTHmeXhOb6YqAi89C4lBTDu0L31U+tvyn8bB8/SP8KcSbgqr/5f4CaEj5orbI7Qp30daA4kB3TmIyvB2UO8gtnnLEUxVr1UbDNTqNwZJsJWvjBWKlwzeYV7Bm/eYT/ROnh0GVyjd2zh3BdDimK2ODgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mI4suG2p; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1B9F4314D;
	Wed, 29 Jan 2025 09:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738144259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6widl6lirSyGjz3M70b3gYYXZvSmR+KuRPDwfXClzIo=;
	b=mI4suG2prn4Cr3vZ4QWBmt8JxZfuOUSPufJ+86fP0AvoZxduNz5Q2ZDcY5wE1JV7lers7O
	qm6eIBzGOKC5aKrDX7Z07/vM8qF8AvMKxOpscNJjDnQz+5zWhxHqTCQi6DF4I9teLf4TXk
	RsUus+yhzUzdB5ytB9k18HBpeBHaspFBoMLsRmjdcWxWvsokILk10+nJlNoXo1bBPTfCxT
	x0c6ndPq6V2gDBa4JIn9YPOxa01NKqfgvpm5DnNqIluaJjLYzshzZ4Y8R0nzxfR8XXf0pM
	rcY/O3SQhcws7FtJ17I51VjSf3WMGHb4HfJR+93fQT//KNv+YrRnFJBnTQoDdg==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Wed, 29 Jan 2025 10:50:46 +0100
Subject: [PATCH net v3 1/2] net: ravb: Fix missing rtnl lock in
 suspend/resume path
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-fix_missing_rtnl_lock_phy_disconnect-v3-1-24c4ba185a92@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffjefgieevkeelheffvdethfduvddugfeiueeugfduffekuefhtedtteeggfefudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudehpdhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrrdhujhessghprdhrvghnvghsrghsrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrsggrrhhkvghrrdgtthessghprdhrvghnvghsrghsrdgtohhmpdhrtghpthhtohepkhhusggrs
 ehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com

Fix the suspend/resume path by ensuring the rtnl lock is held where
required. Calls to ravb_open, ravb_close and wol operations must be
performed under the rtnl lock to prevent conflicts with ongoing ndo
operations.

Without this fix, the following warning is triggered:
[   39.032969] =============================
[   39.032983] WARNING: suspicious RCU usage
[   39.033019] -----------------------------
[   39.033033] drivers/net/phy/phy_device.c:2004 suspicious
rcu_dereference_protected() usage!
...
[   39.033597] stack backtrace:
[   39.033613] CPU: 0 UID: 0 PID: 174 Comm: python3 Not tainted
6.13.0-rc7-next-20250116-arm64-renesas-00002-g35245dfdc62c #7
[   39.033623] Hardware name: Renesas SMARC EVK version 2 based on
r9a08g045s33 (DT)
[   39.033628] Call trace:
[   39.033633]  show_stack+0x14/0x1c (C)
[   39.033652]  dump_stack_lvl+0xb4/0xc4
[   39.033664]  dump_stack+0x14/0x1c
[   39.033671]  lockdep_rcu_suspicious+0x16c/0x22c
[   39.033682]  phy_detach+0x160/0x190
[   39.033694]  phy_disconnect+0x40/0x54
[   39.033703]  ravb_close+0x6c/0x1cc
[   39.033714]  ravb_suspend+0x48/0x120
[   39.033721]  dpm_run_callback+0x4c/0x14c
[   39.033731]  device_suspend+0x11c/0x4dc
[   39.033740]  dpm_suspend+0xdc/0x214
[   39.033748]  dpm_suspend_start+0x48/0x60
[   39.033758]  suspend_devices_and_enter+0x124/0x574
[   39.033769]  pm_suspend+0x1ac/0x274
[   39.033778]  state_store+0x88/0x124
[   39.033788]  kobj_attr_store+0x14/0x24
[   39.033798]  sysfs_kf_write+0x48/0x6c
[   39.033808]  kernfs_fop_write_iter+0x118/0x1a8
[   39.033817]  vfs_write+0x27c/0x378
[   39.033825]  ksys_write+0x64/0xf4
[   39.033833]  __arm64_sys_write+0x18/0x20
[   39.033841]  invoke_syscall+0x44/0x104
[   39.033852]  el0_svc_common.constprop.0+0xb4/0xd4
[   39.033862]  do_el0_svc+0x18/0x20
[   39.033870]  el0_svc+0x3c/0xf0
[   39.033880]  el0t_64_sync_handler+0xc0/0xc4
[   39.033888]  el0t_64_sync+0x154/0x158
[   39.041274] ravb 11c30000.ethernet eth0: Link is Down

Reported-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Closes: https://lore.kernel.org/netdev/4c6419d8-c06b-495c-b987-d66c2e1ff848@tuxon.dev/
Fixes: 0184165b2f42 ("ravb: add sleep PM suspend/resume support")
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Changes in v3:
- Move back to first version of ravb fix.
- Remove the duplicate of the if condition.

Changes in v2:
- Move the rtnl_lock before ravb_wol_setup() and and ravb_wol_restore()
  instead of before the if condition.
---
 drivers/net/ethernet/renesas/ravb_main.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index bc395294a32d..c9f4976a3527 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -3217,10 +3217,15 @@ static int ravb_suspend(struct device *dev)
 
 	netif_device_detach(ndev);
 
-	if (priv->wol_enabled)
-		return ravb_wol_setup(ndev);
+	rtnl_lock();
+	if (priv->wol_enabled) {
+		ret = ravb_wol_setup(ndev);
+		rtnl_unlock();
+		return ret;
+	}
 
 	ret = ravb_close(ndev);
+	rtnl_unlock();
 	if (ret)
 		return ret;
 
@@ -3245,19 +3250,20 @@ static int ravb_resume(struct device *dev)
 	if (!netif_running(ndev))
 		return 0;
 
+	rtnl_lock();
 	/* If WoL is enabled restore the interface. */
-	if (priv->wol_enabled) {
+	if (priv->wol_enabled)
 		ret = ravb_wol_restore(ndev);
-		if (ret)
-			return ret;
-	} else {
+	else
 		ret = pm_runtime_force_resume(dev);
-		if (ret)
-			return ret;
+	if (ret) {
+		rtnl_unlock();
+		return ret;
 	}
 
 	/* Reopening the interface will restore the device to the working state. */
 	ret = ravb_open(ndev);
+	rtnl_unlock();
 	if (ret < 0)
 		goto out_rpm_put;
 

-- 
2.34.1


