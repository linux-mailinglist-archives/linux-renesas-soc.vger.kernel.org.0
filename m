Return-Path: <linux-renesas-soc+bounces-16703-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D74AABC86
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 10:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 457827BBEB8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 08:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7811B5EA4;
	Tue,  6 May 2025 07:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="O79DzhuI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C064A24
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 May 2025 07:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746517984; cv=none; b=T1Z3IHwBbM7oheOhQRb2Fff+P48VzHGEVkXB8M/SIGPe4iF0t/Y+1Q81TzouWBb5q8wGptG9KS83GSLDexwuL5A//ZPTNJxUtJEkPJ5V+9CTLZnLRg5REoAUMCbfQpM6/HeFtn/huc3BwA7XxfthoQnczXjn+Pahdc7n8Q6yecU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746517984; c=relaxed/simple;
	bh=T4plSMkB/Rkg2h+63z9rTVs09/asGlbit2WyZkgc5cI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X0h8WkJ2PuicRHLuNHfrl/EOCd5YV2f54WpNJlUPgZZ9Zae4Bf7rjuVWqFaKr2iYplvn5HEbTdecPWg0iuofRiRbhmablrBu465ah2vzEaXSeAq2V1CW46crIab0sozUG7BgeFSKs0wAW4QrPuoGLeyYCnv5/pymMApT1MXSuk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=O79DzhuI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=8WlILYCRWuNyeN
	DT8WpojOWWs9oFfR3WA8Well/x80w=; b=O79DzhuIas0V7rtbbhdDMSnvEdANo6
	814iiP0n4wEtqeof8YdeWI5a51BCBx7BVd2JOJSkKhN3j0EvlwzZXqVb8G9EGjOG
	0eW6x9deCewRqusatIZCO6y0itSdotICvS+CcWWKtZw3pQ+go+yv84MIoPoNIRTl
	h51WhLM+RHr6oJ7pS208djeM6C2RkuVIdLcMXvHRVsqD+iuHkNJHA7sgpy1BFGW/
	7VLffwyiJtdy+ZXtWtE8QDrpFEcEask1jf5jPs7IVAuoby2Pa7FvhESDSLLw3w8S
	N23daTeOPfcoWcA0Bqh60tRSZ37xnavH+oOZ0nd0XkWRdgkkXym6V4+A==
Received: (qmail 2832855 invoked from network); 6 May 2025 09:52:54 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 May 2025 09:52:54 +0200
X-UD-Smtp-Session: l3s3148p1@5Cpe53I0eh5tKPHd
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: controllers do not need to depend on I3C
Date: Tue,  6 May 2025 09:52:11 +0200
Message-ID: <20250506075247.1545-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Kconfig file for controller drivers is only sourced if the I3C
symbol is enabled. No need to check for that in individual drivers.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Based on linux-next.

 drivers/i3c/master/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
index 77da199c7413..7b30db3253af 100644
--- a/drivers/i3c/master/Kconfig
+++ b/drivers/i3c/master/Kconfig
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config CDNS_I3C_MASTER
 	tristate "Cadence I3C master driver"
-	depends on I3C
 	depends on HAS_IOMEM
 	depends on !(ALPHA || PARISC)
 	help
@@ -9,7 +8,6 @@ config CDNS_I3C_MASTER
 
 config DW_I3C_MASTER
 	tristate "Synospsys DesignWare I3C master driver"
-	depends on I3C
 	depends on HAS_IOMEM
 	depends on !(ALPHA || PARISC)
 	# ALPHA and PARISC needs {read,write}sl()
@@ -38,7 +36,6 @@ config AST2600_I3C_MASTER
 
 config SVC_I3C_MASTER
 	tristate "Silvaco I3C Dual-Role Master driver"
-	depends on I3C
 	depends on HAS_IOMEM
 	depends on !(ALPHA || PARISC)
 	help
@@ -46,7 +43,6 @@ config SVC_I3C_MASTER
 
 config MIPI_I3C_HCI
 	tristate "MIPI I3C Host Controller Interface driver (EXPERIMENTAL)"
-	depends on I3C
 	depends on HAS_IOMEM
 	help
 	  Support for hardware following the MIPI Aliance's I3C Host Controller
-- 
2.47.2


