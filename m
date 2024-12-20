Return-Path: <linux-renesas-soc+bounces-11638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B48639F9165
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 12:32:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14CC37A1D8E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 11:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC221C54BB;
	Fri, 20 Dec 2024 11:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Zr1r0Bi5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534051C3F06
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 11:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734694232; cv=none; b=f4Tx7dOV2G+ddA25s+m4AYce49hvsLmIjGopQEEIozoP7f8c6nV5yqRCFCw4TGSlgKbul4jJ739uWwuVOx/8jfKFGZJphW/sHn3Vag2WthqztDtQ0JHCZEx9qnoo3TbidsufsfzMc38rc/6nz6G9qSmp5+hWTBQOiKd+fctKCLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734694232; c=relaxed/simple;
	bh=aDJUijj+npAEq/jYvHNfTGdquE1R8rihjhhAzvV3KOI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OUE3LpeeciG4U3NNIhiCbf0aYi+sfhPHWD1jcOt1aS5xxwsiXXekUCsUkQXQxce8y7yoIyl5MmPPhi7wXvSkccM9AKl8JHQhWYv59f1zoZy4B8+wpacUmuVkW9Gtup6daVK5uFXI6ZXLVWTn52Uq2uH6SMK7t6qe5rxIlwQgE5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Zr1r0Bi5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=qQIh3wUDa4kRyy
	tLvPuCivNA0Fsl6gM39oMEUiYc93g=; b=Zr1r0Bi5VfddcWJhKWorSFb/tN7xMx
	Hwu+GECAaxRPk77bHYk/y1Vf1k6/nw9xMcOqU3zpB6HQW1w3tRjRZmFjSATxGWGI
	ZbXtVMxdFBYEAJFsCO3U+NUPxRc6CiBD6Q+2+beVyjTrDkg9wae2TzIJeGyyWZOa
	tU74jRLNgY9krfw+CgKYZ1SgpVfYCoQ6MjI41uabBm4Yf2ddaB7tTHh40fp34sNp
	I7JWBb157G5RHSAsrETRKU5Z2WMrSXZIi0xdHZZe1AdfnnpR3jizSikOtqgivX/+
	JDIhbvnNSFOmRm0VDzvlABFjmMftU9mNfFkHeXk2mPvrQU7zY3TKDRuw==
Received: (qmail 989625 invoked from network); 20 Dec 2024 12:30:18 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 12:30:18 +0100
X-UD-Smtp-Session: l3s3148p1@m52y+LEpTpAujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>
Subject: [PATCH RFT 0/5] i3c: introduce and use generic parity helper
Date: Fri, 20 Dec 2024 12:29:54 +0100
Message-Id: <20241220113000.17537-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Is this acceptable? The non-I3C patches have all the tags they need,
only the I3C patches would need testing on hardware.

A locally build-tested branch is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i3c/get_parity

Looking forward to comments...

[1] https://lore.kernel.org/all/20241214085833.8695-1-wsa+renesas@sang-engineering.com/


Wolfram Sang (5):
  bitops: add generic parity calculation for u8
  hwmon: (spd5118) Use generic parity calculation
  i3c: dw: use get_parity8 helper instead of open coding it
  i3c: mipi-i3c-hci: use get_parity8 helper instead of open coding it
  i3c: cdns: use get_parity8 helper instead of open coding it

 drivers/hwmon/spd5118.c                  |  8 +-----
 drivers/i3c/master/dw-i3c-master.c       | 14 +++--------
 drivers/i3c/master/i3c-master-cdns.c     |  3 +--
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 11 +--------
 include/linux/bitops.h                   | 31 ++++++++++++++++++++++++
 5 files changed, 37 insertions(+), 30 deletions(-)

-- 
2.39.2


