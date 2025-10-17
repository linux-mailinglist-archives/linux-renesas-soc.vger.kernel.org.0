Return-Path: <linux-renesas-soc+bounces-23216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C66FEBE8074
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 12:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8952A4F9A3F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 10:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5231298991;
	Fri, 17 Oct 2025 10:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DoQ2qivf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7F62E5B21
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 10:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760696171; cv=none; b=WuExkV7HUkbnw9qFVPhTay/LioEmXCS8i2kCWR0sKqb3yJZ6hkUZEMVeiViETCYCWikjD1qECowLLd+OkXkvhdNHumGuqs9azVhrfOXozU80UqdI0ZoAHJk3R8LeaT6CJ60dIWr3GE77hTee260mnkC0Vmc3BhRRn7iDZDMPM0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760696171; c=relaxed/simple;
	bh=2FTuHNjSGvJZAf1LWMC8NRugqg6c8LK0Hzr2Dv7fpYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N304b6reRoZFR/v0jkMg4whUJgbBeTOz643au+rTRAGHw6/zK6eyFSjh1N0SbHN2mbYcbScZERFd3AyEy2T4nC/oFqm52lhmc5Bk2b5/8fYI4lut/Mo4Q/+2U+dMJS6sGGbup8222xuKit4Qc/i6tWfZhaE1SnL3IZTFpdPDTPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DoQ2qivf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=iNrPd0l4fyyEjN
	jK3c/izEfD+LBndDM/O9UHeCvxIlE=; b=DoQ2qivfVrqYQmVZ4hLZ3himhq+kSS
	uSElWEt3laeqCWd6e/dU/oNH9wTvuqO/KF+UhP7+2uQKgmyDP2ZyyGvIhfT8JgBV
	QZ8Xyh6UK7lGwURO95PnBFSW0OkpIgftrJJExwAbjt0tR3sekSL1cJH5FLhg/UlX
	Uceyd4er/ltk+LW7kf81gJZqqV9zeigvGwuMO4DEez4u+v91Okkl4MTv7rxLln18
	A6GUDUm0YX02q7wfouzCJ+xJcwFtaTsUnvJ8GrAhhO6SXRHNdfdgfUJGm64n5SfX
	/yLe0otgaeWEJG8fb7pTPdrGChW6kQ1PIUUTFDSVQKfTFmg+wlBB+MCw==
Received: (qmail 4183245 invoked from network); 17 Oct 2025 12:16:05 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Oct 2025 12:16:05 +0200
X-UD-Smtp-Session: l3s3148p1@snR2BVhBYMQgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-watchdog@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: [PATCH v3 0/2] watchdog: add Renesas Window Watchdog support
Date: Fri, 17 Oct 2025 12:15:47 +0200
Message-ID: <20251017101549.4275-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This Window Watchdog is a little peculiar because it can only be setup
once but we cannot find out if this write already happened. So,
configuration is delegated to the firmware/bootloader and the driver
will adapt to whatever is configured. The driver handles all bits
described in the datasheets. This is really all there is.

Tested on a SparrowHawk board (Renesas R-Car V4H). Based on v6.18-rc1
and build bot is already happy. Passes also binding checks and dtb
checks here.

Big picture change since v2 (details mentioned per patch):

* minor improvements to patch 2

Looking forward to comments!


Wolfram Sang (2):
  dt-bindings: watchdog: Add Renesas WWDT
  watchdog: renesas_wwdt: add driver

 .../watchdog/renesas,rcar-gen3-wwdt.yaml      | 114 ++++++++++++
 drivers/watchdog/Kconfig                      |   8 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/renesas_wwdt.c               | 163 ++++++++++++++++++
 4 files changed, 286 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rcar-gen3-wwdt.yaml
 create mode 100644 drivers/watchdog/renesas_wwdt.c

-- 
2.47.2


