Return-Path: <linux-renesas-soc+bounces-23653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 38374C0F0C0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 16:51:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D367F34ECA9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 15:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FBC30C635;
	Mon, 27 Oct 2025 15:46:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6064F2620E4;
	Mon, 27 Oct 2025 15:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761579991; cv=none; b=KjSmKgvu9k6PF2Zb9AZcTHA99PGGR2ACJ2OP5P1/WZ9EtJb5n0/LwKVMIhQJVPJXSeJa2MOB4mWQMurj8DxE8ecBKDPEn9QY3fPiLqbvTIRDGAgddzJjciF0pIR3IShDvenq+y66F3u9D077vk1km233TngO3steNAQOCId/5nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761579991; c=relaxed/simple;
	bh=+R8Fsz9b7HwEmtTFzrmf82rkmoqpGC3iY/+mfGTaS6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VN9nktlLmVfgstzgkSGq4I49HZKn8YwZLSfR1LLUyqBP6f+6dD2vf5nReBMmPak4Q9ItQK9rBt6aGWnU/0OpUwIN5rmNkaSCfKDA8uzuId+4gVsaQLT5hSSSxc1PfyvS+BsbcEML3z8F3YhBlRaHPVhmEhdfxQwRTE2+6OiM7cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: hSyxVqzPRR+ycZ0we476xA==
X-CSE-MsgGUID: G0eqT3DaTD2btkYnuvHU4Q==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Oct 2025 00:46:22 +0900
Received: from localhost.localdomain (unknown [10.226.93.103])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4184E4003EA1;
	Tue, 28 Oct 2025 00:46:18 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 00/19] Add RZ/G3E RSCI support
Date: Mon, 27 Oct 2025 15:45:47 +0000
Message-ID: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RZ/G3E RSCI support for FIFO and non-FIFO mode. RSCI IP found on
RZ/G3E SoC is similar to one on RZ/T2H, but has 32-stage fifo. RZ/G3E has
5 module clocks compared to 2 on RZ/T2H, and it has multiple resets.
Add support for hardware flow control.

Biju Das (19):
  clk: renesas: r9a09g047: Add RSCI clocks/resets
  dt-bindings: serial: rsci: Drop "uart-has-rtscts: false"
  dt-bindings: serial: renesas,rsci: Document RZ/G3E support
  serial: sh-sci: Fix deadlock during RSCI FIFO overrun error
  serial: rsci: Drop rsci_clear_CFC()
  serial: sh-sci: Drop extra line
  serial: rsci: Drop unused macro DCR
  serial: rsci: Drop unused TDR register
  serial: sh-sci: Use devm_reset_control_array_get_exclusive()
  serial: sh-sci: Add RSCI_PORT_{SCI,SCIF} port IDs
  serial: sh-sci: Add sci_is_rsci_type()
  serial: sh-sci: Add support for RZ/G3E RSCI clks
  serial: sh-sci: Make sci_scbrr_calc() public
  serial: sh-sci: Add finish_console_write() callback
  serial: sh-sci: Add support for RZ/G3E RSCI SCIF
  serial: sh-sci: Add support for RZ/G3E RSCI SCI
  arm64: dts: renesas: r9a09g047: Add RSCI nodes
  arm64: dts: renesas: renesas-smarc2: Move aliases to board DTS
  arm64: dts: renesas: renesas-smarc2: Enable rsci{2,4,9} nodes

 .../bindings/serial/renesas,rsci.yaml         |  84 +++-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 190 ++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  46 ++
 .../boot/dts/renesas/renesas-smarc2.dtsi      |  18 +-
 drivers/clk/renesas/r9a09g047-cpg.c           | 126 ++++++
 drivers/tty/serial/rsci.c                     | 413 +++++++++++++++---
 drivers/tty/serial/rsci.h                     |   2 +
 drivers/tty/serial/sh-sci-common.h            |  10 +
 drivers/tty/serial/sh-sci.c                   |  65 ++-
 9 files changed, 869 insertions(+), 85 deletions(-)

-- 
2.43.0


