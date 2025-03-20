Return-Path: <linux-renesas-soc+bounces-14674-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC0AA6A2AD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 10:31:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23A5E3AA289
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 09:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81785214A7F;
	Thu, 20 Mar 2025 09:31:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305B4AD23;
	Thu, 20 Mar 2025 09:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742463075; cv=none; b=KCFlgTWHfxQSkqNYr/FuKNYWwBYJ2h+tknq4beiXkwpbVuHD7zpVySTIUseCCdx1HixBPa9CUUr6MpqQmbcwTJI8Q+YFAI7qpSBS0/Grl8uiyxEky4JJXwJvwcrByy3wyUWjTOmxqHiiR0YerFpl4cek1dibQ89/Qo9d8BNfz8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742463075; c=relaxed/simple;
	bh=Gfl6dLMu1qf9UD47vShq0+2QEVKe0Y2o7y8LmBbuTO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LG6KJY40p98gakRlJn/0iIrIw6s54l/9kEJpW5mHhTJu10VAvb4FMbCwYl2DOBCxba8T5KMMt/s7rWl1Lpx9cfpDLnW/6fTvaL62CWidA8TuRK2wX+RbDgoroWVLHxUMujvbkdgiakgBB3sGOz2cRofF/BuiLc6ZZDmozf00+no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 5ZEQDK1hRxe5IaN9lpI3cA==
X-CSE-MsgGUID: WyxJ5FacRNqg2AILExekvg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Mar 2025 18:31:12 +0900
Received: from localhost.localdomain (unknown [10.226.93.24])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id B15374005026;
	Thu, 20 Mar 2025 18:31:09 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] clk: renesas: rzv2h-cpg: Fix a typo
Date: Thu, 20 Mar 2025 09:31:01 +0000
Message-ID: <20250320093107.36784-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo montor->monitor in kernel-doc comment.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 2b9771ab2b3f..99e17646a673 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -110,7 +110,7 @@ struct pll_clk {
  * @on_index: register offset
  * @on_bit: ON/MON bit
  * @mon_index: monitor register offset
- * @mon_bit: montor bit
+ * @mon_bit: monitor bit
  */
 struct mod_clock {
 	struct rzv2h_cpg_priv *priv;
-- 
2.43.0


