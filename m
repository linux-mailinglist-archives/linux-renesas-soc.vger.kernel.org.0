Return-Path: <linux-renesas-soc+bounces-19317-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F50AFB2B2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 13:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E28354A2B5E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 11:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D9929A323;
	Mon,  7 Jul 2025 11:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cHopMX37"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FA729AB03
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jul 2025 11:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751889270; cv=none; b=uxBZtrVe69CwIAo1IRc9xwulX7uZbfBKYUOWNfr3dRCtgg7JNYtS1wgB7wuDaZw6r7t6N4R1MHhu4Ox7xKMhAwWSBf4txWBoZs44kvB53brU7PtBdOj/nGyqV8ztu5SCpZQ3vrDvvoAef99hrkuE/HeLKyLO7dFVh7Ul4RISLhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751889270; c=relaxed/simple;
	bh=DWhyrkM8qv+PWhbRftv8rDmGviMtsqqXA4WIaZ/QSa8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uH8GGtugY2gFj7jujo7gjdShIlOvQxc5XSp5zXuTP56lGkMLyfB0yCrDTVhHqxWs6tBJ+eo5uMchzyrOCS4sDvmIMFiZQ8nbJGVZuFzghN+t+J5y+KDjr/DK/3BegHhPEyKIpsPvnLsqEmnI2VVr7SmkiggTuafb+IJ6LTFlzf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cHopMX37; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=mzQIYfnc/jikMB
	HsCtIB3ODwwiqLPJL7jcl6lMJlanY=; b=cHopMX37EObz6Vqhrljn3F2NFoqAqG
	MJr3sWJWOLrjoJz1EFs8YzOpLOgefPiGqtqPIYP6ybqNhjXdZMiY+P4TdTzGkSv8
	/UaRGvBDc+inh/gxXVS9O3ZQY/Z35k7ZCrBQ8nQYi/BUx6nIFIh44PsmOxqoxgrD
	R1WJoD1W2dUTQsT6wF0bOI1PhIWOvDHp/mjlEwvyP6AHv8GHXUlz6xJnioNOgYs6
	dCjkTe3o2qItMjzmaO2+w3QgY57mOWTKQ/rj9fTQQx35ajOkLImSoBOrh+MvrHsL
	gyGIUNT7x+3rsHTK6nHYOxeTOPKJaktsgQaWIXVTgFWsA0nSNfIEQ29Q==
Received: (qmail 1232290 invoked from network); 7 Jul 2025 13:54:22 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jul 2025 13:54:22 +0200
X-UD-Smtp-Session: l3s3148p1@6J4ggVU5LKsgAwDPXxVOAFK6vZd9m4LR
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: prefix hexadecimal entries in sysfs
Date: Mon,  7 Jul 2025 13:54:08 +0200
Message-ID: <20250707115409.73545-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hexadecimal values in sysfs should be prefixed with '0x' like e.g. PCI
and SCSI already do it. Also ensure the two digit length since BCR and
DCR are a byte in size.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/master.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index ea6b99c05f44..ffb734d378e2 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -141,7 +141,7 @@ static ssize_t bcr_show(struct device *dev,
 
 	i3c_bus_normaluse_lock(bus);
 	desc = dev_to_i3cdesc(dev);
-	ret = sprintf(buf, "%x\n", desc->info.bcr);
+	ret = sprintf(buf, "0x%02x\n", desc->info.bcr);
 	i3c_bus_normaluse_unlock(bus);
 
 	return ret;
@@ -158,7 +158,7 @@ static ssize_t dcr_show(struct device *dev,
 
 	i3c_bus_normaluse_lock(bus);
 	desc = dev_to_i3cdesc(dev);
-	ret = sprintf(buf, "%x\n", desc->info.dcr);
+	ret = sprintf(buf, "0x%02x\n", desc->info.dcr);
 	i3c_bus_normaluse_unlock(bus);
 
 	return ret;
-- 
2.47.2


