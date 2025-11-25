Return-Path: <linux-renesas-soc+bounces-25113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E990C85A7F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 16:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4ABC4351C7E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 15:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A9C329C54;
	Tue, 25 Nov 2025 15:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyiXADg1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66954328B55
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 15:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764083206; cv=none; b=jkr2dmmS+MndkWzhUklGy2YlGswEImWbrqEoebLvtO9b2wT5DQoGqXKi1abNKz/Jv/fZaailCV/uZTu+YXXXnoYKEvj3BEKC5VnlUE3j14y4dIrIvXlb01L0W26eNc9OACDfxo9ooZVp2LfdpLB2y+UjYggvTixTvYDxbynqQQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764083206; c=relaxed/simple;
	bh=RqWNr+J2yXgOsuO0923Xd+N0rvDeRRxq1yU1YzPrTew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sk8EFB1AssxVKF9+Ru03Kp8y7X+feymObEwoRZS5slNGd5Fhfp2sWLGOQIPfbl9n1pbtbfzrwJ31bfLwDi1PoZOoNcDsoIJ3zVZnvmxQi1szGsN2nbYn35jCslNoCbs+Uc2B6Qy84gVYpMXzzMSv/sBcRIyVi4e4kgQd8s/lVgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyiXADg1; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b3108f41fso3426948f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 07:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764083202; x=1764688002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jX3LIbgY2Qs2rnCAEJyiR5LJ9WWfAcTghJovwqWhk0=;
        b=NyiXADg1wq59/Lan29YX1N8/NiYv3ArDTmDW/KlGMkWdJ823QpatOmkCrifAUpZUNv
         RrLjXJeWRiQAQRmvN9dbkE3jJTuqp8IxxmGQXgaDRxEodApiUNfwCKF0jHtPI4X5kMWG
         ejTG9/Ufl6zNYw4LluBWjmj86nJaQvqXoWszyJmMQmpEK9P77n5CHazyO0OBAUspGdlX
         1SdwmXcxybU5hBMjS96XhSXHWiqqHfuuTsMGHVGYrXOpbNkJ8rFzbS38hjco7GhY3tfs
         W85keXXDRKB2EGTZa3ulvg99GnZOwI8UkkgIYP38SIibhracFA7eNaYWLueRLVEMR6CK
         +Euw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764083202; x=1764688002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6jX3LIbgY2Qs2rnCAEJyiR5LJ9WWfAcTghJovwqWhk0=;
        b=feUGiRnXdc6lZDX5KB1zcah8TVb04ZvN2wwM2PFc6mYKjs01eH4xQOVsHNVMcl2WVN
         a+DKE/5smpmYD/nTNL8A3vY1Dz9c8qxznZB8q4FUIXpH/Aze9yn0HnchyHaAVWngLqZP
         JZ01BGrbW0l1Vnt/UoBb9SH+SbTOMNi4AlT+ueh8zIqikePEq/kYlON6msvUo2sxEcA0
         QzWx/7jU5A04rM17RHrDuZPYh/GxI390aXajACSiEB7l4t/fE0T57edi2uSMeiU5O23L
         SZXTUtJ9uKyPKkeyCeosFKddi78J3x1+Mnp96Xnr0GfBSycXRbD2vR5c9izlZ+LH9bd9
         0krw==
X-Forwarded-Encrypted: i=1; AJvYcCX1Ul9eF36DTxfk4PuoelesggIHYj1H//gXvSy6avHuRErySKDs4JZSYZc4L6Vg7sn+xuIAB3LE5Se5o6WEsof9JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlNpRZWvKbkLJkY6UDutr7AWfJA+GE7N3rUSNmedt45GloX68N
	yL+swgv7ajYsf0VWzdSzrYsAJtGTmG8VTfTjDQ/OFK1rlNrHuzRRu9OM
X-Gm-Gg: ASbGncvUPUW+6Po3wsE1KkuqLrr5c2JDaYtGj0YzwlkpazgTt21sHVHThkqIdA7mCD+
	hHjS/znIJburlEUqUmNQ6znkijEJBbOjYjHp/gJ9psNHmkiuKc+P/jSl3U2FsYbYLlgwTuEWN2v
	yebKp9TUcWhQk21OgHbsFP3+bmiH8I8U2YmQegHy4OMt8SLMAfcrRu8VJD4kfstjf+xNU0qnqTB
	j9GNKBqPjk6Ahm0n5may3rSVXMk/m1r0ZW9LDHAbt6BOyTe8IC2+qTX/EeiF/LGpyhrPQIQJo4p
	nUVJS5nU6eYju89GTIQdsnDD7d68kuljmrrJg/3lbJEZ6KK7lBAIGi4rK8twdA52l3Rcz/gvq6N
	xdUGvaApPU/eVTQWWYInuRDBN+Jre80MrLJ4Sz7NqV6gf4PK9/ezyAb5IFNkjBTgpn1teH3i0dK
	+iUb6s4JShQqze0+M5JPgWztJEoZbqTKK/rp+Ojti78o5GkNR3NNr5Lzhsk2q0yL5oh8FpXOYul
	g==
X-Google-Smtp-Source: AGHT+IHJ3f6R4O0T6ProSqd6CgB0eBY01jmedSgsJF/qjxeGwfodfwrWbqyZIRq1uJuQdty6QtAvRg==
X-Received: by 2002:a5d:64c9:0:b0:42b:47da:c313 with SMTP id ffacd0b85a97d-42cc1abdefdmr18028213f8f.3.1764083202442;
        Tue, 25 Nov 2025 07:06:42 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm34797809f8f.32.2025.11.25.07.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 07:06:42 -0800 (PST)
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
Subject: [PATCH v4 09/16] serial: sh-sci: Add sci_is_rsci_type()
Date: Tue, 25 Nov 2025 15:06:11 +0000
Message-ID: <20251125150632.299890-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125150632.299890-1-biju.das.jz@bp.renesas.com>
References: <20251125150632.299890-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add sci_is_rsci_type() for RSCI port type. This will simplify the code
when the support added for RSCI_PORT_SCIF32 private PORT type.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Collected tag.
 * Updated commit description.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/tty/serial/sh-sci.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index ae76705baba9..914bdb41ccc6 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1182,6 +1182,11 @@ static int sci_handle_errors(struct uart_port *port)
 	return copied;
 }
 
+static bool sci_is_rsci_type(u8 type)
+{
+	return (type == SCI_PORT_RSCI);
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


