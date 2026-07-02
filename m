Return-Path: <linux-renesas-soc+bounces-34647-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Sc80Dl1dRmo5RwsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34647-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 14:45:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F176F7D47
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 14:45:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TI2hPzRv;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34647-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34647-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 846BA3018DA9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2026 12:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DB848A2CD;
	Thu,  2 Jul 2026 12:31:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD8C47F2C8
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jul 2026 12:31:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995496; cv=none; b=ksMfG3H9u9IfAQUsDXUxeqq9/Q03A98wupAZnSqmISdZHM0y+oYQgS04fOqoDOSsT29DNgH4zNijPlFlafyORW73w6FZe3O78sGP6DeTpTis/WTJw0fHU8hhjFkwejHQp3tpURZiaGzUR4rEHY3S3aplbDXCOjys7w5yW/Idy+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995496; c=relaxed/simple;
	bh=F1BW2OtB1L4atzHir5xyMPhq9vhCUockLhS79uDA0Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BbmEb6zTQu6/ZlwtqDHPPQVH09VlKeYRGJo6eJdtroAD2sn3cfo5Y6DAg9SpojcFieP6dCkxMBHK2nmz8ECc3j8LDpuLcLdZEMx1V45jx/az7qRQnE1h23WnAN7JWXPlAR7ODKZ2HVrH8F8RaTsee9U/8Kuz82giUm89TC7Pors=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TI2hPzRv; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493c1950518so2876755e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Jul 2026 05:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782995487; x=1783600287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M14rQTlPNoEhf0b8ahlEf8t6l4fnbwAvdy1RJM8PIGg=;
        b=TI2hPzRva5HQvOrPZnZLa+LFXgkxfNy5Z/KeOhbrvWg2ATQFGcpjUsb9vW6CH9ULPR
         cZX5bigY1aSZXvUxbO/ccf212w3DKQeODWURv7GOGnhpHqmaoRRuK0GC+ZeBjgjYV2uI
         VBgoWnvlRMw8es/VXnSAkz5Ar+sJ8TV7YlGbBoyQWAc+Tova1iKE8kMnPtm6RwqA8OVx
         IB3sEqcvFseJtM8WVOH9jDFxel4j/E2lMoEggkNFPIxSIu3QIz/ow221yjfYV7pQbSTh
         t4MZle4/c7+FnIpv1957WZk3srJUEoeKapg5kUgh7RQJ4r77z7RajgmWmpNC//BUI/WI
         fBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995487; x=1783600287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M14rQTlPNoEhf0b8ahlEf8t6l4fnbwAvdy1RJM8PIGg=;
        b=GHL4ccP842r7ncPLWT6UVYYQHgFWP9vPylFGAfE1bflkDlrx2xIqYl6ZTyeQzQAxAK
         +qfcpZBphu1fIUIydhUo5OURK8AZ1YKpQKvFzWXYmBqCSd7+dvVrNNx23CJx9WyBj/MY
         xP2tNNgUE0G5GAn6Fkr1l5cAu/6pGr8FWheNczA7WgfMfvWBMJbCDEaGTro9UiIGSeh6
         SKLHNKV3XA47NdBLSMSpyfrUzanVAHfnv9dWASt/5xjUUpjfih/dPEtSqMinKwnQO5fX
         8cfZyt5x9YvSpmugEiyYJ1JlGwMgMYmdkAbYkbOpZtcPtEp8hu8XObvFq3w9LxRtllb7
         AUbQ==
X-Gm-Message-State: AOJu0Yyi2efVbcDyRSCVh9Ay1lhye75Zh18RJp1oTXtUimWC6rQn0Ubi
	UE/oVT4swAP5EheDq+dNJCzuDCGrBLtyYGcHppGPy4MrSm9IKT1FtEXa
X-Gm-Gg: AfdE7cntF737VFt4g6ipe56gJoQQRcmGZM1rcG+DnKkzU/oN5FMPK5dvMSqzGEpfYbH
	DcNIXhRw/4FLp4YYiNfI6O9uGEMU4HytgqtEuvy5mg8txWgnY0pg+JBDJ4WbSqX47mKb6rXRY/w
	gjPSotWieaBBAU3Uyu8W54A3qVGBRYO0l2JrQNsEzOaiKwQnzWiQnG2rgQUIR+1fRKO16/pTsWZ
	13rUx0WIKwK/yDxgnWQq5Vz4myUDvFX+Ob4qa7/SZ3Ionyb94fzJF/wQ/2qa1p+B7UVlC9KyT5y
	HDBpPdm2LlWsV4lQMIwxklWaHneBv35lssmnJo3prxlZeVRdd0gDlI5IGQ9a0EzBnJVxeO4fqGf
	jiVlceFg4GgPHIro/ZBmU/zaDr0r7S04TEiAi6o9PltcOzmvqy/nxnoY7gq1DUsRakUh5wv1n9K
	Ii4zwzbDrt9kd6z8MZXa4LNTa5W2zgAKP7LTNNwVkF2Rk1MwWi3cUoKFYE6aw9ZskUhXrmnZVvK
	6Q2XpnHmuUSn99GHM+gMEby5hddw0M5OQQpKQ==
X-Received: by 2002:a5d:5d11:0:b0:46e:5594:7385 with SMTP id ffacd0b85a97d-475e0af6aabmr14521534f8f.25.1782995486857;
        Thu, 02 Jul 2026 05:31:26 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7a4b:58b4:175e:8c2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477ddf0f433sm9772923f8f.32.2026.07.02.05.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:31:26 -0700 (PDT)
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
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC v2 2/9] clk: renesas: r9a09g077: Add SYSC regmap support
Date: Thu,  2 Jul 2026 13:31:05 +0100
Message-ID: <20260702123112.161160-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34647-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:magnus.damm@gmail.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,linux-watchdog.org,roeck-us.net,gmail.com,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 40F176F7D47

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
v1->v2:
- Made use of for_each_child_of_node_scoped
- Moved sysc_init() to the end of the probe function
---
 drivers/clk/renesas/Kconfig            |   2 +
 drivers/clk/renesas/r9a09g077-cpg.c    | 164 +++++++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c |   3 +
 drivers/clk/renesas/renesas-cpg-mssr.h |   1 +
 4 files changed, 170 insertions(+)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 5c0238e878b7..d648ddc02fca 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -219,11 +219,13 @@ config CLK_R9A09G077
 	bool "RZ/T2H clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSSR
 	select CLK_RZV2H_CPG_LIB
+	select MFD_SYSCON
 
 config CLK_R9A09G087
 	bool "RZ/N2H clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSSR
 	select CLK_RZV2H_CPG_LIB
+	select MFD_SYSCON
 
 config CLK_SH73A0
 	bool "SH-Mobile AG5 clock support" if COMPILE_TEST
diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 5640c2035e5a..33aec2f272df 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/clk-provider.h>
 #include <linux/clk/renesas.h>
 #include <linux/device.h>
@@ -15,7 +16,9 @@
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/math.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/regmap.h>
 #include <linux/types.h>
 #include <linux/units.h>
 
@@ -87,6 +90,16 @@ MODULE_IMPORT_NS("RZV2H_CPG");
 #define CPG_PLL_MON(x)		((x) - 0x10)
 #define CPG_PLL_MON_LOCK	BIT(0)
 
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
@@ -875,6 +888,156 @@ r9a09g077_cpg_clk_register(struct device *dev, const struct cpg_core_clk *core,
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
+	for_each_child_of_node_scoped(np, child) {
+		struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
+		struct r9a09g077_sysc_reg *sysc_reg;
+		struct regmap *regmap;
+		void __iomem *base;
+		char *name;
+		u32 index;
+		int ret;
+
+		if (!of_node_name_eq(child, "system-controller"))
+			continue;
+
+		if (of_property_read_u32(child, "renesas,sys-block", &index))
+			return -EINVAL;
+
+		if (index >= RZT2H_MAX_SYSC)
+			return -EINVAL;
+
+		sysc_reg = devm_kzalloc(dev, sizeof(*sysc_reg), GFP_KERNEL);
+		if (!sysc_reg)
+			return -ENOMEM;
+
+		if (!regmap_cfg)
+			return -ENOMEM;
+
+		name = devm_kasprintf(dev, GFP_KERNEL, "sysc%u", index);
+		if (!name)
+			return -ENOMEM;
+
+		base = devm_of_iomap(dev, child, 0, NULL);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
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
+		if (IS_ERR(regmap))
+			return PTR_ERR(regmap);
+
+		ret = of_syscon_register_regmap(child, regmap);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 const struct cpg_mssr_info r9a09g077_cpg_mssr_info = {
 	/* Core Clocks */
 	.core_clks = r9a09g077_core_clks,
@@ -889,4 +1052,5 @@ const struct cpg_mssr_info r9a09g077_cpg_mssr_info = {
 
 	.reg_layout = CLK_REG_LAYOUT_RZ_T2H,
 	.cpg_clk_register = r9a09g077_cpg_clk_register,
+	.sysc_init = r9a09g077_sysc_init,
 };
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 80f4403ea2ba..dcca7f095052 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -1414,6 +1414,9 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
 
 	error = cpg_mssr_reset_controller_register(priv);
 
+	if (!error && info->sysc_init)
+		error = info->sysc_init(priv->dev);
+
 reserve_exit:
 	cpg_mssr_reserved_exit(priv);
 
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


