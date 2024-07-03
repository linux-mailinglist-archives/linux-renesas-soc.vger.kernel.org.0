Return-Path: <linux-renesas-soc+bounces-7042-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB093926425
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 17:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55E531F25DBD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 15:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A5A17DA15;
	Wed,  3 Jul 2024 14:59:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB3117C205
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jul 2024 14:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720018741; cv=none; b=c469EAyc6fl/W/1n7aIA3lU6X+j50ZxU5zNp9h16jQcPtHhZqGZQuLssgf52xBJxrBqjGyy1roh8tQzbQbyso/PI3hz9b1uqwMVnq/JI4mkJnxlxXVWogZK/CzV5Lc3WRYj9Q0AT760cDmwK5YheD/t5Pz/F0JIrAK/920SGADE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720018741; c=relaxed/simple;
	bh=uMXhJuzOx98Ibkf2JSJEzShQIOJEvbVY+1JxNX5o7FI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UfkXaaPp4jIa24OsH1IRZlU47c3QOUZB2/NC4YYFls+zPxSVlgc+KnCnkV9EuWflXBGu1wDYioSzYe8L8cKl/qaM9I6dphaxd5S7As4M/neHyfq0/0CHGU7mVxNOXymjGP2iQ3e3hXak8gzSP8lZe8pMtGMHE/yO2u02G1yiV0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,182,1716217200"; 
   d="scan'208";a="214125765"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Jul 2024 23:58:56 +0900
Received: from localhost.localdomain (unknown [10.226.92.104])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E69334561783;
	Wed,  3 Jul 2024 23:58:53 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Walle <michael@walle.cc>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/3] Enable serial NOR flash on RZ/G2UL SMARC EVK
Date: Wed,  3 Jul 2024 15:58:45 +0100
Message-ID: <20240703145851.204306-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to enable serial NOR flash on RZ/G2UL SMARC EVK.

The RZ/{G2L,G2LC,V2L} SMARC EVK uses Micron MT25QU412A flash and RZ/G2UL
SMARC EVK uses Renesas AT25QL128A flash. With current pin setting for
IOVF pin, 4-bit flash write fails for AT25QL128A flash. Use Hi-Z state
as the default for IOVF pins, so that spi controller driver in linux will
be independent of flash type.

To support this, during board production, the bit 4 of the NV config
register must be cleared by the bootloader for Micron flash.

Output from u-boot after clearing bit4 of NVCR register.
=> renesas_micron_flash_nvcr
SF: Detected mt25qu512a with page size 256 Bytes, erase size 64 KiB, total 64 MiB

Update partition table for spi-nor flash, so that we can flash bootloaders
in Linux by executing the below commands:
flash_erase /dev/mtd0  0 0
flash_erase /dev/mtd1  0 0
mtd_debug write /dev/mtd0 0 ${BL2_FILE_SIZE} ${BL2_IMAGE}
mtd_debug write /dev/mtd1 512 ${FIP_FILE_SIZE} ${FIP_IMAGE}

RFC->v1:
 * Dropped patches related to set_iofv() callback
 * Used Hi-Z state as the default for IOVF pin state.
 * Enabled Serial NOR flash on RZ/G2UL SMARC EVK
 * Updated partition table on RZ/{G2L,G2LC,V2L} SMARC EVK in order to
   flash bootloader images from Linux.
 
RFC: https://lore.kernel.org/linux-renesas-soc/e8ed909b39b5a7de46a07d2b57c0393a@walle.cc/T/#t

Biju Das (3):
  memory: renesas-rpc-if: Use Hi-Z state as the default for IOVF pin
  arm64: dts: renesas: rzg2ul-smarc-som: Enable serial NOR flash
  arm64: dts: renesas: rz{g2l,g2lc}-smarc-som: Update partition table
    for spi-nor flash

 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     | 15 ++++--
 .../boot/dts/renesas/rzg2lc-smarc-som.dtsi    | 15 ++++--
 .../boot/dts/renesas/rzg2ul-smarc-som.dtsi    | 48 +++++++++++++++++++
 drivers/memory/renesas-rpc-if.c               |  2 +-
 4 files changed, 71 insertions(+), 9 deletions(-)

-- 
2.43.0


