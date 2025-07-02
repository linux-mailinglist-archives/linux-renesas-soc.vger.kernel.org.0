Return-Path: <linux-renesas-soc+bounces-19015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD5AAF0E7D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 10:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA1701767AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 08:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0BE2236454;
	Wed,  2 Jul 2025 08:54:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25FE19D8A7;
	Wed,  2 Jul 2025 08:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751446441; cv=none; b=gGUPmWTkjY68q7v8IPUFy/3J9tS6F0g+HYSgowd8I/YIBIs/vSTf0/CyCopOm3FbuiLr8syqLFrT8AIGZROI3ST15lZUsUIkAKZg36lJzpaKgDK+8m4Fmfq4DJFdO1IZmhNwGq2HhXnRf+QrdsLuZjWnTkSSPs8CLXmjADlTi9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751446441; c=relaxed/simple;
	bh=rnRY7lBQU0q4PYMw/uTDWJlxe1RyC6Q+srqWl9qmGAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IxxovXK6JntMAnvUZ2kM5A3SDvEeSWdddxhyTXadzHe4vJj8VUN/T3s2hEDKhBsLAzbIp19A03T5hqc6nvvQ5d+2qivl0ca34+QbKngdOsjDVSLbTQbfALaL1peNIK6LjliDVgS6sB8rFEQB2iqtqqHKPsgeOSpsWIxBqfM+INs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16E3C4CEED;
	Wed,  2 Jul 2025 08:53:59 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Thomas Gleixner <tglx@linutronix.de>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] irqchip/renesas-rzv2h: Remove unneeded includes
Date: Wed,  2 Jul 2025 10:53:54 +0200
Message-ID: <d4fbffc39af2eaa7bc50a0a97ffb3a22e3c4cb6a.1751446168.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RZ/V2H ICU driver does not use clocks, of_address, or syscore.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/irqchip/irq-renesas-rzv2h.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 57c5a3c008c91efd..e58ac9eedc821e50 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -11,18 +11,15 @@
 
 #include <linux/bitfield.h>
 #include <linux/cleanup.h>
-#include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/irqchip.h>
 #include <linux/irqchip/irq-renesas-rzv2h.h>
 #include <linux/irqdomain.h>
-#include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/spinlock.h>
-#include <linux/syscore_ops.h>
 
 /* DT "interrupts" indexes */
 #define ICU_IRQ_START				1
-- 
2.43.0


