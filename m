Return-Path: <linux-renesas-soc+bounces-11640-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9A29F9168
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 12:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48268161797
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 11:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428FA182B4;
	Fri, 20 Dec 2024 11:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="I2vJXMSN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F21718A6D3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 11:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734694420; cv=none; b=iYKizCi7crVmlUZNRXnszEp0R+hlte+/Tbx/wK73iBNmlf/rppzYB24/EBUorJFG/kX91f2AefCYaeCoUMHX3Qog7imXux52n55juCRtFG44/y45zRZxqFHf/h03qOjBzX/QUDwL+7T2DoczqALT0PhSsy+HxomZZJ82qZ4TbeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734694420; c=relaxed/simple;
	bh=L2qRB/4RsenLysWWpzzLQ3NvFXn5zVSGbccXuNtldJc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l75D+Rel8AogKHPneUMuyUVgAPU8kbVc+17zt5N9Pzo46seOzH+atFZarM2k3sJDNuj4RKqhKMx6OLfhFenJuywNNJokD+lGFNpQAZoXrmMJi6ZvYi78AFNdCkUJb81awElPbzUaK/dA1qeMlu8CIr7/CDGpukGO1DpVlLKzkCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=I2vJXMSN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=iDrd0KAldwsOGF
	ZG14RvkZSAD3d9IP9pPolACARu4Z8=; b=I2vJXMSNopplmpeP5gNHe6J63hrXKl
	23aq7PLtGJymsHcrWeqxtlHgyTN2YDHz6PD+KyuAqscstZC42lsaW82Ej2hVL4Sk
	tKzNbxSKAYdh0+I7dybJFcRD/peS0Wn64S998AXwSLpClNiLAp3Pdpl3EflP+3kT
	iclejiGi4NVgDUYqHSj1jKTTJt3H9/xP+j1dwgL3D27K7vl5AfzWIus/B6J0JlzL
	9EslcYOL07WKFlk+mMq643HAlqt2H6D7sw80Zyujvs2di54EAKWnAPAJwSSoalbn
	sHf4+0MYC/GQGjPykTWbMUn4njJwKcg7LK31hR42sCQZJENodi6PmFQw==
Received: (qmail 990839 invoked from network); 20 Dec 2024 12:33:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 12:33:35 +0100
X-UD-Smtp-Session: l3s3148p1@sClvBLIpquIujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	linux-i3c@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>
Subject: [PATCH RFT RESEND 0/5] i3c: introduce and use generic parity helper
Date: Fri, 20 Dec 2024 12:33:28 +0100
Message-Id: <20241220113335.17937-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[Resending because I3C list was not added on all patches. Sorry!]

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


