Return-Path: <linux-renesas-soc+bounces-23483-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 085BDC008D9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 12:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 78C3E359882
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 10:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4CA30ACF0;
	Thu, 23 Oct 2025 10:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqVtJOSg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3D13002DD
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 10:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761216219; cv=none; b=g/l1BynoCk3UkaG7KqIPle2ihz4DBVJlV4Gx8Oh02UDqhSX1qWNaBPvSKA///y3doALxfI6LEtQ0Cpa8wrIlWeDl47b79dUZ9LO0zcVLgc/DWGZgObwSdH9WhsIndPVU6IBxNxUpyvMXM+OSYFu2K+adhAttdF5h5r1YL+PIZj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761216219; c=relaxed/simple;
	bh=wHqfqowEGFB9QGqM7vKaziPwsUVfZNAABM+p3ZeSqTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rjo4Kmp+w5P1lwOwUvlQ3Blo0gXvvIjb0qbpPHA8yjElUCH46QMIu+3tTyxKmt2LjDlpB3Yqsa1jIISyrroJJub5ORKZKRjir7tJaHK0vGC89MxEXnQjuAfV9tUNQsM2hdSidyAeHVnukdL3cdY/oIPWaNc7yaSD6IrXJiN9yV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqVtJOSg; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-78118e163e5so1818010b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 03:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761216216; x=1761821016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJJY8vT54RV34RHFpE+Bbik5UMhLhn13zG4dOqEGSyU=;
        b=lqVtJOSgjEC+21dTeB9NA/so1Vido5M6iqko7SIsgHb5qwZw/+A/9z3evY03y5mgr7
         ZKvsPYbhLEsYOUcO4T7E7V54ttJm3GQQnlBYVNbmIvmtCwYL+yEwbpLA8N72FpvDtzAd
         /6NjZLB59lTN78yZZRKFa3GlN9h2rbTiqb5as0Qp7pR4KnAVkyU68SKfBzTuw+4xVhLe
         4Z3+LGU22+g6NweH0hI4YodIPChhRg7hDgRZvlGbZQBeTaYq3J7hQ8lGkMjUZkemY9S7
         /9tQX9N+sygusNtzxq4BxdBzyZYKABSnCN9ANyeTmYK2rwErFP0J3wox7wDgOTiRoiop
         3ZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761216216; x=1761821016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJJY8vT54RV34RHFpE+Bbik5UMhLhn13zG4dOqEGSyU=;
        b=tUXu9a5f9IxRGXfb8AMB1C8JC+van3xKo82qn4+T1weGA3Foy/shiF3FaeJ7Vmfczu
         +K9BO0N+2Wh4G1KPdjjyUJ3Q1jhngQWGoTAMJJaFN+HQ7q7t7dtaju84pZ8jSpgxqc6G
         l/dIY8HJ3jp0lukQoWgVA0hqRmMdKS8cAFfuWc3LgBX6kmU5W21G6Aa1Mc7qs55a/koG
         VrlXz5vo83lqLKflWtN3hKuKZqlUt7nGOxC9Iqs8FCdYFWOylO0jpCAwwI92iOG0hG9W
         rF+DoGDUxcF6TE2jNAnI5lmvYrNFPQJ0i6yRkslWK7W6+MYQibBuuFhgdGDqqUp6p9zM
         PxVA==
X-Forwarded-Encrypted: i=1; AJvYcCXptFytpUDZxbOcPnIAdxVYbS8/DRDZLZu//YzxY2sR//uP+A9VYNDvkjUQ09tnbXTdZyC26OWd92XizLMvu8qqEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6rEukDahDqX5y7CXs7Ii/7Kzk+qntjf7w9Ko5ft9oR3MDWnXB
	DXkJgSQIGb/0KsObuLplNBv6HAk/uy43JvvtNoXM963AI/WU27xJ2ze3
X-Gm-Gg: ASbGnctXQJTwyrWjgYBlTmvmhht2XlPvz/V2+w/XAuyKTS+2b3sXQ6EQRd2R8XYOww4
	CnTD2q456fRBmbWexUOMrirl2yKRqy1wkzy90Q0m/Oil1BihoSFRC6LCOjjP99f08VfEsr3j62+
	E4kYIu26fjkQfkgK15H7y0u+GBdNmIKjBlscX6kqmiRjox6H3kCVK7OZh3NQ2+YjljYuWOuDC6L
	+FNy3wHFh7dtnyh7BgAYm6cIXqzULH3YCNdZQgthh/Pk7xcywFC5/Ob3n5M4Gd5BOP2YC/BntOX
	kDHoVoo0MER6vrbf1SykOQ5OhYEXmDKSYTq20THJJNy7Uh/J88Xq8SQd2RDiQ2RzYWxTPLx+hEc
	cB8YmwwJ7VIpFaf9jwHYe7ILkF/2NZytILzEnSYmUp1fX4yLCaRIugr5057EZGPBpsMxK2m2dcg
	UdtSfMu71DamPdfta2Fg3HPc0FkKsTpQ==
X-Google-Smtp-Source: AGHT+IHJfwM6Y6SPhOLlmiV+UNhGRDLVcxUXEzxyrFUF0UeCKrpOjoqVvrZ3zFlVOd1nzNtnA9u2dA==
X-Received: by 2002:a17:903:1b64:b0:293:639:6546 with SMTP id d9443c01a7336-2935e0f9701mr49585555ad.20.1761216216232;
        Thu, 23 Oct 2025 03:43:36 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:ef2:36b5:9454:6fa:e888])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946ddec426sm19240945ad.34.2025.10.23.03.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:43:35 -0700 (PDT)
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
Subject: [PATCH v2 2/2] serial: sh-sci: Merge sh-sci.h into sh-sci.c
Date: Thu, 23 Oct 2025 11:43:13 +0100
Message-ID: <20251023104313.210989-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023104313.210989-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251023104313.210989-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Dropped the previous patch that sorted include files alphabetically,
  as it is now part of the first patch in the series.
- Updated commit message.
---
 drivers/tty/serial/sh-sci.c | 176 ++++++++++++++++++++++++++++++++++-
 drivers/tty/serial/sh-sci.h | 178 ------------------------------------
 2 files changed, 175 insertions(+), 179 deletions(-)
 delete mode 100644 drivers/tty/serial/sh-sci.h

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 125a56d47924..b28711eeab71 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -17,6 +17,7 @@
  */
 #undef DEBUG
 
+#include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/console.h>
 #include <linux/cpufreq.h>
@@ -28,6 +29,7 @@
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/ktime.h>
 #include <linux/major.h>
@@ -40,6 +42,7 @@
 #include <linux/reset.h>
 #include <linux/scatterlist.h>
 #include <linux/serial.h>
+#include <linux/serial_core.h>
 #include <linux/serial_sci.h>
 #include <linux/sh_dma.h>
 #include <linux/slab.h>
@@ -57,7 +60,178 @@
 #include "rsci.h"
 #include "serial_mctrl_gpio.h"
 #include "sh-sci-common.h"
-#include "sh-sci.h"
+
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
 
 #define SCIx_IRQ_IS_MUXED(port)			\
 	((port)->irqs[SCIx_ERI_IRQ] ==	\
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
2.43.0


