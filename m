Return-Path: <linux-renesas-soc+bounces-8569-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBFC966A82
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 22:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F17AB1C21F20
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 20:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537CF166F0D;
	Fri, 30 Aug 2024 20:30:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9B315B117;
	Fri, 30 Aug 2024 20:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725049831; cv=none; b=blFZpzeJC+u/f3183Uww4+prx6P8IXkDtxZFl/tNWaeYoxSg9DjZ3zrHUe1yfBdeDEfOxnMIC0Vl2tSe5HdhEmyt7Yd/z3m4OrlESQsGgHNjG+5eFT3MXqCWwumBqdZjdBMTSj/HbQQCeIaYg6OgDzKVFT7JnSeZw1nRmZHcr1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725049831; c=relaxed/simple;
	bh=r+vleoUyp+YLco4inMrnkZ9PxfRAdtFda/5YsmJJPzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bbJYX+OPepGXRdz0zNA03ZPLWOUjY4JirXedw/iMK421JoBjvNT1RSAKZ1ypjIzSO85l3MMHvvCEJizzS33wOfPj06g1QE4w1D0/jRKXjFS0kv6ey3KQ0oNmT48HN5ap2BEtqrS/+BmSHxIaH+8iw/tPKFvZPqLXGrew7WjRNGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,189,1719846000"; 
   d="scan'208";a="217084506"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 Aug 2024 05:30:20 +0900
Received: from localhost.localdomain (unknown [10.226.92.75])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id DE8C5406DF57;
	Sat, 31 Aug 2024 05:30:17 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 RESEND 0/3] Enable serial NOR flash on RZ/G2UL SMARC EVK
Date: Fri, 30 Aug 2024 21:30:02 +0100
Message-ID: <20240830203014.199326-1-biju.das.jz@bp.renesas.com>
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

v2->v2 resend:
 * Rebased to next
RFC->v2:
 * Dropped patches related to set_iofv() callback
 * Used Hi-Z state as the default for IOVF pin state.
 * Enabled Serial NOR flash on RZ/G2UL SMARC EVK
 * Updated partition table on RZ/{G2L,G2LC,V2L} SMARC EVK in order to
   flash bootloader images from Linux.
 
RFC: https://lore.kernel.org/all/c9b0cffbb1566a7d38f2251ac7c8883a@walle.cc/

Biju Das (3):
  memory: renesas-rpc-if: Use Hi-Z state as the default setting for IOVF
    pins
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


