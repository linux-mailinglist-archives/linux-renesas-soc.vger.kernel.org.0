Return-Path: <linux-renesas-soc+bounces-23931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C63C219D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 19:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8696E421900
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 18:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91E337DBFF;
	Thu, 30 Oct 2025 17:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+3fxuz1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C99A375743
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 17:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761847102; cv=none; b=XSm7G6+0tqbjLBBX708Lk/lcLwTkfEydO4Z2ViA0+suoUulfbfsFpDdNtIbOOgN2eLEHOI2ecU1VDaEYhMP69wUVgpJf01B7OB6DLsMu0Aw1G+uPY6hII6zyiDYKYOCgKoHjvPBTOs6aAM8jmX5sAGQTjna0m/qHwGFIB7tFoI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761847102; c=relaxed/simple;
	bh=vO9lAruIFRWwmcjhkElTrINqAF4ZFqyjtlRL6JeFb7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b0uPL1EdeKLbXed+mQ1ShpOCYAR+qKKk8Mb/yZWoN9nk3knHWAImQlaG1q08/LIGwMVrOhGFSCD4EtmD60Kvl11TYdJ8aXCd7W04u/Sy+EHD0W/aJx+SBKGIQe9HwIlEIL4nELkOxiqvFiA5Cemyc+kQU3y4srqp734H53WKCzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+3fxuz1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-474975af41dso10114685e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 10:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761847098; x=1762451898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWj+7xNpysOeYb6zB5ArYmBB0QA2bqcJvV4UM5jfotc=;
        b=G+3fxuz1w6dLvNdBnSclQjsuzXUS/OCeDEFOcc66qghMNxL7Iy/2o143MmZRVvXZz1
         1spVp0vONa50xG30/qk5WeBwq9kGdXvP7Mx5klSK5nboaWcbytszB0J9hXp8Uo2KuHIm
         +2fS4Q/Cy7wLHIpblWV5dkIYSZtBPnqR6nIuQtLg9Nex2QVICZ3D5Yv8kRY0oTr9i7g2
         n/L5QbLcPuZqZ/Kz9vaIHMpMskZF4oKZVHNObkHIKd1WEC8dBcZQTGA8HeaULMYIZpPJ
         XWjCxt/f7GW3U3sc+qO9Hpeqyd0NGZ1q1+U/2vZ3S/5DeAt38in3bx/HZHJQUQOH7doI
         DUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761847098; x=1762451898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWj+7xNpysOeYb6zB5ArYmBB0QA2bqcJvV4UM5jfotc=;
        b=IElUPzN0GBs7U8RQQVdnXxQfhB1GNNz+k/jKFwztky3yVEMJvygKiYiHCJXXioZNtD
         d8q3YjgbnDnw45BE5/UzEADQfruSOvvvkmDKZhmJR3MJpvN6odMLW3kGUXICVizw/WiR
         Gcn/BqRa7UYDeQ8mYYyAD5DPd2s3pdqFZIWWUmUPxJEnipL169PkjpsOo9V0jyEoxKny
         988RwsCnmBX5TbkReuiCIlALYFnAuJuDlnuEInIUzBrTn7SKrjt1vQ9xuBFWuQ4kO5sa
         QmN1QX+2z4CI/JqP3p7V2yiFioTuEBhR751SP5OudNXwfktsIsD5Okzt6GbK+ai7NnRk
         ZLmw==
X-Forwarded-Encrypted: i=1; AJvYcCWpp9yMqUmNOFv9Wav57wWawdFWKr+KEekYxkMAAbhDyireEVwVIypAHYHioAc8oBzjdaC+rXF/r5dJz74nMcgBxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLPmJua+lkC1YJ+Hp382tAwGc4x2fBt0tmCWdHnMyKxWIINiO1
	62qeylTP5LeqdbuDPyoYAeDI0P/xUsqgM2k7yu/WZ36ZniuIQ8ZFZO6l
X-Gm-Gg: ASbGncsvkMt3conPEit/Zgyix4AD1c6RrorVx3rq56BtI7xORotu9uIqv2xNG2AiOqu
	81OpdrnQFhhGHYNvB5aVylGTTMuda+amR3cqSQp8W0axq2ZeuAFVM9QV6Y216cZykLRzFfoViQM
	V0eKXqVNvXcoEhRsv/QCTdhKIgIPe8N4rO3LW5XuQ0V7G2i8t2IaYDE00gXUPdKvOyT9X2joYpk
	x+yvqhfhNrnJ4NRF3jA9zGExXDiJlR42H9noG9woizBzHPvvdgfHYSKU3gDJULLIh2CVZxH4yO5
	jMZiGWyRs1Dlof/nXPB/VBUTuWQ0apbPpXRd3jkJW7XiEo9p8tA711PekL5PpZUQPHauobBBmpb
	bMOIIMCzalZeJzMrP3JfES0MMiBWr9IFaZzFeZ89WpmGEdvTanPtsV1Wu8ihQuCA9D9LfBUHPj2
	j/1tRmkfGB6M6tYRjybnFsA5w5xP6FQaJ4ct0wnLNIV1lJ4MWiSyvBV1Qq4MMj+y/OJGOkDbQ=
X-Google-Smtp-Source: AGHT+IHSLeHPyg7IKsaNF1Z5dRMW0XOJfQJfZIjvZOv3DXHqMuCpNkr1OVMVg0G9x3tsIeUBwjGQJA==
X-Received: by 2002:a05:600c:1e11:b0:475:faaa:8620 with SMTP id 5b1f17b1804b1-47730871febmr4732345e9.20.1761847098425;
        Thu, 30 Oct 2025 10:58:18 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772f53aad6sm15098055e9.13.2025.10.30.10.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:58:18 -0700 (PDT)
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
Date: Thu, 30 Oct 2025 17:57:56 +0000
Message-ID: <20251030175811.607137-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030175811.607137-1-biju.das.jz@bp.renesas.com>
References: <20251030175811.607137-1-biju.das.jz@bp.renesas.com>
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


