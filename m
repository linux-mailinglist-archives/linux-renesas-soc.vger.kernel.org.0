Return-Path: <linux-renesas-soc+bounces-23917-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C54AC2197B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 18:57:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3F7594EA85F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 17:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3B136E358;
	Thu, 30 Oct 2025 17:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfWj3pH6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F40236CA84
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 17:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761846938; cv=none; b=WAjakF8NiTpMrxI66gl5nhaZTWF7A5PPBLwokxx3UiIOZKg97NwZ9M5sTkeQIOwj9XPk0sm9Gqcv2GCS2jYFGX4FMTI4f+tzlk3iW196KJIwsHlqvSJQSMDyi2h1HdQdVMMYSgF98izXseyamoGxi63nK/HI7GYro7vO7ufwIf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761846938; c=relaxed/simple;
	bh=vO9lAruIFRWwmcjhkElTrINqAF4ZFqyjtlRL6JeFb7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lcZC3unkfoyzNIB+motxOGDRY8Bha6h4ifQ4hXKaea8mdb7maiuKAjm85B9f1lTjjiKG8f0YgPaYYP+CQPZY+TvhaX/Nnawu66JNek1fvOt8+lwqJfFyUHbORSdNE+/G2rZsZvyKMUuMsbggi4fi/ZdxaRFFZ0DXVy2bSZwx5Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfWj3pH6; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so1298455f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 10:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761846933; x=1762451733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWj+7xNpysOeYb6zB5ArYmBB0QA2bqcJvV4UM5jfotc=;
        b=DfWj3pH6gJatdsT5V21tGVLpmbkoptpWV8J5GgmVMAKaP7SV3J7Z4HSS+ma+ayDxwm
         YM/s8zT09gC0IxSmbuR71sx2udzUzAWWaqQS4PSsa8F+w9rEGXr8U8np1W3jCtVQfGx7
         sSdSIrngsl9r4I2XYMvk6HqrzQCGDFgmeOvDlWUC6mgM20+noF3bKvcehFxFWFjy1eZI
         sr6pDNrhj8xC51nbBUCOjNnI3GRNTfA12IgPl6s/5YVPl0Ta2hWD2k6uAPaDMVl2zigC
         Iwx1aR0011i5mZ1G8qklIkuUQjFQmBC7TokydxDBDyoT2Hrfeqke7rgxmFtk45q23x3x
         N7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761846933; x=1762451733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWj+7xNpysOeYb6zB5ArYmBB0QA2bqcJvV4UM5jfotc=;
        b=q07OzOotkmY19/y1/sIyA8Ne0IiEBH6nBwGZA88lcBffuWoVETvlKysvaj97KoGKu+
         nhEhgMj3hTFiipa6gNo2hIyTl/k1pOz09LfNm3DdMIxgPz94tchZ7ndV2/eXp6U8vGcp
         t/aSGHe7hO0TufyyXsl9YnDXClltFuN26dCXW9GGwfDmOzl+d8Iw7cIKPmL3T6IAu67d
         9KFkL3fvPDm5nZv/KlaczArw6GwmdGADWQCM/qIJsjNg4idSepoFsdSQ/9JB5ig6kZ/n
         RhvB4q6jSolGOz/HHwbRp/np6R2MwIsGv4nqewglvae9ailDXncO8/unhQ6KjWpqDAiG
         vCYA==
X-Forwarded-Encrypted: i=1; AJvYcCXNTUJN5IQZF0pnESfqK1BbTadJXgXQMcb/JLiQ6NZUzf1QC5yc/0FO+4mnY6doKoo/GYuoL7v0Zv/Qc1D7SZZApQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW/bgnDCdQqSkI1SoUjOhTuwLBjy2N870ujjkgjHZ6uRl7a/UD
	F95b3R/0WwKnBfYeCWuT9XQmYh74hdt/6Y6kqVrFnYb92SDNpDoF2P5Q
X-Gm-Gg: ASbGnctUifVP5yA+hhdg81Egvw7oqKQ9N0UbwI19dQWDuE+z7LRPWpAcr08vXRLNuAu
	4GzS4diZBTKLcNeCKt2c5+JmlBKi/3CnyHDuMYSlxmhFSRG0AfyNSpA9r5kxI9/eu46SY3aN9uh
	K1AWigsXZH7fvOEOTLRUjWJtvaq3lpbFlL2JV1j2BnL72CR9MFxC2qCyFAZZ74/AWN+Fal0C+00
	OY4y874rJc1pw4fnY/ahDmKX63KKBzV0+PbLxHALNT5c68NGDAMdAkHI2Et9GYR9swFD5RJSi58
	gunNL/xVsvwm6qg3GAnk6yQqxP8E3CjF3lzM+MbAY/1e6V3XGQCbzaGhkaVytUBbyqS+w8m8QCl
	0XaEhQy4qmqPMCbdZx6PLkT1wWRRgIJysnfdpBjZAYHizPBBWsyESMl2Uu2gTPkH0tCfHP0Ve37
	rgNH30YKcSxqZLJmq4JD7sNCplpX8h0xGKnwTMriKwzfTHHUvusE0QjEa15lzN8wjxeN4r/Rs=
X-Google-Smtp-Source: AGHT+IHQFsWv2WZtyuikDXDSZcQC16eMKnf/MSqZRjYeCi+/xS7a8yMFYJt3MbTFP4GQ55NBuKaNJQ==
X-Received: by 2002:a5d:5d11:0:b0:427:7ad:cdac with SMTP id ffacd0b85a97d-429bd682c6dmr534666f8f.20.1761846932711;
        Thu, 30 Oct 2025 10:55:32 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de5f9sm33384041f8f.38.2025.10.30.10.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:55:32 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 08/13] serial: sh-sci: Add sci_is_rsci_type()
Date: Thu, 30 Oct 2025 17:55:12 +0000
Message-ID: <20251030175526.607006-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030175526.607006-1-biju.das.jz@bp.renesas.com>
References: <20251030175526.607006-1-biju.das.jz@bp.renesas.com>
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
v1->v2:
 * No change.
---
 drivers/tty/serial/sh-sci.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 6f396e1151d8..7cc2b622e270 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1008,6 +1008,11 @@ static int sci_handle_errors(struct uart_port *port)
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
@@ -1016,7 +1021,7 @@ static int sci_handle_fifo_overrun(struct uart_port *port)
 	int copied = 0;
 	u32 status;
 
-	if (s->type != SCI_PORT_RSCI) {
+	if (!sci_is_rsci_type(s->type)) {
 		reg = sci_getreg(port, s->params->overrun_reg);
 		if (!reg->size)
 			return 0;
@@ -1024,7 +1029,7 @@ static int sci_handle_fifo_overrun(struct uart_port *port)
 
 	status = s->ops->read_reg(port, s->params->overrun_reg);
 	if (status & s->params->overrun_mask) {
-		if (s->type == SCI_PORT_RSCI) {
+		if (sci_is_rsci_type(s->type)) {
 			s->ops->clear_SCxSR(port, s->params->param_bits->overrun_clr);
 		} else {
 			status &= ~s->params->overrun_mask;
@@ -1837,7 +1842,7 @@ static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
 	unsigned long flags;
 	u32 ctrl;
 
-	if (s->type != PORT_SCI && s->type != SCI_PORT_RSCI)
+	if (s->type != PORT_SCI && !sci_is_rsci_type(s->type))
 		return sci_tx_interrupt(irq, ptr);
 
 	uart_port_lock_irqsave(port, &flags);
@@ -3112,7 +3117,7 @@ static int sci_init_single(struct platform_device *dev,
 	 * The fourth interrupt on SCI and RSCI port is transmit end interrupt, so
 	 * shuffle the interrupts.
 	 */
-	if (p->type == PORT_SCI || p->type == SCI_PORT_RSCI)
+	if (p->type == PORT_SCI || sci_is_rsci_type(p->type))
 		swap(sci_port->irqs[SCIx_BRI_IRQ], sci_port->irqs[SCIx_TEI_IRQ]);
 
 	/* The SCI generates several interrupts. They can be muxed together or
-- 
2.43.0


