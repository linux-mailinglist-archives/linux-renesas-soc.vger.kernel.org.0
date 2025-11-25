Return-Path: <linux-renesas-soc+bounces-25116-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 31717C85B40
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 16:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CAC574EF902
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 15:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD4432A3D4;
	Tue, 25 Nov 2025 15:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qnu1bQBz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC67329360
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 15:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764083209; cv=none; b=sUqn56LGal/wF7HIZL5lounUB84epA0y0hgd0Cz8nrSiMk1uOerFD9OUbufSdKbR5pbv6QxoZ1BX2nAfAOViNbSmQVCkUqtHqx2aK6vnrIBgciUYAVsYT+sK8E0lrXw0+sJsiHHA3ttdDShCig4hP4EvC7eHykaxxtuudr/V25M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764083209; c=relaxed/simple;
	bh=Y9Og79ZAp1LzlNRB/+j1NPNbgm1v4IaiVXeLQZ1UcbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=boN9g4l9zJRSbH5mAT0SMONtqF+R2IKJf2j3GZNJbcBeoQWE1EzA4EmktWkv7N7z6SaqBYimgVCefCHJHoY0fVoXbEZ0IP4X6HNC3hQeipgKwb6qOwn08QkzRVu5pQyEeYpxGaMPypsEk4LJz0V3ZONT2KcAHuaLPbUZ6td/hqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qnu1bQBz; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so3284743f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 07:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764083203; x=1764688003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQBggaWsGLbsTfz97O6p05mhqq7oFm4UAg4lh0dmr5w=;
        b=Qnu1bQBzuBB+12kdzy/dmdvb/C+WXI2l6K30U/NZqR90pITourjJjnQH24cC3Qad96
         nnM4NucDPlRNDpybB5SJ0JxISJA2vSoE0wVRVGtEMbfZxXqnrVfHO6r0mKrCC/1sfKQ/
         GVUITp8fMv1ukAahFzOPFJe/flz/fxyc7lrPabkStc8cJksIEYye+dWTXxAzvkgivvRR
         WfxWDge9fBuZXTTjAMbMYgWA87aNAiToe0G0WocSnLA7BvlQIVAgL1jaZVus3WlgbAV2
         eZrqkjIGlV9FR5tKAWSPu4anugcVDWxFuinAqZEBBmEXRs6ST4F7MBXZbye1IpnVGyg+
         gA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764083203; x=1764688003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KQBggaWsGLbsTfz97O6p05mhqq7oFm4UAg4lh0dmr5w=;
        b=h8EjRTFnWUk7gF1s0/vumF7FBR9dZPrGDLq1WABKY94mAdZLTyeWr0e7eurKprqiM1
         qU73PQJlikry0I6kU62lu9xORxY10lY6XLbMsJzAU8amtxINkB26lXC1KkLUmmupgVGq
         2zrxtwwDsRRm/0tJHSeT+1cKibHV8txMid4iijSizyfvU1KnNX1NJj4+gYjvHWGvl7i/
         3QVWHloM/Fwxubx0Wu5MYF+bxHH2Ri0apWF0LZktMvgzW+QHCeMvpKrjYJy5fhgRWDpy
         4qi0rMsSWFBdovekfQXoAY2KWb3oXaapx6kayerNc1+kw42d/JM4iW64uG5qMP0Jv1Wx
         Rnlg==
X-Forwarded-Encrypted: i=1; AJvYcCWloMtg2QmjYO3T30JSF8WDcwNI0AFz4KHiRZU1bcCr1uOn0cof8LclCIdqZ3P6OszcFZc4AVwFPJwh1z7Mo1jONQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLW0XA6VJEm3nT8IiIbaiElUh0D/O7pGEFX2hjyirAo0swjh4G
	493A5yuv3GUP2EIK5llwqXKMiWCpEMj1Pba05U3byJeFPGLTk7vGu9ht
X-Gm-Gg: ASbGncutO3dPiYfVCYGCTfiZD4KdvnkV9vyfrjQbjoHate1XiDQWfWh8dwMkoHGkgSs
	QwGz4aNpaHwa3qSDmPr3DzPlcA2ameT372ma7RC1yN02j2CQdiGrhjZWOQPeYUgr5ka3iQ9CSD2
	6nOgmrDIf3mNZHJY1UF5WY/KvdyEvz2JUTL7NrHCNqKxU35dBSsuYdv5/jNKVGGsmND5ke5GI8J
	qDw0ZgZVwrBYNFIk+D7ULQv4uB+Qs+FL37aE+p4puyVk+/pvFSUqevhZpxE0/MakIUfTwRbu5Ug
	gyCW3RLmJFUuBNEEhxo3tlZIp76gD8YLgfX7bvvwfrXNzXdT54AmbuSOMspT2Q2gWtN8HID+PL6
	/39BC1m4n6B3QUqAhqZ+h9T0eTVYMCGZQXC5BhVh0hCh6FO6uIx8Vo2qrtKnJ1aD8Smj6CvN1mY
	CK/BxhhdNM7+8oVxEZs8s86SiKYkXSbWWxNuW+h5ny8MQi9vc1KdbT4releA8vV5LYxn1nQlNVP
	eTK7jcUWTXvea0H
X-Google-Smtp-Source: AGHT+IHY3RAScU6Nx94JkJj3C7pct+wKtm7jPjdtRPYHB33Drum3deOmgXGvKEWzPIL7rdg62WgVbw==
X-Received: by 2002:a5d:5d02:0:b0:42b:3339:c7ff with SMTP id ffacd0b85a97d-42cc1d19a16mr17579997f8f.43.1764083203179;
        Tue, 25 Nov 2025 07:06:43 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm34797809f8f.32.2025.11.25.07.06.42
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
Subject: [PATCH v4 10/16] serial: sh-sci: Rename port SCI_PORT_RSCI->RSCI_PORT_SCIF16
Date: Tue, 25 Nov 2025 15:06:12 +0000
Message-ID: <20251125150632.299890-11-biju.das.jz@bp.renesas.com>
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

Rename port SCI_PORT_RSCI->RSCI_PORT_SCIF16 to differentiate it from
RZ/G3E port that has 32-stage FIFO.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4:
 * New patch.
---
 drivers/tty/serial/rsci.c          |  2 +-
 drivers/tty/serial/sh-sci-common.h |  2 +-
 drivers/tty/serial/sh-sci.c        | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index 5d43e8cdbc0d..c5d373ee494f 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -445,7 +445,7 @@ static const struct sci_port_ops rsci_port_ops = {
 };
 
 struct sci_of_data of_sci_rsci_data = {
-	.type = SCI_PORT_RSCI,
+	.type = RSCI_PORT_SCIF16,
 	.ops = &rsci_port_ops,
 	.uart_ops = &rsci_uart_ops,
 	.params = &rsci_port_params,
diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index e3c028df14f1..1b9480c7f4cb 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -7,7 +7,7 @@
 
 /* Private port IDs */
 enum SCI_PORT_TYPE {
-	SCI_PORT_RSCI = BIT(7) | 0,
+	RSCI_PORT_SCIF16 = BIT(7) | 0,
 };
 
 enum SCI_CLKS {
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 914bdb41ccc6..08a1898f14ea 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1184,7 +1184,7 @@ static int sci_handle_errors(struct uart_port *port)
 
 static bool sci_is_rsci_type(u8 type)
 {
-	return (type == SCI_PORT_RSCI);
+	return (type == RSCI_PORT_SCIF16);
 }
 
 static int sci_handle_fifo_overrun(struct uart_port *port)
@@ -3178,7 +3178,7 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 
 	if (sci_port->type == PORT_HSCIF) {
 		clk_names[SCI_SCK] = "hsck";
-	} else if (sci_port->type == SCI_PORT_RSCI) {
+	} else if (sci_port->type == RSCI_PORT_SCIF16) {
 		clk_names[SCI_FCK] = "operation";
 		clk_names[SCI_BRG_INT] = "bus";
 	}
@@ -3190,7 +3190,7 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 		if (IS_ERR(clk))
 			return PTR_ERR(clk);
 
-		if (!clk && sci_port->type == SCI_PORT_RSCI &&
+		if (!clk && sci_port->type == RSCI_PORT_SCIF16 &&
 		    (i == SCI_FCK || i == SCI_BRG_INT))
 			return dev_err_probe(dev, -ENODEV, "failed to get %s\n", name);
 
@@ -3328,7 +3328,7 @@ static int sci_init_single(struct platform_device *dev,
 		else
 			sci_port->rx_trigger = 8;
 		break;
-	case SCI_PORT_RSCI:
+	case RSCI_PORT_SCIF16:
 		sci_port->rx_trigger = 16;
 		break;
 	default:
@@ -3548,7 +3548,7 @@ static struct uart_driver sci_uart_driver = {
 static bool sci_is_fifo_type(u8 type)
 {
 	return (type == PORT_SCIFA || type == PORT_SCIFB ||
-		type == PORT_HSCIF || type == SCI_PORT_RSCI);
+		type == PORT_HSCIF || type == RSCI_PORT_SCIF16);
 }
 
 static void sci_remove(struct platform_device *dev)
-- 
2.43.0


