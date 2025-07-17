Return-Path: <linux-renesas-soc+bounces-19574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38136B08C55
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jul 2025 14:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76C8D16B4C5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jul 2025 12:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CCE27991C;
	Thu, 17 Jul 2025 12:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ygn4Fuu8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1D51E766E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Jul 2025 12:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752753680; cv=none; b=h9kpF1SNxMby1A1Vx3xwvMDD2y9/xoQ94Xtlurd3z+UqeX0bUnmaNIzMoxaVxqtUz0z2Y/xy2ZO0Wm6ZWaIvFX1Z4E2EtAFckS41+OpsY0BaXKgMg6eE/DKbhu8tVhkSPV5YBdRasUIWrRLHJUdDmZfXgRelTjtlQ9YH2UcXhi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752753680; c=relaxed/simple;
	bh=iYi5nCFjbLjbzinRvDAF3gyWINJcUYbMxN3lBMCs0SI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=seJT9FqdEHCLXyVj+JAuVMrGxhtKl5gvHB0IQElc6fpGihRG8BtuZzJCe1dllgn3A4Jw1XhjMIwk01Y5WNWK6rG7aTPTyMv1jf3ukEIJYF6aBuzCggFtKOScoZ3t1RGkLh8vzD//vWmQc9rMQXzYBhD3Y+QMuJP3Erg0JcUDRtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ygn4Fuu8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Iywdj3bEMgSqz2
	EzIawphcUGcb2X+//tviQ2sOEb13U=; b=Ygn4Fuu88XmJ07NUdIiWQGrqTVYaXx
	EulktAm9SygKZPb6shdpGSNxVpDHGWAQl32o0Nhae14Z+TXOqXiUU85dPupppBZU
	64WgYs0iOcfvQb2qjsSHBjb2+TRZMANHCKtB6ia9bOhktBxaKT/w10y+sVr69iyL
	4YF01QvyRWM7lhMYQpQM9ccYlqVJ4CPYOu8z2M//5SOT8n4zPAvjfD1MWAFhhmfR
	BakylX7xFWg0rsIYrIT8epQQVKF01xJh38wRTvwt8rGK7l52zY1KrMvLgY8kyNay
	ydB0bQvS868UPT95MF9VMjzM41Bn/4Iy6YeDocNUQw9pmPmMo2ASRSoQ==
Received: (qmail 3664127 invoked from network); 17 Jul 2025 14:01:04 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jul 2025 14:01:04 +0200
X-UD-Smtp-Session: l3s3148p1@7hmCwx46kusgAwDPXx+vAAkEB0lWxGP4
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	kernel test robot <lkp@intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: add missing include to internal header
Date: Thu, 17 Jul 2025 14:00:47 +0200
Message-ID: <20250717120046.9022-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LKP found a random config which failed to build because IO accessors
were not defined:

   In file included from drivers/i3c/master.c:21:
   drivers/i3c/internals.h: In function 'i3c_writel_fifo':
>> drivers/i3c/internals.h:35:9: error: implicit declaration of function 'writesl' [-Werror=implicit-function-declaration]

Add the proper header to where the IO accessors are used.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507150208.BZDzzJ5E-lkp@intel.com/
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/internals.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 67ed1c44f615..1bf6aecebcbb 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -9,6 +9,7 @@
 #define I3C_INTERNALS_H
 
 #include <linux/i3c/master.h>
+#include <linux/io.h>
 
 extern const struct device_type i3c_masterdev_type;
 
-- 
2.47.2


