Return-Path: <linux-renesas-soc+bounces-25381-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD2DC94407
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 17:45:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A7E024E681A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 16:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2CE311971;
	Sat, 29 Nov 2025 16:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OK8KQatb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA3830F55E
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 16:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764434620; cv=none; b=ZcW1Bv1kv84D8CLoxgZTpWMlRd6F29HdX4asagPCfxLB6vmO8NTIzGfDRYimCfDdzfSNqRNKak6hfHeu7aAn/snZX7UCHWY8rLGTDmzu0LhnoBAYV375mq6+A8c0U4eXYEjZkHTHLiWoAXDkK8nx8vnCp+ovCa2sFD2K8/tElRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764434620; c=relaxed/simple;
	bh=g7eagy+PpaIq9mY9rUDS/ea1R4Zj9Oy2om8jVH92e30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rpp8l6nhVR3iDsEEZ1CwMHv1q1EGeu4RA6s1GORC0cZ+HAlrD+60rzLaFvxjASrHXZPYjwMvj5lJPaMBz293cDDbzp6QnBGGLwpEgbhBglP/eVQVEtcfX/uSILGBEsPMs5BENXQnqMjoWvYzx822FfY1yC8RenXZthlm7UyQsO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OK8KQatb; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so23027785e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 08:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764434615; x=1765039415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzbFxtV/Yi+durONt0GWWiE+qMxddalAl0BfmYSp3AY=;
        b=OK8KQatbeGEt/8zhEQV/mRllD/jHiLN3cc2M5wHUX/tBOYZJvMOoEgYKen0BHXQJ/O
         lg60MLx6HNC+KSXQw69zjPwoH+QJ49qQJGzznrch+VbXMSRuRD6NeEdIH8gLITQinIMw
         lOCXFzu4Ev9qFIgk2Wh/jIs2SNvVcwcyFBlcTJj+CFycfrh6YHGsdjIbEuV3tkefG0eW
         K7DNglMmmQnGLUrN1iTkQ1cw8eOkqw/4D9ZJGy2iBZ1iF1dh7T0ySCEUdyYkxd5aw/7D
         QCSECKSzC9dLubWOEzwIrDGYNg/O310E86SaeQJq/1A98cqSwrbuezfJC+qVgS9NdO0A
         dGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764434615; x=1765039415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wzbFxtV/Yi+durONt0GWWiE+qMxddalAl0BfmYSp3AY=;
        b=cCAb+wXpu7NdfMMosY9lOzZF2ZAmjiyTIGIugeFMKC9u+a1jzA2IoLIHQKFseEsRqU
         RzXZGKSaoPqJ8IoBI7LJNAgqf/XSK9EUIVZHd9lgGF0f8Nx0+UTWHRkjq1fl8Yi1C3SF
         GRi5njDj9rYca2HmIRU9kLiPJl6xnMsfz7fqGWIEkfTv409NgOMMpel2gfLPFoa56KzO
         eQ6D5h+XRHubY98ZYPwoi8VhZOsY2BGEci3ohy5nq5Yl2BiVtd+CRxkYY+2SVJJjSx2k
         3Bv1wLB1jEBpI0ykRNRm1gjRDDbg/L3YvOIen0LfJkPXqrEf93rqCKV0FiiESNmbuY71
         O+pg==
X-Forwarded-Encrypted: i=1; AJvYcCUbKuKml8jew3Q0jbrhlUTm6IXj2r9a3ICsHVfu3jVsmoiH515GAMPnOAeAw2XUSIW+LHhtNJb6Qzm4jsiLX2VMnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVgP+9g/C3paSFQZ0MAx2R1aQ0ah7rljNoMb5MttrkWrwZn138
	E/QCoj5cvXll26Eyn0WTC43eAu8kKzSPdASYTcF2JLulbCMnojaejnaY
X-Gm-Gg: ASbGnctYCeHPa5X0A80mgXjGrF8YpsvL+VQ8rfSg/laK8Kh51Kd361/LBwgd2wJ8D8P
	INftB1nXWcpgS4bRcQ8Uf3hgslY/ewcFB+yBoUiJFa4gZJZjkcjcgd1CTx/InkrXstpDcuz5Hia
	GGsesBjtAmaVSqtXFGkOhiv3uUmKwDyXTJ2NTPRnYa0c2FVxLPUnz06o0I1zia3bcYYHRPaBt8B
	LWbn/+jc6G9P6tfo/gzvV4juYkSOTkjK++bWY9/Kjy1J6Tcuq/zTjMnxw9dlERVjVjX8FETx6oR
	6eaeIJGEzS/CxLYBbJNAmxp/p0tZzYcdQwp4fKVcrj44E6aEtSqFMFC5xEVx6bJMLwmL/ykr/fm
	uUbT8h7UYGdl/zKLKJq7ShQeQw7ksBBA0JBQwY9cv4m1DkfVkULQyQYxZJ/XuwEfVpoluwGHm9x
	y3m2QEP8vFRBMIlRd3OesHqX/KifKEcksuLs3TcMqmRvqf9aqx51yTP35Koyt9GNioCCWux2a3f
	+Y2An/dIZ3jghNH
X-Google-Smtp-Source: AGHT+IF6pzZC8Gkj9csAykb8avHHf17SJMVDRgNZQphKqTS9b+/Tvp2qaiZkWVBITrdWpS+t4PJB9Q==
X-Received: by 2002:a05:6000:430d:b0:42b:36f4:cd24 with SMTP id ffacd0b85a97d-42e0f204b52mr22082263f8f.24.1764434615165;
        Sat, 29 Nov 2025 08:43:35 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca4078csm15970060f8f.29.2025.11.29.08.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:43:34 -0800 (PST)
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
Subject: [PATCH v5 10/17] serial: sh-sci: Add sci_is_rsci_type()
Date: Sat, 29 Nov 2025 16:43:06 +0000
Message-ID: <20251129164325.209213-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
References: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
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
v4->v5:
 * No change.
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
index 704f175b14e4..b7fef518a2b8 100644
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


