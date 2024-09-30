Return-Path: <linux-renesas-soc+bounces-9211-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0765F98A8FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 17:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AEFE280F15
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 15:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B906818EA2;
	Mon, 30 Sep 2024 15:47:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE2F63D5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Sep 2024 15:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727711246; cv=none; b=JtcpKvwPzjPfCcW8GcRYUORyAU16fa8cZSFNQD6m0FdYWWIUZ1NwBmv8PhqiXNbAnslDt7qEA1o/muuMdS5Tv2UDzTCQPY7ipgWU69zCywWe0zglrBF3+aKR/ECECAAqZMJ54qCmWDCmvkg+78i2EvP6CnZylynwMHWSrhKF9pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727711246; c=relaxed/simple;
	bh=ji77p899NmuWJWPYiFO/RsFWcSBX60ECvP0uw6S6F7w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tn4d+yUqGO5M6M5ervsHZh3EkaehMiABk8uTw3Ed4lQLF8glGBmLQezrPK2fnlvBB5PMXd46n/PAwpLC5cpG2tHMs03T39s7kdHlO0TI5Gs5N6cKl1XHqDM6ptRmiALcJ4LUn9Je7FwwRofB1J0cAxOiJqjQ+6FVqx9VC7wZu6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:99bb:7ad4:7fac:370a])
	by michel.telenet-ops.be with cmsmtp
	id JfnL2D00H4pGYif06fnLxt; Mon, 30 Sep 2024 17:47:21 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1svIcD-000wnk-4i;
	Mon, 30 Sep 2024 17:47:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1svIcK-000djs-Id;
	Mon, 30 Sep 2024 17:47:20 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: rza2: Mark GPIOs as used
Date: Mon, 30 Sep 2024 17:47:19 +0200
Message-Id: <2862093f7701dcaf29f37c0b2f9268234168338f.1727711124.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIOs showed up as unclaimed in debugfs, so they could be muxed to
something else even though they were in use.  Mark GPIOs as claimed when
in use to avoid that.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl for v6.13.

On RZA2M-EVB,
/sys/kernel/debug/pinctrl/fcffe000.pinctrl-pinctrl-rza2/pinmux-pins
changes:

    @@ -48,7 +48,7 @@
     pin 45 (P5_5): device e822a000.mmc function sdhi1 group sdhi1
     pin 46 (P5_6): UNCLAIMED
     pin 47 (P5_7): UNCLAIMED
    -pin 48 (P6_0): UNCLAIMED
    +pin 48 (P6_0): GPIO pinctrl:560
     pin 49 (P6_1): UNCLAIMED
     pin 50 (P6_2): UNCLAIMED
     pin 51 (P6_3): UNCLAIMED
    @@ -97,7 +97,7 @@
     pin 94 (PB_6): UNCLAIMED
     pin 95 (PB_7): UNCLAIMED
     pin 96 (PC_0): UNCLAIMED
    -pin 97 (PC_1): UNCLAIMED
    +pin 97 (PC_1): GPIO pinctrl:609
     pin 98 (PC_2): UNCLAIMED
     pin 99 (PC_3): UNCLAIMED
     pin 100 (PC_4): UNCLAIMED
---
 drivers/pinctrl/renesas/pinctrl-rza2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza2.c b/drivers/pinctrl/renesas/pinctrl-rza2.c
index af689d7c117f3548..dd1f8c29d3e7557b 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza2.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza2.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
 
@@ -229,6 +230,8 @@ static const char * const rza2_gpio_names[] = {
 static struct gpio_chip chip = {
 	.names = rza2_gpio_names,
 	.base = -1,
+	.request = pinctrl_gpio_request,
+	.free = pinctrl_gpio_free,
 	.get_direction = rza2_chip_get_direction,
 	.direction_input = rza2_chip_direction_input,
 	.direction_output = rza2_chip_direction_output,
-- 
2.34.1


