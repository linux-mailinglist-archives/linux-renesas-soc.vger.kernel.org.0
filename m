Return-Path: <linux-renesas-soc+bounces-5833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA53D8FB9EC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 19:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E70611C212D5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 17:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0006D14A632;
	Tue,  4 Jun 2024 17:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bb1daZkI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E082214A4EF;
	Tue,  4 Jun 2024 17:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717520751; cv=none; b=Jy+KwR096fstTE/GISumt84MbwXGhV5ogRXbwx8C0r3X31Czcgalxtq/lOT3hCh+hjsGeEaYj53voXKoxnPK7zsgs096rZByj903g6/viSR1onql+rKV5Lqd6aInK+/+JGUxj+NZ2no23ItzZb4/k/bjnwwoQe4UrxoG3QltKTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717520751; c=relaxed/simple;
	bh=S4zI23jXY5UCYhcYcLEHzR39qEGwQxMYzl57igXjnSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=daTE/BGla4XEux5xJNlng3Js234yrT/sxMCVcN3HKo+hWRaHsYbMCFb8fwD/ivH4rZHnXdREY3t4N5b/82oZo/MIIHJoMC+sa6wx8EYamiy0C7kONQiwpVrCZ85g0KvRRWyl5BfHuuC8CJLqNqZAK3cEgxCuMV+85GI06fbGJno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bb1daZkI; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-35e573c0334so10792f8f.1;
        Tue, 04 Jun 2024 10:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717520748; x=1718125548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGYHbF59iZQUuSem60N9wQ2sz32IfeHdhp9ulRawMZ0=;
        b=Bb1daZkIow0M7lYSmG9OSccT08lG2QKq2HZetgP6UH8dyInZJ+vMnQcgDDxq/zbloT
         QrlXBN//L2KUrZHeTAGCyyxUvE+vLUX+Ehdmm8/Hym5S58OcAyT6cFAN9sW2nTN3ompb
         OQCg2678jSbsyWu3/+9yOoLhcnhrUsxy9uR/JEXLSU3z2K6RUgbSuIPbUIiAK1JpPGPj
         2Lqy5s89JNFTi0ILMbijRN9J+oJpz8QzWZn5K92YWTggtH4431TzcIiyOg1X4zQpHDOC
         2NVkl0CQxFT+tMD4ILKj0NRZj1GCjso62q6wrU/p08hmOjgblVADcuTZus0xcJyfRGNN
         AyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717520748; x=1718125548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mGYHbF59iZQUuSem60N9wQ2sz32IfeHdhp9ulRawMZ0=;
        b=WnShLC7kDvY2YbtTtQpduiDyWdN/mze32JlrevfI1aHL3xK5/vt/JYF0myAXCTBU9Q
         G5GBpd31Xjjmuwtw5ftF7yyCR15NQkgj/glusQAnJlIPMEJTMCqZTz1iEQTI4bCXl+Vr
         knAWE9GlUbDlJjJXrZYpXb3RPOJp0fcGwzfXSdi6YSYRwgkbMlnKuRl5rEncQQDcfg5N
         SSL//ARj9wtnGdi7VLmHPp+ijrGDHqii2TrPlHDgSfGicKhe7kFydwV0R62niVjEnyvG
         6TEul4FKEWP7LpNqPSsXSD9LparDCSqkVbvbMLSmQ6pRgndxog85VivQjjpq4xMBHLEw
         ikCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhaMT1vi7BHk6MI7adPyc5S3Y++XqLMNuESYqy6skauCh5ZoIyRuZOcITnMc0mviqew6NLdHq16gpeknXbUA9ctHawWrUG1oGoh1Fhks+c/vrkfSkdQOEy8WE6/mOUGZCJCzD/zNXajX24Z8f2qCsX4dcNzjr/93dD7x06X+57mbzlqvW/+qBFcklxQO2pkg1CGiwma5lO9906H41bQzVHu/Sw3e1Tzara
X-Gm-Message-State: AOJu0Yz/644BgA8JbjuJOmdXpkXicoawmhR04lkQvyop9qFJzJ0VPRMF
	ZEMJMaD0H0G5+3NuyvXYZdh/k3jLx4KL4Yi/dzGewj3CrD3ASJv7AyTD2/4D
X-Google-Smtp-Source: AGHT+IGogEfmHMC1iFii2yLHXYzFwHrA3TajAr+bExLnDU4vduJgzcWcl+etyGfgDSl6SLve9BKF0A==
X-Received: by 2002:adf:e805:0:b0:35e:537c:b1ac with SMTP id ffacd0b85a97d-35e7c59148fmr3162243f8f.34.1717520748226;
        Tue, 04 Jun 2024 10:05:48 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c0f2asm12244077f8f.3.2024.06.04.10.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 10:05:47 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 5/5] serial: sh-sci: Add support for RZ/V2H(P) SoC
Date: Tue,  4 Jun 2024 18:05:13 +0100
Message-Id: <20240604170513.522631-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604170513.522631-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240604170513.522631-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add serial support for RZ/V2H(P) SoC with earlycon.

The SCIF interface in the Renesas RZ/V2H(P) is similar to that available
in the RZ/G2L (R9A07G044) SoC, with the following differences:

- RZ/V2H(P) SoC has three additional interrupts: one for Tx end/Rx ready
  and two for Rx and Tx buffer full, all of which are edge-triggered.
- RZ/V2H(P) supports asynchronous mode, whereas RZ/G2L supports both
  synchronous and asynchronous modes.
- There are differences in the configuration of certain registers such
  as SCSMR, SCFCR, and SCSPTR between the two SoCs.

To handle these differences on RZ/V2H(P) SoC SCIx_RZV2H_SCIF_REGTYPE
is added.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Hi Geert, Ive restored your RB tag after rebase (as the changes were trival)
hope that's OK.

Cheers, Prabhakar

v4 -> v5
- Rebased changes on top of v6.10-rc2
- Included RB tag from Geert

v3 -> v4
- Added SCIx_RZV2H_SCIF_REGTYPE to handle the differences on the
  RZ/V2H(P) SoC

v2 -> v3
- new patch
---
 drivers/tty/serial/sh-sci.c | 55 +++++++++++++++++++++++++++++++++----
 include/linux/serial_sci.h  |  1 +
 2 files changed, 51 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index f738980a8b2c..b80e9a528e17 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -317,6 +317,37 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.error_clear = SCIF_ERROR_CLEAR,
 	},
 
+	/*
+	 * The "SCIF" that is in RZ/V2H(P) SoC is similar to one found on RZ/G2L SoC
+	 * with below differences,
+	 * - Break out of interrupts are different: ERI, BRI, RXI, TXI, TEI, DRI,
+	 *   TEI-DRI, RXI-EDGE and TXI-EDGE.
+	 * - SCSMR register does not have CM bit (BIT(7)) ie it does not support synchronous mode.
+	 * - SCFCR register does not have SCFCR_MCE bit.
+	 * - SCSPTR register has only bits SCSPTR_SPB2DT and SCSPTR_SPB2IO.
+	 */
+	[SCIx_RZV2H_SCIF_REGTYPE] = {
+		.regs = {
+			[SCSMR]		= { 0x00, 16 },
+			[SCBRR]		= { 0x02,  8 },
+			[SCSCR]		= { 0x04, 16 },
+			[SCxTDR]	= { 0x06,  8 },
+			[SCxSR]		= { 0x08, 16 },
+			[SCxRDR]	= { 0x0a,  8 },
+			[SCFCR]		= { 0x0c, 16 },
+			[SCFDR]		= { 0x0e, 16 },
+			[SCSPTR]	= { 0x10, 16 },
+			[SCLSR]		= { 0x12, 16 },
+			[SEMR]		= { 0x14, 8 },
+		},
+		.fifosize = 16,
+		.overrun_reg = SCLSR,
+		.overrun_mask = SCLSR_ORER,
+		.sampling_rate_mask = SCI_SR(32),
+		.error_mask = SCIF_DEFAULT_ERROR_MASK,
+		.error_clear = SCIF_ERROR_CLEAR,
+	},
+
 	/*
 	 * Common SH-3 SCIF definitions.
 	 */
@@ -757,7 +788,7 @@ static void sci_init_pins(struct uart_port *port, unsigned int cflag)
 		}
 		sci_serial_out(port, SCPDR, data);
 		sci_serial_out(port, SCPCR, ctrl);
-	} else if (sci_getreg(port, SCSPTR)->size) {
+	} else if (sci_getreg(port, SCSPTR)->size && s->cfg->regtype != SCIx_RZV2H_SCIF_REGTYPE) {
 		u16 status = sci_serial_in(port, SCSPTR);
 
 		/* RTS# is always output; and active low, unless autorts */
@@ -2124,8 +2155,9 @@ static void sci_set_mctrl(struct uart_port *port, unsigned int mctrl)
 
 	if (!(mctrl & TIOCM_RTS)) {
 		/* Disable Auto RTS */
-		sci_serial_out(port, SCFCR,
-			       sci_serial_in(port, SCFCR) & ~SCFCR_MCE);
+		if (s->cfg->regtype != SCIx_RZV2H_SCIF_REGTYPE)
+			sci_serial_out(port, SCFCR,
+				       sci_serial_in(port, SCFCR) & ~SCFCR_MCE);
 
 		/* Clear RTS */
 		sci_set_rts(port, 0);
@@ -2137,8 +2169,9 @@ static void sci_set_mctrl(struct uart_port *port, unsigned int mctrl)
 		}
 
 		/* Enable Auto RTS */
-		sci_serial_out(port, SCFCR,
-			       sci_serial_in(port, SCFCR) | SCFCR_MCE);
+		if (s->cfg->regtype != SCIx_RZV2H_SCIF_REGTYPE)
+			sci_serial_out(port, SCFCR,
+				       sci_serial_in(port, SCFCR) | SCFCR_MCE);
 	} else {
 		/* Set RTS */
 		sci_set_rts(port, 1);
@@ -3225,6 +3258,10 @@ static const struct of_device_id of_sci_match[] __maybe_unused = {
 		.compatible = "renesas,scif-r9a07g044",
 		.data = SCI_OF_DATA(PORT_SCIF, SCIx_RZ_SCIFA_REGTYPE),
 	},
+	{
+		.compatible = "renesas,scif-r9a09g057",
+		.data = SCI_OF_DATA(PORT_SCIF, SCIx_RZV2H_SCIF_REGTYPE),
+	},
 	/* Family-specific types */
 	{
 		.compatible = "renesas,rcar-gen1-scif",
@@ -3533,6 +3570,13 @@ static int __init rzscifa_early_console_setup(struct earlycon_device *device,
 	return early_console_setup(device, PORT_SCIF);
 }
 
+static int __init rzv2hscif_early_console_setup(struct earlycon_device *device,
+						const char *opt)
+{
+	port_cfg.regtype = SCIx_RZV2H_SCIF_REGTYPE;
+	return early_console_setup(device, PORT_SCIF);
+}
+
 static int __init scifa_early_console_setup(struct earlycon_device *device,
 					  const char *opt)
 {
@@ -3553,6 +3597,7 @@ OF_EARLYCON_DECLARE(sci, "renesas,sci", sci_early_console_setup);
 OF_EARLYCON_DECLARE(scif, "renesas,scif", scif_early_console_setup);
 OF_EARLYCON_DECLARE(scif, "renesas,scif-r7s9210", rzscifa_early_console_setup);
 OF_EARLYCON_DECLARE(scif, "renesas,scif-r9a07g044", rzscifa_early_console_setup);
+OF_EARLYCON_DECLARE(scif, "renesas,scif-r9a09g057", rzv2hscif_early_console_setup);
 OF_EARLYCON_DECLARE(scifa, "renesas,scifa", scifa_early_console_setup);
 OF_EARLYCON_DECLARE(scifb, "renesas,scifb", scifb_early_console_setup);
 OF_EARLYCON_DECLARE(hscif, "renesas,hscif", hscif_early_console_setup);
diff --git a/include/linux/serial_sci.h b/include/linux/serial_sci.h
index 1c89611e0e06..0f2f50b8d28e 100644
--- a/include/linux/serial_sci.h
+++ b/include/linux/serial_sci.h
@@ -37,6 +37,7 @@ enum {
 	SCIx_SH7705_SCIF_REGTYPE,
 	SCIx_HSCIF_REGTYPE,
 	SCIx_RZ_SCIFA_REGTYPE,
+	SCIx_RZV2H_SCIF_REGTYPE,
 
 	SCIx_NR_REGTYPES,
 };
-- 
2.34.1


