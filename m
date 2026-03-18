Return-Path: <linux-renesas-soc+bounces-29739-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Gd6M5dnumnnWAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29739-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:51:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DF62B8701
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:51:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E9D183007496
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 08:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27FC3859D2;
	Wed, 18 Mar 2026 08:51:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2FD1DD889;
	Wed, 18 Mar 2026 08:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823893; cv=none; b=YeVQJiibGF63mkGRTCVi1iXv83wdEKfbCAxTwF01R4Jt+51H0BuKDsxHqd1l0rWOoIZaQuQv7xlmQofS7DVtTiL7AeTyfHRpTBajfiMVrTZ4Q0Na6xjHIvB0J6UQtbBSkmSgaFeSXMKddxpzt/cjU3cuhgCSRsPSodms01JpA2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823893; c=relaxed/simple;
	bh=M7pkuF/4pycr0iNeinZS8lOsDKU2xX4IWzSvv6mGj2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uOnpibiG8PWlsBTrl0I431aKPZMY6FhI6mIyjwj2Y0KylATTMboNFAfKxYCQbLcC/TM395QJnm8r6DGcvubO8I6vYoO4JjKDGKunvz9mQVQpKVlxQnoOpgQjRZwsO3z8XDr9UjcSwHCojehsbNbK6CgwEd00WO0gVbIlbYII9WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: ehr5u4UGQf6kL2c777ZNaA==
X-CSE-MsgGUID: NiW8MqtOSImpLy7QAha4gg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 18 Mar 2026 17:51:29 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.3])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id F413340103B0;
	Wed, 18 Mar 2026 17:51:24 +0900 (JST)
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
Subject: [PATCH v9 0/4] PCI: renesas: Add RZ/G3E PCIe controller support
Date: Wed, 18 Mar 2026 09:51:15 +0100
Message-ID: <20260318085119.44717-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-29739-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.664];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 94DF62B8701
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

Note: patches 1-3/15 and 5-12/15 of the original v8 series have been applied.
This series contains the remaining 4 patches pending review/application:

Changes:

v9:
 - Patches 1/4, 2/4, 3/4: no changes
 - Patch 4/4: renamed gpio-hog node from 'pcie-clkreq-n' to
   'pcie-clkreq-n-hog' to satisfy DT schema naming constraint
   (reported by Biju)
 - Patch 4/4: kept line-name = "pcie_clkreq_n" as the node name
   suffix '-hog' no longer reflects the GPIO signal name
 - Patch 4/4: fixed node sort order within &pinctrl
   (reported by Geert)

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

John Madieu (4):
  clk: renesas: r9a09g047: Add PCIe clocks and reset
  arm64: dts: renesas: r9a09g047: Add PCIe node
  arm64: dts: renesas: r9a09g047e57-smarc-som: Add PCIe reference clock
  arm64: dts: renesas: r9a09g047e57-smarc: Enable PCIe

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 69 +++++++++++++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 16 +++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      |  4 ++
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 11 +++
 drivers/clk/renesas/r9a09g047-cpg.c           |  5 ++
 5 files changed, 105 insertions(+)

-- 
2.25.1


