Return-Path: <linux-renesas-soc+bounces-12409-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4525A1A842
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 18:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A95D1188C12D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 17:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1897145B39;
	Thu, 23 Jan 2025 17:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jklwZC7V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D13137776;
	Thu, 23 Jan 2025 17:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737651610; cv=none; b=lPcbLz4sThmbuip0eI9IAIebhmz6BUI43mkaiTSwv/ipIYkmf32ZotKWhVYAbp8JFcHgPlmywy0+vpu04ts3zIEvjQYdU1jrqXNg+OYuFHcUQFJJXYwOteKZG7K7tnBMGIJoViDST2ia5nuZzDAaziR//YblKGiQlwhXDdi1vrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737651610; c=relaxed/simple;
	bh=gRogZkN/ZYeW7ugpdxEbqxuwqT+k60xHmTHVdfKjKmM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZFyoqWfx5Ggym/8wKRJMX87sfoAS3L4/QDmdskskJ11gxHHXUVotLmKKTivfv1HqMe43yak3f9U0IEhit4pCl5TkN90OBdpWlJr1PG5AZnqVQA8MubiRyCGSQo3XA+RJVyTT5VF9VjXEoMK3nYg8qU0OAGuKM/GLMNrQurJMiKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jklwZC7V; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53FC21BF203;
	Thu, 23 Jan 2025 17:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737651606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iR72WWfQooPYRih8ekKDUZx/ywzZWW2vIvazDAUGnoE=;
	b=jklwZC7Vl53FEx06CFIRti7QWyhdv6htKmDJelajqEb1WK5R1J2ZmjoscXN0uhmkZ3fQAZ
	WeWXvpanga73wpS+eHjlggI+kcEj7bf9iNVVFdXGlTEkTX7BqBXL6q1bt80M7iUtuPVQ0A
	Ill64DLz+Glb4e0d2c0bqJh+N5tdd90H/HrMqF85vzEwhrkbv2t4dbrQTxg3wcyXRg25pQ
	NxgMBTJDj2frUhXiZad1wgiNvWjWauBGtKN8Woss+N3SbXW6ENo2f0xJANPe0+Gn5qi1iI
	fsJDa8SamazRemeCemBC80phIet6it5Yo1so/DJ+KLqE0w01NX6BaaZWHIeioQ==
From: Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH net v2 0/2] Fix missing rtnl lock in suspend path
Date: Thu, 23 Jan 2025 17:57:59 +0100
Message-Id: <20250123-fix_missing_rtnl_lock_phy_disconnect-v2-0-e6206f5508ba@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABd1kmcC/5WNXQqDMBCEryL73JQkoLV96j2KhJofXaobyQapi
 Hdv8AZ9/GaY+XZgn9AzPKodkl+RMVIBfanAjm8avEBXGLTUtVRai4BfMyMz0mBSpslM0X7MMm7
 GIdtI5G0WwSrXhNr1N1lDuVqSL7tT8wLyGboSjsg5pu1Ur+qs/rOsSkjR2v4emtC2walnH2Oek
 K42ztAdx/EDswiyNd8AAAA=
To: Paul Barker <paul.barker.ct@bp.renesas.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, 
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, netdev@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kory Maincent <kory.maincent@bootlin.com>, 
 Sergey Shtylyov <s.shtylyov@omp.ru>
X-Mailer: b4 0.14.1
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
Changes in v2:
- Move the rtnl_lock before ravb_wol_setup() and ravb_wol_restore()
  instead of before the if condition.
- Link to v1: https://lore.kernel.org/r/20250122-fix_missing_rtnl_lock_phy_disconnect-v1-0-8cb9f6f88fd1@bootlin.com

---
Kory Maincent (2):
      net: ravb: Fix missing rtnl lock in suspend path
      net: sh_eth: Fix missing rtnl lock in suspend path

 drivers/net/ethernet/renesas/ravb_main.c | 14 ++++++++++++--
 drivers/net/ethernet/renesas/sh_eth.c    |  4 ++++
 2 files changed, 16 insertions(+), 2 deletions(-)
---
base-commit: b1754a69e7be48a64b3cdb0df60a96d97959da73
change-id: 20250122-fix_missing_rtnl_lock_phy_disconnect-fc1d6f5db705

Best regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


