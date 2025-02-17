Return-Path: <linux-renesas-soc+bounces-13207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79709A380FF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 12:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3F4C3A3516
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 10:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3D08BE8;
	Mon, 17 Feb 2025 10:59:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F6117E45B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Feb 2025 10:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739789964; cv=none; b=PKjcpr5Nym32kPmnkokojIsU7Cw31e325pLDX95nh32D5rNVXyRjAfwoy6FLxTiLZnbPSqn5SK0wxaQBIYwTzr8Gq3NP/Pe8SMNiAfPDkeBB3eYnFrE3AZpjLdy6lx3imii/SeSBhBFdrich4yB1Rd6int1iYO1uk3HKtVv07wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739789964; c=relaxed/simple;
	bh=d3kddO+ZoGxcp99Q5c/gVHjB3jxBcACEunLFJetinIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qb6GOMaH0wRyFwkK0cCJOJDYn2P6drIjPrcgDBlMXl+nwO5vrQE18YVpztZ48uhnqihWcbM0b/wYt/rIOErd0v+Chl2mX9IGZueVJ4Il4IwdIwgcGbN4WRTCjvqJc5vErIcEjAS8oJe2VfPAlut2uQZdpQ1RRbuv0/U7wQ8djHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 3/EtgC6SQQ6jTvOwAhxX7A==
X-CSE-MsgGUID: wmvSR02HS5+5jqYjRE68qA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Feb 2025 19:54:13 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.254])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id AADE04280557;
	Mon, 17 Feb 2025 19:54:11 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Subject: [PATCH v2 00/13] add initial support for Renesas RZ/T2H SoC
Date: Mon, 17 Feb 2025 11:52:01 +0100
Message-ID: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com>
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

Clock support for RZ/T2H is added to the existing renesas-cpg-mssr
driver, with some little modifications so that more paremeters are
passed to the device-speicif registration callback. 
At this stage, the assumption is made that most of the initialization 
is done earlier by the bootloader. Module clock enable/disable is 
not supported, because quite hard to test when the only available 
peripheral is the serial console, and will come in a future patchset.

Changes v1->v2
* CPG based on renesas-cpg-mssr (no more new CPG driver), updated cover letter
  for that.
* bindings: 
  - passed dt_binding_check and added missing comppatible strings, 
  - document SoC + evaluation board in a single commit
  - rzsci added to sci documentation
  - fixed dependencies
  - renamed the evaluation board to r9a9g077m44-rzt2h-evk
  - removed clock module numbers & resets from binding header
  
* rz/sci:
  - fixed rzsci_receive_chars following Geert's advice, and comment
    that 9-bits data is not supported
  - fixed the regression (ops init) on non-DT legacy boards, sci_probe_regmap
    called moved in the non-DT case.
  - moved struct sci_of_data introduction in the appropriate commit
  
* dts
  - applied conventions (nodes alphabetical order & node names)
  - added missing compatibles to r9a09g077m44.dtsi and r9a09g077m44-rzt2h-evk.dts
  

Thierry Bultel (13):
  dt-bindings: soc: Add Renesas RZ/T2H (R9A09G077) SoC
  dt-bindings: clock: Add cpg for the Renesas RZ/T2H SoC
  dt-bindings: serial: Add compatible for Renesas RZ/T2H SoC in sci
  soc: renesas: Add RZ/T2H (R9A09G077) config option
  clk: renesas: Pass sub struct of cpg_mssr_priv to cpg_clk_register
  clk: renesas: Add support for R9A09G077 SoC
  serial: sh-sci: Fix a comment about SCIFA
  serial: sh-sci: Introduced function pointers
  serial: sh-sci: Introduced sci_of_data
  serial: sh-sci: Add support for RZ/T2H SCI
  arm64: dts: renesas: Add initial support for renesas RZ/T2H SoC
  arm64: dts: renesas: Add initial support for renesas RZ/T2H eval board
  defconfig: Enable RZ/T2H Soc and RZ_SCI

 .../bindings/clock/renesas,cpg-mssr.yaml      |   1 +
 .../bindings/serial/renesas,sci.yaml          |   2 +
 .../bindings/soc/renesas/renesas.yaml         |  10 +
 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    | 129 +++++
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  35 ++
 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi |  13 +
 arch/arm64/configs/defconfig                  |   2 +
 drivers/clk/renesas/Kconfig                   |   5 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r7s9210-cpg-mssr.c        |   7 +-
 drivers/clk/renesas/r8a77970-cpg-mssr.c       |  11 +-
 drivers/clk/renesas/r9a09g077-cpg-mssr.c      | 237 +++++++++
 drivers/clk/renesas/rcar-gen3-cpg.c           |   8 +-
 drivers/clk/renesas/rcar-gen3-cpg.h           |   6 +-
 drivers/clk/renesas/rcar-gen4-cpg.c           |   9 +-
 drivers/clk/renesas/rcar-gen4-cpg.h           |   3 +-
 drivers/clk/renesas/renesas-cpg-mssr.c        | 139 +++--
 drivers/clk/renesas/renesas-cpg-mssr.h        |  44 +-
 drivers/soc/renesas/Kconfig                   |   5 +
 drivers/tty/serial/Kconfig                    |   7 +
 drivers/tty/serial/Makefile                   |   1 +
 drivers/tty/serial/rzsci.c                    | 485 ++++++++++++++++++
 drivers/tty/serial/rzsci.h                    |  12 +
 drivers/tty/serial/sh-sci.c                   | 415 ++++++++-------
 drivers/tty/serial/sh-sci_common.h            | 180 +++++++
 .../dt-bindings/clock/r9a09g077-cpg-mssr.h    |  49 ++
 include/linux/serial_sci.h                    |   3 +-
 include/uapi/linux/serial_core.h              |   3 +
 29 files changed, 1555 insertions(+), 268 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi
 create mode 100644 drivers/clk/renesas/r9a09g077-cpg-mssr.c
 create mode 100644 drivers/tty/serial/rzsci.c
 create mode 100644 drivers/tty/serial/rzsci.h
 create mode 100644 drivers/tty/serial/sh-sci_common.h
 create mode 100644 include/dt-bindings/clock/r9a09g077-cpg-mssr.h

-- 
2.43.0


