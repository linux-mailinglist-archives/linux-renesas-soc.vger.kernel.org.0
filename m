Return-Path: <linux-renesas-soc+bounces-23964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F946C27477
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 01 Nov 2025 01:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 401344202FB
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Nov 2025 00:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC71D1EA7EC;
	Sat,  1 Nov 2025 00:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LjUdqYbL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7934315E5DC
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Nov 2025 00:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761957913; cv=none; b=nUP9rk3YJtfE+sYuoe5H8bh+C/OLIOwtTs75gd9JVNeLV3Vkx+HFzDE6jKUWDc6vcxDmdhk102jTiwfXp4giNX6e9mS2fLW8mMf7zyQddr75Us6XgfM7A2Ncba+rwIux3O1QkSx+wQDKzsfJ6pfFkW0ByZIPNMPDjz5QbRYMCBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761957913; c=relaxed/simple;
	bh=xPqiofoYl4Ytw3t2kzle46Tgc10+yCnIhVMSuuieHIU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qf/vXsh9u18b4Qjh71VLoJNhRZSzoDEgpKehOfCqeRxgroBsLTXBX5EZWIwUz0MXb25KuBr7KLDBnX50nYYRQCGPJHt3MIDltn24FgBFtXKQ402lS3QlSPUzARLjZOczRJqfDxA9emXFPMUTqBsBzeYAo4obZyUTUSf57NT8YDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LjUdqYbL; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 77EB01A17C5;
	Sat,  1 Nov 2025 00:45:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3E5B56070B;
	Sat,  1 Nov 2025 00:45:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2AB911181ABB0;
	Sat,  1 Nov 2025 01:45:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761957907; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=JiyTca8VFBJQ8q87I5zHm2O+uHgWPMn4Mgl1lerN9xI=;
	b=LjUdqYbLm5kNstyL4Ri/jMxDASZfJhfHXXhk5JRKi90tGkAkORu2v0x0H3rKcL9M66KUKc
	5SmimBgMJIOk5LtCwF55u5BLy05KAhGfUBrqo+Ht8FMVCt9ORuJVCbRLP0ZTVVG9HayNQi
	4KOP1sv927gMhGUbN7Wkr4mlFMa+IWGrAQySyaVYufW97+wTxWZUMkV5PLkA26ExTBNBD7
	piUbFCA6FbhnC34MF5nfHgwBL6bYDjw97r210O0xKkBd5Vm72zDLOKaSpSWSqKVmBgJV8L
	CmCextHzdkWGU1tea4ypc8JRkppD0A1C892QsfX9KXPcVxa5/JR0oUT4U2cs5Q==
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 00/11] Stop setting max_user_freq in rtc drivers
Date: Sat, 01 Nov 2025 01:45:02 +0100
Message-Id: <20251101-max_user_freq-v1-0-c9a274fd6883@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA2ND3dzEivhSoKb4tKLUQl1T41RjM6OUVCNL81QloJ6CotS0zAqwedG
 xtbUAu8CcUF8AAAA=
X-Change-ID: 20251031-max_user_freq-53e362de297e
To: Joshua Kinard <linux@kumba.dev>, 
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

max_user_freq has not been related to the hardware RTC since 6610e0893b8b
("RTC: Rework RTC code to use timerqueue for events"). It is not limited by
the hardware capabilities and so it is not necessary to set it from the RTC
drivers as a user with sufficient rights will be able to change the value.
Also, max_user_freq is always clamped to 5000, there is not point in
setting an higher value.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
Alexandre Belloni (11):
      rtc: sa1100: stop setting max_user_freq
      rtc: ds1685: stop setting max_user_freq
      rtc: pic32: stop setting max_user_freq
      rtc: renesas-rtca3: stop setting max_user_freq
      rtc: rv3028: stop setting max_user_freq
      rtc: rv3032: stop setting max_user_freq
      rtc: rv8803: stop setting max_user_freq
      rtc: rx6110: stop setting max_user_freq
      rtc: rx8010: stop setting max_user_freq
      rtc: rx8025: stop setting max_user_freq
      rtc: sh: stop setting max_user_freq

 drivers/rtc/rtc-ds1685.c        | 3 ---
 drivers/rtc/rtc-pic32.c         | 2 --
 drivers/rtc/rtc-renesas-rtca3.c | 1 -
 drivers/rtc/rtc-rv3028.c        | 2 --
 drivers/rtc/rtc-rv3032.c        | 2 --
 drivers/rtc/rtc-rv8803.c        | 2 --
 drivers/rtc/rtc-rx6110.c        | 2 --
 drivers/rtc/rtc-rx8010.c        | 1 -
 drivers/rtc/rtc-rx8025.c        | 2 --
 drivers/rtc/rtc-sa1100.c        | 3 ---
 drivers/rtc/rtc-sh.c            | 1 -
 include/linux/rtc/ds1685.h      | 1 -
 12 files changed, 22 deletions(-)
---
base-commit: 384150d7a5b60c1086790a8ee07b0629f906cca2
change-id: 20251031-max_user_freq-53e362de297e

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>


