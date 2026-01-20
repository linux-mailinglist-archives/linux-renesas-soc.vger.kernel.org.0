Return-Path: <linux-renesas-soc+bounces-27112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J+ZBY9FcGnXXAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 04:18:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E90950552
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 04:18:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 358E850BD97
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 12:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE767438FF3;
	Tue, 20 Jan 2026 12:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9W/hQip"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CFA426EAD
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 12:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913566; cv=none; b=FYD4G0GifXP7N4JRrem+dvMSC4Qgz4JXyB80A2h5VVve7NCPdSVyTMQNc9SlELxmwrnOW3Akr0w+n4MsA7YHbFRdzz0Qv+tSWv/U0Qj+iAjZoUiKIPwhLCqEOf1iB3LMCOh31QR9tVMep6r2Gz9MVs+u/l0+feXpJXGf6XHzsu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913566; c=relaxed/simple;
	bh=K4xSVjQ5mnK1kiszxhrkBfm7/qY+r2b2+frDRdsXQ8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PkATiwl9FNTpFyZiy6VYYXheuSfpyOZ1YQ8gtEOu+zVmIW3IpwLl3YEc02ywOhUYMpWXJLLGOPejz7vWq0kYgQV9zP/bENPzSoGstk4xlm3x768J7icf/7PyDE0HAdHcNdJV0KEg5EjKcwohG21jS1LJbe7IG3m/S8M6BPD7w+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9W/hQip; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-64b608ffca7so8061132a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 04:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768913560; x=1769518360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIR2QLlr6qXxhSTAxff09jiUqxRcSNuLdPjV2JesBrY=;
        b=C9W/hQipW0HOAZ52qSCvjSFaMkMeOvLAlw5QYRudRYoXCA9wFckwOIg0I/c1EKczZ8
         J+9mIf6Q6bPGTLSyc3sbai8Gdpfxj9UjMJjc2LjpCLndkpIVVjSUoKSJMajLKmSN8tIo
         MH54atm/XEikpQBLFwthA/LTot5MgmO7ZQTe8T8GnIZfsgDbwGU6hUce2xMRDCG+TJb/
         SCc9twvS9L43+kUZeFtSOMA37YXp6g4Q4vVe+CNZ/Y7NbPCf5GOvrn40MPUN+490HcOu
         Qb6zp7Nyu75KGjqFlkgM37WmxJjUNF71ZHONZAY9gmzO2pz8vX6SMfrl1FdRSN8vgXVx
         +w4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768913560; x=1769518360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PIR2QLlr6qXxhSTAxff09jiUqxRcSNuLdPjV2JesBrY=;
        b=bQwsxUtjSJym7aLGTwOfuQvJNrMl9Qpqp2iyxlgm/eMRMsA+DZ8PBEV1EWSHKikmjH
         x7B/QdFJyUlpyYj9+HAriPslS977t3UNzrJS2mY5MN2g6LxgHv0bjcCVj5NIFIF8n1K9
         FQBVfz3q8QH/AUKyMzkyWh67Ce8G5yCe3xFUOuoo6sz8iNbh/mjBhoYtA+e5Pjp2NjCY
         0qYhq2E+3IHakiH+g7oDnIcnY51Gkm2NGhORQEkYGQR5LQqlET9BM4wm7Y3xbFGawabr
         nnWGhNwFIrX99Q9FabPmSNHMDVyrlPpaXCpMG/gI/EXY5YkHdm3X0TJceGP/BHUlDPN+
         5p0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfMe7Z0QOl7XfmI+d0Ifpf9wVNc2vj3LNdhZrh3Ejk+8qXH08FbIouQM2hWEdBnqciqq6dwYF5tmO9N/RmNI4eEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxerZFAKrceyAvVm22837nz8lLaDRlncF2fhOZ+Jey0K1j4jYhj
	vDtSxqUjausW3uHjRg2quX4jkwJa3uVj1cBf2UyvQjo6XDfkWrZLr8bl
X-Gm-Gg: AZuq6aKv4jJIsXX+dqvDjFTAm15C9It+sljtENNgysGJC6AZd57Zdt2n4yzlCxqq7RK
	SqN2NmelmHDfCmKlLfzzCp+f0pasmxRLJukVCXTPxnc+rexMUbXCX8qOllQPjn2YbKSsY+C8zLS
	65+IBVgLAnvkwLTie4GBDMdZ9Fh7/gta1DGnnUn6NSo1QK8o6rLMkkuQCmHzv4lhhwVUb56OL41
	KuHKXjWGZ4cFJxRh9veWkMyZStupuC510FlZHTcFuiB75vAQ01Em7uBNwHDeLNUYR1B3RMaUHdt
	S3dCBuwMJRpp+p/A0bi6jFyFM6SjZJ0WsQhImfr2CilkdUxQH3HogW96n8S9C+xrSnn/RnZp1WI
	9Ysmhrf1CmbjZaaxC9d5UmdwlMSop74ADJMMMtTTf99gU2M/mdRamfabHp16Zcy1XQon9gPpuuv
	KDE8/XL7EUeQE12f/wzu4RbLW2s/SzAu0Kxe8=
X-Received: by 2002:a17:906:f5a2:b0:b87:b87:cdbf with SMTP id a640c23a62f3a-b8796b85d1bmr1241674966b.53.1768913559578;
        Tue, 20 Jan 2026 04:52:39 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:c8c7:2ef6:8ac5:5556])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959ca32esm1420626066b.41.2026.01.20.04.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:52:39 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 07/12] dt-bindings: clock: Document RZ/G3L SoC
Date: Tue, 20 Jan 2026 12:52:18 +0000
Message-ID: <20260120125232.349708-8-biju.das.jz@bp.renesas.com>
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
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-27112-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 7E90950552
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Document the device tree bindings for the Renesas RZ/G3L SoC Clock Pulse
Generator (CPG).

Also define RZ/G3L (R9A08G046) Clock Pulse Generator Core Clock, module
clock outputs, as listed in section 4.4.2 ("Clock List r1.00") and add
Reset definitions referring to registers CPG_RST_* in Section 4.4.3
("Register") of the RZ/G3L Hardware User's Manual (Rev.1.00 Oct, 2025).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../bindings/clock/renesas,rzg2l-cpg.yaml     |   1 +
 include/dt-bindings/clock/r9a08g046-cpg.h     | 339 ++++++++++++++++++
 2 files changed, 340 insertions(+)
 create mode 100644 include/dt-bindings/clock/r9a08g046-cpg.h

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
index 8c18616e5c4d..318fb91e4f5e 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
@@ -28,6 +28,7 @@ properties:
       - renesas,r9a07g044-cpg # RZ/G2{L,LC}
       - renesas,r9a07g054-cpg # RZ/V2L
       - renesas,r9a08g045-cpg # RZ/G3S
+      - renesas,r9a08g046-cpg # RZ/G3L
       - renesas,r9a09g011-cpg # RZ/V2M
 
   reg:
diff --git a/include/dt-bindings/clock/r9a08g046-cpg.h b/include/dt-bindings/clock/r9a08g046-cpg.h
new file mode 100644
index 000000000000..d8304a73efdf
--- /dev/null
+++ b/include/dt-bindings/clock/r9a08g046-cpg.h
@@ -0,0 +1,339 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__
+#define __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* R9A08G046 CPG Core Clocks */
+#define R9A08G046_CLK_I			0
+#define R9A08G046_CLK_IC0		1
+#define R9A08G046_CLK_IC1		2
+#define R9A08G046_CLK_IC2		3
+#define R9A08G046_CLK_IC3		4
+#define R9A08G046_CLK_P0		5
+#define R9A08G046_CLK_P1		6
+#define R9A08G046_CLK_P2		7
+#define R9A08G046_CLK_P3		8
+#define R9A08G046_CLK_P4		9
+#define R9A08G046_CLK_P5		10
+#define R9A08G046_CLK_P6		11
+#define R9A08G046_CLK_P7		12
+#define R9A08G046_CLK_P8		13
+#define R9A08G046_CLK_P9		14
+#define R9A08G046_CLK_P10		15
+#define R9A08G046_CLK_P13		16
+#define R9A08G046_CLK_P14		17
+#define R9A08G046_CLK_P15		18
+#define R9A08G046_CLK_P16		19
+#define R9A08G046_CLK_P17		20
+#define R9A08G046_CLK_P18		21
+#define R9A08G046_CLK_P19		22
+#define R9A08G046_CLK_P20		23
+#define R9A08G046_CLK_M0		24
+#define R9A08G046_CLK_M1		25
+#define R9A08G046_CLK_M2		26
+#define R9A08G046_CLK_M3		27
+#define R9A08G046_CLK_M4		28
+#define R9A08G046_CLK_M5		29
+#define R9A08G046_CLK_M6		30
+#define R9A08G046_CLK_AT		31
+#define R9A08G046_CLK_B			32
+#define R9A08G046_CLK_ETHTX01		33
+#define R9A08G046_CLK_ETHTX02		34
+#define R9A08G046_CLK_ETHRX01		35
+#define R9A08G046_CLK_ETHRX02		36
+#define R9A08G046_CLK_ETHRM0		37
+#define R9A08G046_CLK_ETHTX11		38
+#define R9A08G046_CLK_ETHTX12		39
+#define R9A08G046_CLK_ETHRX11		40
+#define R9A08G046_CLK_ETHRX12		41
+#define R9A08G046_CLK_ETHRM1		42
+#define R9A08G046_CLK_G			43
+#define R9A08G046_CLK_HP		44
+#define R9A08G046_CLK_SD0		45
+#define R9A08G046_CLK_SD1		46
+#define R9A08G046_CLK_SD2		47
+#define R9A08G046_CLK_SPI0		48
+#define R9A08G046_CLK_SPI1		49
+#define R9A08G046_CLK_S0		50
+#define R9A08G046_CLK_SWD		51
+#define R9A08G046_OSCCLK		52
+#define R9A08G046_OSCCLK2		53
+#define R9A08G046_CLK_P4_DIV2		54
+
+/* R9A08G046 Module Clocks */
+#define R9A08G046_CA55_SCLK		0
+#define R9A08G046_CA55_PCLK		1
+#define R9A08G046_CA55_ATCLK		2
+#define R9A08G046_CA55_GICCLK		3
+#define R9A08G046_CA55_PERICLK		4
+#define R9A08G046_CA55_ACLK		5
+#define R9A08G046_CA55_TSCLK		6
+#define R9A08G046_CA55_CORECLK0		7
+#define R9A08G046_CA55_CORECLK1		8
+#define R9A08G046_CA55_CORECLK2		9
+#define R9A08G046_CA55_CORECLK3		10
+#define R9A08G046_SRAM_ACPU_ACLK0	11
+#define R9A08G046_SRAM_ACPU_ACLK1	12
+#define R9A08G046_SRAM_ACPU_ACLK2	13
+#define R9A08G046_GIC600_GICCLK		14
+#define R9A08G046_IA55_CLK		15
+#define R9A08G046_IA55_PCLK		16
+#define R9A08G046_MHU_PCLK		17
+#define R9A08G046_SYC_CNT_CLK		18
+#define R9A08G046_DMAC_ACLK		19
+#define R9A08G046_DMAC_PCLK		20
+#define R9A08G046_OSTM0_PCLK		21
+#define R9A08G046_OSTM1_PCLK		22
+#define R9A08G046_OSTM2_PCLK		23
+#define R9A08G046_MTU_X_MCK_MTU3	24
+#define R9A08G046_POE3_CLKM_POE		25
+#define R9A08G046_GPT_PCLK		26
+#define R9A08G046_POEG_A_CLKP		27
+#define R9A08G046_POEG_B_CLKP		28
+#define R9A08G046_POEG_C_CLKP		29
+#define R9A08G046_POEG_D_CLKP		30
+#define R9A08G046_WDT0_PCLK		31
+#define R9A08G046_WDT0_CLK		32
+#define R9A08G046_WDT1_PCLK		33
+#define R9A08G046_WDT1_CLK		34
+#define R9A08G046_WDT2_PCLK		35
+#define R9A08G046_WDT2_CLK		36
+#define R9A08G046_XSPI_HCLK		37
+#define R9A08G046_XSPI_ACLK		38
+#define R9A08G046_XSPI_CLK		39
+#define R9A08G046_XSPI_CLKX2		40
+#define R9A08G046_SDHI0_IMCLK		41
+#define R9A08G046_SDHI0_IMCLK2		42
+#define R9A08G046_SDHI0_CLK_HS		43
+#define R9A08G046_SDHI0_IACLKS		44
+#define R9A08G046_SDHI0_IACLKM		45
+#define R9A08G046_SDHI1_IMCLK		46
+#define R9A08G046_SDHI1_IMCLK2		47
+#define R9A08G046_SDHI1_CLK_HS		48
+#define R9A08G046_SDHI1_IACLKS		49
+#define R9A08G046_SDHI1_IACLKM		50
+#define R9A08G046_SDHI2_IMCLK		51
+#define R9A08G046_SDHI2_IMCLK2		52
+#define R9A08G046_SDHI2_CLK_HS		53
+#define R9A08G046_SDHI2_IACLKS		54
+#define R9A08G046_SDHI2_IACLKM		55
+#define R9A08G046_GE3D_CLK		56
+#define R9A08G046_GE3D_AXI_CLK		57
+#define R9A08G046_GE3D_ACE_CLK		58
+#define R9A08G046_ISU_ACLK		59
+#define R9A08G046_ISU_PCLK		60
+#define R9A08G046_H264_CLK_A		61
+#define R9A08G046_H264_CLK_P		62
+#define R9A08G046_CRU_SYSCLK		63
+#define R9A08G046_CRU_VCLK		64
+#define R9A08G046_CRU_PCLK		65
+#define R9A08G046_CRU_ACLK		66
+#define R9A08G046_MIPI_DSI_PLLCLK	67
+#define R9A08G046_MIPI_DSI_SYSCLK	68
+#define R9A08G046_MIPI_DSI_ACLK		69
+#define R9A08G046_MIPI_DSI_PCLK		70
+#define R9A08G046_MIPI_DSI_VCLK		71
+#define R9A08G046_MIPI_DSI_LPCLK	72
+#define R9A08G046_LVDS_PLLCLK		73
+#define R9A08G046_LVDS_CLK_DOT0		74
+#define R9A08G046_LVDS_PCLK		75
+#define R9A08G046_LCDC_CLK_A		76
+#define R9A08G046_LCDC_CLK_D		77
+#define R9A08G046_LCDC_CLK_P		78
+#define R9A08G046_SSI0_PCLK2		79
+#define R9A08G046_SSI0_PCLK_SFR		80
+#define R9A08G046_SSI1_PCLK2		81
+#define R9A08G046_SSI1_PCLK_SFR		82
+#define R9A08G046_SSI2_PCLK2		83
+#define R9A08G046_SSI2_PCLK_SFR		84
+#define R9A08G046_SSI3_PCLK2		85
+#define R9A08G046_SSI3_PCLK_SFR		86
+#define R9A08G046_USB_U2H0_HCLK		87
+#define R9A08G046_USB_U2H1_HCLK		88
+#define R9A08G046_USB_U2P0_EXR_CPUCLK	89
+#define R9A08G046_USB_U2P1_EXR_CPUCLK	90
+#define R9A08G046_USB_PCLK		91
+#define R9A08G046_USB_SCLK		92
+#define R9A08G046_ETH0_CLK_AXI		93
+#define R9A08G046_ETH0_CLK_CHI		94
+#define R9A08G046_ETH0_CLK_TX_I		95
+#define R9A08G046_ETH0_CLK_RX_I		96
+#define R9A08G046_ETH0_CLK_TX_180_I	97
+#define R9A08G046_ETH0_CLK_RX_180_I	98
+#define R9A08G046_ETH0_CLK_RMII_I	99
+#define R9A08G046_ETH0_CLK_PTP_REF_I	100
+#define R9A08G046_ETH1_CLK_AXI		101
+#define R9A08G046_ETH1_CLK_CHI		102
+#define R9A08G046_ETH1_CLK_TX_I		103
+#define R9A08G046_ETH1_CLK_RX_I		104
+#define R9A08G046_ETH1_CLK_TX_180_I	105
+#define R9A08G046_ETH1_CLK_RX_180_I	106
+#define R9A08G046_ETH1_CLK_RMII_I	107
+#define R9A08G046_ETH1_CLK_PTP_REF_I	108
+#define R9A08G046_I2C0_PCLK		109
+#define R9A08G046_I2C1_PCLK		110
+#define R9A08G046_I2C2_PCLK		111
+#define R9A08G046_I2C3_PCLK		112
+#define R9A08G046_SCIF0_CLK_PCK		113
+#define R9A08G046_SCIF1_CLK_PCK		114
+#define R9A08G046_SCIF2_CLK_PCK		115
+#define R9A08G046_SCIF3_CLK_PCK		116
+#define R9A08G046_SCIF4_CLK_PCK		117
+#define R9A08G046_SCIF5_CLK_PCK		118
+#define R9A08G046_RSCI0_PCLK		119
+#define R9A08G046_RSCI0_TCLK		120
+#define R9A08G046_RSCI1_PCLK		121
+#define R9A08G046_RSCI1_TCLK		122
+#define R9A08G046_RSCI2_PCLK		123
+#define R9A08G046_RSCI2_TCLK		124
+#define R9A08G046_RSCI3_PCLK		125
+#define R9A08G046_RSCI3_TCLK		126
+#define R9A08G046_RSPI0_PCLK		127
+#define R9A08G046_RSPI0_TCLK		128
+#define R9A08G046_RSPI1_PCLK		129
+#define R9A08G046_RSPI1_TCLK		130
+#define R9A08G046_RSPI2_PCLK		131
+#define R9A08G046_RSPI2_TCLK		132
+#define R9A08G046_CANFD_PCLK		133
+#define R9A08G046_CANFD_CLK_RAM		134
+#define R9A08G046_GPIO_HCLK		135
+#define R9A08G046_ADC0_ADCLK		136
+#define R9A08G046_ADC0_PCLK		137
+#define R9A08G046_ADC1_ADCLK		138
+#define R9A08G046_ADC1_PCLK		139
+#define R9A08G046_TSU_PCLK		140
+#define R9A08G046_PDM_PCLK		141
+#define R9A08G046_PDM_CCLK		142
+#define R9A08G046_PCI_ACLK		143
+#define R9A08G046_PCI_CLKL1PM		144
+#define R9A08G046_PCI_CLK_PMU		145
+#define R9A08G046_SPDIF_PCLK		146
+#define R9A08G046_I3C_TCLK		147
+#define R9A08G046_I3C_PCLK		148
+#define R9A08G046_VBAT_BCLK		149
+#define R9A08G046_BSC_X_BCK_BSC		150
+
+/* R9A08G046 Resets */
+#define R9A08G046_CA55_RST0_0		0
+#define R9A08G046_CA55_RST0_1		1
+#define R9A08G046_CA55_RST0_2		2
+#define R9A08G046_CA55_RST0_3		3
+#define R9A08G046_CA55_RST4_0		4
+#define R9A08G046_CA55_RST4_1		5
+#define R9A08G046_CA55_RST4_2		6
+#define R9A08G046_CA55_RST4_3		7
+#define R9A08G046_CA55_RST8		8
+#define R9A08G046_CA55_RST9		9
+#define R9A08G046_CA55_RST10		10
+#define R9A08G046_CA55_RST11		11
+#define R9A08G046_CA55_RST12		12
+#define R9A08G046_CA55_RST13		13
+#define R9A08G046_CA55_RST14		14
+#define R9A08G046_CA55_RST15		15
+#define R9A08G046_CA55_RST16		16
+#define R9A08G046_SRAM_ACPU_ARESETN0	17
+#define R9A08G046_SRAM_ACPU_ARESETN1	18
+#define R9A08G046_SRAM_ACPU_ARESETN2	19
+#define R9A08G046_GIC600_GICRESET_N	20
+#define R9A08G046_GIC600_DBG_GICRESET_N	21
+#define R9A08G046_IA55_RESETN		22
+#define R9A08G046_MHU_RESETN		23
+#define R9A08G046_SYC_RESETN		24
+#define R9A08G046_DMAC_ARESETN		25
+#define R9A08G046_DMAC_RST_ASYNC	26
+#define R9A08G046_GTM0_PRESETZ		27
+#define R9A08G046_GTM1_PRESETZ		28
+#define R9A08G046_GTM2_PRESETZ		29
+#define R9A08G046_MTU_X_PRESET_MTU3	30
+#define R9A08G046_POE3_RST_M_REG	31
+#define R9A08G046_GPT_RST_C		32
+#define R9A08G046_POEG_A_RST		33
+#define R9A08G046_POEG_B_RST		34
+#define R9A08G046_POEG_C_RST		35
+#define R9A08G046_POEG_D_RST		36
+#define R9A08G046_WDT0_PRESETN		37
+#define R9A08G046_WDT1_PRESETN		38
+#define R9A08G046_WDT2_PRESETN		39
+#define R9A08G046_XSPI_HRESETN		40
+#define R9A08G046_XSPI_ARESETN		41
+#define R9A08G046_SDHI0_IXRST		42
+#define R9A08G046_SDHI1_IXRST		43
+#define R9A08G046_SDHI2_IXRST		44
+#define R9A08G046_SDHI0_IXRSTAXIM	45
+#define R9A08G046_SDHI0_IXRSTAXIS	46
+#define R9A08G046_SDHI1_IXRSTAXIM	47
+#define R9A08G046_SDHI1_IXRSTAXIS	48
+#define R9A08G046_SDHI2_IXRSTAXIM	49
+#define R9A08G046_SDHI2_IXRSTAXIS	50
+#define R9A08G046_GE3D_RESETN		51
+#define R9A08G046_GE3D_AXI_RESETN	52
+#define R9A08G046_GE3D_ACE_RESETN	53
+#define R9A08G046_ISU_ARESETN		54
+#define R9A08G046_ISU_PRESETN		55
+#define R9A08G046_H264_X_RESET_VCP	56
+#define R9A08G046_H264_CP_PRESET_P	57
+#define R9A08G046_CRU_CMN_RSTB		58
+#define R9A08G046_CRU_PRESETN		59
+#define R9A08G046_CRU_ARESETN		60
+#define R9A08G046_MIPI_DSI_CMN_RSTB	61
+#define R9A08G046_MIPI_DSI_ARESET_N	62
+#define R9A08G046_MIPI_DSI_PRESET_N	63
+#define R9A08G046_LCDC_RESET_N		64
+#define R9A08G046_SSI0_RST_M2_REG	65
+#define R9A08G046_SSI1_RST_M2_REG	66
+#define R9A08G046_SSI2_RST_M2_REG	67
+#define R9A08G046_SSI3_RST_M2_REG	68
+#define R9A08G046_USB_U2H0_HRESETN	69
+#define R9A08G046_USB_U2H1_HRESETN	70
+#define R9A08G046_USB_U2P0_EXL_SYSRST	71
+#define R9A08G046_USB_PRESETN		72
+#define R9A08G046_USB_U2P1_EXL_SYSRST	73
+#define R9A08G046_ETH0_ARESET_N		74
+#define R9A08G046_ETH1_ARESET_N		75
+#define R9A08G046_I2C0_MRST		76
+#define R9A08G046_I2C1_MRST		77
+#define R9A08G046_I2C2_MRST		78
+#define R9A08G046_I2C3_MRST		79
+#define R9A08G046_SCIF0_RST_SYSTEM_N	80
+#define R9A08G046_SCIF1_RST_SYSTEM_N	81
+#define R9A08G046_SCIF2_RST_SYSTEM_N	82
+#define R9A08G046_SCIF3_RST_SYSTEM_N	83
+#define R9A08G046_SCIF4_RST_SYSTEM_N	84
+#define R9A08G046_SCIF5_RST_SYSTEM_N	85
+#define R9A08G046_RSPI0_PRESETN		86
+#define R9A08G046_RSPI1_PRESETN		87
+#define R9A08G046_RSPI2_PRESETN		88
+#define R9A08G046_RSPI0_TRESETN		89
+#define R9A08G046_RSPI1_TRESETN		90
+#define R9A08G046_RSPI2_TRESETN		91
+#define R9A08G046_CANFD_RSTP_N		92
+#define R9A08G046_CANFD_RSTC_N		93
+#define R9A08G046_GPIO_RSTN		94
+#define R9A08G046_GPIO_PORT_RESETN	95
+#define R9A08G046_GPIO_SPARE_RESETN	96
+#define R9A08G046_ADC0_PRESETN		97
+#define R9A08G046_ADC0_ADRST_N		98
+#define R9A08G046_ADC1_PRESETN		99
+#define R9A08G046_ADC1_ADRST_N		100
+#define R9A08G046_TSU_PRESETN		101
+#define R9A08G046_PDM_PRESETN		102
+#define R9A08G046_PCI_ARESETN		103
+#define R9A08G046_SPDIF_RST		104
+#define R9A08G046_I3C_TRESETN		105
+#define R9A08G046_I3C_PRESETN		106
+#define R9A08G046_VBAT_BRESETN		107
+#define R9A08G046_RSCI0_PRESETN		108
+#define R9A08G046_RSCI1_PRESETN		109
+#define R9A08G046_RSCI2_PRESETN		110
+#define R9A08G046_RSCI3_PRESETN		111
+#define R9A08G046_RSCI0_TRESETN		112
+#define R9A08G046_RSCI1_TRESETN		113
+#define R9A08G046_RSCI2_TRESETN		114
+#define R9A08G046_RSCI3_TRESETN		115
+#define R9A08G046_LVDS_RESET_N		116
+
+#endif /* __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__ */
-- 
2.43.0


