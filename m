Return-Path: <linux-renesas-soc+bounces-13694-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DF2A46044
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 14:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CA823A8909
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 13:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D97E13EFE3;
	Wed, 26 Feb 2025 13:09:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9E843166
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Feb 2025 13:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740575385; cv=none; b=spX0jxneO78E8gNuYNm7Ej9qUn0VWsPNV7vxwmo0gH98NI4N0tok5mbnkEE9128P1Fx9+uOzcfoH8WNuAjQUuB+WbVUda8bshWYUHSLS7tmWPa0UBCr8GrNHmW/vjf0ezHBubArX2Y+QWI1kB+wjqII8H2wvhn1IxRvVIJi2dJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740575385; c=relaxed/simple;
	bh=Bdo/OygTOPLFXCDWahjzHG9mUS4mEzQN8D9IOW9kOkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a2DEFKGMiBboDAXcE67fvQNIZQW+g+iq2VGn1Y7L8QbBuVrp23c+pegQ32ddisK6Gt6VDfZyAyQb8y/eAMO6gm7GniIa1Y67eyyWBfmVJrN1psOdobUEuHCYDQkvfWlDGb+0bwAWr5eKPWq4qpPe+Fv1BU6HZ04TPPeM+SxLyEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 1MwJGztDR66URoFH2MBguA==
X-CSE-MsgGUID: apJqlc69Se2Hv+h9W68n0Q==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Feb 2025 22:09:41 +0900
Received: from superbuilder.administration.lan (unknown [10.226.92.221])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2E2BA4069606;
	Wed, 26 Feb 2025 22:09:38 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Subject: [PATCH v3 00/13] Add initial support for Renesas RZ/T2H SoC
Date: Wed, 26 Feb 2025 14:09:19 +0100
Message-ID: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
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
allowing to code the specifics of RZ/T2H in a separate file.
Termios setting is not supported yet, the default 115200 baudrate
being kept by default.

Clock support for RZ/T2H is added to the existing renesas-cpg-mssr
driver, with some little modifications so that more parameters are
passed to the device-specific registration callback. 
At this stage, the assumption is made that most of the initialization 
is done earlier by the bootloader. Module clock enable/disable is 
not supported, because quite hard to test when the only available 
peripheral is the serial console, and will come in a future patchset.

There is an underway discussion on how to group the user selectable
Renesas SoC option into bigger families, but such a change is out of
scope for this patchset.

This patch series is based on master + patch [1]

[1]: https://lore.kernel.org/all/20250207113313.545432-1-claudiu.beznea.uj@bp.renesas.com/

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
  arm64: defconfig: Enable Renesas RZ/T2H SoC option

 .../bindings/clock/renesas,cpg-mssr.yaml      |   4 +-
 .../bindings/serial/renesas,sci.yaml          |  64 +-
 .../bindings/soc/renesas/renesas.yaml         |  10 +
 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    | 129 ++++
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  35 +
 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi |  13 +
 arch/arm64/configs/defconfig                  |   2 +
 drivers/clk/renesas/Kconfig                   |   5 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r7s9210-cpg-mssr.c        |   7 +-
 drivers/clk/renesas/r8a77970-cpg-mssr.c       |  11 +-
 drivers/clk/renesas/r9a09g077-cpg-mssr.c      | 237 +++++++
 drivers/clk/renesas/rcar-gen2-cpg.c           |   5 +-
 drivers/clk/renesas/rcar-gen2-cpg.h           |   3 +-
 drivers/clk/renesas/rcar-gen3-cpg.c           |   6 +-
 drivers/clk/renesas/rcar-gen3-cpg.h           |   6 +-
 drivers/clk/renesas/rcar-gen4-cpg.c           |   8 +-
 drivers/clk/renesas/rcar-gen4-cpg.h           |   3 +-
 drivers/clk/renesas/renesas-cpg-mssr.c        | 153 +++--
 drivers/clk/renesas/renesas-cpg-mssr.h        |  43 +-
 drivers/soc/renesas/Kconfig                   |   5 +
 drivers/tty/serial/Kconfig                    |   7 +
 drivers/tty/serial/Makefile                   |   1 +
 drivers/tty/serial/rzsci.c                    | 465 ++++++++++++++
 drivers/tty/serial/rzsci.h                    |  12 +
 drivers/tty/serial/sh-sci-common.h            | 171 +++++
 drivers/tty/serial/sh-sci.c                   | 603 ++++++++++--------
 drivers/tty/serial/sh-sci.h                   |   2 -
 .../clock/renesas,r9a09g077-cpg-mssr.h        |  49 ++
 include/linux/serial_sci.h                    |   3 +-
 include/uapi/linux/serial_core.h              |   3 +
 32 files changed, 1713 insertions(+), 354 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi
 create mode 100644 drivers/clk/renesas/r9a09g077-cpg-mssr.c
 create mode 100644 drivers/tty/serial/rzsci.c
 create mode 100644 drivers/tty/serial/rzsci.h
 create mode 100644 drivers/tty/serial/sh-sci-common.h
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h

-- 
2.43.0


