Return-Path: <linux-renesas-soc+bounces-27799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBfoI17QgWl1JwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 11:39:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 025A3D7D5C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 11:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 91780307121D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 10:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949F1324B3B;
	Tue,  3 Feb 2026 10:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ffkznbvm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D15E322753
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 10:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770114640; cv=none; b=bYiG7W7gHP4rdF+IaGrFZbwG3FmFWrJlnibE/crWQLnU22hYW1p2laJiHJVGa0XsUpwdMhu/5niqv0CCa1bVlLKc2aaCuG6uSp6KRKRW3/BVbkjrqEJqaMfxLuNCbmy1ioz7LJODmG8KzWNBHp0SgALhy6d+gm20Z8COX6eo2Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770114640; c=relaxed/simple;
	bh=HIa1lNGJGkMNWo1R856YSk3QF6nmps7KwcFmvWTHz5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rd5/DOI90dK5yOv9FhjlHu/ZrbKH3+EwGx9crjV9aETjqbN6zR3xspN0TMXrhQwRWbzAyeBplj//PWuiMWWA7GzO3DUMXrsIbR8OK2LAw4xuS0WbQpzKpx8h6klI2vDOvoHYSz55pls3EdyYIzWdw9yuQFZmqnlapoex3xNx3ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ffkznbvm; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43615d9c507so177081f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 02:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770114636; x=1770719436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blXdSmm5RtfaqdLDW2tVMSMsTASh0LCe/QM5BibNqEY=;
        b=FfkznbvmRVsH743ifkXcow2euxAz17e/lKIVy6lLi8AL13ZZ/j/iSdd9iYdeu39IHv
         YDQZJPisusu60TE9e8hNrGrKjlW+koquQPBZLDxKSe1MIrOYKdPlQc+NfZj16hSG6LsI
         x+KcckqOTC0/F2XvSqluBu2a0js+qgw2o9Y3kcxvoEu4/Gkj61uMUMm6zOPCeHnSQNX8
         1qFh4fuKaSvgam9N+6C8hMe9biP/M09OftyP7d1aPUv2GuSwNERRVzQUppw9t0N5sPw2
         AvoW2x5CLiW6LRUwZpVBDghl9D7vfpWwWVlXFp+kY04AiAE7mD/0qKq/YmUhwubRZIKJ
         HzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770114636; x=1770719436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=blXdSmm5RtfaqdLDW2tVMSMsTASh0LCe/QM5BibNqEY=;
        b=aOxYCLZOJP2feT53td+eBdvIkIU3wtgsPm8AZFzw6H1lS0xXmEgjqGDuh2ED1cOdzY
         eJizKRZHDgG5tjhalA/rmkyLwRACcmwqbPp+7O9OKCcDMXngt0Dm8VR0YAN+gu5oRv8s
         QhF2PvchCnNkxaNbibU2IQzcDfe3szGR4T7w+fvBpn1k+bj232RRdqzMtAL2f9r1uuVF
         gXeeb3WT8WvqbypVuORKbjF0MdD04CT009/qOH+1PFjjaGeckITOj5hmE19lcOQqD6W/
         HNWdobdJmjpxe8lL4Psm8wIdBPeRJazG6C3fiMIAGp0PalxakN2yFRl4U6RUA6scfgno
         YY1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUO/EuuO5P3tatfJZMqV+MYcRTTYliBZ37xRPjN2GtWcOqSQDigcZEOhWwMxe4kzOigXQ+PcCvAhDlgmDmPXxhqsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiDUa76XZUNgAu6t0O15Zn1opLhgit9w9UpSE+sNBqkQTzIjIG
	a7ESlw1A1pBf5KEhgqmVHGDe3GF2aHF1Fe4NWgqhI7BYzkHLZAS2Khpz
X-Gm-Gg: AZuq6aKyiKHvLrMbOZAjz7SdoBC+JkMwldw/mgBbDkJ4BO4hxQwlse7j5NP01G0jlAD
	sNACzock+UtD7U7dnV+59XlInx4fOx2X9WckwGna9hcCcoetwQuV+w3NXhNNmzN+L7VpKIbi4ed
	53Zl7NVX7wSKABmS0z+KF2fWAQTrZX14KLNygXfeDxqlLy/mMDUYyNd5VcbVOx2RFdWGBvYuaKE
	UQM0DgAsP+rfhXtNJnD1v/jZuOosW84QWYqBHNa7geqKtQ4jgk5IED3Pa9atv6mqL4ltu0YIXq+
	faNk7DQfWQ5EYnZaBQHh96QrAYI65L4LvZ1XskDc/NBjvL5sKoWnZpiUyVGJD0HYrDBbHBbihzy
	Ya0NEKV8LzJXXAIZIxwgEAAVa34g3MjvKs0NEEXjoCuwQ45NTJjP7UiLQ8IutTI8cjlSDi9Kk4Z
	kvDrPXlTk6owwBwOVgtw==
X-Received: by 2002:a05:600c:8115:b0:477:b734:8c22 with SMTP id 5b1f17b1804b1-482db448774mr177547475e9.8.1770114636033;
        Tue, 03 Feb 2026 02:30:36 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1323034sm53160961f8f.35.2026.02.03.02.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:30:35 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 04/10] soc: renesas: rz-sysc: Add SoC identification for RZ/G3L SoC
Date: Tue,  3 Feb 2026 10:30:12 +0000
Message-ID: <20260203103031.247435-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27799-lists,linux-renesas-soc=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 025A3D7D5C
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add SoC identification for the RZ/G3L SoC using the System Controller
(SYSC) block.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
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


