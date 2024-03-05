Return-Path: <linux-renesas-soc+bounces-3481-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F478726B4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 19:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 070901C23501
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 18:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911F117BCF;
	Tue,  5 Mar 2024 18:39:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3631426F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Mar 2024 18:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709663978; cv=none; b=nmSt1kDpbQ1H1eKB9snxOlzHev63SzMyG8YcgT6spbm2pgEF2V8SSYIBt58IpC+26xK5AP7Jku+F6GeU7YQs3kI/tRMcGBH8WOFlTN2aIpm42Xj/Y7lyk0Kr1C2OZ9ztjDONXPAJelw4O2ykZk+3C2SWYcpTs2mhM1U4Nqmz5sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709663978; c=relaxed/simple;
	bh=puECASevmLJ/VvGEV/sJQyCpXsY7ue6F20w0Ja5Sr64=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lcqE6rwF/TDo5hjf/tRgQbVPLlu96pLl2u2wvwzVR5Ob7+KYJnewDo6N69uSdWygIfPb332+LDtCH7LGH/EzAG8upRxR1VYgfyzz5sIMCYc/wXAyB47PgFn2U5sZhXj8m3iJHF9in+mHqeJqilQrY4uIV+5M4DEEaY6d4NmlucI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,206,1705330800"; 
   d="scan'208";a="200436902"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Mar 2024 03:39:28 +0900
Received: from localhost.localdomain (unknown [10.226.92.185])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C4425400C4E9;
	Wed,  6 Mar 2024 03:39:26 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Marc Zyngier <maz@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/5]  Fix spurious TINT IRQ and enhancements
Date: Tue,  5 Mar 2024 18:39:17 +0000
Message-Id: <20240305183922.138727-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to fix the spurious IRQ as per the precaution
mentioned in section "8.8.3 Precaution when Changing Interrupt Settings"
of the latest RZ/G2L hardware manual. As per this masking of the
interrupts need to be done before setting the interrupt detection method.
Then set the TINT interrupt detection method followed by clearing the
status register for fixing spurious IRQ.

Patch#1 in this series flushes the posted write
patch#2 and #3 simplifies the code and reused the same in patch#3
patch#4 fixes spurious irq
patch#5 drops removing/adding tint source during disable()/enable()

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

v1->v2:
 * Dropped pinctrl dependency as it hits next.
 * Updated commit header and description for patch#1.
 * Extended the flushing of posted write to IRQ interrupt as well.
 * Updated patch#2 commit description *_tint_eoi()->*_clear_tint_int().
 * Added Rb tag from Geert for patch#2.
 * Added Patch#3 is for replacing rzg2l_irq_eoi()->rzg2l_clear_irq_int().
 * Updated commit header and description for patch#4.
 * Extended spurious IRQ fix for TINT to IRQ as well.
 * Updated the logic for rzg2l_disable_tint_and_set_tint_source() and
   rzg2l_tint_set_edge().
 * Merged patch#4 and #5 and updated commit description.

Biju Das (5):
  irqchip/renesas-rzg2l: Flush posted write
  irqchip/renesas-rzg2l: Rename rzg2l_tint_eoi()
  irqchip/renesas-rzg2l: Rename rzg2l_irq_eoi()
  irqchip/renesas-rzg2l: Fix spurious IRQ
  irqchip/renesas-rzg2l: Use TIEN for enable/disable

 drivers/irqchip/irq-renesas-rzg2l.c | 101 ++++++++++++++++++----------
 1 file changed, 66 insertions(+), 35 deletions(-)

-- 
2.25.1


