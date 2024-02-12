Return-Path: <linux-renesas-soc+bounces-2610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA32851267
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 12:38:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4CD9B284DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 11:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C0B38FBC;
	Mon, 12 Feb 2024 11:37:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B056424B57
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Feb 2024 11:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707737847; cv=none; b=Jx3z/ctoqenhQ0cZ/fn9ABJQrIQrgcQStXCs5Gx11zMwATnYKFEgz2XwfApzF5C9Fd3nKI/qRZUO/4sB+9eWGRpJ+ll26vC21vPFLDeSaPiIhwW4foEefjIprVAI5UTReYC4qj8RR/LZ/qk/SdDJJMxyJfbBWBvMJB8wxLKxKM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707737847; c=relaxed/simple;
	bh=attIBsmyl3gbtsqI7wiFXmy2jpnsNHmkkD5Kz26BirI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fg5cs9oa4o+bAn8vefv8ZntO5dLnGHuIGbtOr2TbKq18lpMKLdhk1FToOMYX/+MY6CH5hlmhSjTCWhGLGjfvlLTghVWWcm9vpZts4A4y3/Yp9QFa2eH4J4dkX83lanL+FHljLnSLjcL4/7zXTG7zFPKFPJQNnWKD8jIAADs5yUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,263,1701097200"; 
   d="scan'208";a="193656656"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 12 Feb 2024 20:37:17 +0900
Received: from localhost.localdomain (unknown [10.226.92.40])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6ADB441A9A88;
	Mon, 12 Feb 2024 20:37:15 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Marc Zyngier <maz@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/5] Fix spurious TINT IRQ and enhancements
Date: Mon, 12 Feb 2024 11:37:07 +0000
Message-Id: <20240212113712.71878-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to fix the spurious TINT IRQ as per the precaution
mentioned in section "8.8.3 Precaution when Changing Interrupt Settings"
of the latest RZ/G2L hardware manual. As per this we need to mask
the interrupts while setting the interrupt detection method. Apart from
this we need to clear interrupt status after setting TINT interrupt
detection method to the edge type.

Patch#1 in this series fixes HW race condition due to clearing delay
        by the cpu.
patch#2 simplifies the code and reused the same code in patch#3
patch#3 fixes spurious tint irq
patch#4 drops removing/adding tint source during disable()/enable()
patch#5 simplifies enable()/disable()

Before fix: Spurious TINT IRQ's during boot
root@smarc-rzg2l:~# cat /proc/interrupts | grep pinctrl
 67:          1          0 11030000.pinctrl 344 Edge      rtc-isl1208
 68:          0          0 11030000.pinctrl 378 Edge      SW3
 81:          1          0 11030000.pinctrl  17 Edge      1-003d
root@smarc-rzg2l:~#

After the fix:
root@smarc-rzg2l:~# cat /proc/interrupts | grep pinctrl
 67:          0          0 11030000.pinctrl 344 Edge      rtc-isl1208
 68:          0          0 11030000.pinctrl 378 Edge      SW3
 81:          0          0 11030000.pinctrl  17 Edge      1-003d
root@smarc-rzg2l:~#

This patch series is tested with [1]
[1] https://lore.kernel.org/all/20240206135115.151218-1-biju.das.jz@bp.renesas.com/

Biju Das (5):
  irqchip/renesas-rzg2l: Prevent IRQ HW race
  irqchip/renesas-rzg2l: Rename rzg2l_tint_eoi()
  irqchip/renesas-rzg2l: Fix spurious TINT IRQ
  irqchip/renesas-rzg2l: Use TIEN for enable/disable
  irqchip/renesas-rzg2l: Simplify rzg2l_irqc_irq_{en,dis}able()

 drivers/irqchip/irq-renesas-rzg2l.c | 88 ++++++++++++++++++++---------
 1 file changed, 61 insertions(+), 27 deletions(-)

-- 
2.25.1


