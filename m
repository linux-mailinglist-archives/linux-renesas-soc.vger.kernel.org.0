Return-Path: <linux-renesas-soc+bounces-15252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1D0A77DDC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 16:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D5E57A25D2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 14:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4548F204592;
	Tue,  1 Apr 2025 14:35:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E051ACED1
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Apr 2025 14:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518154; cv=none; b=PvRX+J+9FGtZ+FISvcM3Zprp22iyVrbszcGfd2ZJVacqpH71EFrMkVbd2WBu4Vv2RJ46ennnzihlc0kgDp/ju/1/GX/jjmyc7VIe8ouqPRspw/lFScejKgsv1sk5vZKczGDxnw5a78NUx5NXygIopXuNl8H2Eh0XLbMk8gHs6qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518154; c=relaxed/simple;
	bh=1ktT0ENen+5O01GlcspIpyJOTcFS2aG7OMgfHbQYEuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T+V9jGG1bHCT0gMOpseo7xuLfqbj3LYYrzFgc67xR0OieDUVJ3DrBtRwbrTJ1Nz5W9YBHchz5buJ3WgVcdJq27FNS0Qz/4l1In2eMnrMyqcQNun/kL8o/zBxKsW+avEequWN3mhrA0oM/PcpUZbBYbq8ThGli6FDDtoZN6Zuu5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: kxpf7SmKSoCQLCHDwr15DA==
X-CSE-MsgGUID: uZ6fP+EkT0K2qVwGObWSyw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 Apr 2025 23:35:51 +0900
Received: from localhost.localdomain (unknown [10.226.92.156])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E36BD432BC94;
	Tue,  1 Apr 2025 23:35:48 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 2/9] memory: renesas-rpc-if: Fix RPCIF_DRENR_CDB macro error
Date: Tue,  1 Apr 2025 15:35:20 +0100
Message-ID: <20250401143537.224047-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250401143537.224047-1-biju.das.jz@bp.renesas.com>
References: <20250401143537.224047-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the below macro error found while moving the reg definitions
to renesas-rpc-if-regs.h in the later patch.

ERROR: Macros with complex values should be enclosed in parentheses

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Fixed the duplicate most outer set of parentheses.
v3:
 * New patch.
---
 drivers/memory/renesas-rpc-if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 15b4706aafee..c29bec8327e8 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -56,7 +56,7 @@
 #define RPCIF_DROPR		0x0018	/* R/W */
 
 #define RPCIF_DRENR		0x001C	/* R/W */
-#define RPCIF_DRENR_CDB(o)	(u32)((((o) & 0x3) << 30))
+#define RPCIF_DRENR_CDB(o)	(((u32)((o) & 0x3)) << 30)
 #define RPCIF_DRENR_OCDB(o)	(((o) & 0x3) << 28)
 #define RPCIF_DRENR_ADB(o)	(((o) & 0x3) << 24)
 #define RPCIF_DRENR_OPDB(o)	(((o) & 0x3) << 20)
-- 
2.43.0


