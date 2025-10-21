Return-Path: <linux-renesas-soc+bounces-23357-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF89BF525B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 10:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 127CE4683FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 08:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C332EBDEB;
	Tue, 21 Oct 2025 08:04:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CED29BDAC;
	Tue, 21 Oct 2025 08:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761033841; cv=none; b=ST70bSVPjVT49S/PyZO319Cw5F4ZyvyRds6u5pvYYbBk11GCcmi5/ohP+q6eVkv0u5KxkNRkWIZhbhd/zyvwnzERALWsDuZXEn8v4qi9ghYCKvuP+IHdlcFLiWwTmH7/yoVfcnoxM5Q9a51SYyTKV7CRjzvqzJ9OZI/Wufmp5Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761033841; c=relaxed/simple;
	bh=2gHaaqXyKyG2dX+elCvrKh1JmB9OH4MXLU/Yn2bFckE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X98FPX8o0r0O8QMsKBr4ILztARQvkkUAt5CUZ7M7nRiAfBPGC/bV2PO0X3+WoY5U5MVUGf/m5wGbBMfeWp2vQYUG1QZ16kuj4yLKTV0CzzqzYArecu+eUGjC+BoYoU4q6rVqqQSbiy0kxEtvmNC/hLs8N2QVaCWDpinuAjr6LgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA3FC4CEF1;
	Tue, 21 Oct 2025 08:03:59 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: cpg-mssr: Spelling s/offets/offsets/
Date: Tue, 21 Oct 2025 10:03:56 +0200
Message-ID: <47bf5186c3a234f6a6e53d8fdc81fafd2e981534.1761033805.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a misspelling of "offsets".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.19.
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index a3d171ddaab9923b..9e61abcba6c852da 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -41,7 +41,7 @@
 #endif
 
 /*
- * Module Standby and Software Reset register offets.
+ * Module Standby and Software Reset register offsets.
  *
  * If the registers exist, these are valid for SH-Mobile, R-Mobile,
  * R-Car Gen2, R-Car Gen3, and RZ/G1.
-- 
2.43.0


