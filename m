Return-Path: <linux-renesas-soc+bounces-3836-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D257887E53B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 09:50:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C32B280CB4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 08:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5265288D7;
	Mon, 18 Mar 2024 08:50:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B03D24A12
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Mar 2024 08:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710751856; cv=none; b=sbKgmPk1MKwVIZwjA7ZputS5ISE5ZNsBgIxy7HqsYnaUhA8OPMHRYlP0bXwMe3LEDlHlTXP0SmuLnbKIWMrvFw6tMae5Ztt+dcS1Z4T4JSs9tyeUYFBe8WkJVlUtmPt6IeM/9pe54rzwXYHvmWDucRe7GG2DRGmacw5fEBgqKEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710751856; c=relaxed/simple;
	bh=4xeN9IuFdJlMYb34uz+hU0Q3jrMuzZ6Y/7xERjSsIUU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=exTRRzZg14hg3VTJ3Z7N8tHOg7xrucZHUaMqrrj8O6WTiS5WH60nRfHBYlq61pMEG5QcMxunOTfwRnv2zftAfxgsncIPVFOXs40L6VJhFvbcn3I/4jjxnZ9J6vmFZjTs0ZPsJnkQQT1raUpeXECU9LKh0SDxf/zugEZmeujLme0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,134,1708354800"; 
   d="scan'208";a="198171084"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 18 Mar 2024 17:50:46 +0900
Received: from localhost.localdomain (unknown [10.226.93.20])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id F1BE14008C77;
	Mon, 18 Mar 2024 17:50:44 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/2] Renesas RZ/G2L IRQ chip driver enhancements
Date: Mon, 18 Mar 2024 08:50:39 +0000
Message-Id: <20240318085041.3150-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the hardware team, TINT enable and TINT source should not be set
together as it will lead to a hardware race that result in spurious IRQ.
Hence avoid setting both in enable()/disable() instead set/clear TIEN on
enable()/disable(). After this the code can be simplfied by sharing the
common code between enable()/disable() by a helper function
rzg2l_tint_irq_endisable().

v2->v3:
 * Dropped patch#1-#4 as it is accepted
 * Split the patch#5 into 2. first one avoids setting TIEN and TINT source
   together and later patch simplifies the code.
 * Updated commit header and description for patch#1.
 * Restored the patch#2 from series#1.
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

Biju Das (2):
  irqchip/renesas-rzg2l: Do not set TIEN and TINT source at the same
    time
  irqchip/renesas-rzg2l: Simplify rzg2l_irqc_irq_{en,dis}able()

 drivers/irqchip/irq-renesas-rzg2l.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

-- 
2.25.1


