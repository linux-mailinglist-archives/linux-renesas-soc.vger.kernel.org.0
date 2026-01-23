Return-Path: <linux-renesas-soc+bounces-27339-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJiVGGyAc2nxwwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27339-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 15:06:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DC876AA9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 15:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E516D30A67A4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01CA2F1FFC;
	Fri, 23 Jan 2026 14:01:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED2142A96;
	Fri, 23 Jan 2026 14:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769176899; cv=none; b=WcgJXGokw8aWRZLLD/2bvKuJiBmnu5vOtQoX4WZ6V/eDj2GVLCTLEWfYBfm4uOWv3BZ7nSXahp0+lk+2a6npmE4qKcTpP0cyr42VAspJkFJDnilm8SrAT65V4rWPx01dwQUEWktV1Hglo1r9T6h8w45wMP9o23/jA8vpkU+LFp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769176899; c=relaxed/simple;
	bh=5BtYInpNEdfzo9yjIyCYvxYjM2VjEVK2ms6GbxMMgsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ky8rJ3xXNAZM/2poRd7r24PCE95ywRBKFCAidrK5JNTKyIsCUN0N6ILyEwNdfFa8ksOLXMcEd415XE7nSYZWqO+2uJ0Q8VP59KHog2Tmwr5D007E9E3Iz5FjBoHmiOpovOMvrrgIlzqNt4hRyIlCnaHyteznUmGOmxCZyfoD0BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 5OgG4W9dSyCMsnQYYs7ujw==
X-CSE-MsgGUID: tiFRNyMMT86cO48oc9tUUA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 Jan 2026 23:01:37 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.92])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 00E1140703E7;
	Fri, 23 Jan 2026 23:01:31 +0900 (JST)
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
Subject: [PATCH v2 03/15] clk: renesas: rzv2h-cpg: Add support for init_{off|asserted} clocks/resets
Date: Fri, 23 Jan 2026 15:00:19 +0100
Message-ID: <20260123140031.94752-4-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123140031.94752-1-john.madieu.xa@bp.renesas.com>
References: <20260123140031.94752-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27339-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D7DC876AA9
X-Rspamd-Action: no action

Some peripherals may be left enabled by the bootloader but should be
explicitly disabled by the kernel to ensure a known initial state.
This is particularly important for PCIe which requires proper
initialization sequencing.

Add new macros DEF_MOD_INIT_OFF() and DEF_RST_INIT_ASSERTED() to declare
module clocks that should be turned off and resets that should be
asserted during CPG probe if found in the opposite state.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v2:
 - Added reset-specific assert on probe
 - Removed Rb tag from Geert due to previous point

 drivers/clk/renesas/rzv2h-cpg.c | 27 +++++++++++++++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h | 34 +++++++++++++++++++++++++--------
 2 files changed, 52 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 3f6299b9fec0..ced944276945 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -1337,6 +1337,15 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 		spin_unlock_irqrestore(&priv->rmw_lock, flags);
 	}
 
+	/*
+	 * Turn off clocks marked with init_off flag if they were left
+	 * enabled by the bootloader. This ensures a known initial state.
+	 */
+	if (mod->init_off && rzv2h_mod_clock_is_enabled(&clock->hw)) {
+		dev_dbg(dev, "Disabling clock %s (init_off)\n", mod->name);
+		rzv2h_mod_clock_endisable(&clock->hw, false);
+	}
+
 	return;
 
 fail:
@@ -1585,7 +1594,7 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
 	struct rzv2h_cpg_priv *priv;
 	unsigned int nclks, i;
 	struct clk **clks;
-	int error;
+	int error, ret;
 
 	info = of_device_get_match_data(dev);
 
@@ -1635,6 +1644,22 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
 	for (i = 0; i < info->num_mod_clks; i++)
 		rzv2h_cpg_register_mod_clk(&info->mod_clks[i], priv);
 
+	/*
+	 * Assert resets marked with init_asserted flag if they were left
+	 * deasserted by the bootloader. This ensures a known initial state.
+	 */
+	for (i = 0; i < info->num_resets; i++) {
+		if (!info->resets[i].init_asserted)
+			continue;
+
+		/* Check if reset is currently deasserted (status == 0) */
+		ret = rzv2h_cpg_status(&priv->rcdev, i);
+		if (ret == 0) {
+			dev_dbg(dev, "Asserting reset %u (init_asserted)\n", i);
+			rzv2h_cpg_assert(&priv->rcdev, i);
+		}
+	}
+
 	error = of_clk_add_provider(np, rzv2h_cpg_clk_src_twocell_get, priv);
 	if (error)
 		return error;
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index dc957bdaf5e9..927009431a73 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -250,6 +250,7 @@ enum clk_types {
  * @parent: id of parent clock
  * @critical: flag to indicate the clock is critical
  * @no_pm: flag to indicate PM is not supported
+ * @init_off: flag to indicate the clock should be turned off during probe
  * @on_index: control register index
  * @on_bit: ON bit
  * @mon_index: monitor register index
@@ -262,6 +263,7 @@ struct rzv2h_mod_clk {
 	u16 parent;
 	bool critical;
 	bool no_pm;
+	bool init_off;
 	u8 on_index;
 	u8 on_bit;
 	s8 mon_index;
@@ -269,14 +271,15 @@ struct rzv2h_mod_clk {
 	s8 ext_clk_mux_index;
 };
 
-#define DEF_MOD_BASE(_name, _mstop, _parent, _critical, _no_pm, _onindex, \
-		     _onbit, _monindex, _monbit, _ext_clk_mux_index) \
+#define DEF_MOD_BASE(_name, _mstop, _parent, _critical, _no_pm, _init_off, \
+		     _onindex, _onbit, _monindex, _monbit, _ext_clk_mux_index) \
 	{ \
 		.name = (_name), \
 		.mstop_data = (_mstop), \
 		.parent = (_parent), \
 		.critical = (_critical), \
 		.no_pm = (_no_pm), \
+		.init_off = (_init_off), \
 		.on_index = (_onindex), \
 		.on_bit = (_onbit), \
 		.mon_index = (_monindex), \
@@ -285,17 +288,20 @@ struct rzv2h_mod_clk {
 	}
 
 #define DEF_MOD(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
-	DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit, -1)
+	DEF_MOD_BASE(_name, _mstop, _parent, false, false, false, _onindex, _onbit, _monindex, _monbit, -1)
 
 #define DEF_MOD_CRITICAL(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
-	DEF_MOD_BASE(_name, _mstop, _parent, true, false, _onindex, _onbit, _monindex, _monbit, -1)
+	DEF_MOD_BASE(_name, _mstop, _parent, true, false, false, _onindex, _onbit, _monindex, _monbit, -1)
+
+#define DEF_MOD_INIT_OFF(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
+	DEF_MOD_BASE(_name, _mstop, _parent, false, false, true, _onindex, _onbit, _monindex, _monbit, -1)
 
 #define DEF_MOD_NO_PM(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
-	DEF_MOD_BASE(_name, _mstop, _parent, false, true, _onindex, _onbit, _monindex, _monbit, -1)
+	DEF_MOD_BASE(_name, _mstop, _parent, false, true, false, _onindex, _onbit, _monindex, _monbit, -1)
 
 #define DEF_MOD_MUX_EXTERNAL(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop, \
 			     _ext_clk_mux_index) \
-	DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit, \
+	DEF_MOD_BASE(_name, _mstop, _parent, false, false, false, _onindex, _onbit, _monindex, _monbit, \
 		     _ext_clk_mux_index)
 
 /**
@@ -305,24 +311,36 @@ struct rzv2h_mod_clk {
  * @reset_bit: reset bit
  * @mon_index: monitor register index
  * @mon_bit: monitor bit
+ * @init_asserted: flag to indicate the reset should be asserted during probe
  */
 struct rzv2h_reset {
 	u8 reset_index;
 	u8 reset_bit;
 	u8 mon_index;
 	u8 mon_bit;
+	bool init_asserted;
 };
 
-#define DEF_RST_BASE(_resindex, _resbit, _monindex, _monbit)	\
+#define DEF_RST_BASE(_resindex, _resbit, _monindex, _monbit, _init_asserted)	\
 	{ \
 		.reset_index = (_resindex), \
 		.reset_bit = (_resbit), \
 		.mon_index = (_monindex), \
 		.mon_bit = (_monbit), \
+		.init_asserted = (_init_asserted), \
 	}
 
 #define DEF_RST(_resindex, _resbit, _monindex, _monbit)	\
-	DEF_RST_BASE(_resindex, _resbit, _monindex, _monbit)
+	DEF_RST_BASE(_resindex, _resbit, _monindex, _monbit, false)
+
+/**
+ * DEF_RST_INIT_ASSERTED - Define a reset that should be asserted during probe
+ *
+ * Use this for peripherals that require their reset to be asserted at boot
+ * to ensure a known initial state before the peripheral driver takes over.
+ */
+#define DEF_RST_INIT_ASSERTED(_reset_index, _reset_bit, _mon_index, _mon_bit) \
+	DEF_RST_BASE(_reset_index, _reset_bit, _mon_index, _mon_bit, true)
 
 /**
  * struct rzv2h_cpg_info - SoC-specific CPG Description
-- 
2.25.1


