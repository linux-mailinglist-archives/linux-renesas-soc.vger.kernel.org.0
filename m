Return-Path: <linux-renesas-soc+bounces-28959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDdfBJ/mqmlgYAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 15:37:19 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7FD222CAC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 15:37:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 605E73063812
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 14:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDCAB33B960;
	Fri,  6 Mar 2026 14:34:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A00F34B404;
	Fri,  6 Mar 2026 14:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772807692; cv=none; b=l/rydN+YPs/dk5XR0pdV3iwLhVSE3HygMizThOVlxf49zHv3oywxRXd7oqvx+/0thcPfyXR3UIydWael8RXKFzpmsymhCv6Gn9u2KpAVs/sqltO1dZZXSF3xaOK0MWTVG2R2nfs8Ee9SczrUqQQQ1ZFL3j+YGgFzjPHMYBJB5E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772807692; c=relaxed/simple;
	bh=ILGA1yWRCt/iDfGqQQYx6Go5uTQ7XXxi7LKZ5RIpGyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sztbqqZMmZRo0dIXNz7NpXX1YK6cVXsZdkp04g2BaDUa/Clsq0pQ47pw9yZrkT8tKAytEDgKqYWTFfWGsti7inllfh4WBOnZY6mvhThGL5oLZ9Qg3LlaKwNQddKXaNFsS6m5ZWe6fx1zH3QhQPLPqqNwF5uDZYQ5ZODWCwIGhGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 8tX+YHfOQ4mxcAT1M280aw==
X-CSE-MsgGUID: VAjP0/8ASr6OL0bw4O9aMQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Mar 2026 23:34:43 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.98])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 16B074008546;
	Fri,  6 Mar 2026 23:34:37 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: claudiu.beznea.uj@bp.renesas.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org
Cc: robh@kernel.org,
	bhelgaas@google.com,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	biju.das.jz@bp.renesas.com,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	john.madieu@gmail.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v8 00/15] PCI: renesas: Add RZ/G3E PCIe controller support
Date: Fri,  6 Mar 2026 15:34:07 +0100
Message-ID: <20260306143423.19562-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AB7FD222CAC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28959-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,bp.renesas.com:mid]
X-Rspamd-Action: no action

The Renesas RZ/G3E SoC features a PCIe controller that shares similarities with
the existing RZ/G3S PCIe controller, but with several key differences.
This series adds support for the RZ/G3E PCIe controller by extending the existing
RZ/G3S driver and device tree bindings.

Key differences between RZ/G3E and RZ/G3S PCIe controllers:

Link Speed Support:
 - RZ/G3E: Supports PCIe Gen3 (8.0 GT/s) alongside Gen2 (5.0 GT/s)
 - RZ/G3S: Supports PCIe Gen2 (5.0 GT/s) only

Reset Control:
 - RZ/G3E: Uses register-based reset control mechanism
 - RZ/G3S: Uses exclusively external reset control signals

Inbound Window Configuration:
 - RZ/G3E: Requires precise power-of-2 window coverage with strict address
   alignment constraints. Non-power-of-2 memory regions must be split into
   multiple windows to avoid over-mapping, ensuring proper hardware address
   decoding for DMA operations.
 - RZ/G3S: Uses a simpler approach that rounds up to the next power-of-2,
   creating single larger windows. The hardware tolerates over-mapped regions.

Class/Revision IDs:
 - RZ/G3E: Requires explicit setting of class/revision values
 - RZ/G3S: Has default values in hardware

Clock Naming:
 - RZ/G3E: Uses "clkpmu" clock for power management
 - RZ/G3S: Uses "clkl1pm" PM control clock while CLKREQ_B is deasserting

Phy Settings:
 - RZ/G3E: Does not need PHY settings as it works with default hw values
 - RZ/G3S: Requires explicit PHY settings

This series extends the existing driver to detect the SoC type from the device
tree compatible string and configure the controller appropriately. The updates
are minimal and focused on the hardware-specific differences while keeping the
common code paths unified.

Changes:

v8:
 - Collected additional Rb tags on remaining code patches
 - Fixed typos in patch descriptions
 - Fixed checkpatch warnings

v7:
 - Removed former patch [04/16] adding support for init[off|asserted] clocks
   and resets as these steps are not required anymore
 - Renamed RZG3E_PCI_RESET* register defines to RZG3S_PCI_RESET* for
   consistency, as upcoming SoCs (RZ/V2H, RZ/T2N, RZ/N2H) share these
   registers
 - Dropped some useless comments and reduced verbose descriptions to
   concise forms 
 - Unified function naming: rzg3s_pcie_config_{post_init,deinit}() and
   rzg3e_pcie_config_{pre_init,post_init,deinit}()
 - Used local mask variables in rzg3e_pcie_config_{pre_init,post_init}()
   for compactness within 80-char line limit
 - Fixed resume_noirq: reordered MODE before RST_RSM_B to match probe
   sequence, fixing error path handling
 - Fixed checkpatch commit message line length warnings

v6:
 - Replaced rzg3s_sysc_config() with enum-based rzg3s_sysc_config_func()
   as suggested by Claudiu, dropping the -1 skip pattern
 - Introduced enum rzg3s_sysc_func_id and array-based SYSC function
   descriptors in patch 08
 - Used regmap_update_bits() consistently for all SYSC accesses
 - Fixed config_reinit error path in suspend_noirq: call config_pre_init
   before config_post_init as spotted by Claudiu
 - Fixed double config_deinit in rzg3s_pcie_host_init() error path by
   separating config_deinit_post into a non-fall-through path
 - Shortened comments as per Claudiu's suggestions
 - Reordered patchset, moving v5's patch 09/16 to 02/16 and added Fixes tag 

v5:
 - Introduced new patch to reorder reset handling
 - Introduced rzg3s_sysc_config() helper to handle SYS config
 - Collected Tags on documentation

v4:
 - Collected Ab tag
 - Fixed binding clock name constraint

v3:
 - Removed extra MaxItems in binding causing warnings
 - Fix potential crash for non-initialized rcdev in CPG driver
 - Fix binding contraints replacing 'description' with 'const' as per
   Geert and Rob's comment

v2:
 - Address Bjorn typo comments
 - Address Claidiu's comment on stylish
 - Use single inbound-window-configuration function for both G3E/G3S
 - Refactor goto laballing as per Claudiu's comments
 - Update bindings and reused G3S's interrupt ordering
   * This involves reordering interrupts in dt
 - Remove Board-specific PCIe dma-range.


John Madieu (15):
  PCI: rzg3s-host: Fix reset handling in probe error path
  PCI: rzg3s-host: Reorder reset assertion during suspend
  PCI: rzg3s-host: Rework inbound window algorithm for multi-SoC support
  clk: renesas: r9a09g047: Add PCIe clocks and reset
  dt-bindings: PCI: renesas,r9a08g045s33-pcie: Fix naming properties
  dt-bindings: PCI: renesas,r9a08g045s33-pcie: Document RZ/G3E SoC
  PCI: rzg3s-host: Make SYSC register offsets SoC-specific
  PCI: rzg3s-host: Make configuration reset lines optional
  PCI: rzg3s-host: Add SoC-specific configuration and initialization
    callbacks
  PCI: rzg3s-host: Explicitly set class code for RZ/G3E compatibility
  PCI: rzg3s-host: Add PCIe Gen3 (8.0 GT/s) link speed support
  PCI: rzg3s-host: Add support for RZ/G3E PCIe controller
  arm64: dts: renesas: r9a09g047: Add PCIe node
  arm64: dts: renesas: r9a09g047e57-smarc-som: Add PCIe reference clock
  arm64: dts: renesas: r9a09g047e57-smarc: Enable PCIe

 .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 121 ++++--
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  69 ++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  16 +
 .../boot/dts/renesas/renesas-smarc2.dtsi      |   4 +
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     |  11 +
 drivers/clk/renesas/r9a09g047-cpg.c           |   5 +
 drivers/pci/controller/pcie-rzg3s-host.c      | 362 ++++++++++++++----
 7 files changed, 478 insertions(+), 110 deletions(-)

-- 
2.25.1


