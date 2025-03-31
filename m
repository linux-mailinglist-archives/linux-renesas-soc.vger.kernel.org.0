Return-Path: <linux-renesas-soc+bounces-15154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FB1A765DE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 14:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FD52188D43A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8201E8855;
	Mon, 31 Mar 2025 12:28:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F1E1E7C2E;
	Mon, 31 Mar 2025 12:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743424081; cv=none; b=aQY/WD4k0E2H2ixFUlRr6WDmlKlVw7OqcHAO7A0pDjIC11fgAEj3qR55WAl0yMaS3ZfreyS9u5eWGEgGNqIq3Snd69b4H59t9DR9mnAQ9YU5mUjm75fLq9TacuwcQ8tH2fenjHj9oMLGDcSEnGiSRf6JflxF6/htlk0SDITJtNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743424081; c=relaxed/simple;
	bh=p+UpnbPwDeARJv/maC1fIkcpZEJZnsAIOIGzIP9Aizo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VfUeBy6PFL+xLVCbEP+zPblf8grusfHLhKHVljHL+2+9xTe49tgl6b/HijU3rVt6yaaBKxASJ4nOQZBdB2ZGUtOIZZZAZJ/C6AZnEuf02zCAEikfoAK9fKFt0DJ5lvsDPHSHtyUmZ+5Q38E+0a1torH3jFHOh9T5LOo/AEIL9UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: xnI36c88SxWCGCveon7jLQ==
X-CSE-MsgGUID: Dx5Lmjg0Sq+Q8LNNRbacpQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 Mar 2025 21:27:59 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.144])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3FE0E41F57FC;
	Mon, 31 Mar 2025 21:27:55 +0900 (JST)
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
Subject: [PATCH v6 07/13] serial: sh-sci: Fix a comment about SCIFA
Date: Mon, 31 Mar 2025 14:26:48 +0200
Message-ID: <20250331122657.3390355-8-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250331122657.3390355-1-thierry.bultel.yh@bp.renesas.com>
References: <20250331122657.3390355-1-thierry.bultel.yh@bp.renesas.com>
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


