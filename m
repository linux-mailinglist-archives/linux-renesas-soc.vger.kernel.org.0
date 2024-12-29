Return-Path: <linux-renesas-soc+bounces-11738-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A369FDE7D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Dec 2024 11:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A03E7A0831
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Dec 2024 10:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B54513B59E;
	Sun, 29 Dec 2024 10:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AGqF9Ixk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6923378F3E
	for <linux-renesas-soc@vger.kernel.org>; Sun, 29 Dec 2024 10:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735467169; cv=none; b=cVwgLoIospgPQQLHuhjdhIZ8Rx1wqcW/fsidinHaAH2fJ8JiG3S9z9o7bcHqikM2tgyC0Kd+D0Lu9k+X3XOIrYq/a5ARX3U1nJyyHarZlhYfiC1TGQ6i/zBa8o20pzSGx0EH0lG3VwxtiPgwVfwVXJ++VsDlYy+vVx2e3lDCMJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735467169; c=relaxed/simple;
	bh=bmZJ5WX2phbiLdWRz0fMuLVlY8H9m81cT8arVKfo1VA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ttj4a0/4PqvxJj4CDMA0XVx4y3QG/7mTynhvP5EPqdyYiMD05vmZrhi6exfEszkYwzA0ZciEvHNG4suFqRFKZqjvG9GYR7b6yU52Tip33YXT9bHploWn6yBlPB30MCgvmbNdpyYQywbtlpysc6xkzvD8rhAUAJ9jCc6ybJLXqYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AGqF9Ixk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=gy3C2fetuKlo5H
	/lwbCNlSgRf4N0PX6S0u3SIFUvYm8=; b=AGqF9IxkYUIa3U7khz7CK/1BrDnd16
	zy5R5QXhSw2Njw8lf59KUB6rlyl9mQE83CWKoG1BhVuJE0et8ydZVxiJnWXDZfVq
	63cgjMCaERYlb3xbHQU2EWa2tF7/c6Z8SVoEpB5puHH4fvcEx71taCDHRVRvuhE8
	LM82bI3mK7HieImzZu1TcxsURBi8sE3Nflz8EP7h7y5V9fS90Gx+ZH7H+YWrChxD
	3lsUeM3SVtrCrRh6bqBsewRkLhq6+3doMbTii33vam4nUZVc6UUMZwbZ3MEX7ggh
	x1vjvq2uci2ragT/NkkzuMcq80e9X7pay3OKyhSbV7QARGK4VfWdAlBw==
Received: (qmail 3656572 invoked from network); 29 Dec 2024 11:12:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Dec 2024 11:12:35 +0100
X-UD-Smtp-Session: l3s3148p1@woFT72UqgLEujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Yury Norov <yury.norov@gmail.com>
Subject: [PATCH RFT v2 0/5] i3c: introduce and use generic parity helper
Date: Sun, 29 Dec 2024 11:12:28 +0100
Message-Id: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v1:

* renamed from 'get_parity8' to 'parity8'
* use XOR instead of OR in the kdoc example (Thanks, Rasmus, for both)
* added tag from Guenter (thanks!)
* rebased to 6.13-rc4

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

Is this acceptable? The non-I3C patches have all the tags they need,
only the I3C patches would need testing on hardware.

A build-tested (incl. build-bots) branch is here:

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


