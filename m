Return-Path: <linux-renesas-soc+bounces-15038-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7197DA7548D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Mar 2025 08:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 145C73ACFBF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Mar 2025 07:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F6262557C;
	Sat, 29 Mar 2025 07:03:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452EAE555;
	Sat, 29 Mar 2025 07:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743231826; cv=none; b=hUtTLbBY00AvEifhMaA1o5qqPNQHl3YHianO7Gu1iOAa7VN/yFLaqX1cYFLyfzhXkqiIkl/HAUNgPuyxRfaONBcaof1Hpm+Ns3KcVytvl150axV+WBtxDdMp+HDY8LsEo36Td4KOJHjc02SEjcICsE2+z3qqsl+/8B+GmgmMB9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743231826; c=relaxed/simple;
	bh=2beA8cDcWIdtdekuX8g1pqz0xOLSNaN8ZjGSH7bwWB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f+9pZF8zFdJgOf+Zjl6NBIBRgnacdcM7+IhPOQlwTLyN2r4itZjKPTr9KtDxejQpma8IVtJEenNRWIin4SZYIqdu5zv4CUbPp3mXfpq0ChIEiSXovgDviCTm/7B2LL8iLmEVyYb2wH8mIa0KzoMtgUxO2h2qbLvwp6RglMR4FCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: FoFkQ5JrSqCHgBDbVBGbAQ==
X-CSE-MsgGUID: pPB8W405Sm2oEVizY0cVVQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 29 Mar 2025 16:03:36 +0900
Received: from localhost.localdomain (unknown [10.226.92.21])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 14C46417BE56;
	Sat, 29 Mar 2025 16:03:31 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Ben Chuang <ben.chuang@genesyslogic.com.tw>,
	Victor Shih <victor.shih@genesyslogic.com.tw>,
	Sergey Khimich <serghox@gmail.com>,
	Shan-Chun Hung <shanchun1218@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] mmc: host: Kconfig: Fix undefined reference to rdev_get_drvdata()
Date: Sat, 29 Mar 2025 07:03:24 +0000
Message-ID: <20250329070329.32562-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver no longer builds when regulator support is unavailable. Fix
the build error undefined reference to rdev_get_drvdata() by selecting the
REGULATOR in config MMC_SDHI.

Fixes: fae80a99dc03 ("mmc: renesas_sdhi: Add support for RZ/G3E SoC")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503290554.zASQT70Q-lkp@intel.com/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/mmc/host/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 6824131b69b1..14f485248ff9 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -692,6 +692,7 @@ config MMC_SDHI
 	tristate "Renesas SDHI SD/SDIO controller support"
 	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
 	select MMC_TMIO_CORE
+	select REGULATOR
 	select RESET_CONTROLLER if ARCH_RENESAS
 	help
 	  This provides support for the SDHI SD/SDIO controller found in
-- 
2.43.0


