Return-Path: <linux-renesas-soc+bounces-15350-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF46A7B170
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Apr 2025 23:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BF4F3A60C7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Apr 2025 21:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C544B1F3D58;
	Thu,  3 Apr 2025 21:30:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7770E1EFFB4;
	Thu,  3 Apr 2025 21:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715826; cv=none; b=mIBYfliRxW+6NVnw8/9ehad9qERuHXd9Y2Ig2wni+g9Off6LDY0xfqN4ZT3rt/PWlkReyz7PI70rx4XIKm1fJiLY3Xac9pb/Dd/lPgX87d4CDFrPXLruWcqkF8K+HYxW3UWLYFwzBctVHlHWOVlStjxsqybDgnvC6ZcbD5JIJeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715826; c=relaxed/simple;
	bh=Kxv8bDlCQcifV6nha/JRMeJQNZk5VkGyRFOMYLjWjJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SzY+1bORvSbYSv4jcU/+2rNfH+4QZ+jH61dHMmccjqP7KDu9Ix9bv1taLUAapMa0MsSHfc75jYt1ODWWh4q4PKkm8N23XNpbqKui4yMRSE0i3M9v5v0+p/6gkajV0I5si1M1qTzbtwdL6RUssvaJIiIrwfRHwq8hyutDQ2wPXwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 5SR29/26SpKHb3QWt/aQxA==
X-CSE-MsgGUID: ozSC8nBKRrCMgVMb5riQAA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Apr 2025 06:30:23 +0900
Received: from superbuilder.administration.lan (unknown [10.226.92.33])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 24DA340B5151;
	Fri,  4 Apr 2025 06:30:19 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v7 07/13] serial: sh-sci: Fix a comment about SCIFA
Date: Thu,  3 Apr 2025 23:29:09 +0200
Message-ID: <20250403212919.1137670-8-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment was correct when it was added, at that time RZ/T1 was
the only SoC in the RZ/T line. Since then, further SoCs have been
added with RZ/T names which do not use the same SCIFA register
layout and so the comment is now misleading.

So we update the comment to explicitly reference only RZ/T1 SoCs.

Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
Changes v6->v7: none
Changes v5->v6: none
Changes v4->v5: none
Changes v3->v4: none
---
 drivers/tty/serial/sh-sci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 1c8480d0338e..d7a060033a89 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -310,7 +310,7 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 	},
 
 	/*
-	 * The "SCIFA" that is in RZ/A2, RZ/G2L and RZ/T.
+	 * The "SCIFA" that is in RZ/A2, RZ/G2L and RZ/T1.
 	 * It looks like a normal SCIF with FIFO data, but with a
 	 * compressed address space. Also, the break out of interrupts
 	 * are different: ERI/BRI, RXI, TXI, TEI, DRI.
-- 
2.43.0


