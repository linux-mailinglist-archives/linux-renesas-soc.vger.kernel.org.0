Return-Path: <linux-renesas-soc+bounces-18014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3382EAD2EAE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 09:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC82E189181D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 07:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F1427F170;
	Tue, 10 Jun 2025 07:31:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FECB1D5CC7;
	Tue, 10 Jun 2025 07:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749540667; cv=none; b=MBis1/dHTbb45DAUyo0GM7ixTXQHoDSOkXj2VJDcK8GBIrIbWtnB/f2pCqsCGl5YgnPFg7FYhxKllaNs3fNLmgwbeA2OcR4hJ1I2FbxkWkSAaseiVkCZnC9e0+E9N4B05ZWSaDpebzFx7Cf/wJ65/h7cUFK812o1UPxYVjAHTfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749540667; c=relaxed/simple;
	bh=26tVSt8f1MPboWi2tg6Yi62RNxnrigzIO/5t6WjgNCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BfcE87nUzbUFhwhW0yl1EzPi3seigoGiSTwwoafi2Kh0N2WbYWK0M47LCRwYs+5PI2pRe+yH1Cfg68Tg3r8QJvZp6zjj8gLDF9t6Nq+gHEpvfwCExRCbRT09qg+IdmKWvL6gl8jJRhIyfKXC8yXtpLxxJ+F509XBXfkyYbk/VgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: HIP4XrZEQhWoRIC3hI4bUQ==
X-CSE-MsgGUID: e8tAcXgCRFOnvEF+HnXbiA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Jun 2025 16:25:54 +0900
Received: from shimoda-ggear.. (unknown [10.166.13.45])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E37414178CC8;
	Tue, 10 Jun 2025 16:25:54 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: wsa+renesas@sang-engineering.com,
	ulf.hansson@linaro.org
Cc: linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] mmc: host: renesas_sdhi: Fix incorrect auto retuning for an SDIO card
Date: Tue, 10 Jun 2025 16:25:43 +0900
Message-ID: <20250610072545.2001435-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This host controller is possible to change incorrect tap if an SDIO
card is used because DAT1 is used for interrupt signal on SDIO standard
but the contoller doesn't take care of it. So, in the worst case,
this behavior causes a CRC error.

To resolve the issue, add some new ops into the tmio core and
add fixed code into the renesas_sdhi driver.

This patch set tested on RZ/G2M (r8a774a1-hihope-rzg2m-ex.dtb) with
EmbeddedArtists 1ZM module.

Before I don't apply this patch set, the RVSCNTL value was changed
unexpectidly like below.

[  687.103589] renesas_sdhi_internal_dmac ee100000.mmc: renesas_sdhi_auto_correction: rvscntl = 00000701
...
[  768.490979] renesas_sdhi_internal_dmac ee100000.mmc: renesas_sdhi_auto_correction: rvscntl = 00000501
[  768.500307] renesas_sdhi_internal_dmac ee100000.mmc: renesas_sdhi_auto_correction: rvscntl = 00000401
[  768.509640] renesas_sdhi_internal_dmac ee100000.mmc: renesas_sdhi_auto_correction: rvscntl = 00000501
[  768.518947] renesas_sdhi_internal_dmac ee100000.mmc: renesas_sdhi_auto_correction: rvscntl = 00000501
[  768.528217] renesas_sdhi_internal_dmac ee100000.mmc: renesas_sdhi_auto_correction: rvscntl = 00000501
[  768.537494] renesas_sdhi_internal_dmac ee100000.mmc: renesas_sdhi_auto_correction: rvscntl = 00000601

Yoshihiro Shimoda (2):
  mmc: host: tmio: Add .sdio_irq()
  mmc: host: renesas_sdhi: Fix incorrect auto retuning for an SDIO card

 drivers/mmc/host/renesas_sdhi.h      |  1 +
 drivers/mmc/host/renesas_sdhi_core.c | 48 ++++++++++++++++++++++++----
 drivers/mmc/host/tmio_mmc.h          |  1 +
 drivers/mmc/host/tmio_mmc_core.c     |  5 ++-
 4 files changed, 47 insertions(+), 8 deletions(-)

-- 
2.43.0


