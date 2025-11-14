Return-Path: <linux-renesas-soc+bounces-24652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0EDC5CB58
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 11:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 69DF8347F88
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FCE315D32;
	Fri, 14 Nov 2025 10:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjCuflfK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0978F314A75
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 10:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763117534; cv=none; b=Yvq/Z2MWEU704GH1DUsYlNQoCQY8+wwLko5sEWDEHk/nqP4MFgporapXRldBrM8F29gXRuqy2tb38Xdj7rz8j4N74K0js6NdfQhff7U9HXfMx00+rnrVhCN6yL38fBDSsBtl6RECc+QqZP5Bq1AChkosp8L2S9W4dduFuoJqIGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763117534; c=relaxed/simple;
	bh=Vtgi4lfvu1X+kThD5elQPk8tyijOhE+uKacGCvt2KsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fcypbahmsd5uPMeooCqrIHwZivT2ON8Ej+w3LmmbAjwyDV15050ew31okDwEy9aeb6qwtGBvNvhdSIvaY4ySuFEh8Tcb9FViWnAkgFgdOIULbVY5g/7i/afQIVpq1vKldM3odx/BeX29uzUDDaYHMrPf5MgoaQsoSC8GIisdsEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjCuflfK; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b39d51dcfso961330f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 02:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763117530; x=1763722330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8DAzeNxgcKZ7yUD6bDH/FI8JtIxqypywOcVoLK9k0U=;
        b=BjCuflfKNftc0B+avuLIwj7QmZ+3WxprW7JxIVNZtUzG+1pZOcgb1XlY7k4XbiLLp3
         yvk5c8ca8HFv4ar6s81CodEpmosfyP8RAnfHFaR2m60OVV8+MNtiwdP0+N+Q+W5HcUkC
         M/ufz+tq8j6fn36pCXakip0NrwLTsD8rEiwrhEJaN/iMFE+IzxmW4DsBnRQSrrRSAE8v
         9RBMvnnQxn+r8E+0boE/M5JewPDfRnD0e68XVAT1Mvrke3ieGIltLxwvSV1bLhXFr5NI
         NpNC8Qm7xdhqbY3HUdjIBMpqLl1VMyk9qh+wIAtl5BzmAgrunNrpaOaCykW9CGtCzm6n
         SI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763117530; x=1763722330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T8DAzeNxgcKZ7yUD6bDH/FI8JtIxqypywOcVoLK9k0U=;
        b=YZRAWb8xSAe2udB3MSYNqAKk/s/2UYbqkBtbbff+g4eCAagvo77hlZmPbX4f7ZC86H
         B1ykE6yQSYY4K4Bg0N8lWttrCFGpa3RXCGIw1hI15y2LXGnESpvvUWY+7XjPRYLj9g0f
         /iYZXZ7a79QOB8OrSP05B/ABV81gww+KgXajOh9TiK2qxCW440jkxT2Dwh409KJCvv8r
         ApsyvotFAaWY57NjRSfXgxQY9Rl5LyksZsk2nxKkRGdksghtIsYw4RbNxwN2aGqu3cr7
         saSRljDh3IvQYzVrwc3aGgFcWj0okwaPwCB31LjVqyfqNtQC8VCmXeoo2GAhbsGzTEH4
         Rhnw==
X-Forwarded-Encrypted: i=1; AJvYcCXpVXe5DLlpjjBuKA/ADnRsqQUr65VhIz5ASeWROPayGHwSYfuFRETcKZ+he31w1rqIPxgXq0dkG7GPGOZ7TOiSGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeEfnffDsoRB3+ux/LUZPdhaM62lHiNcfiLuhRBt4/BkDkRtYi
	yw/8UcaOb+YflVfNHhW+aEm2cb3hwL/WUAxvVuSmvIhBCIZKTK6pfeWZ
X-Gm-Gg: ASbGncvs/q3COxIm6zwHa+uBNxggVIFUVihEGxHDCLqdg18ftXCF0/mTiktjPdaP3rE
	4d0t6fwGqBi8kAxkeB5SRxOgrKZpqcnqFKy/fCakSmqryg4nkRURUveqGFPbQr2smeFJM4r/Wnq
	22onvCudXU995jjKcLUYFKuHz7xLK80ohdeMdRhRxV8uLGGu0uAZsGRHCMPiXOzSUrd/bbzvOkj
	GUHWtNacLqAvX9yEZqNO8ANsdtoFpCleWwXE82kEpdNJrg6og2O/mVW5SYFDKXo5OWTqWQoHi/y
	7wNbdPjgqmDM868oH4mho0+xcTEF2Vqn2E2QTx725MfCYDRCPm0Fj0W37J76rchkKEQVbSP2AjK
	82Bb3R+aoqZHv7SvDbK/ryI9SfbXbzyz4MSwiA0Zes2ir/8nZO6lwsXidAcK/vXSPa/Imz9krmY
	TZ+VWvMPMYoQazM+VW/+toXFgCVOoLV9V6nY3JUGbPhOZeKUlZmhDNBKEKDUQzGfji/eeQtXeIy
	H2BXi5Ew7ni4JIb
X-Google-Smtp-Source: AGHT+IEsMmHNh0DO1X88HpKTuf6l4Do3Q+f4cMx/ubEtqRtlwPBkz5p20OD2aaXxaMLUIAcCVHyVuQ==
X-Received: by 2002:a5d:5d03:0:b0:429:d391:642e with SMTP id ffacd0b85a97d-42b593742fdmr2342001f8f.30.1763117529498;
        Fri, 14 Nov 2025 02:52:09 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm9031255f8f.35.2025.11.14.02.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:52:09 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 08/13] serial: sh-sci: Add sci_is_rsci_type()
Date: Fri, 14 Nov 2025 10:51:17 +0000
Message-ID: <20251114105201.107406-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add sci_is_rsci_type() for RSCI port type. This will simplify the code
when the support added for RSCI_PORT_{SCI,SCIF} private PORT type.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/tty/serial/sh-sci.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 66ab85571230..2da36e8ce555 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1182,6 +1182,11 @@ static int sci_handle_errors(struct uart_port *port)
 	return copied;
 }
 
+static bool sci_is_rsci_type(u8 type)
+{
+	return (type == SCI_PORT_RSCI || type == RSCI_PORT_SCI || type == RSCI_PORT_SCIF);
+}
+
 static int sci_handle_fifo_overrun(struct uart_port *port)
 {
 	struct tty_port *tport = &port->state->port;
@@ -1190,7 +1195,7 @@ static int sci_handle_fifo_overrun(struct uart_port *port)
 	int copied = 0;
 	u32 status;
 
-	if (s->type != SCI_PORT_RSCI) {
+	if (!sci_is_rsci_type(s->type)) {
 		reg = sci_getreg(port, s->params->overrun_reg);
 		if (!reg->size)
 			return 0;
@@ -1198,7 +1203,7 @@ static int sci_handle_fifo_overrun(struct uart_port *port)
 
 	status = s->ops->read_reg(port, s->params->overrun_reg);
 	if (status & s->params->overrun_mask) {
-		if (s->type == SCI_PORT_RSCI) {
+		if (sci_is_rsci_type(s->type)) {
 			/*
 			 * All of the CFCLR_*C clearing bits match the corresponding
 			 * CSR_*status bits. So, reuse the overrun mask for clearing.
@@ -2015,7 +2020,7 @@ static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
 	unsigned long flags;
 	u32 ctrl;
 
-	if (s->type != PORT_SCI && s->type != SCI_PORT_RSCI)
+	if (s->type != PORT_SCI && !sci_is_rsci_type(s->type))
 		return sci_tx_interrupt(irq, ptr);
 
 	uart_port_lock_irqsave(port, &flags);
@@ -3289,7 +3294,7 @@ static int sci_init_single(struct platform_device *dev,
 	 * The fourth interrupt on SCI and RSCI port is transmit end interrupt, so
 	 * shuffle the interrupts.
 	 */
-	if (p->type == PORT_SCI || p->type == SCI_PORT_RSCI)
+	if (p->type == PORT_SCI || sci_is_rsci_type(p->type))
 		swap(sci_port->irqs[SCIx_BRI_IRQ], sci_port->irqs[SCIx_TEI_IRQ]);
 
 	/* The SCI generates several interrupts. They can be muxed together or
-- 
2.43.0


