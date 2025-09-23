Return-Path: <linux-renesas-soc+bounces-22211-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BECFB95BC4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 13:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 166A6160592
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 11:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBBF321457;
	Tue, 23 Sep 2025 11:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHLkeI2n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDA931DD87
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 11:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758628288; cv=none; b=NHf+RiFdj39tDOiH01dfs3Y+7ofoUd+pA7XRXsNyGKGMj6+I8wgnKRV87lq+oh0Uxol78K5JXXBLdrBG93Gkx5mcO1DaYexIus/piOLU3fNp6I8oZFI9I/ol3rOaVVBy+GiMdk7UjI4P9hl13QltJD6NhE0Mo9AaBlCBU+cT568=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758628288; c=relaxed/simple;
	bh=+qYnS/4klUc7E3MspOXZLJl//awkxuIrwdw8mhv7V5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RHqXDIcuJW/5sXbITXWkFGNOdzRRwWh0xQBgejSemKROsmgzZ6+FbedDQ6Pw6WSCUbyNo6tvgE6IpZmwbrYwW4cG6BwgBfMH8TIh3NkxUTgd0MvjIKf1XvdRr3lrPd8ZsJJCdbZxZw6+4ZN6pA8LyVoUhdbxbyoLGjL8h482d9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHLkeI2n; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ee155e0c08so3461749f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 04:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758628285; x=1759233085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yq1EpLTgmCwyvoSHKi3nsUzH+QQscat8kXdGopYlt7U=;
        b=LHLkeI2nkGpf9sD50HTxJ2L1ZTfdIj7wSMndKcq8jmvKb8qjV/l5LSXxoPDzTP3VDN
         xWuAGSueYqetYUlgpafIO8IqtbGuapx/mDC58Gn3UgAJ7SfrV40dA48Ozn50AFaTwP5B
         c/KTQ+7zE2JR2FDErLLFzvgGH3Qj3wq/8766EnaCPRcZnak71KyQNas2bTc3RiQSBjkD
         l0/50N4LyghHV8bEiydztqmh/MgrvlYXXxbY41A3G+Mu1zB+RO+2mzDRfQp/9d42HdII
         9/G1UIuYeJ4cE2k4v+H8ztTfBpwBuK1j4TWaxtF3Q9X3g7Ukvy3r5hHykP+iCzdSVZIP
         vN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758628285; x=1759233085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yq1EpLTgmCwyvoSHKi3nsUzH+QQscat8kXdGopYlt7U=;
        b=Bm+l+c+z8apHY/MtBOfMm5CRXte/TE2a/DlN/mDMe3hGNVXeR0C7hslOHMqbcq1sL7
         CJ/O6n7CgOdItrgzqpHspq6n+oMhpo2YCqrTzAnMtJ20oBMfNGWLSg0fdY8cojB24Dwd
         KHIRTWL8J0TU0Dg41bS9JHTJb+qesZKIBvoP2VuvVscjFpbCwHZcDb6Vt6qI9rbDHMaC
         YvU2ms9vOOID+OZZZeL8e111bSOLM9REoVWzkHW7O6Sp/ysSSMR2tSz8+GGnwHqrqcg/
         XG3QZ9kkCCRX6f8ECkSVECBS5bjAHZaj58A2mPZhxk2LvvPQU+OfyeLupG62pR/96TDD
         ENqg==
X-Forwarded-Encrypted: i=1; AJvYcCWW20zQj06iYmbksZfTKvz7QIEoTne+eKdsRWKgJloxTSQrZh8D0IzMC2vzpEfT0mc9rVE1AI1vlJSpsmlItLXt6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3kByTb2Zwm3mKULPxcJbv5QwR44XT2z++MzXnHxcTVVSsN0s9
	WwdU+MF/ayvSzK9X04koEcCCce7qQY01PF47tjrtx31KjylE6xXNblVv
X-Gm-Gg: ASbGncvsctrkH1dmCoG/5BUkyFR0a8/DHi+RpUo1/wEKSN72p/4PStjmj4Uo7SwDwEl
	T8jjdfwJYf4MteeMpA2fMJiBvXT0AJnPmpQMntS/gfvChSvhVgIw3WJeEXNvjMfAYfwnryl2U+L
	VzSL5TI9hCnSsUJr5esjSR8gk1Jj1XDkf1m1VHI+QFfWaYjkKyHmwnrIQuZE27rLWiVqpm/86TD
	zOg5pR6OvnHWgmQE/b+Phw49Gp3X3nV076J+RbioeyONOqPkwcHAbUxjMB6bz8PrcX6CvqPQkyO
	wAopZ/VLQYO+ZfUgHEzs73EEhh5vv8PR4uldmpDoNMddcHQQfJouVpjPFPXWGkph1Big6DFcaIu
	YC/RJy5yLqOmvxMYdA6LR16TUu4XlCBaKrltTYvLdha0R7mXbNQIg7Q9VGA==
X-Google-Smtp-Source: AGHT+IHU6rw/Gd5Z4bV9qb7bmri5+mmJhHOHB6MnH78gcmlrL14IFL/PnfWtYG6lUtks5/sPOvpHRw==
X-Received: by 2002:a5d:5f89:0:b0:3f7:ce62:ce17 with SMTP id ffacd0b85a97d-405c9446d45mr2423630f8f.38.1758628284310;
        Tue, 23 Sep 2025 04:51:24 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a5d1:59f5:ca88:d11c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee1227cc37sm22137203f8f.7.2025.09.23.04.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:51:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] serial: sh-sci: Merge sh-sci.h into sh-sci.c
Date: Tue, 23 Sep 2025 12:51:20 +0100
Message-ID: <20250923115120.75685-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Inline the contents of sh-sci.h into sh-sci.c and remove the
header file. The header only contained register definitions
and macros used exclusively by the sh-sci driver, making the
separate header unnecessary.

While at it, sort the includes in alphabetical order.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/tty/serial/sh-sci.c | 182 +++++++++++++++++++++++++++++++++++-
 drivers/tty/serial/sh-sci.h | 178 -----------------------------------
 2 files changed, 178 insertions(+), 182 deletions(-)
 delete mode 100644 drivers/tty/serial/sh-sci.h

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 538b2f991609..f933d4d3dfb1 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -17,29 +17,32 @@
  */
 #undef DEBUG
 
+#include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/console.h>
-#include <linux/ctype.h>
 #include <linux/cpufreq.h>
+#include <linux/ctype.h>
 #include <linux/delay.h>
-#include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
+#include <linux/dmaengine.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/ktime.h>
 #include <linux/major.h>
 #include <linux/minmax.h>
-#include <linux/module.h>
 #include <linux/mm.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/scatterlist.h>
 #include <linux/serial.h>
+#include <linux/serial_core.h>
 #include <linux/serial_sci.h>
 #include <linux/sh_dma.h>
 #include <linux/slab.h>
@@ -56,9 +59,180 @@
 
 #include "rsci.h"
 #include "serial_mctrl_gpio.h"
-#include "sh-sci.h"
 #include "sh-sci-common.h"
 
+#define SCI_MAJOR		204
+#define SCI_MINOR_START		8
+
+/*
+ * SCI register subset common for all port types.
+ * Not all registers will exist on all parts.
+ */
+enum {
+	SCSMR,		/* Serial Mode Register */
+	SCBRR,		/* Bit Rate Register */
+	SCSCR,		/* Serial Control Register */
+	SCxSR,		/* Serial Status Register */
+	SCFCR,		/* FIFO Control Register */
+	SCFDR,		/* FIFO Data Count Register */
+	SCxTDR,		/* Transmit (FIFO) Data Register */
+	SCxRDR,		/* Receive (FIFO) Data Register */
+	SCLSR,		/* Line Status Register */
+	SCTFDR,		/* Transmit FIFO Data Count Register */
+	SCRFDR,		/* Receive FIFO Data Count Register */
+	SCSPTR,		/* Serial Port Register */
+	HSSRR,		/* Sampling Rate Register */
+	SCPCR,		/* Serial Port Control Register */
+	SCPDR,		/* Serial Port Data Register */
+	SCDL,		/* BRG Frequency Division Register */
+	SCCKS,		/* BRG Clock Select Register */
+	HSRTRGR,	/* Rx FIFO Data Count Trigger Register */
+	HSTTRGR,	/* Tx FIFO Data Count Trigger Register */
+	SEMR,		/* Serial extended mode register */
+};
+
+/* SCSMR (Serial Mode Register) */
+#define SCSMR_C_A	BIT(7)	/* Communication Mode */
+#define SCSMR_CSYNC	BIT(7)	/*   - Clocked synchronous mode */
+#define SCSMR_ASYNC	0	/*   - Asynchronous mode */
+#define SCSMR_CHR	BIT(6)	/* 7-bit Character Length */
+#define SCSMR_PE	BIT(5)	/* Parity Enable */
+#define SCSMR_ODD	BIT(4)	/* Odd Parity */
+#define SCSMR_STOP	BIT(3)	/* Stop Bit Length */
+#define SCSMR_CKS	0x0003	/* Clock Select */
+
+/* Serial Mode Register, SCIFA/SCIFB only bits */
+#define SCSMR_CKEDG	BIT(12)	/* Transmit/Receive Clock Edge Select */
+#define SCSMR_SRC_MASK	0x0700	/* Sampling Control */
+#define SCSMR_SRC_16	0x0000	/* Sampling rate 1/16 */
+#define SCSMR_SRC_5	0x0100	/* Sampling rate 1/5 */
+#define SCSMR_SRC_7	0x0200	/* Sampling rate 1/7 */
+#define SCSMR_SRC_11	0x0300	/* Sampling rate 1/11 */
+#define SCSMR_SRC_13	0x0400	/* Sampling rate 1/13 */
+#define SCSMR_SRC_17	0x0500	/* Sampling rate 1/17 */
+#define SCSMR_SRC_19	0x0600	/* Sampling rate 1/19 */
+#define SCSMR_SRC_27	0x0700	/* Sampling rate 1/27 */
+
+/* Serial Control Register, SCI only bits */
+#define SCSCR_TEIE	BIT(2)  /* Transmit End Interrupt Enable */
+
+/* Serial Control Register, SCIFA/SCIFB only bits */
+#define SCSCR_TDRQE	BIT(15)	/* Tx Data Transfer Request Enable */
+#define SCSCR_RDRQE	BIT(14)	/* Rx Data Transfer Request Enable */
+
+/* Serial Control Register, HSCIF-only bits */
+#define HSSCR_TOT_SHIFT	14
+
+/* SCxSR (Serial Status Register) on SCI */
+#define SCI_TDRE	BIT(7)	/* Transmit Data Register Empty */
+#define SCI_RDRF	BIT(6)	/* Receive Data Register Full */
+#define SCI_ORER	BIT(5)	/* Overrun Error */
+#define SCI_FER		BIT(4)	/* Framing Error */
+#define SCI_PER		BIT(3)	/* Parity Error */
+#define SCI_TEND	BIT(2)	/* Transmit End */
+#define SCI_RESERVED	0x03	/* All reserved bits */
+
+#define SCI_DEFAULT_ERROR_MASK (SCI_PER | SCI_FER)
+
+#define SCI_RDxF_CLEAR	(u32)(~(SCI_RESERVED | SCI_RDRF))
+#define SCI_ERROR_CLEAR	(u32)(~(SCI_RESERVED | SCI_PER | SCI_FER | SCI_ORER))
+#define SCI_TDxE_CLEAR	(u32)(~(SCI_RESERVED | SCI_TEND | SCI_TDRE))
+#define SCI_BREAK_CLEAR	(u32)(~(SCI_RESERVED | SCI_PER | SCI_FER | SCI_ORER))
+
+/* SCxSR (Serial Status Register) on SCIF, SCIFA, SCIFB, HSCIF */
+#define SCIF_ER		BIT(7)	/* Receive Error */
+#define SCIF_TEND	BIT(6)	/* Transmission End */
+#define SCIF_TDFE	BIT(5)	/* Transmit FIFO Data Empty */
+#define SCIF_BRK	BIT(4)	/* Break Detect */
+#define SCIF_FER	BIT(3)	/* Framing Error */
+#define SCIF_PER	BIT(2)	/* Parity Error */
+#define SCIF_RDF	BIT(1)	/* Receive FIFO Data Full */
+#define SCIF_DR		BIT(0)	/* Receive Data Ready */
+/* SCIF only (optional) */
+#define SCIF_PERC	0xf000	/* Number of Parity Errors */
+#define SCIF_FERC	0x0f00	/* Number of Framing Errors */
+/*SCIFA/SCIFB and SCIF on SH7705/SH7720/SH7721 only */
+#define SCIFA_ORER	BIT(9)	/* Overrun Error */
+
+#define SCIF_DEFAULT_ERROR_MASK (SCIF_PER | SCIF_FER | SCIF_BRK | SCIF_ER)
+
+#define SCIF_RDxF_CLEAR		(u32)(~(SCIF_DR | SCIF_RDF))
+#define SCIF_ERROR_CLEAR	(u32)(~(SCIF_PER | SCIF_FER | SCIF_ER))
+#define SCIF_TDxE_CLEAR		(u32)(~(SCIF_TDFE))
+#define SCIF_BREAK_CLEAR	(u32)(~(SCIF_PER | SCIF_FER | SCIF_BRK))
+
+/* SCFCR (FIFO Control Register) */
+#define SCFCR_RTRG1	BIT(7)	/* Receive FIFO Data Count Trigger */
+#define SCFCR_RTRG0	BIT(6)
+#define SCFCR_TTRG1	BIT(5)	/* Transmit FIFO Data Count Trigger */
+#define SCFCR_TTRG0	BIT(4)
+#define SCFCR_MCE	BIT(3)	/* Modem Control Enable */
+#define SCFCR_TFRST	BIT(2)	/* Transmit FIFO Data Register Reset */
+#define SCFCR_RFRST	BIT(1)	/* Receive FIFO Data Register Reset */
+#define SCFCR_LOOP	BIT(0)	/* Loopback Test */
+
+/* SCLSR (Line Status Register) on (H)SCIF */
+#define SCLSR_TO	BIT(2)	/* Timeout */
+#define SCLSR_ORER	BIT(0)	/* Overrun Error */
+
+/* SCSPTR (Serial Port Register), optional */
+#define SCSPTR_RTSIO	BIT(7)	/* Serial Port RTS# Pin Input/Output */
+#define SCSPTR_RTSDT	BIT(6)	/* Serial Port RTS# Pin Data */
+#define SCSPTR_CTSIO	BIT(5)	/* Serial Port CTS# Pin Input/Output */
+#define SCSPTR_CTSDT	BIT(4)	/* Serial Port CTS# Pin Data */
+#define SCSPTR_SCKIO	BIT(3)	/* Serial Port Clock Pin Input/Output */
+#define SCSPTR_SCKDT	BIT(2)	/* Serial Port Clock Pin Data */
+#define SCSPTR_SPB2IO	BIT(1)	/* Serial Port Break Input/Output */
+#define SCSPTR_SPB2DT	BIT(0)	/* Serial Port Break Data */
+
+/* HSSRR HSCIF */
+#define HSCIF_SRE	BIT(15)	/* Sampling Rate Register Enable */
+#define HSCIF_SRDE	BIT(14) /* Sampling Point Register Enable */
+
+#define HSCIF_SRHP_SHIFT	8
+#define HSCIF_SRHP_MASK		0x0f00
+
+/* SCPCR (Serial Port Control Register), SCIFA/SCIFB only */
+#define SCPCR_RTSC	BIT(4)	/* Serial Port RTS# Pin / Output Pin */
+#define SCPCR_CTSC	BIT(3)	/* Serial Port CTS# Pin / Input Pin */
+#define SCPCR_SCKC	BIT(2)	/* Serial Port SCK Pin / Output Pin */
+#define SCPCR_RXDC	BIT(1)	/* Serial Port RXD Pin / Input Pin */
+#define SCPCR_TXDC	BIT(0)	/* Serial Port TXD Pin / Output Pin */
+
+/* SCPDR (Serial Port Data Register), SCIFA/SCIFB only */
+#define SCPDR_RTSD	BIT(4)	/* Serial Port RTS# Output Pin Data */
+#define SCPDR_CTSD	BIT(3)	/* Serial Port CTS# Input Pin Data */
+#define SCPDR_SCKD	BIT(2)	/* Serial Port SCK Output Pin Data */
+#define SCPDR_RXDD	BIT(1)	/* Serial Port RXD Input Pin Data */
+#define SCPDR_TXDD	BIT(0)	/* Serial Port TXD Output Pin Data */
+
+/*
+ * BRG Clock Select Register (Some SCIF and HSCIF)
+ * The Baud Rate Generator for external clock can provide a clock source for
+ * the sampling clock. It outputs either its frequency divided clock, or the
+ * (undivided) (H)SCK external clock.
+ */
+#define SCCKS_CKS	BIT(15)	/* Select (H)SCK (1) or divided SC_CLK (0) */
+#define SCCKS_XIN	BIT(14)	/* SC_CLK uses bus clock (1) or SCIF_CLK (0) */
+
+#define SCxSR_TEND(port)	(((port)->type == PORT_SCI) ? SCI_TEND   : SCIF_TEND)
+#define SCxSR_RDxF(port)	(((port)->type == PORT_SCI) ? SCI_RDRF   : SCIF_DR | SCIF_RDF)
+#define SCxSR_TDxE(port)	(((port)->type == PORT_SCI) ? SCI_TDRE   : SCIF_TDFE)
+#define SCxSR_FER(port)		(((port)->type == PORT_SCI) ? SCI_FER    : SCIF_FER)
+#define SCxSR_PER(port)		(((port)->type == PORT_SCI) ? SCI_PER    : SCIF_PER)
+#define SCxSR_BRK(port)		(((port)->type == PORT_SCI) ? 0x00       : SCIF_BRK)
+
+#define SCxSR_ERRORS(port)	(to_sci_port(port)->params->error_mask)
+
+#define SCxSR_RDxF_CLEAR(port) \
+	(((port)->type == PORT_SCI) ? SCI_RDxF_CLEAR : SCIF_RDxF_CLEAR)
+#define SCxSR_ERROR_CLEAR(port) \
+	(to_sci_port(port)->params->error_clear)
+#define SCxSR_TDxE_CLEAR(port) \
+	(((port)->type == PORT_SCI) ? SCI_TDxE_CLEAR : SCIF_TDxE_CLEAR)
+#define SCxSR_BREAK_CLEAR(port) \
+	(((port)->type == PORT_SCI) ? SCI_BREAK_CLEAR : SCIF_BREAK_CLEAR)
+
 #define SCIx_IRQ_IS_MUXED(port)			\
 	((port)->irqs[SCIx_ERI_IRQ] ==	\
 	 (port)->irqs[SCIx_RXI_IRQ]) ||	\
diff --git a/drivers/tty/serial/sh-sci.h b/drivers/tty/serial/sh-sci.h
deleted file mode 100644
index 951681aba586..000000000000
--- a/drivers/tty/serial/sh-sci.h
+++ /dev/null
@@ -1,178 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <linux/bitops.h>
-#include <linux/serial_core.h>
-#include <linux/io.h>
-
-#define SCI_MAJOR		204
-#define SCI_MINOR_START		8
-
-
-/*
- * SCI register subset common for all port types.
- * Not all registers will exist on all parts.
- */
-enum {
-	SCSMR,				/* Serial Mode Register */
-	SCBRR,				/* Bit Rate Register */
-	SCSCR,				/* Serial Control Register */
-	SCxSR,				/* Serial Status Register */
-	SCFCR,				/* FIFO Control Register */
-	SCFDR,				/* FIFO Data Count Register */
-	SCxTDR,				/* Transmit (FIFO) Data Register */
-	SCxRDR,				/* Receive (FIFO) Data Register */
-	SCLSR,				/* Line Status Register */
-	SCTFDR,				/* Transmit FIFO Data Count Register */
-	SCRFDR,				/* Receive FIFO Data Count Register */
-	SCSPTR,				/* Serial Port Register */
-	HSSRR,				/* Sampling Rate Register */
-	SCPCR,				/* Serial Port Control Register */
-	SCPDR,				/* Serial Port Data Register */
-	SCDL,				/* BRG Frequency Division Register */
-	SCCKS,				/* BRG Clock Select Register */
-	HSRTRGR,			/* Rx FIFO Data Count Trigger Register */
-	HSTTRGR,			/* Tx FIFO Data Count Trigger Register */
-	SEMR,				/* Serial extended mode register */
-};
-
-
-/* SCSMR (Serial Mode Register) */
-#define SCSMR_C_A	BIT(7)	/* Communication Mode */
-#define SCSMR_CSYNC	BIT(7)	/*   - Clocked synchronous mode */
-#define SCSMR_ASYNC	0	/*   - Asynchronous mode */
-#define SCSMR_CHR	BIT(6)	/* 7-bit Character Length */
-#define SCSMR_PE	BIT(5)	/* Parity Enable */
-#define SCSMR_ODD	BIT(4)	/* Odd Parity */
-#define SCSMR_STOP	BIT(3)	/* Stop Bit Length */
-#define SCSMR_CKS	0x0003	/* Clock Select */
-
-/* Serial Mode Register, SCIFA/SCIFB only bits */
-#define SCSMR_CKEDG	BIT(12)	/* Transmit/Receive Clock Edge Select */
-#define SCSMR_SRC_MASK	0x0700	/* Sampling Control */
-#define SCSMR_SRC_16	0x0000	/* Sampling rate 1/16 */
-#define SCSMR_SRC_5	0x0100	/* Sampling rate 1/5 */
-#define SCSMR_SRC_7	0x0200	/* Sampling rate 1/7 */
-#define SCSMR_SRC_11	0x0300	/* Sampling rate 1/11 */
-#define SCSMR_SRC_13	0x0400	/* Sampling rate 1/13 */
-#define SCSMR_SRC_17	0x0500	/* Sampling rate 1/17 */
-#define SCSMR_SRC_19	0x0600	/* Sampling rate 1/19 */
-#define SCSMR_SRC_27	0x0700	/* Sampling rate 1/27 */
-
-/* Serial Control Register, SCI only bits */
-#define SCSCR_TEIE	BIT(2)  /* Transmit End Interrupt Enable */
-
-/* Serial Control Register, SCIFA/SCIFB only bits */
-#define SCSCR_TDRQE	BIT(15)	/* Tx Data Transfer Request Enable */
-#define SCSCR_RDRQE	BIT(14)	/* Rx Data Transfer Request Enable */
-
-/* Serial Control Register, HSCIF-only bits */
-#define HSSCR_TOT_SHIFT	14
-
-/* SCxSR (Serial Status Register) on SCI */
-#define SCI_TDRE	BIT(7)	/* Transmit Data Register Empty */
-#define SCI_RDRF	BIT(6)	/* Receive Data Register Full */
-#define SCI_ORER	BIT(5)	/* Overrun Error */
-#define SCI_FER		BIT(4)	/* Framing Error */
-#define SCI_PER		BIT(3)	/* Parity Error */
-#define SCI_TEND	BIT(2)	/* Transmit End */
-#define SCI_RESERVED	0x03	/* All reserved bits */
-
-#define SCI_DEFAULT_ERROR_MASK (SCI_PER | SCI_FER)
-
-#define SCI_RDxF_CLEAR	(u32)(~(SCI_RESERVED | SCI_RDRF))
-#define SCI_ERROR_CLEAR	(u32)(~(SCI_RESERVED | SCI_PER | SCI_FER | SCI_ORER))
-#define SCI_TDxE_CLEAR	(u32)(~(SCI_RESERVED | SCI_TEND | SCI_TDRE))
-#define SCI_BREAK_CLEAR	(u32)(~(SCI_RESERVED | SCI_PER | SCI_FER | SCI_ORER))
-
-/* SCxSR (Serial Status Register) on SCIF, SCIFA, SCIFB, HSCIF */
-#define SCIF_ER		BIT(7)	/* Receive Error */
-#define SCIF_TEND	BIT(6)	/* Transmission End */
-#define SCIF_TDFE	BIT(5)	/* Transmit FIFO Data Empty */
-#define SCIF_BRK	BIT(4)	/* Break Detect */
-#define SCIF_FER	BIT(3)	/* Framing Error */
-#define SCIF_PER	BIT(2)	/* Parity Error */
-#define SCIF_RDF	BIT(1)	/* Receive FIFO Data Full */
-#define SCIF_DR		BIT(0)	/* Receive Data Ready */
-/* SCIF only (optional) */
-#define SCIF_PERC	0xf000	/* Number of Parity Errors */
-#define SCIF_FERC	0x0f00	/* Number of Framing Errors */
-/*SCIFA/SCIFB and SCIF on SH7705/SH7720/SH7721 only */
-#define SCIFA_ORER	BIT(9)	/* Overrun Error */
-
-#define SCIF_DEFAULT_ERROR_MASK (SCIF_PER | SCIF_FER | SCIF_BRK | SCIF_ER)
-
-#define SCIF_RDxF_CLEAR		(u32)(~(SCIF_DR | SCIF_RDF))
-#define SCIF_ERROR_CLEAR	(u32)(~(SCIF_PER | SCIF_FER | SCIF_ER))
-#define SCIF_TDxE_CLEAR		(u32)(~(SCIF_TDFE))
-#define SCIF_BREAK_CLEAR	(u32)(~(SCIF_PER | SCIF_FER | SCIF_BRK))
-
-/* SCFCR (FIFO Control Register) */
-#define SCFCR_RTRG1	BIT(7)	/* Receive FIFO Data Count Trigger */
-#define SCFCR_RTRG0	BIT(6)
-#define SCFCR_TTRG1	BIT(5)	/* Transmit FIFO Data Count Trigger */
-#define SCFCR_TTRG0	BIT(4)
-#define SCFCR_MCE	BIT(3)	/* Modem Control Enable */
-#define SCFCR_TFRST	BIT(2)	/* Transmit FIFO Data Register Reset */
-#define SCFCR_RFRST	BIT(1)	/* Receive FIFO Data Register Reset */
-#define SCFCR_LOOP	BIT(0)	/* Loopback Test */
-
-/* SCLSR (Line Status Register) on (H)SCIF */
-#define SCLSR_TO	BIT(2)	/* Timeout */
-#define SCLSR_ORER	BIT(0)	/* Overrun Error */
-
-/* SCSPTR (Serial Port Register), optional */
-#define SCSPTR_RTSIO	BIT(7)	/* Serial Port RTS# Pin Input/Output */
-#define SCSPTR_RTSDT	BIT(6)	/* Serial Port RTS# Pin Data */
-#define SCSPTR_CTSIO	BIT(5)	/* Serial Port CTS# Pin Input/Output */
-#define SCSPTR_CTSDT	BIT(4)	/* Serial Port CTS# Pin Data */
-#define SCSPTR_SCKIO	BIT(3)	/* Serial Port Clock Pin Input/Output */
-#define SCSPTR_SCKDT	BIT(2)	/* Serial Port Clock Pin Data */
-#define SCSPTR_SPB2IO	BIT(1)	/* Serial Port Break Input/Output */
-#define SCSPTR_SPB2DT	BIT(0)	/* Serial Port Break Data */
-
-/* HSSRR HSCIF */
-#define HSCIF_SRE	BIT(15)	/* Sampling Rate Register Enable */
-#define HSCIF_SRDE	BIT(14) /* Sampling Point Register Enable */
-
-#define HSCIF_SRHP_SHIFT	8
-#define HSCIF_SRHP_MASK		0x0f00
-
-/* SCPCR (Serial Port Control Register), SCIFA/SCIFB only */
-#define SCPCR_RTSC	BIT(4)	/* Serial Port RTS# Pin / Output Pin */
-#define SCPCR_CTSC	BIT(3)	/* Serial Port CTS# Pin / Input Pin */
-#define SCPCR_SCKC	BIT(2)	/* Serial Port SCK Pin / Output Pin */
-#define SCPCR_RXDC	BIT(1)	/* Serial Port RXD Pin / Input Pin */
-#define SCPCR_TXDC	BIT(0)	/* Serial Port TXD Pin / Output Pin */
-
-/* SCPDR (Serial Port Data Register), SCIFA/SCIFB only */
-#define SCPDR_RTSD	BIT(4)	/* Serial Port RTS# Output Pin Data */
-#define SCPDR_CTSD	BIT(3)	/* Serial Port CTS# Input Pin Data */
-#define SCPDR_SCKD	BIT(2)	/* Serial Port SCK Output Pin Data */
-#define SCPDR_RXDD	BIT(1)	/* Serial Port RXD Input Pin Data */
-#define SCPDR_TXDD	BIT(0)	/* Serial Port TXD Output Pin Data */
-
-/*
- * BRG Clock Select Register (Some SCIF and HSCIF)
- * The Baud Rate Generator for external clock can provide a clock source for
- * the sampling clock. It outputs either its frequency divided clock, or the
- * (undivided) (H)SCK external clock.
- */
-#define SCCKS_CKS	BIT(15)	/* Select (H)SCK (1) or divided SC_CLK (0) */
-#define SCCKS_XIN	BIT(14)	/* SC_CLK uses bus clock (1) or SCIF_CLK (0) */
-
-#define SCxSR_TEND(port)	(((port)->type == PORT_SCI) ? SCI_TEND   : SCIF_TEND)
-#define SCxSR_RDxF(port)	(((port)->type == PORT_SCI) ? SCI_RDRF   : SCIF_DR | SCIF_RDF)
-#define SCxSR_TDxE(port)	(((port)->type == PORT_SCI) ? SCI_TDRE   : SCIF_TDFE)
-#define SCxSR_FER(port)		(((port)->type == PORT_SCI) ? SCI_FER    : SCIF_FER)
-#define SCxSR_PER(port)		(((port)->type == PORT_SCI) ? SCI_PER    : SCIF_PER)
-#define SCxSR_BRK(port)		(((port)->type == PORT_SCI) ? 0x00       : SCIF_BRK)
-
-#define SCxSR_ERRORS(port)	(to_sci_port(port)->params->error_mask)
-
-#define SCxSR_RDxF_CLEAR(port) \
-	(((port)->type == PORT_SCI) ? SCI_RDxF_CLEAR : SCIF_RDxF_CLEAR)
-#define SCxSR_ERROR_CLEAR(port) \
-	(to_sci_port(port)->params->error_clear)
-#define SCxSR_TDxE_CLEAR(port) \
-	(((port)->type == PORT_SCI) ? SCI_TDxE_CLEAR : SCIF_TDxE_CLEAR)
-#define SCxSR_BREAK_CLEAR(port) \
-	(((port)->type == PORT_SCI) ? SCI_BREAK_CLEAR : SCIF_BREAK_CLEAR)
-- 
2.51.0


