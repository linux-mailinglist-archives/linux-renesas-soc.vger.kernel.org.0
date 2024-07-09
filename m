Return-Path: <linux-renesas-soc+bounces-7183-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 107DB92AE34
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 04:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E390BB21435
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 02:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35657364AB;
	Tue,  9 Jul 2024 02:36:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FCE2AE68;
	Tue,  9 Jul 2024 02:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720492562; cv=none; b=OgRKehShNu/RjpW4k+ViUGp6DpsfvIZpyAh8y9+C4ru1VnbCGV8X11NdjVbwoxvm1+zIBBC5wW5glcO3pz6bK0ycoXZ6tB0OsYFKvAmVksJKj16JL6rqT6PUVKxEpzyPIIq9yhcoo0rTaRv76JBpwwPqELyWG7v/AzEsVkufu8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720492562; c=relaxed/simple;
	bh=9GUoPyrZ6aOv0JvM77wlgJGFltKoqqcz93uQFR4w8TI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Xny2CiQbHIjlmRZRs1CXsawe9r+9A8KFdpySzPGeP/wIDCxnrjYv/V98tXbRpFkD89gdBemSC1ATnAiJIOOM1P+8mjovAuaz5N10JwQcSzV4kpgCmM0zswWZi5JLyUggI0/5d1y3FziaoUzOT2xfdZRZHoJLprG2IalVHLAmvXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,193,1716217200"; 
   d="scan'208";a="214695286"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 Jul 2024 11:35:58 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id F173D4140BEF;
	Tue,  9 Jul 2024 11:35:57 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/5] scsi: ufs: renesas: Refactor code for other UFS controller
Date: Tue,  9 Jul 2024 11:35:45 +0900
Message-Id: <20240709023550.1750333-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current UFS controller of R-Car S4-8 ES 1.0 only requires statical values
for initializing it. However, other UFS controller (R-Car S4-8 ES 1.2) will
require dynamic values like eFuse values. So, refactor the code for it.
For now, readling eFuse values function which Geert-san made is under
review [1]. So, this patch series refactors is the code only.

[1]
https://lore.kernel.org/all/cover.1716974502.git.geert+renesas@glider.be/

Changes from v1:
https://lore.kernel.org/all/20240708120931.1703956-1-yoshihiro.shimoda.uh@renesas.com/
 - Combine the declaration and assignments into a single statement in patch 1/5.
 - Fix build error when only the patch 1/5 is applied.
 - Further refactoring the code by removing a helper function, not only using
   udelay() directly in patch 3/5.
 - Rename some functions to s/ufs_renesas_param_/ufs_renesas_/.

Yoshihiro Shimoda (5):
  scsi: ufs: renesas: Refactor init code for other UFS controller
  scsi: ufs: renesas: Remove a static local variable
  scsi: ufs: renesas: Remove a register controll helper function
  scsi: ufs: renesas: Refactoring specific PHY settings of 0x10a[df]
  scsi: ufs: renesas: Add reusable functions

 drivers/ufs/host/ufs-renesas.c | 525 +++++++++++++++------------------
 1 file changed, 237 insertions(+), 288 deletions(-)

-- 
2.25.1


