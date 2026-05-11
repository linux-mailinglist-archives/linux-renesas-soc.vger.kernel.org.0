Return-Path: <linux-renesas-soc+bounces-32399-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNw6GT8lAmpooQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32399-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 20:51:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16424514A3C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 20:51:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 857D53069898
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 18:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C7C4C9558;
	Mon, 11 May 2026 18:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2Kef2S0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484FC4C0428
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 18:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525470; cv=none; b=Jy0UhlkhwGDUElMUuGFxgamXMNi0pJ2L1tf8ZIzsqYFR3S+PiH1VHzXHBgx1IBb4xEpe51DE+H8UDhv553PgxzBQuVUtWIFbiiu5kGUIU6T9onG2CCERVXJ66oyOuPvSj+p3KGBq/Jj/B0xpWu4vblfbDvLw/jqxCAkGlGn0YqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525470; c=relaxed/simple;
	bh=nxNgC1w8f7X3DV4XkV7Y+Km50RXfRToGNU+EvWm050o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cLkyEkCDswkehnJumFp5TLZqvqlWyrPP17jZ/bT3fU8lbmccn5lru2frTr5mciv27nCS3xftTLxslCwy0spWEmqdH8SAihJ8doNpyGEAVhaWmuZSRQy6y+kakNlO4/HlE3hespTTMUIUPhCObY9XRXUIhylSUEIBYFu4ogEqQDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2Kef2S0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48e82c23840so12022395e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 11:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778525467; x=1779130267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVv6BK7sqgLYHF8TAdc1SpP42OYwwV+TnXHf/z4Gd54=;
        b=A2Kef2S0CGuL1gL4KuuIRpI3zkrvQ6qZIDy/SY9jXdN/z6J+WrecdLU6C4ifT+1q1s
         +LxP8557PfjCyCUqk4srDiHP96/mYJ54EwObB0LKXUZTXdvjAE4lUzSORy00bE3n/STR
         8yPovdFTSwvxWvwyu+ip4TT4mbGPPWp0JqJ9SblE3kP7RoB0shCIM+nalukqUTWsXUE8
         TTlLQcGXRVSmZX872km7Fo3oVCRogJDUR4dxGdALZzJN8YQmZ/OGDxhtAwuSx9N+1xCY
         HAzJAWEqvJ0vjLm/m0JW6EHbVpD7wWLm7hvubyDgheRXpdYVJeCLgjpu1Symh8gyNZcc
         j5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778525467; x=1779130267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JVv6BK7sqgLYHF8TAdc1SpP42OYwwV+TnXHf/z4Gd54=;
        b=FCfAHT/E5bN9R7RDyT9e5gd7tn2Cppwg3Y3ikyFbX5gPWltIZhuXYqdPQwuut1Ta5Y
         609YSYUwWrQdsKxafJ3xjbL0QWZRVABT0u0sO1mCbcXcsWHF3TtNsPSX67sDUze3byJ8
         6xurt7GIBXbNnYMF8WCxYGph7Bbv93CgYu5hcHBMTRLVYg0nDtHwtQkKI4FIU+anM7n4
         kbyMJ8XXSkG8e82nu1pAkdYcmP4Wot//b7JO0vErVX43C9t0DLrn2N97WaQXbDgV7OFI
         7DWfUGxDWFn33PnCYVY5a3ljwZOQPI4eCym+EZ6orN+guymy2Nvk/gB4HVWYtvYpCkHK
         CDYA==
X-Gm-Message-State: AOJu0Yz/NlejQ9nR4j2JfRB0Ft51bVEKqaLep/I1+8HekccwW6mwxKkh
	uKMK/c6tND13ocgP/Jbe0ZaMsusPuF0SThUpqzoFuG28bzTPTt62K78c
X-Gm-Gg: Acq92OHaaN2+QrynEC9gZlbfmDACIant0Bd1nXO5XwWK7RCb9mx/5Ji9paRp10d0+Jm
	MvRH3YOzv63uGsNm/uNHF7z/srnbUGz5nXbKbzTBQXrCExzAjMpLUQBe4V+w+XDZw6i95VihJ75
	iK2IFDgGy4yZk0YdhOvNKdV/1AELzcrhVD13gNF8a3SChqQ6gjJVR5DGuto0ezQA+xaFncNUjI2
	7ceGn6HX8Ty/eLCtcA6Rqmts49tvtPSduRXJdVZxY9Oa6Hp4AenPe2U/2zJHlwmhP9alLhtbKjg
	ZOPG6s7gSO5SeCe54CL/Xi4aPdxzAiFdKa3/8y9+qqrGijhgFO95QJxoAuWshXQ3bOPPBSUcyWl
	QEaEbGp/ZYH1vv9G+5R3Q+cV3hjX4Ui3PRgClHqKCySvN8fAuTulqvqJkNzs04/ckDl+viEUa1F
	dL+ePNkSOc7eVFhPAqrmK2/GpqukLtrCN63Q8ppHp80lCj9VXKh9PoL0xBOsLHtftXbFQqzVmQT
	DURxUMZaafAOMQlARuf3E1yjTwuIhdxJIFb0qyVmm+IbR8lEviRW8WUzBs=
X-Received: by 2002:a05:600c:17d2:b0:485:ae14:8191 with SMTP id 5b1f17b1804b1-48e51e0a8b9mr235531385e9.5.1778525466651;
        Mon, 11 May 2026 11:51:06 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3cf0cdsm854775e9.2.2026.05.11.11.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:51:06 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 2/9] clk: renesas: r9a09g077: Add SYSC regmap support
Date: Mon, 11 May 2026 19:50:51 +0100
Message-ID: <20260511185058.1926869-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 16424514A3C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32399-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,linux-watchdog.org,roeck-us.net,gmail.com,pengutronix.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.983];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add System Controller (SYSC) regmap support for the RZ/T2H SoC.

The RZ/T2H SoC features two System Controller (SYSC) blocks that handle
low-power management and access control. These blocks are defined as child
nodes within the Clock Pulse Generator (CPG) address space in the device
tree. Implement support for creating regmaps for these SYSC blocks.

Register the regmap using of_syscon_register_regmap() against the CPG
device node so that consumers can access SYSC registers via the existing
syscon phandle.

Add a sysc_init() callback to the CPG/MSSR core to allow SoC-specific
initialization of the SYSC regmap.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/Kconfig            |   2 +
 drivers/clk/renesas/r9a09g077-cpg.c    | 180 +++++++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h |   1 +
 4 files changed, 189 insertions(+)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 0203ecbb3882..4b2b766e2241 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -218,10 +218,12 @@ config CLK_R9A09G057
 config CLK_R9A09G077
 	bool "RZ/T2H clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSSR
+	select MFD_SYSCON
 
 config CLK_R9A09G087
 	bool "RZ/N2H clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSSR
+	select MFD_SYSCON
 
 config CLK_SH73A0
 	bool "SH-Mobile AG5 clock support" if COMPILE_TEST
diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index f777601a23b9..aa9306d4e288 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -7,11 +7,14 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/clk-provider.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/math.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
 #include <linux/types.h>
 
 #include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
@@ -67,6 +70,16 @@
 #define DIVSCI3ASYNC	CONF_PACK(SCKCR3, 12, 2)
 #define DIVSCI4ASYNC	CONF_PACK(SCKCR3, 14, 2)
 
+enum r9a09g077_sysc {
+	RZT2H_SYSC0,
+	RZT2H_SYSC1,
+	RZT2H_MAX_SYSC,
+};
+
+struct r9a09g077_sysc_reg {
+	void __iomem *base;
+};
+
 enum rzt2h_clk_types {
 	CLK_TYPE_RZT2H_DIV = CLK_TYPE_CUSTOM,	/* Clock with divider */
 	CLK_TYPE_RZT2H_MUX,			/* Clock with clock source selector */
@@ -502,6 +515,172 @@ r9a09g077_cpg_clk_register(struct device *dev, const struct cpg_core_clk *core,
 	}
 }
 
+static int rzt2h_regmap_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct r9a09g077_sysc_reg *sysc = context;
+
+	*val = readl(sysc->base + reg);
+
+	return 0;
+}
+
+static int rzt2h_regmap_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct r9a09g077_sysc_reg *sysc = context;
+
+	writel(val, sysc->base + reg);
+
+	return 0;
+}
+
+static const struct regmap_bus rzt2h_sys_regmap_bus = {
+	.reg_write = rzt2h_regmap_write,
+	.reg_read = rzt2h_regmap_read,
+};
+
+static bool rzt2h_writeable_readable_sysc0(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x0000 ... 0x0008:
+	case 0x1000 ... 0x1164:
+	case 0x2000 ... 0x2024:
+	case 0x2030 ... 0x2054:
+	case 0x2060:
+	case 0x3000 ... 0x300C:
+	case 0x3100 ... 0x310C:
+	case 0x4100:
+	case 0x4200:
+		return true;
+
+	default:
+		return false;
+	}
+}
+
+static bool rzt2h_writeable_readable_sysc1(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x000C:
+	case 0x0034 ... 0x0038:
+	case 0x0048 ... 0x007C:
+	case 0x0100 ... 0x017C:
+	case 0x0200 ... 0x027C:
+	case 0x0308 ... 0x030C:
+	case 0x0320 ... 0x037C:
+	case 0x0480 ... 0x0484:
+	case 0x0580 ... 0x0584:
+	case 0x0680 ... 0x0684:
+	case 0x0780 ... 0x0784:
+	case 0x0880:
+	case 0x0980 ... 0x098C:
+	case 0x1100 ... 0x1118:
+	case 0x1200 ... 0x1204:
+	case 0x1400 ... 0x1484:
+	case 0x1500 ... 0x1584:
+	case 0x1600 ... 0x1680:
+	case 0x1700 ... 0x1780:
+	case 0x1800 ... 0x1884:
+	case 0x1900 ... 0x1984:
+	case 0x1A00 ... 0x1A84:
+	case 0x1B00 ... 0x1B8C:
+	case 0x1C00 ... 0x1C8C:
+	case 0x1D00 ... 0x1D8C:
+	case 0x3000:
+	case 0x3010:
+	case 0x3020:
+	case 0x3030:
+	case 0x4000:
+	case 0x5008 ... 0x500C:
+	case 0x5020 ... 0x503C:
+	case 0x5100 ... 0x5114:
+	case 0x6000:
+		return true;
+
+	default:
+		return false;
+	}
+}
+
+static int r9a09g077_sysc_init(struct device *dev)
+{
+	struct device_node *child, *np = dev->of_node;
+
+	for_each_child_of_node(np, child) {
+		struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
+		struct r9a09g077_sysc_reg *sysc_reg;
+		struct regmap *regmap;
+		void __iomem *base;
+		char *name;
+		u32 index;
+		int ret;
+
+		sysc_reg = devm_kzalloc(dev, sizeof(*sysc_reg), GFP_KERNEL);
+		if (!sysc_reg) {
+			of_node_put(child);
+			return -ENOMEM;
+		}
+
+		if (!regmap_cfg) {
+			of_node_put(child);
+			return -ENOMEM;
+		}
+
+		if (!of_node_name_eq(child, "system-controller"))
+			continue;
+
+		if (of_property_read_u32(child, "renesas,sys-block", &index)) {
+			of_node_put(child);
+			return -EINVAL;
+		}
+
+		if (index >= RZT2H_MAX_SYSC) {
+			of_node_put(child);
+			return -EINVAL;
+		}
+
+		name = devm_kasprintf(dev, GFP_KERNEL, "sysc%u", index);
+		if (!name) {
+			of_node_put(child);
+			return -ENOMEM;
+		}
+
+		base = devm_of_iomap(dev, child, 0, NULL);
+		if (IS_ERR(base)) {
+			of_node_put(child);
+			return PTR_ERR(base);
+		}
+
+		sysc_reg->base = base;
+		regmap_cfg->name = name;
+		regmap_cfg->reg_bits = 32;
+		regmap_cfg->reg_stride = 4;
+		regmap_cfg->val_bits = 32;
+		regmap_cfg->fast_io = true;
+		regmap_cfg->max_register = 0x10000;
+		if (index == RZT2H_SYSC0) {
+			regmap_cfg->readable_reg = rzt2h_writeable_readable_sysc0;
+			regmap_cfg->writeable_reg = rzt2h_writeable_readable_sysc0;
+		} else {
+			regmap_cfg->readable_reg = rzt2h_writeable_readable_sysc1;
+			regmap_cfg->writeable_reg = rzt2h_writeable_readable_sysc1;
+		}
+
+		regmap = devm_regmap_init(dev, &rzt2h_sys_regmap_bus, sysc_reg, regmap_cfg);
+		if (IS_ERR(regmap)) {
+			of_node_put(child);
+			return PTR_ERR(regmap);
+		}
+
+		ret = of_syscon_register_regmap(child, regmap);
+		if (ret) {
+			of_node_put(child);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 const struct cpg_mssr_info r9a09g077_cpg_mssr_info = {
 	/* Core Clocks */
 	.core_clks = r9a09g077_core_clks,
@@ -516,4 +695,5 @@ const struct cpg_mssr_info r9a09g077_cpg_mssr_info = {
 
 	.reg_layout = CLK_REG_LAYOUT_RZ_T2H,
 	.cpg_clk_register = r9a09g077_cpg_clk_register,
+	.sysc_init = r9a09g077_sysc_init,
 };
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 5b84cbee030b..2c125bbda5c9 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -1283,6 +1283,12 @@ static int __init cpg_mssr_common_init(struct device *dev,
 		}
 	}
 
+	if (info->sysc_init) {
+		error = info->sysc_init(priv->dev);
+		if (error)
+			goto out_err;
+	}
+
 	priv->num_core_clks = info->num_total_core_clks;
 	priv->num_mod_clks = info->num_hw_mod_clks;
 	priv->last_dt_core_clk = info->last_dt_core_clk;
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index ad11ab5f0069..2d1b5c2c4472 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -178,6 +178,7 @@ struct cpg_mssr_info {
 
 	/* Callbacks */
 	int (*init)(struct device *dev);
+	int (*sysc_init)(struct device *dev);
 	struct clk *(*cpg_clk_register)(struct device *dev,
 					const struct cpg_core_clk *core,
 					const struct cpg_mssr_info *info,
-- 
2.54.0


