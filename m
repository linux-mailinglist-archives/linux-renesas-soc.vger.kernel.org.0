Return-Path: <linux-renesas-soc+bounces-14256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 762B2A5BF36
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 12:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7010174654
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 11:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2645FC13B;
	Tue, 11 Mar 2025 11:36:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5B72505AC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Mar 2025 11:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741693003; cv=none; b=JkVzRmF5zBMY6WK9Cu7ctfM7+I1Vx7GoBDwg+phDNkt9W9Y5uMw7v+W3iNIihQMTo0rMeeW04UqM+UOS4HwShEZ8YYhWu0S5bm4Ppi8hH+GWFDmg3FzV+jQm8d0i3XGEkIul1QP80xSzfwRp4O3sm25XIuHkBEdiuhRWiqXAri8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741693003; c=relaxed/simple;
	bh=C/hiu6wFIXhUd5Z9aiAEs6oK3DpFurDR5oV4MyjcXbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KEsZZQmuAeeIMT8+IBiSJ14v701uZBZy3W+pWumMJU2YxWtJ8heNWwLNc42Ko5Ac7FhafltVRZUYEPduv48v9ayBOb8gOOmwxoOlwGt/fPcClmf9sxDzkhCZkoi2aVI24510yvYXzHE4TKvZ3EO3cHGbXUYpjJZPRrjSC9Evf7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: kQCoF+etQya91O/MaQcuYw==
X-CSE-MsgGUID: HrE8VYqNTxepnJo5F0RKjg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Mar 2025 20:36:34 +0900
Received: from localhost.localdomain (unknown [10.226.92.227])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 89D2142AA21E;
	Tue, 11 Mar 2025 20:36:32 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 2/9] memory: renesas-rpc-if: Fix RPCIF_DRENR_CDB macro error
Date: Tue, 11 Mar 2025 11:36:08 +0000
Message-ID: <20250311113620.4312-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
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
#define RPCIF_DRENR_CDB(o)	(u32)((((o) & 0x3) << 30))

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * New patch.
---
 drivers/memory/renesas-rpc-if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 15b4706aafee..f17a958b097e 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -56,7 +56,7 @@
 #define RPCIF_DROPR		0x0018	/* R/W */
 
 #define RPCIF_DRENR		0x001C	/* R/W */
-#define RPCIF_DRENR_CDB(o)	(u32)((((o) & 0x3) << 30))
+#define RPCIF_DRENR_CDB(o)	(((u32)((o) & 0x3) << 30))
 #define RPCIF_DRENR_OCDB(o)	(((o) & 0x3) << 28)
 #define RPCIF_DRENR_ADB(o)	(((o) & 0x3) << 24)
 #define RPCIF_DRENR_OPDB(o)	(((o) & 0x3) << 20)
-- 
2.43.0


