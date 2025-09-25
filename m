Return-Path: <linux-renesas-soc+bounces-22363-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAC2B9E830
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 11:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48BA61BC121C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 09:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2209E2874E4;
	Thu, 25 Sep 2025 09:53:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B7638FA6;
	Thu, 25 Sep 2025 09:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758794013; cv=none; b=laRvnHM/70VQDPSB9pVn4FQAb+wHuzWYT9r+MDhBlgmvt5ulJuOnMOcNS7RQXvjQj5Pypd2sm/dGptlnUtkmtu1sylmeUhi659x6QfT+w+kxOLrnOMLNyt4yiIWr/Ht+6NtQdit/SbBKpUgUZveQTpACMAjDO8JsU3wtdBqUbXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758794013; c=relaxed/simple;
	bh=ExBC2jwsDRqkqjG/cxYrmOLzoi1H+ZjZ/3tUYQ5ijSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hfL3jNQa0fM53lVWkoSo7yC1O24lcfVsBYbVwGPlk2W2iyNTBgPs+HC/YKG6Q+JWbRN7gbbr67nvi8XdVlLwo6f/32jzNh5H7SyTnw0RnKLMa7OwLu0WV8d2efLnMr77gu+oe79YI0ogS4gKpJS+piRQ5FMVcH7w8AxWGuxtS/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BDFC4CEF0;
	Thu, 25 Sep 2025 09:53:30 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] clk: renesas: Use IS_ERR() for pointers that cannot be NULL
Date: Thu, 25 Sep 2025 11:53:24 +0200
Message-ID: <81260328acb5c78e915ab04afad3901a31c16128.1758793709.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of IS_ERR_OR_NULL() suggests that "clk" can be a NULL pointer.
Hence smatch assumes so, and issues a "passing zero to 'PTR_ERR'"
warning.

At these checkpoints, "clk" always contains either a valid pointer, or
an error pointer (none of the functions called return NULL pointers).
Hence replace IS_ERR_OR_NULL() by IS_ERR().

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202408032025.ve2JMaoV-lkp@intel.com/
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk-for-v6.19.

 drivers/clk/renesas/renesas-cpg-mssr.c | 2 +-
 drivers/clk/renesas/rzg2l-cpg.c        | 2 +-
 drivers/clk/renesas/rzv2h-cpg.c        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 7d661beb09a0810b..0289a35e4e6a0e59 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -451,7 +451,7 @@ static void __init cpg_mssr_register_core_clk(const struct cpg_core_clk *core,
 		break;
 	}
 
-	if (IS_ERR_OR_NULL(clk))
+	if (IS_ERR(clk))
 		goto fail;
 
 	dev_dbg(dev, "Core clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 15b0b96373b03d16..2923961ec001079a 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1177,7 +1177,7 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 		goto fail;
 	}
 
-	if (IS_ERR_OR_NULL(clk))
+	if (IS_ERR(clk))
 		goto fail;
 
 	dev_dbg(dev, "Core clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 0965f3d11213ed22..0509d1e338058f4e 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -591,7 +591,7 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 		goto fail;
 	}
 
-	if (IS_ERR_OR_NULL(clk))
+	if (IS_ERR(clk))
 		goto fail;
 
 	dev_dbg(dev, "Core clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
-- 
2.43.0


