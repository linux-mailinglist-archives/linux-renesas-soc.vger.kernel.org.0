Return-Path: <linux-renesas-soc+bounces-18915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9854AED6CC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 10:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFC1918999F5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 08:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF742397B0;
	Mon, 30 Jun 2025 08:13:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CC9239E82;
	Mon, 30 Jun 2025 08:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751271210; cv=none; b=FLsicrm7xgOX1ie7ee9oeK18l+elqdB/KJ9+i9+Owq48rnyiK2oDx4L6B0kUzWkhTbkPt8BEhcZ4LZbYXKuJgYQw7Y86YJhsO+5t9PcypGXTJ765r8X+S5ayijKO5ZqL9EBfG8AchrkTgIHnI5qHGtz/IoX+EbD7CrU0EPziApM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751271210; c=relaxed/simple;
	bh=8LCExvnyGXEauHQ75u5swL3gccPi+WXz5xY5SUNv6Q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=emlZOry6tmB2+YYu4+6t8MWjm8DhX9zleDv87KuvywVqhADnoTfFmH/0NB47ZubJ9FSXZZnpXStA1Wo2vxDrd5DRm2R9Ho91CKrIQWjt3Crgqnc/QdRCDZodSuDc9hTysIAT2OC54eiZ6eOalpxGDj1A1FmhvpoAJav40NjjFnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: KgqNFuYxRKKwAEGOa8b6Eg==
X-CSE-MsgGUID: h+65nhXGQJOh4DpLPiC2Gw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 30 Jun 2025 17:13:20 +0900
Received: from localhost.localdomain (unknown [10.226.92.44])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 60F5241BF1FF;
	Mon, 30 Jun 2025 17:13:18 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH RFC/RFT 0/2] Enable 64-bit polling mode for R-Car Gen3 and
Date: Mon, 30 Jun 2025 09:13:09 +0100
Message-ID: <20250630081315.33288-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the RZ/{G2L,G3E} HW manual SD_BUF0 can be accessed by 16/32/64
bits. Most of the data transfer in SD/SDIO/eMMC mode is more than 8 bytes.
During testing it is found that, if the DMA buffer is not aligned to 128
bit it fallback to PIO mode. In such cases, 64-bit access is much more
efficient than the current 16-bit.

Biju Das (2):
  mmc: tmio: Add 64-bit read/write support for SD_BUF0 in polling mode
  mmc: renesas_sdhi: Enable 64-bit polling mode

 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  3 +-
 drivers/mmc/host/tmio_mmc.h                   | 12 +++++++
 drivers/mmc/host/tmio_mmc_core.c              | 32 +++++++++++++++++++
 include/linux/platform_data/tmio.h            |  3 ++
 4 files changed, 49 insertions(+), 1 deletion(-)

-- 
2.43.0


