Return-Path: <linux-renesas-soc+bounces-27110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIuNNr5+cGktYAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 08:22:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 828AF52BF5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 08:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 993FA6A2AD2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 12:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AECE42EED6;
	Tue, 20 Jan 2026 12:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JGKQxzSy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A3242EECB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 12:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913564; cv=none; b=G9QHjLKCVLD8mWWJUpWgcTObxrB/uu5/Og0+i4KHGBiPj4QJDgCXaKSt4/e7DoBE4Fup20dCa1BBwgK45NEcIHteuzKriLDxMOjCcgNCIXVjsKbQTM9kXQmJQLy5gTz4IbX/KxI2cmFWvvskT91yi0RrGVwK6tzSewYjaCcReWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913564; c=relaxed/simple;
	bh=PLQFcz6fBg/O5DbM/xCTgK/S2z2lI+sDie+DPiBxM7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jt+KN4huHtmkLyfT4vFqx1hh+PCENQQ/1HLAB9TnvN0Vi/BehO0fOqs3OBrjX62BGmTVaMCjDU2Nho2u3tTZDXbhlXV+vcoyglmAAdWcKd7evP2ixZoonXXOdh9uXPdcBMCJXa5dAQWvZmeiZxrR5hyctqGBGDf60R3+fc8DL34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JGKQxzSy; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b87f3c684a1so232909066b.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 04:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768913559; x=1769518359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubul1lntS+me4eq8/yn7DWd1axBIj6sOw7q+IlvVeQg=;
        b=JGKQxzSyTvKq4FBm8fmHxwiz2XuVFRnd7m/r44a5QfpEghjbLSIlY4nTEjNKwnkzKa
         XNHA+2jhGaCfvWWx/xfrCTKMtHIrJB0TTFFzzxyzLKLe59nPI5IatGThCbnjJLgi1fMa
         5HJ5HxB65Pu4EKBUHT5Am+h7bYkugCb/WwlDJb2jGo85S/iSmkd5Dv1wQA8EvqDUnTMu
         YwFm4XAOn/xM8V821+pcytSBeumM/Jg/fztBVrY9zjtwrS81rt1d7lkb2B1ku4ypkw1f
         x5qevr6nYAUD+PQoehuUkZq2SFewYlqlzC40H7HcB0+BkQ4zKLLuXMkVjirGdc5j//oY
         DFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768913559; x=1769518359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ubul1lntS+me4eq8/yn7DWd1axBIj6sOw7q+IlvVeQg=;
        b=XNh/SZE90BsVERprN3FQC2XePx4CJFkD+ZbXB5RGmgI4L+FLAQ220pxopTcSFADnWb
         HYG9jSBgcHBAzOwyg4TDGn/S5RNJRuGUOEgQwdynElt5DM/hyJkNyyCFLa2O9kaE/RW2
         gJG/53PbX4JWDkWVrdSHLAPyeNNrC2HXeFALIay7WSky1ENKbTTkuANn/mxti3ZspjQ2
         GR7AjSaPEiJWnpA56Zm8MjCZGYFkb3yqpPF9UCmvhkdZr5Fp/yNT43Ac5bCj1II2ruVh
         5+VL3s2YSY0D6nGvhHiPtuL1tIw+/d0obrF1MxwT9D6Fr+zQR811dUgiV+Yo7ly93WJq
         sqEw==
X-Forwarded-Encrypted: i=1; AJvYcCVgnv1+N6FmdobIs6HBqTBAxiurAxX2nRDXmIldbI8k+WfrHRP4sf6p0/HBL6EjQKQ7JFEGzAL2ENfPZ94JaVGlpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcP+11UwlJdb5DSTTtiuT7lOP9S000SJ1NYfS/CA9Cfq7litMe
	0iD7e6EYq+8ZmmwbI945SJdZRA+GCAzSma5I787d/wRwAZZaQ54kqbZx
X-Gm-Gg: AZuq6aJPF9AvZzG4yafbXepQSfHTzJC0kYSYiOz9OVZjfmfcXTzaAHwgECPc485/MI0
	WCtOkXciVkixbU5j/cgcGuqoxBxKkA4UQFpjZrK0PIMw5z5QLj+yF5Kqu7ayjF5RUQSUrgw+Nd4
	68TTIMpwX6K/xREmMr2c9wgSwinXSGQLryNNmfIXA0u2d2knr2C7gjvcT6I3NLAi/xuMw5Nzth3
	PwR/gntbNTEcSC74EUX2eVm/tKgs6BtBVhrdr0wpjPmj/xgS/aEJBWQSW3v08SwGoDZ3tNumlRK
	l7YHqMFh9C+7h8PDi3FAfMNHgI7Rs93OfQJwrjcwAv3H9s7sDeM0QxyNHsqLVpn1TZgYk83FsgZ
	61u4iLMYgaaseqZBbGMfbTtS8RfFJlexzrXcF7p9pC1h93OBP0XWC+UbkI86D3NCZ3GI4WGujmA
	J2xd560m7VxEcvKjk8OTNKWzM6KJZuw1pxhb8=
X-Received: by 2002:a17:907:fd17:b0:b87:bb45:bd58 with SMTP id a640c23a62f3a-b88002927b8mr183104566b.24.1768913558859;
        Tue, 20 Jan 2026 04:52:38 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:c8c7:2ef6:8ac5:5556])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959ca32esm1420626066b.41.2026.01.20.04.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:52:38 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 06/12] soc: renesas: rz-sysc: Add SoC identification for RZ/G3L SoC
Date: Tue, 20 Jan 2026 12:52:17 +0000
Message-ID: <20260120125232.349708-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
References: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FREEMAIL_TO(0.00)[glider.be,gmail.com];
	TAGGED_FROM(0.00)[bounces-27110-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 828AF52BF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add SoC identification for the RZ/G3L SoC using the System Controller
(SYSC) block.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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


