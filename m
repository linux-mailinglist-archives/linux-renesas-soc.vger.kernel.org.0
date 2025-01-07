Return-Path: <linux-renesas-soc+bounces-11895-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9179BA03A7F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 10:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3C881886894
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 09:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC671E282D;
	Tue,  7 Jan 2025 09:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RXulI486"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE0A15A86B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jan 2025 09:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736240535; cv=none; b=FIKbF3i3MCaghtJn9WQI1YU4MqCQomYDjYPGuZN5tbXGyb7YmcJUWrUOxhS3E1QrZLIB4+Jxsp44cg7lSBWcHVrIJ3sHUjy3ropOWOFSn79YyhbG6PKFFsA3efAwY9O1YZc9/XdOJWwjWqievOcv5pGBNfkGgKOhuKK3LsphZs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736240535; c=relaxed/simple;
	bh=Hh7oprRhF/pidIWSRWfMF+jtr1nimfa89ISEiBJDOBM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=amfhyPpteNMe3IrQ4kag08m6DL7nHrXVGLXGiZXvGQeEnGJptbZZKPv6AZB0dOl/aMIyiUl2TVqg4PlGiUW1o/D7maR3qFY5v+8iAjS/kRuO+xebnFdfSS8UbZeBCMeARKTHPDfg77tB1DHZOX6HvvoKxDN+VkfzQKKdPxIkKD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RXulI486; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=ECaGPyPMzolXgm
	I8MfZTH06/mWak6x2fO5JL7V8cO5E=; b=RXulI486ZbrXu++bLN/AHyaIVY3fBU
	yV8I3974o+dsyRsLS89j5uSAP7Ey9xmxeoPnuqpD4Wv+r/JhjS/o/eK1ipsyrOGM
	YafK3TblyN8h039pYTiimxardNhG2cfmaNG2+6PUgzSCCQRAxN6zPpm4gFFKvVRS
	nACTMep8Tmt/DpejrMN2XLwEzmO4HMCXNCUuUxuuJUDzTWt37xs1Z2/guBEMqRll
	sp7SpRbXPALrLT0DM9ZXdZ1L6dVU25wR6rgmu1ThNJ8MxMVlT+d5ZHNvnz9w7UlJ
	RZ26Noh9RR+7BChq0xbaVAp5QeDGt8csAr8U/Hd1C6Zh48Ulp+pJYKFg==
Received: (qmail 2125166 invoked from network); 7 Jan 2025 10:02:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jan 2025 10:02:06 +0100
X-UD-Smtp-Session: l3s3148p1@fFDW/xkrRJMgAwDPXw20AOMQ2KO98fSH
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Yury Norov <yury.norov@gmail.com>
Subject: [PATCH v4 0/5] i3c: introduce and use generic parity helper
Date: Tue,  7 Jan 2025 10:01:58 +0100
Message-ID: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v3:

* updated commit message of patch 4 to state that a bug gets fixed.

All acks from bitmap.h and HWMON maintainers are already included.

Old coverletter follows:

I am currently working on upstreaming another I3C controller driver. As
many others, it needs to ensure odd parity for a dynamically assigned
address. The BSP version of the driver implemented a custom parity
algorithm. Wondering why we don't have a generic helper for this in the
kernel, I found that many I3C controller drivers all implement their
version of handling parity.

So, I sent out an RFC[1] moving the efficient implementation of the
SPD5118 driver to a generic location. The series was well received, but
the path for upstream was not clear. Because I need the implementation
for my I3C controller driver and I3C is a prominent user of this new
function, I got the idea of converting the existing I3C drivers and
resend the series, suggesting this all goes upstream via I3C.

A build-tested branch is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i3c/get_parity

Looking forward to comments...

[1] https://lore.kernel.org/all/20241214085833.8695-1-wsa+renesas@sang-engineering.com/



Wolfram Sang (5):
  bitops: add generic parity calculation for u8
  hwmon: (spd5118) Use generic parity calculation
  i3c: dw: use parity8 helper instead of open coding it
  i3c: mipi-i3c-hci: use parity8 helper instead of open coding it
  i3c: cdns: use parity8 helper instead of open coding it

 drivers/hwmon/spd5118.c                  |  8 +-----
 drivers/i3c/master/dw-i3c-master.c       | 14 +++--------
 drivers/i3c/master/i3c-master-cdns.c     |  3 +--
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 11 +--------
 include/linux/bitops.h                   | 31 ++++++++++++++++++++++++
 5 files changed, 37 insertions(+), 30 deletions(-)

-- 
2.45.2


