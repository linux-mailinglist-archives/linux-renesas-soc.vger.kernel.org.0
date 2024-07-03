Return-Path: <linux-renesas-soc+bounces-7044-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E4A926428
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 17:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 052561C24CCD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 15:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08F918132E;
	Wed,  3 Jul 2024 14:59:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E593B17C205
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jul 2024 14:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720018748; cv=none; b=QcLkTRhdphjnKJrTF19gcz1Qw4thrdKPGXVt32QPFWbEXn6ok7aNxns5QGh0jPO9ho5g99l/prGsKo9BAbGHG93E1FsISUl8RlM3Wf6M6xL3D31KFgBY/uByWYGqkw/ViYjP5fZgplZbhOz/YkJRq5JvR2ORbbcvG+p6i7YKEAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720018748; c=relaxed/simple;
	bh=R3pgxcELtpOsRj6xJhtmOyC65GWJU8oXpkyYnuWm3Uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ohlnYc5DvotUNcws/RA3tUkWatjoMJB3xHlOxrOdmawXls73XDorRRPIVlMJcBYxma0Tqo81edJg/jj/T92vHwfKBDzjbkf7W+qQYgwwlinK/CoH+ENKDlUjrfXjZS+tqBfbWWB8gUmiKGTPce7siWyjB+Sw++4zpndri5pEBMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,182,1716217200"; 
   d="scan'208";a="210169602"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Jul 2024 23:58:59 +0900
Received: from localhost.localdomain (unknown [10.226.92.104])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 67ECE4561783;
	Wed,  3 Jul 2024 23:58:57 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Walle <michael@walle.cc>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/3] memory: renesas-rpc-if: Use Hi-Z state as the default setting for IOVF pins
Date: Wed,  3 Jul 2024 15:58:46 +0100
Message-ID: <20240703145851.204306-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240703145851.204306-1-biju.das.jz@bp.renesas.com>
References: <20240703145851.204306-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RZ/{G2L,G2LC,V2L} SMARC EVK uses Micron MT25QU412A flash and RZ/G2UL
SMARC EVK uses Renesas AT25QL128A flash. With current pin setting for
IOVF pin, 4-bit flash write fails for AT25QL128A flash. Use Hi-Z state
as the default for IOVF pin, so that spi controller driver in linux will
be independent of flash type.

To support this, during board production, the bit 4 of the NV config
register must be cleared by the bootloader for Micron flash.

Output from u-boot after clearing bit4 of NVCR register.
=> renesas_micron_flash_nvcr
SF: Detected mt25qu512a with page size 256 Bytes, erase size 64 KiB, total 64 MiB
NVCR=0xef

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
RFC->v1:
 * New patch.
---
 drivers/memory/renesas-rpc-if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 3167826b236a..7fbd36fa1a1b 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -367,7 +367,7 @@ int rpcif_hw_init(struct device *dev, bool hyperflash)
 		regmap_update_bits(rpc->regmap, RPCIF_CMNCR,
 				   RPCIF_CMNCR_MOIIO(3) | RPCIF_CMNCR_IOFV(3) |
 				   RPCIF_CMNCR_BSZ(3),
-				   RPCIF_CMNCR_MOIIO(1) | RPCIF_CMNCR_IOFV(2) |
+				   RPCIF_CMNCR_MOIIO(1) | RPCIF_CMNCR_IOFV(3) |
 				   RPCIF_CMNCR_BSZ(hyperflash ? 1 : 0));
 	else
 		regmap_update_bits(rpc->regmap, RPCIF_CMNCR,
-- 
2.43.0


