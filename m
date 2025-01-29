Return-Path: <linux-renesas-soc+bounces-12686-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ACCA21A5B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 10:51:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC66B1888A27
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 09:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F44A1AF0AF;
	Wed, 29 Jan 2025 09:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iWqVy3q/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E831ACEB0;
	Wed, 29 Jan 2025 09:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738144263; cv=none; b=caqIjM24bmSzUXWEHxoRIheFDKTEL6hAmVIdzArBNVxS/uratczSJD/xJjR/djqlJIQ5ImQk2W2DdOWW3PLF4hwB0kiIBC8qWyCkGfoDNJUWnZUj0owMZlRrSqUo6Gx5pPIIrTHSMpwJdYIhMklWDcNzSspAojxZails828vmhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738144263; c=relaxed/simple;
	bh=hNj0KTQiQRPifcOXgKJcVQhvAAgNOIdzYO1GdK67pbU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=anCLBl9Y6oUy5Egh8y+uii48D1mzjUHZBp8DiLWnvdYD6+J8HA0Hfw0LVoVAEQ305XxhtklA+tRuW74tVH9q/MRTnQfjv7oAIa7M6azti4xT3c7yWos2QW2weeKR1dBwoKFGTUrqyAfOpNhVLN1UsneeAE10GA4C72lAYCPReDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iWqVy3q/; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D65BB42D46;
	Wed, 29 Jan 2025 09:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738144258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=55fhWacHtHSPd/jKVDQYfpPChrRHnuj16fxXinODQ4Q=;
	b=iWqVy3q/FPpg026T1czHN5Jx/9LBYB/fV2XDtBGT2/3nSml8tYdmOCditSEq4RssGs6bkr
	2WBIa5qweKLCwiidku5Y6PhGXjOFR3NRl/Q6arvbHJABCAj/xP7Pyp0cnfQsY31IFnvq89
	aKCs5sf/wyfyFT85yinBLTLpMjlQawYXkiaI2hfVxRomd7gyoXJLxSiK5Vgo3wwpBoVYzW
	iH5z70vyIofh86S5QgD2CQIWxz86gsKw4S8czAVsL4XTKaFQAt24Wyw+DS61mmnaZPanU5
	3dGN6ImhVUzny3ooLk0bMMj6nF7YvGsXm1o9o89InQL3f/426bUEbIvYaarflw==
From: Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH net v3 0/2] Fix missing rtnl lock in suspend path
Date: Wed, 29 Jan 2025 10:50:45 +0100
Message-Id: <20250129-fix_missing_rtnl_lock_phy_disconnect-v3-0-24c4ba185a92@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPX5mWcC/5WPyw7CIBBFf6VhLQZoWtGV/2EMKa92YoUGCLFp+
 u8SVrrT5Z2bOSd3Q9EEMBFdmg0FkyGCdyW0hwapaXCjwaBLRoywjlDGsIWXeEKM4EYRkpvF7NV
 DLNMqNETlnTMqYauo7m2n5Yl0qKCWYMpf1dyQMwndy3GCmHxYqzrTWv1nyRQTzJU8295ybjW9S
 u/TDO6o/LMqMvvEtj9iWcGanpGyoCNcDt/Yfd/fkBI9hjYBAAA=
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduhfevudetfffgkedvhfevheeghedtleeghfffudeiffefvdehfeegieeivdekteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudehpdhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrrdhujhessghprdhrvghnvghsrghsrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrsggrrhhkvghrrdgtthessghprdhrvghnvghsrghsrdgtohhmpdhrt
 ghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com

Fix the suspend path by ensuring the rtnl lock is held where required.
Calls to open, close and WOL operations must be performed under the
rtnl lock to prevent conflicts with ongoing ndo operations.

Discussion about this issue can be found here:
https://lore.kernel.org/netdev/20250120141926.1290763-1-kory.maincent@bootlin.com/

While working on the ravb fix, it was discovered that the sh_eth driver
has the same issue. This patch series addresses both drivers.

I do not have access to hardware for either of these MACs, so it would
be great if maintainers or others with the relevant boards could test
these fixes.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Changes in v3:
- Move back to first version of ravb fix.
- Remove the duplicate of the if condition in ravb fix.
- Link to v2: https://lore.kernel.org/r/20250123-fix_missing_rtnl_lock_phy_disconnect-v2-0-e6206f5508ba@bootlin.com

Changes in v2:
- Move the rtnl_lock before ravb_wol_setup() and ravb_wol_restore()
  instead of before the if condition.
- Link to v1: https://lore.kernel.org/r/20250122-fix_missing_rtnl_lock_phy_disconnect-v1-0-8cb9f6f88fd1@bootlin.com

---
Kory Maincent (2):
      net: ravb: Fix missing rtnl lock in suspend/resume path
      net: sh_eth: Fix missing rtnl lock in suspend/resume path

 drivers/net/ethernet/renesas/ravb_main.c | 22 ++++++++++++++--------
 drivers/net/ethernet/renesas/sh_eth.c    |  4 ++++
 2 files changed, 18 insertions(+), 8 deletions(-)
---
base-commit: 05d91cdb1f9108426b14975ef4eeddf15875ca05
change-id: 20250122-fix_missing_rtnl_lock_phy_disconnect-fc1d6f5db705

Best regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


