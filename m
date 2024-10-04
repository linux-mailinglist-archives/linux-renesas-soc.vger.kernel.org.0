Return-Path: <linux-renesas-soc+bounces-9450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F31990A28
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 19:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 275D81F2275C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 17:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FC515B554;
	Fri,  4 Oct 2024 17:32:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA253E49D;
	Fri,  4 Oct 2024 17:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728063172; cv=none; b=CQUO5HFuYCvT0Plf4iK29x0Allj9i/jU53Sa7W3+3M2XeIXXN+cptltSRCsux93NloMrf+FoiLjFk5yRC6XstBchrjCp6mWwQpP0VWP3L7QV5oL5CsDwWpCrtSHf5G3eyJPcKmRMmqW3if6AorQeJQK3zeunLSeEyjr71cj1vEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728063172; c=relaxed/simple;
	bh=Kp07i5SXOKodjMo48XNn2U8zeRawZILe6R6C672UpMc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H9hKnYukouXaUJurLncXkIb3FgvI/3pANHQP/3iW5GzZwkzW6+U1dXc9MV1ScGKyMj0xV5fcKcGA22Ymu7/I5DPHJT0oXcDCQXU3se+61H7s4Ne0lvMBcFJ2tnoFvqITuGI0xUqQ9DYzlvQzdTXEmaMJQvRMv4KW4OzhPMHrVNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,178,1725289200"; 
   d="scan'208";a="224808644"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Oct 2024 02:32:42 +0900
Received: from localhost.localdomain (unknown [10.226.92.178])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0D1534031864;
	Sat,  5 Oct 2024 02:32:37 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 0/2] Enable serial NOR flash on RZ/G2UL SMARC EVK
Date: Fri,  4 Oct 2024 18:32:30 +0100
Message-ID: <20241004173235.74307-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to enable serial NOR flash on RZ/G2UL SMARC EVK.

Also update partition table for spi-nor flash on RZ{G2L,G2LC,V2L}, so
that we can flash bootloaders in Linux by executing the below commands:
flash_erase /dev/mtd0  0 0
flash_erase /dev/mtd1  0 0
mtd_debug write /dev/mtd0 0 ${BL2_FILE_SIZE} ${BL2_IMAGE}
mtd_debug write /dev/mtd1 512 ${FIP_FILE_SIZE} ${FIP_IMAGE}

v4->v5:
 * Updated bl2 size to avoid 4 KiB gap between bl2 and fip partitions.
v3->v4:
 * Dropped patch#1 from the series [1] as it is aceepted.
 * Merged patch#2 for [1] and patch from [2]
 * Updated partition table for spi-nor flash.
 * Removed Rb tag from Geert as there are some changes w.r.to
   partition table.
 [1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=885350
 [2] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20230901075932.105822-2-biju.das.jz@bp.renesas.com/
v2->v3:
 * Dropped subnodes, as all pins use the same power-source value.
v1->v2:
 * Enabled 4-bit tx support


Biju Das (2):
  arm64: dts: renesas: rzg2ul-smarc-som: Enable serial NOR flash
  arm64: dts: renesas: rz{g2l,g2lc}-smarc-som: Update partition table
    for spi-nor flash

 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     | 15 +++++--
 .../boot/dts/renesas/rzg2lc-smarc-som.dtsi    | 15 +++++--
 .../boot/dts/renesas/rzg2ul-smarc-som.dtsi    | 45 +++++++++++++++++++
 .../boot/dts/renesas/rzfive-smarc-som.dtsi    |  4 ++
 4 files changed, 71 insertions(+), 8 deletions(-)

-- 
2.43.0


