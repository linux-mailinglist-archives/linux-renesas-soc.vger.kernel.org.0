Return-Path: <linux-renesas-soc+bounces-11864-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0313AA021C3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 10:27:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 382997A1632
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 09:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADB31D9587;
	Mon,  6 Jan 2025 09:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NPKmm3zp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A65C1D6DD4
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jan 2025 09:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736155657; cv=none; b=AmvS4w7B8+ofSIxTSUnlooH6cGYXTpYuFf5XGXrOg25SnY0vT4bYJU+c8XGfNiVAdH8r7e0cz2ZCsqfck5lsdpWdvVBIBeoF0xf9ospVpY5B7AvLOtgvAd/KjhP+1Z8nb153XQ5oir1efCej3rKuC8gJ4l6KdficD36lq9XFnA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736155657; c=relaxed/simple;
	bh=fhqmTRr7u4BHKvHcV1kZc0UltFaqJQUCBzHU9D8MLSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QRrbkFSf6Wfo0OIRV73C7sW6KVuh+gP6tbchek32KEhuif8cq7WE44AUTOmZ92VSmDdgWsYAtWAEJCxDgIYo9tEOpXmlAayV0vHNytv5irulDIUHtw7kl5e2jld2/7+Kla2OeHb3K7KCCz+tOH2cU1s4sYHEN/LUIrZz265bFsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NPKmm3zp; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=aGWd2BQY7AIqRD
	QgZzEn8Ps7vMIe6tCz1E86UjvA7+Y=; b=NPKmm3zpgiWmosqxEwjyz6ZjhJLOCy
	Yc2ZZeW8CcITXry4Jf0vs0kPDgBRNX4Eyt4QWruJt6TPMoaMLP0i12R1AOs7BxIJ
	n6YgxbZda3xnN1bo+5kp9CUOMmxdCPA2bb4oH+APlF4kSTzUInfubk8lNpz+7CH+
	KOvXu4YFlx3wbHcjgatRexGESVqTmLoeo3L9tJsWfdIP+IHXnehlVJ6JNMxW0Xc+
	rZTDjXtvEHUnXc/Ygml3nW/0+Y9tOTagfjtEROkdBmKi6x6de27txJMZtJca5+oR
	fWdqhUpkieLMwVwspdzhPBEPOvuRwdsWORh+mR7nOTlMblzSvsffu2Iw==
Received: (qmail 1727747 invoked from network); 6 Jan 2025 10:27:26 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jan 2025 10:27:26 +0100
X-UD-Smtp-Session: l3s3148p1@Tn2LPAYr1psgAwDPXw20AOMQ2KO98fSH
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
Subject: [PATCH v3 0/5] i3c: introduce and use generic parity helper
Date: Mon,  6 Jan 2025 10:27:18 +0100
Message-ID: <20250106092725.22869-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v2:

* fixed commit messages from 'get_parity8' to 'parity8'
* added tag from Jarkko (thanks!)
* rebased to 6.13-rc6

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


