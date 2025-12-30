Return-Path: <linux-renesas-soc+bounces-26194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8A2CE9E1A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 15:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09307301EF8D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 14:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53099230BEC;
	Tue, 30 Dec 2025 14:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="h1gHOzwt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB20B23EAAD;
	Tue, 30 Dec 2025 14:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767103859; cv=none; b=X/Gh4vxUxZzhZ8MRBKxiq3eyFMaKFsfO4o/NCpwqPXZ7FZ8T+54Mri18ZnbEZhVlKTJZRBWmnHuE166htqbFdr2Di3dpVXKLkixfkiWEdFNomgB+YJp2TLQtXTpiqepkHMC5go+8+vz3+viT9iM495ozyBVnizu8B8u3VdodceQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767103859; c=relaxed/simple;
	bh=wrJwLJQvSWH7TiEuJKh8CnxLJmnN9SkHl28E2/NoZ68=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OB6F74sF/N6rMDEKq4DWSz2P6oJ6D/qDx6Ytp4mqD7+8i+z05pWEjAjlG+3uWx+te9cU9Khva5jHIzDTDSil4NPPMf0aYp4pOHCuY0fvj1LC6pWWBIURs45vaca7e19eDI/GxQSUuA1C0l7Bie0id235UQ/ALGUErZdbcd4bH5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=h1gHOzwt; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JUQCdhyqa1/3bZomRbu2t/WU5oAGOwDFR5E9voRpuJU=;
  b=h1gHOzwtlwpnCD2M+OB27XRMZOHYbGXSCLnl8wymsL3U5l3puFPDeUNJ
   5fk1fjCDO83qU9A2KwRqgh5WMCtmO6I6kxwBE3MmRmI93yVPdwOAAvvBc
   ZnUFdQnzebn7SCNjYNXqcXWv/u6f8VhSvHr5v86iNrWOZF1Kr+2/vUuBY
   Y=;
X-CSE-ConnectionGUID: aCmhUqSRQAutl/S4pg/3BA==
X-CSE-MsgGUID: KN80KtU2QViOFQ7xjWTc3g==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.21,189,1763420400"; 
   d="scan'208";a="134749896"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.102.196])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 15:10:55 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Vinod Koul <vkoul@kernel.org>
Cc: yunbolyu@smu.edu.sg,
	kexinsun@smail.nju.edu.cn,
	ratnadiraw@smu.edu.sg,
	xutong.ma@inria.fr,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: renesas: phy-rcar-gen2: fix typo in function name reference
Date: Tue, 30 Dec 2025 15:10:50 +0100
Message-Id: <20251230141050.93856-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace cmpxcgh by cmpxchg.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/phy/renesas/phy-rcar-gen2.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen2.c b/drivers/phy/renesas/phy-rcar-gen2.c
index c0221e7258c0..08d36e6eabcd 100644
--- a/drivers/phy/renesas/phy-rcar-gen2.c
+++ b/drivers/phy/renesas/phy-rcar-gen2.c
@@ -85,7 +85,7 @@ static int rcar_gen2_phy_init(struct phy *p)
 	 * Try to acquire exclusive access to PHY.  The first driver calling
 	 * phy_init()  on a given channel wins, and all attempts  to use another
 	 * PHY on this channel will fail until phy_exit() is called by the first
-	 * driver.   Achieving this with cmpxcgh() should be SMP-safe.
+	 * driver.   Achieving this with cmpxchg() should be SMP-safe.
 	 */
 	if (cmpxchg(&channel->selected_phy, -1, phy->number) != -1)
 		return -EBUSY;


