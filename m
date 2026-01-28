Return-Path: <linux-renesas-soc+bounces-27514-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI7kAq/2eWkE1QEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27514-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 12:44:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4550BA0BBB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 12:44:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3EFFC30AF6A7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 11:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E0534FF6B;
	Wed, 28 Jan 2026 11:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9Lgu0c3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D82734E760
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 11:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599843; cv=none; b=iqmZB8h9VQfPruddHgTllyhkTinoBecTflZgKpj1y1ENw7NVwfrLE2khQwyrarJjzh/rQ03M8IXqp/eVPyFWrh4QAlqreWAs4WwqGWuli7e7X5b2FtbjhKW63isTvi5MfTtxYywH8KCRSFEFlIW7v5zaV2yN01CrQ+iV/dwlbQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599843; c=relaxed/simple;
	bh=94Yp11geDS09/M48mK3HP68FwYsNapK0Mf3HeWD8UTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/h8WwzHnA/Hh9nct49VYmD9i/ODFGUtwTuLTOPVNxkp7FVT8hK4qQbI6Vg9vxZQaseKxUjDxXNhklsA2UCjV/Z+OuRwFX4utAomZcxRQxuCeqI9Wz1tIGln7PBdjGSnRqJNhoZGtOo8JGa0kM5jc9mVVmtzpM19rRTPR4Md+Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9Lgu0c3; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b884a84e622so1076113266b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 03:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769599839; x=1770204639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7HjnTT44kC0vsx/rpsMq/SbWTo0wKN0mTmo1e7BWPc=;
        b=I9Lgu0c3kv5fwUYTLFSDTFE7TLbcZb5LA9CS9giyJFhh/x/YauZPI/T47e50zHotl5
         r/JNrEAv3jToayHrgdyhldVoEvbxT+db/F318SEYHARjQwgJ7C2njkYfniYR7xiydN2N
         jjJDGxkWQir39Sr9mMCakkK+SZxSCF0ILesdCPmo54E/8Ng3Xg+syzCkifi3yN+jiC4e
         RX0+BFJ1Q8mORe6TEj7o2OecRi8x27dmfK+3HEZ/9qGxYulhP2srgxPiByJPC1KjvoXc
         ok6Z5wRcgOLK+DXS+iY3X5xdUdN+w+Rh6KA8tRf4//TZDWWQ2kS15bBAwProvw+D2G0u
         GI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599839; x=1770204639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H7HjnTT44kC0vsx/rpsMq/SbWTo0wKN0mTmo1e7BWPc=;
        b=VMoy0tX7t574Pr9S+PLYW2ewllim5/rvLHmpdaBLtJA0NS/P3X3Hs8HFk2ylva5CQV
         3EJON032vbbAbu1v0vVcpciJZmF1apaUBj9ZbeoDRY5iCRGOZx993Ux4RpUXs6XgLDBJ
         zNPa4xGZughzllgWkLBQyUl2xblCWWOZwhvtUpnzCOh0YEYnGfamdxpY/qgiTKNcnIVK
         GUJLDral41Givf7hSHV1liulvvM9Pc4dvRbAdn8voawQiP0Z5RnKuM3491ydH0he7nzA
         vxW45UQeCbNgSeZM/WsMKmRzl4JOehnc62VEbkvt5Ws4yXjbbU4xzVtw7wFUA5cbWT/G
         v/pw==
X-Forwarded-Encrypted: i=1; AJvYcCXU5+gfRkphj/RFGj/8Kzfi9Z2CNk7oIayRrG5WjoyLwB+/Tfthk3kuyHOsy/TXhJ5vlD9VVv1rcUCz1h5+/Rz4aQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrsheJwezHYB8rJ2Nt0jpToZgFyz8qh5aFlZRv+jh0zC6UjpR3
	cInIIrStmYX20rS9qawYoP0S+YcUIwRFne6WlRVbop2deFk633Xyslsg
X-Gm-Gg: AZuq6aJSoakWdSlaG8S32VNdEILMSm5ea0cHVgTho2dC33aQPf5BNQLKcmW3foOQnXx
	1rMGW54NHpY9pCLMMPD8MxTxIfQbaP+z3M+q2VcIxL0gCNsE4utZOtcMUT8jKBLdyd2cfKjEH6K
	T03DyPuPbO0N5iysWtMHlYN/Chvjr2sR0ASr/EYWT2CfmDNTM7Zs8xaO0QUn5QquvBzF6L+xLMB
	5u//lBz9+VG2noWbOiT9zID0keZHQf4HbDgLnQwKNxfsm6BswOPcAdc2izF/M8/nnBI2z0kHquW
	dAZasGjAu97J03JoyMY/uO3Ruv6ZjiXcou0hdIcdWMbTzWHFGxRlb/ipV2uCG7G43mVc9euY55Y
	oZcc7DK3jJMB+q0r1zcanN8mA/1//1E4uvvpPTUJtlpZfE6Ixa7xnH4lp801aOo4gOjYCisXuCu
	XrIyvY3+Po1F7zGjUTA4H71plz7X8zImvHzW4=
X-Received: by 2002:a17:906:6a21:b0:b79:d24b:474d with SMTP id a640c23a62f3a-b8dab2d9bc9mr341625066b.16.1769599839273;
        Wed, 28 Jan 2026 03:30:39 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e29d:6e0e:72c1:d15d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm114400366b.46.2026.01.28.03.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:30:39 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 04/10] soc: renesas: rz-sysc: Add SoC identification for RZ/G3L SoC
Date: Wed, 28 Jan 2026 11:30:23 +0000
Message-ID: <20260128113032.337231-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128113032.337231-1-biju.das.jz@bp.renesas.com>
References: <20260128113032.337231-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27514-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4550BA0BBB
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add SoC identification for the RZ/G3L SoC using the System Controller
(SYSC) block.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/soc/renesas/Kconfig          | 12 ++++
 drivers/soc/renesas/Makefile         |  1 +
 drivers/soc/renesas/r9a08g046-sysc.c | 91 ++++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.c        |  3 +
 drivers/soc/renesas/rz-sysc.h        |  1 +
 5 files changed, 108 insertions(+)
 create mode 100644 drivers/soc/renesas/r9a08g046-sysc.c

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 1e50dc7c31cd..26bed0fdceb0 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -390,6 +390,14 @@ config ARCH_R9A08G045
 	help
 	  This enables support for the Renesas RZ/G3S SoC variants.
 
+config ARCH_R9A08G046
+	bool "ARM64 Platform support for R9A08G046 (RZ/G3L)"
+	default y if ARCH_RENESAS
+	select ARCH_RZG2L
+	select SYSC_R9A08G046
+	help
+	  This enables support for the Renesas RZ/G3L SoC variants.
+
 config ARCH_R9A09G011
 	bool "ARM64 Platform support for R9A09G011 (RZ/V2M)"
 	default y if ARCH_RENESAS
@@ -474,6 +482,10 @@ config SYSC_R9A08G045
 	bool "Renesas System controller support for R9A08G045 (RZ/G3S)" if COMPILE_TEST
 	select SYSC_RZ
 
+config SYSC_R9A08G046
+	bool "Renesas System controller support for R9A08G046 (RZ/G3L)" if COMPILE_TEST
+	select SYSC_RZ
+
 config SYS_R9A09G047
 	bool "Renesas System controller support for R9A09G047 (RZ/G3E)" if COMPILE_TEST
 	select SYSC_RZ
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 33d44d964d61..655dbcb08747 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -7,6 +7,7 @@ ifdef CONFIG_SMP
 obj-$(CONFIG_ARCH_R9A06G032)	+= r9a06g032-smp.o
 endif
 obj-$(CONFIG_SYSC_R9A08G045)	+= r9a08g045-sysc.o
+obj-$(CONFIG_SYSC_R9A08G046)	+= r9a08g046-sysc.o
 obj-$(CONFIG_SYS_R9A09G047)	+= r9a09g047-sys.o
 obj-$(CONFIG_SYS_R9A09G056)	+= r9a09g056-sys.o
 obj-$(CONFIG_SYS_R9A09G057)	+= r9a09g057-sys.o
diff --git a/drivers/soc/renesas/r9a08g046-sysc.c b/drivers/soc/renesas/r9a08g046-sysc.c
new file mode 100644
index 000000000000..fd98df196d0a
--- /dev/null
+++ b/drivers/soc/renesas/r9a08g046-sysc.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ/G3L System controller (SYSC) driver
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/init.h>
+
+#include "rz-sysc.h"
+
+#define SYS_XSPI_MAP_STAADD_CS0		0x348
+#define SYS_XSPI_MAP_ENDADD_CS0		0x34c
+#define SYS_XSPI_MAP_STAADD_CS1		0x350
+#define SYS_XSPI_MAP_ENDADD_CS1		0x354
+#define SYS_GETH0_CFG			0x380
+#define SYS_GETH1_CFG			0x390
+#define SYS_PCIE_CFG			0x3a0
+#define SYS_PCIE_MON			0x3a4
+#define SYS_PCIE_PHY			0x3b4
+#define SYS_I2C0_CFG			0x400
+#define SYS_I2C1_CFG			0x410
+#define SYS_I2C2_CFG			0x420
+#define SYS_I2C3_CFG			0x430
+#define SYS_I3C_CFG			0x440
+#define SYS_PWRRDY_N			0xd70
+#define SYS_IPCONT_SEL_CLONECH		0xe2c
+
+static bool rzg3l_regmap_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SYS_XSPI_MAP_STAADD_CS0:
+	case SYS_XSPI_MAP_ENDADD_CS0:
+	case SYS_XSPI_MAP_STAADD_CS1:
+	case SYS_XSPI_MAP_ENDADD_CS1:
+	case SYS_GETH0_CFG:
+	case SYS_GETH1_CFG:
+	case SYS_PCIE_CFG:
+	case SYS_PCIE_MON:
+	case SYS_PCIE_PHY:
+	case SYS_I2C0_CFG:
+	case SYS_I2C1_CFG:
+	case SYS_I2C2_CFG:
+	case SYS_I2C3_CFG:
+	case SYS_I3C_CFG:
+	case SYS_PWRRDY_N:
+	case SYS_IPCONT_SEL_CLONECH:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool rzg3l_regmap_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SYS_XSPI_MAP_STAADD_CS0:
+	case SYS_XSPI_MAP_ENDADD_CS0:
+	case SYS_XSPI_MAP_STAADD_CS1:
+	case SYS_XSPI_MAP_ENDADD_CS1:
+	case SYS_PCIE_CFG:
+	case SYS_PCIE_PHY:
+	case SYS_I2C0_CFG:
+	case SYS_I2C1_CFG:
+	case SYS_I2C2_CFG:
+	case SYS_I2C3_CFG:
+	case SYS_I3C_CFG:
+	case SYS_PWRRDY_N:
+	case SYS_IPCONT_SEL_CLONECH:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct rz_sysc_soc_id_init_data rzg3l_sysc_soc_id_init_data __initconst = {
+	.family = "RZ/G3L",
+	.id = 0x87d9447,
+	.devid_offset = 0xa04,
+	.revision_mask = GENMASK(31, 28),
+	.specific_id_mask = GENMASK(27, 0),
+};
+
+const struct rz_sysc_init_data rzg3l_sysc_init_data __initconst = {
+	.soc_id_init_data = &rzg3l_sysc_soc_id_init_data,
+	.readable_reg = rzg3l_regmap_readable_reg,
+	.writeable_reg = rzg3l_regmap_writeable_reg,
+	.max_register = 0xe2c,
+};
diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index ae727d9c8cc5..0d3b7f52f846 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -88,6 +88,9 @@ static const struct of_device_id rz_sysc_match[] = {
 #ifdef CONFIG_SYSC_R9A08G045
 	{ .compatible = "renesas,r9a08g045-sysc", .data = &rzg3s_sysc_init_data },
 #endif
+#ifdef CONFIG_SYSC_R9A08G046
+	{ .compatible = "renesas,r9a08g046-sysc", .data = &rzg3l_sysc_init_data },
+#endif
 #ifdef CONFIG_SYS_R9A09G047
 	{ .compatible = "renesas,r9a09g047-sys", .data = &rzg3e_sys_init_data },
 #endif
diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
index 88929bf21cb1..921ee0d26c47 100644
--- a/drivers/soc/renesas/rz-sysc.h
+++ b/drivers/soc/renesas/rz-sysc.h
@@ -46,6 +46,7 @@ struct rz_sysc_init_data {
 };
 
 extern const struct rz_sysc_init_data rzg3e_sys_init_data;
+extern const struct rz_sysc_init_data rzg3l_sysc_init_data;
 extern const struct rz_sysc_init_data rzg3s_sysc_init_data;
 extern const struct rz_sysc_init_data rzv2h_sys_init_data;
 extern const struct rz_sysc_init_data rzv2n_sys_init_data;
-- 
2.43.0


