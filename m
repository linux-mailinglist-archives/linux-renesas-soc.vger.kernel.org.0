Return-Path: <linux-renesas-soc+bounces-12704-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35265A2222A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 17:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A12271883968
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 16:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A3B1DFD91;
	Wed, 29 Jan 2025 16:51:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770D01DF75C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jan 2025 16:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738169513; cv=none; b=WsV1j/Gn+gPuAEFaJ7EV6AkpMTA0qmtHQtMmuYehuLBHSZZh8dU+kqaH8V11lzrZOEtexf6sFmiAWHV/4GppVDGxcKTJiQP5BOou5AkWWEhtG+jGYvhx2w1+oTCjp0sEBQ5988ZBQhjMnENMhHDXzr/WS505hTDZzOfP0BJGljg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738169513; c=relaxed/simple;
	bh=w/YhLbHISJOXiRkhAyylqFQPfBz0fe5rgW4fRb7Tr9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GUjIheqhreSgekr/+CH50LhHukHhE2dSyT8HzdXOWE7va73VQ2caU+eLBVomRNNn/9lXdnup8yaYpj8u//tWymSGbMq0H9GT8dqxB25ESPKnJ/NWiZo6CfRPFYuTLJ9lwct2smF6p7tPngzA11Wrquu13TUcvJVI39SXs3K4L1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: Y6YOUwkxSde6cGZWh1ohJw==
X-CSE-MsgGUID: xtHLK5hxSwuhNu+2KJaHaw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 30 Jan 2025 01:51:43 +0900
Received: from wvbox.administration.lan (unknown [10.226.92.145])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id C2852402F547;
	Thu, 30 Jan 2025 01:51:30 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 00/14] add initial support for Renesas RZ/T2H SoC
Date: Wed, 29 Jan 2025 16:37:36 +0000
Message-ID: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset brings basic support for Renesas RZ/T2H SoC and
its evaluation board. The 4 CPUs are enabled, only the serial 
console is available and the board must boot on a ramdisk. 
earlycon is supported, though.

The RZ/T2H serial controller (SCI) is quite different from the 
other RZ SoCs, one of the big differences (but not the only) being
the 32 bits registers. In order to not modify the existing sh-sci 
driver too much, a new set of 'ops' function pointer is introduced,
alllowing to code the specifics of RZ/T2H in a separate file.
Termios setting is not supported yet, the default 115200 baudrate
being kept by default.

The new CPG clock driver comes with the minimal things at this stage,
with the assumption that most of the initialization is done earlier
by the bootloader. Also, module clock enable/disable is not supported,
because quite hard to test when the only available peripheral is the 
serial console, and will come in a future patchset.

Thierry Bultel (14):
  dt-bindings: soc: Document Renesas RZ/T2H (R9A09G077) SoC
  dt-bindings: serial: Document sci bindings for the Renesas RZ/T2H
    (a.k.a r9a09g077) SoC
  dt-bindings: soc: Document the Renesas RZ/T2H Evaluation board for the
    R9A09G077 SoC
  dt-bindings: clock: Document cpg bindings for the Renesas RZ/T2H SoC
  soc: renesas: Add RZ/T2H (R9A09G077) config option
  clk: renesas: Add support for RZ/T2H family clock
  clk: renesas: Add support for R9A09G077 SoC
  serial: sh-sci: Fix a comment about SCIFA
  serial: sh-sci: Introduced function pointers
  serial: sh-sci: Introduced sci_of_data
  serial: sh-sci: Add support for RZ/T2H SCI
  arm64: dts: renesas: Add initial support for renesas RZ/T2H SoC
  arm64: dts: renesas: Add initial support for renesas RZ/T2H eval board
  defconfig: Enable RZ/T2H Soc and RZ_SCI

 .../bindings/clock/renesas,rzt2h-cpg.yaml     |  73 +++
 .../bindings/serial/renesas,rzsci.yaml        | 100 ++++
 .../bindings/soc/renesas/renesas.yaml         |  10 +
 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    | 129 ++++
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  37 ++
 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi |   8 +
 arch/arm64/configs/defconfig                  |   2 +
 drivers/clk/renesas/Kconfig                   |   9 +
 drivers/clk/renesas/Makefile                  |   2 +
 drivers/clk/renesas/r9a09g077-cpg.c           | 100 ++++
 drivers/clk/renesas/rzt2h-cpg.c               | 549 ++++++++++++++++++
 drivers/clk/renesas/rzt2h-cpg.h               | 201 +++++++
 drivers/soc/renesas/Kconfig                   |   5 +
 drivers/tty/serial/Kconfig                    |   7 +
 drivers/tty/serial/Makefile                   |   1 +
 drivers/tty/serial/rzsci.c                    | 484 +++++++++++++++
 drivers/tty/serial/rzsci.h                    |  12 +
 drivers/tty/serial/sh-sci.c                   | 421 +++++++-------
 drivers/tty/serial/sh-sci_common.h            | 179 ++++++
 include/dt-bindings/clock/r9a09g077-cpg.h     | 144 +++++
 include/linux/serial_sci.h                    |   3 +-
 include/uapi/linux/serial_core.h              |   3 +
 23 files changed, 2284 insertions(+), 196 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzt2h-cpg.yaml
 create mode 100644 Documentation/devicetree/bindings/serial/renesas,rzsci.yaml
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi
 create mode 100644 drivers/clk/renesas/r9a09g077-cpg.c
 create mode 100644 drivers/clk/renesas/rzt2h-cpg.c
 create mode 100644 drivers/clk/renesas/rzt2h-cpg.h
 create mode 100644 drivers/tty/serial/rzsci.c
 create mode 100644 drivers/tty/serial/rzsci.h
 create mode 100644 drivers/tty/serial/sh-sci_common.h
 create mode 100644 include/dt-bindings/clock/r9a09g077-cpg.h

-- 
2.43.0


