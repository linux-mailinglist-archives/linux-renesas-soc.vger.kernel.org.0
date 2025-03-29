Return-Path: <linux-renesas-soc+bounces-15042-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F03BA754E5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Mar 2025 09:00:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B43A216F803
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Mar 2025 08:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD6939ACC;
	Sat, 29 Mar 2025 08:00:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39129C2FA;
	Sat, 29 Mar 2025 08:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743235248; cv=none; b=EA9IHxN/23JSbiUL5VZkNVvQMcjmuCdBCl0dWEC4DsKA9/HFpusJw4muFONTXC8PlslHU20YEXM5Q9i3CFuPxOK6OIre0NJHEqGgZ9aLX+LIIY7NY+gQfrnVX1FwzHK4SA+OLxEFqzNsvYKWaZc4AZBcD24VmLcUKTDaPPXxzTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743235248; c=relaxed/simple;
	bh=dpat2ePyZ15xKLA503Z0fkVdgFx9rcG1UZVBlq7hlZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ETkCHqVcKQHMOCFQfL6IvSZUtO+WdXx4eQSzjmFhZYNsX1VWy8z5qfk3QfrfWy4UURV3gG0ywPvML2AHId7pUhaEKWgO6EGjmLyCEXv7IhKyAizXao6b5EIqTL7fDWLlE8CbUBrywzyu+PHDG6WoQIjT+33no1igdXodPc5Z/ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: D20YfBhUQU6LnMKHmfxZbg==
X-CSE-MsgGUID: CS6cMvYcTqCwJAYbVjCOAQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 29 Mar 2025 17:00:43 +0900
Received: from localhost.localdomain (unknown [10.226.92.57])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 266634008A17;
	Sat, 29 Mar 2025 17:00:38 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Victor Shih <victor.shih@genesyslogic.com.tw>,
	Ben Chuang <ben.chuang@genesyslogic.com.tw>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
Subject: [PATCH v2] mmc: host: Kconfig: Fix undefined reference to rdev_get_drvdata()
Date: Sat, 29 Mar 2025 08:00:34 +0000
Message-ID: <20250329080036.49170-1-biju.das.jz@bp.renesas.com>
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
v1->v2:
 * Added 'if ARCH_RENESAS' to leave SUPERH out
---
 drivers/mmc/host/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 6824131b69b1..f62e436b1d4f 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -692,6 +692,7 @@ config MMC_SDHI
 	tristate "Renesas SDHI SD/SDIO controller support"
 	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
 	select MMC_TMIO_CORE
+	select REGULATOR if ARCH_RENESAS
 	select RESET_CONTROLLER if ARCH_RENESAS
 	help
 	  This provides support for the SDHI SD/SDIO controller found in
-- 
2.43.0


