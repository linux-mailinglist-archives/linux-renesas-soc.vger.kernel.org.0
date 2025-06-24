Return-Path: <linux-renesas-soc+bounces-18681-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AD8AE6F89
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 21:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D67D9164B53
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 19:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A349E2E62B3;
	Tue, 24 Jun 2025 19:27:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DB722D4C3;
	Tue, 24 Jun 2025 19:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793278; cv=none; b=bQS6JbU53hiXzV7I8zQ1IonbyeWrD8hgUyFS6i2Gfr1QbikEdpEUdGFGwb5iG8OoFFXlGaB+lTUsxbjcopxfCTbOegICTsrONbUt1BoKgiE8OCrWcP2dgNHFdSvf6AYwpGGa9LolrBHuQYF51xiSrPuOVpSUH6iqAPCGmJaFsdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793278; c=relaxed/simple;
	bh=EmKrkmrGNow4ZgVvb7DHBI4PdW+wNF09nrDNzAON91g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=skAoXPCTZdtOW+zYDe2p0S/x9GFu2GWbi0ejwb0MUUO3m4Rf/K4+g5OylZ29WvZMnaOFOqCXhWXihdKISSPitfRE38XN+y2mMs+1XiNyMaaCI840OxFe+xh3oE3qoEhALC03jKCCpsCHgPIjV6NbhGxjWObSx4kTme+Lhn1Nu+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: BV0tFG9ZT0edBPxm6UPkUg==
X-CSE-MsgGUID: bXlZBeQ0RxeW8g3gNFptaQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jun 2025 04:27:55 +0900
Received: from mulinux.example.org (unknown [10.26.240.23])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 056D4406C864;
	Wed, 25 Jun 2025 04:27:52 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: renesas: rzv2h: Add missing include file
Date: Tue, 24 Jun 2025 20:27:48 +0100
Message-Id: <20250624192748.340196-1-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

File `rzv2h-cpg.h` makes use of data types defined in `types.h`,
but it's not including it, which could translate to build errors.

Include `types.h` to fix this problem.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 7321b085f937..25e0a9e5761b 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -9,6 +9,7 @@
 #define __RENESAS_RZV2H_CPG_H__
 
 #include <linux/bitfield.h>
+#include <linux/types.h>
 
 /**
  * struct pll - Structure for PLL configuration
-- 
2.34.1


