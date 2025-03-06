Return-Path: <linux-renesas-soc+bounces-14099-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D99A54F0D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 16:30:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BF2E1896582
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 15:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB54C211A07;
	Thu,  6 Mar 2025 15:26:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DA120C46A;
	Thu,  6 Mar 2025 15:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741274784; cv=none; b=NHgjLaauZXMjKdbbShAew1YIeRZImjDGk7RloYgGZUX2Dh4ENh0YUliV2xGumPz9cUKtX1Tux1oK2J0gqkepHI7yHjOlb8rc6qCxkjDQlU1DjyDEQu2ULIwu1J+tiP7N6TjNqunch1oP2WIbS3l9zc3RKDK9dndLoMgFn5kJdck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741274784; c=relaxed/simple;
	bh=oHXRfZigFd/7C6a+A45VoVrVTjOVCLfBiBq6Dr5a1Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLbGop4CCXBgtcPyWSRcOvKd26sYlVX9XzW2yYLquA3avIlaLEEHenWMxlT6Gp9PwgdPPhi1H/wZAwAU7PpmevaxjMTjqrnkmzFm4C60FnphYH0ikXfzR1wbWCbzJLQCVtFuAf97iA+7TrWOlyDy+xI3Fwnh7H5wpNYEkbCI0+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: DAtfxqZwT9uryN1cZpL8tA==
X-CSE-MsgGUID: Nalr3OXTTuu5XzMzoOQ0Vw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Mar 2025 00:26:22 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.123])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 887DD400091E;
	Fri,  7 Mar 2025 00:26:19 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v4 07/13] serial: sh-sci: Fix a comment about SCIFA
Date: Thu,  6 Mar 2025 16:24:41 +0100
Message-ID: <20250306152451.2356762-8-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
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

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
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


