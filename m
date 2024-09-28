Return-Path: <linux-renesas-soc+bounces-9177-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC19988ED9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Sep 2024 11:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EFDDB2125F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Sep 2024 09:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7569119F10E;
	Sat, 28 Sep 2024 09:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SR4a6CXG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DFA19DF8D
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Sep 2024 09:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727516702; cv=none; b=uqSS8zZcqsjnJZPFS97yDz4PrMSFo6pVfw1ljUsmEcc0sOz5n9vm1Jrwzw0Ol9A8a+2hgFeJMO2xpnMAHuFZwlMHrJs+XP0H+CuN6eBxx2hUgSCOtjHmgHQLhnoEes8fqlmKG1Hkk1xaPPjCq/eFasG7VghEbomIvc48nQ0/AKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727516702; c=relaxed/simple;
	bh=Fk669RB3+ndwi8Jtefr6NVYca1f0zvoq41tjSncT+HU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u2RB7EAwwn7+Yd//SCKOGxDA7StUtS3Tb6sEvjH9DA73wRpr4fYZGsps9Tuglqn0fa02nIMohfbtvKzpkNeWL7KAqtLIhMaZ+3hoU+KPjbNYszne2y+DTBC21L97EJkhHoeSj/8EhwhGtvWainQ1KBZzzLWlWEoG4WgMxuF474s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SR4a6CXG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=NbYO2nuct9sklS
	fjK+WKbQZP2WMJSo/7GN7AcQWmmno=; b=SR4a6CXGrTxtu+8ejSCiKiqFez2NRs
	pAkfUq0KdwFvJ9TM/DM0VZYWcQrBbziTCjPzunpuEuWo1vcep/nXY8MD3h/JC3IK
	KoomQjHI5FgiSxnNXA2rly0NsTE4ONkxsKr0Xq264ZxKEKuccmjiNERrxsai8vOa
	Uv6lK896nGCmim3/+snKL4asDd5ydiw2Mz40mBOYt8CuRrKpGVlhaN5mottfz/iI
	0JGwhS+uGx9E30gHEmIH8M2Y6b0cRU/6WJJOJLwrf8BC6JHbQ1DwVBwJC0uu58BU
	mG4GzbauYxCoRM0C4oRJpQLvber800zo6dNYnVw4TVGlNphCqc/oz6BQ==
Received: (qmail 1579196 invoked from network); 28 Sep 2024 11:44:58 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2024 11:44:58 +0200
X-UD-Smtp-Session: l3s3148p1@OtIo0yojOtkgAQnoAHS0AAL7owIOnAiN
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org
Subject: [PATCH] mmc: sh_mmcif: correctly report success when obtaining DMA channels
Date: Sat, 28 Sep 2024 11:44:54 +0200
Message-ID: <20240928094454.3592-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The debug message could still report success when getting the channels
was OK but configuring them failed. This actually caused a minor detour
when debugging DMA problems, so make sure the success is only reported
when the channels are really ready-to-use.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/sh_mmcif.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
index 08b4312af94e..0e7fa3e9c9fe 100644
--- a/drivers/mmc/host/sh_mmcif.c
+++ b/drivers/mmc/host/sh_mmcif.c
@@ -439,14 +439,15 @@ static void sh_mmcif_request_dma(struct sh_mmcif_host *host)
 		if (IS_ERR(host->chan_rx))
 			host->chan_rx = NULL;
 	}
-	dev_dbg(dev, "%s: got channel TX %p RX %p\n", __func__, host->chan_tx,
-		host->chan_rx);
 
 	if (!host->chan_tx || !host->chan_rx ||
 	    sh_mmcif_dma_slave_config(host, host->chan_tx, DMA_MEM_TO_DEV) ||
 	    sh_mmcif_dma_slave_config(host, host->chan_rx, DMA_DEV_TO_MEM))
 		goto error;
 
+	dev_dbg(dev, "%s: got channel TX %p RX %p\n", __func__, host->chan_tx,
+		host->chan_rx);
+
 	return;
 
 error:
-- 
2.45.2


