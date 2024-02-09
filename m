Return-Path: <linux-renesas-soc+bounces-2515-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FC084EEB0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 02:59:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 901911C24391
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 01:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1F05240;
	Fri,  9 Feb 2024 01:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aRDeMm8c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C467A4C6F
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Feb 2024 01:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707443936; cv=none; b=mq/LmM0+9T3zo1rtNzu6m9dVPMksB4FOEsACWkbZ6a/wT9DXWfAAj2ZouNTtcYhVzDjHxl6O8UeRImh5vN3yqGF9rz6A9jt7gWhsUJa5ol5JL6u51YGTNmRQKtHfSmeQgmieiTjWiLWWy424WklAGjuXKxAEcfTxucaH/Cw4DAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707443936; c=relaxed/simple;
	bh=eSZ0UF6f5wQGVbK3MfAk9QDVqW9e5WhVYigroBv8fqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G2uE+zkwP6kgVEnjDse+7fuZqWlM4KJPQomXHTyN0lS/uoVYG30i0deks+mBZxN+wfQ5Z5nC2K95j3ANWX9cYxUVDZN1xEvs0PLbuvQlsKeIH80ReJi4u5kP3KYUEsffOiIpNMvTA6q3HUFf3KsMw7FsBQee1c1wvJHhxCWu7uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aRDeMm8c; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=CIb4fU6aD0u2MIHraJnpW3RoUetuKj7I8/j6aS5bid0=; b=aRDeMm
	8ckmE3LrbwdHQVF8R4F1jFHuz5IRDxgnWhnXMqBpjOCB0kRZTup//rVr8rWNHMA9
	bBALwyWYF/ICF9XYrPM4YPNYyVtIu+dZl9ZmVVjH4psT3Gaa+nAcVGDw9DZl8KDX
	NYGuntN7nJ3J/wPRzn6nW3bMfbxHPMNx3lBm9aMTW/gVgoCcmpn+Lhcc0Sfg9yXs
	w9WVSY0gznAr7ru5iQA5s43oXZgDmvSoQByRQllkBBt8OvlZTAAskN+FWdStE8hm
	fruHuYxSCGMr0BPFzBmX1UL5r6UQCvGDC6goizkzCUUe/6V3SJorfVH78C6Yg6KF
	E6gea8JBxNcHg3oQ==
Received: (qmail 2792359 invoked from network); 9 Feb 2024 02:58:47 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Feb 2024 02:58:47 +0100
X-UD-Smtp-Session: l3s3148p1@I++6ROkQlLMujnsZ
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	kernel test robot <lkp@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] mmc: tmio/sdhi: fix includes
Date: Fri,  9 Feb 2024 02:58:18 +0100
Message-ID: <20240209015817.14627-11-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209015817.14627-8-wsa+renesas@sang-engineering.com>
References: <20240209015817.14627-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TMIO uses an of_* function, and SDHI uses pm_runtime functions. Add the
includes directly, so we can clean up another header properly. Sort the
pagemap include while we are here.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202402070323.JpYfFtkQ-lkp@intel.com/
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 3 ++-
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 3 ++-
 drivers/mmc/host/tmio_mmc_core.c              | 1 +
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 53d34c3eddce..24e1c17908d7 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -16,8 +16,9 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/platform_device.h>
 #include <linux/pagemap.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/sys_soc.h>
 
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index 9cf7f9feab72..c18581897f8a 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -16,8 +16,9 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/platform_device.h>
 #include <linux/pagemap.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/sys_soc.h>
 
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index be7f18fd4836..c39141a5bd23 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -37,6 +37,7 @@
 #include <linux/mmc/mmc.h>
 #include <linux/mmc/slot-gpio.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/pagemap.h>
 #include <linux/platform_device.h>
 #include <linux/pm_qos.h>
-- 
2.43.0


