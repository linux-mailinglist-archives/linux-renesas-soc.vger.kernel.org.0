Return-Path: <linux-renesas-soc+bounces-12340-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 684A6A19654
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 17:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5590816C337
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 16:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA95C21504A;
	Wed, 22 Jan 2025 16:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UobflmCR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9047F214A78;
	Wed, 22 Jan 2025 16:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737562787; cv=none; b=qFIQkhGAAS7/abGruSACmaEkZpuSF809smv28wsseqmLXx7c2bFRo5dtcktArilh04OS59RfilT+4RamB7gDpff9zheeXyVgzaoyo+k40LQkn7LhPNCRLrastX+x4hwQZkg68mKS6hZyiNGSXD++n8Q9gukzT+EjLXKWfD6+GOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737562787; c=relaxed/simple;
	bh=7CNsQ80LZVw9IoDMMnVfyIz2uDFTInZGLzFYz+F0bNM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ki5RLJCQMm3ipyQaf/y5CDzSgIO1jJ9sGHf7vWpUeCahidRQ/iU31GD/JJqXybj2DEijfXhMmgpPPI7N6wIK9rTxcSuWAlyMpQySLuvBRCYgaSzqkf15OkcVTrG96mj9+qAKX/6UtueKcDQVtQeltoPeIrx9zr89WYMZmzcsd+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UobflmCR; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95E752000D;
	Wed, 22 Jan 2025 16:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737562778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BaNeaxo/EXydVKaUh75bYjXQwd6aUYDYIH7Dt+yJ8Pg=;
	b=UobflmCReyqT3rtzXHkILvPtITOis36/jEp10bDQU6C3SNPdQL1JDSFgsxm0M0hf3BPMDD
	2J99CRSncP+ktkMB1no6GqEGJejY7TQzLB/oDXuqLcKJ6UGXK+yJVjpOy9eqJCjtYgGzfc
	iaD/3fvFgfI3QYkMnEiuO1E0LvIYoZ/GtBgL+FW2HVa9HS3r91xcIZfGL2GEisMmCcUUS4
	2Lv/T7AMtQYt6EypRFlUM80ifGBp7M23lVieMBM/90QWmnDLbS1ra3tIgydp1+r+aVkwjk
	8H7qsmFYB4/WjK6ZWMLjQvYLuEUH4aBPBlM6iXKeBsstEJ+Q9adBS2TblrkPyw==
From: Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH net 0/2] Fix missing rtnl lock in suspend path
Date: Wed, 22 Jan 2025 17:19:27 +0100
Message-Id: <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-0-8cb9f6f88fd1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAI8akWcC/x2NQQrDIBAAvxL2XEEFU+hXSpF2XZOl6RpcCS0hf
 6/kOIeZ2UGpMinchh0qbaxcpIO7DIDzUyYynDqDtz5Y573J/I0fVmWZYm2yxKXgO67zLyZWLCK
 EzWR0acwhva42QE+tlbp3bu4g1OBxHH+4jmBCewAAAA==
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
 Kory Maincent <kory.maincent@bootlin.com>
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
Kory Maincent (2):
      net: ravb: Fix missing rtnl lock in suspend path
      net: sh_eth: Fix missing rtnl lock in suspend path

 drivers/net/ethernet/renesas/ravb_main.c | 19 +++++++++++++++----
 drivers/net/ethernet/renesas/sh_eth.c    |  4 ++++
 2 files changed, 19 insertions(+), 4 deletions(-)
---
base-commit: b1754a69e7be48a64b3cdb0df60a96d97959da73
change-id: 20250122-fix_missing_rtnl_lock_phy_disconnect-fc1d6f5db705

Best regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


