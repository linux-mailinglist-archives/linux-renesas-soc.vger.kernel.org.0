Return-Path: <linux-renesas-soc+bounces-8570-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD52966A84
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 22:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 199411C22605
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 20:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCA416D4FF;
	Fri, 30 Aug 2024 20:30:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D54F14A624
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Aug 2024 20:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725049832; cv=none; b=M1mxIIOokbl1mbb9nE/VJytKy+mX2oI3J/BPiLCeWvdzHcKUO60idN3jWPlT3PlGlm8664mRu5O7qg60H8C7f6/Pa45vN3H8MBPu8jHwQ4awVQAD4HbkY0C2OKW8tD5ncUxW31Fo2QHCrFi89IDMJpcx6MdY6ODjOCLs5Zi+YmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725049832; c=relaxed/simple;
	bh=jJjz/Mjn/tEYdtyLR6dqr7miC4NGLZvxdhGr97EI+Bs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jSw7ZxRwmJSBSa9uJXES4+j4ac/Au0oCQGdPospPp7m6o6L7BE2n7qKsyfPRb2poPaMbCZjxpSl14D9oWObBwaJS9Mrqi5VDwfLVYbBas4Z7X5DSXlHuqMjwU8TCjeGCWeoWI1cQHHxBj74aB7yDr8g4NTf8Pe2sZqgpBllwlrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,189,1719846000"; 
   d="scan'208";a="221057071"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 Aug 2024 05:30:23 +0900
Received: from localhost.localdomain (unknown [10.226.92.75])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5E860406F1EA;
	Sat, 31 Aug 2024 05:30:21 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 RESEND 1/3] memory: renesas-rpc-if: Use Hi-Z state as the default setting for IOVF pins
Date: Fri, 30 Aug 2024 21:30:03 +0100
Message-ID: <20240830203014.199326-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240830203014.199326-1-biju.das.jz@bp.renesas.com>
References: <20240830203014.199326-1-biju.das.jz@bp.renesas.com>
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
v2->v2 resnd:
 * Rebased to next.
RFC->v2:
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


