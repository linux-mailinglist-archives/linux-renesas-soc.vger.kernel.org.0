Return-Path: <linux-renesas-soc+bounces-10919-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8682C9E3F0E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 17:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2242A162265
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 16:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D96B21765C;
	Wed,  4 Dec 2024 15:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="iU0RE5p9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF8C215F64
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Dec 2024 15:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733327906; cv=none; b=iXDjqiabW8h7AUafbX5SfSrJkeUiggGCb0zP6HS66hQGNLegppgfWJvu+sbYaRaYl3m1bvSZOFunCDBQJKX10VbXztNfOfErtbQ8NzYsQE++wxHCFE/kmDrqDlXiF3Xkxq7/0eFfFIujrTIA5QXeGqQDAwjvahrRE1SzPpHENJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733327906; c=relaxed/simple;
	bh=MxMaPltCgRW13FZnasc8Tq7kHIMdsrQSwKvFTxmIPUI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=flDh4hJbHvIJsy6GlMg7LCqvI9yIelQfP74q/lxj7aEazTNx5wucm7R6FmJcPdzoVhz2mJN310RZB2R/mZmroKtCreqcrza1cpAa6MFM15GFeqbtoj1TBDp3xs1T7DRc+5Mo9NV1ZId8ji0YvDRYDcECXqugaGaSCHtDkWVn3E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=iU0RE5p9; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434aabd688fso45683515e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Dec 2024 07:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733327902; x=1733932702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rlI7Qx26yf6aFN47ni90xhGkPbc5gZWYXhldcxWmyE=;
        b=iU0RE5p9qa0LrI95cZg5ZxC3Afi8ZeqyNDm+G4AqCeNXWNOgSmdgK40LM+1sxDP2+9
         EFqzNAgc524OmngAKAHVLkK9YNY+MifE4F9GCbNtDL+2Wnv87fb7tA7/YhVqKHuzP3Xw
         SuX0i0d8p3muSMfRyEdcVLEQO/njMziGv+VFOo54xRK0RH6FvvyKRPKLWE3glp91qsCa
         GhUg4X+KpnXlR4SbP4O1x6DMNrpv/o+cNAmssO2JDngawur4N31H1x8DeyGVFqoXrcBi
         +R5NLZdxM2gD60D0N/uE0ZXKN0mPlYdQdrSwPeEe+r/icdoUwD9UKqNfCSGnS9jOMg5T
         J9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327902; x=1733932702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rlI7Qx26yf6aFN47ni90xhGkPbc5gZWYXhldcxWmyE=;
        b=nmj5TRbOy9UgKyVFO9vzhvNNE6SVaVAUjOHtipImW1rhBJ+xgyi4nqsnoNFGISxLxE
         FXEavFa+v1YeGNSlcTQH/v8vP/SPAid0Tlz9HYxezH4Gx8NiAqENk8AIm1iG42a4qRmn
         8GWQ9Y4cR8CoREs6sq4Xs04xGw4pKkgsHCrawG6DueNT284NsVKa/s7iOu7a1e8HOBNR
         v9ZCGUXdbDiKzUqBUIM6utOIIFkGLho0+USEgbkFeDcuEWgXNu1WYSbGu4NYAq+TK3EM
         Hro8qS5pAMJwQh8fAh6oMA+mWSK2trWaXZHfhsykIzotMBoXNgWYB8FsgKv0I9KA5nNJ
         /VRA==
X-Forwarded-Encrypted: i=1; AJvYcCXLTHNYKAakeOjJARoWgKdqMmj88FYIFncyRZT9vpl6UlxIOYW9jKRLV7T3/OfAkKJjxni2M3N8zoc8IebE+8zI8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwX7HTGSZUOeQAduoxEVaQgarxDnq2CgLxH5MzfCT4LxbLPpj3k
	rW2pco4A5cFRMNUmMyRsndjwyHavFBJqN/Wv+l2JC4XCDkDXTBEKdgBwDKcoOcw=
X-Gm-Gg: ASbGncsZzygRyG0HFTA5UgezRb5okRJfg+MlNVB/qr2NnXFiYoxEVyNFkghwYLFVtdU
	Xy8YPVGM7zy8FcP1U+wkou1xQAVynK+ueC7ONKrz85+zkNfA3xSu6u2EopEfjeI7IYj/m1XWIOy
	fmu8UduWM7SPXkQCSaP3sLD1mDk97GaqwY4hs7EtwiB9pR5YN59+/t1vr1HAT1+AxOwMwWjMWk/
	fgMA516O3C8x7JDeoD++7pMUHkHQ8oJStfOAuS7jYOKknlFYmiIe0fgcAdnAGStYdMWThUphO3q
	sMFS
X-Google-Smtp-Source: AGHT+IF+1o32TF0lWbqkhxRtE212Vnx1K8CfTxGY1M11SpSR8N/1jY5uC9iZqH3b8pu7L9xs+zxDJA==
X-Received: by 2002:a05:600c:19ce:b0:431:5871:6c5d with SMTP id 5b1f17b1804b1-434d3f8e454mr48344175e9.3.1733327902370;
        Wed, 04 Dec 2024 07:58:22 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52b5677sm29043695e9.37.2024.12.04.07.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:58:21 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	wsa+renesas@sang-engineering.com,
	geert+renesas@glider.be,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lethal@linux-sh.org,
	g.liakhovetski@gmx.de,
	groeck@chromium.org,
	mka@chromium.org,
	ulrich.hecht+renesas@gmail.com,
	ysato@users.sourceforge.jp
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH RFT 5/6] serial: sh-sci: Clean sci_ports[0] after at earlycon exit
Date: Wed,  4 Dec 2024 17:58:05 +0200
Message-Id: <20241204155806.3781200-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The early_console_setup() function initializes sci_ports[0].port with an
object of type struct uart_port obtained from the struct earlycon_device
passed as an argument to early_console_setup().

Later, during serial port probing, the serial port used as earlycon
(e.g., port A) might be remapped to a different position in the sci_ports[]
array, and a different serial port (e.g., port B) might be assigned to slot
0. For example:

sci_ports[0] = port B
sci_ports[X] = port A

In this scenario, the new port mapped at index zero (port B) retains the
data associated with the earlycon configuration. Consequently, after the
Linux boot process, any access to the serial port now mapped to
sci_ports[0] (port B) will block the original earlycon port (port A).

To address this, introduce an early_console_exit() function to clean up
sci_ports[0] when earlycon is exited.

To prevent the cleanup of sci_ports[0] while the serial device is still
being used by earlycon, introduce the struct sci_port::probing flag and
account for it in early_console_exit().

Fixes: 0b0cced19ab1 ("serial: sh-sci: Add CONFIG_SERIAL_EARLYCON support")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes since the integrated patch:
- adjust the commit message to address Geert comments at [1]
- Introduce the struct sci_port::probing flag to prevent the cleanup
  of sci_ports[0] while the serial device is still being used by earlycon


[1] https://lore.kernel.org/all/CAMuHMdX57_AEYC_6CbrJn-+B+ivU8oFiXR0FXF7Lrqv5dWZWYA@mail.gmail.com/

 drivers/tty/serial/sh-sci.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index e12fbc71082a..f74eb68774ca 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -159,6 +159,7 @@ struct sci_port {
 	bool autorts;
 	bool tx_occurred;
 	bool earlycon;
+	bool probing;
 };
 
 #define SCI_NPORTS CONFIG_SERIAL_SH_SCI_NR_UARTS
@@ -3386,7 +3387,8 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
 static int sci_probe_single(struct platform_device *dev,
 				      unsigned int index,
 				      struct plat_sci_port *p,
-				      struct sci_port *sciport)
+				      struct sci_port *sciport,
+				      struct resource *sci_res)
 {
 	int ret;
 
@@ -3433,12 +3435,15 @@ static int sci_probe_single(struct platform_device *dev,
 		sciport->port.flags |= UPF_HARD_FLOW;
 	}
 
-	ret = uart_add_one_port(&sci_uart_driver, &sciport->port);
-	if (ret) {
-		return ret;
+	if (sci_ports[0].earlycon && sci_ports[0].port.mapbase == sci_res->start) {
+		/*
+		 * Skip cleanup up the sci_port[0] in early_console_exit(), this
+		 * port is the same as the earlycon one.
+		 */
+		sci_ports[0].probing = true;
 	}
 
-	return 0;
+	return uart_add_one_port(&sci_uart_driver, &sciport->port);
 }
 
 static int sci_probe(struct platform_device *dev)
@@ -3496,7 +3501,7 @@ static int sci_probe(struct platform_device *dev)
 
 	platform_set_drvdata(dev, sp);
 
-	ret = sci_probe_single(dev, dev_id, p, sp);
+	ret = sci_probe_single(dev, dev_id, p, sp, res);
 	if (ret)
 		return ret;
 
@@ -3579,6 +3584,20 @@ sh_early_platform_init_buffer("earlyprintk", &sci_driver,
 #ifdef CONFIG_SERIAL_SH_SCI_EARLYCON
 static struct plat_sci_port port_cfg;
 
+static int early_console_exit(struct console *co)
+{
+	struct sci_port *sci_port = &sci_ports[0];
+
+	/*
+	 * Clean the slot used by earlycon. A new SCI device might
+	 * map to this slot.
+	 */
+	if (sci_port->earlycon && !sci_port->probing)
+		memset(sci_port, 0, sizeof(*sci_port));
+
+	return 0;
+}
+
 static int __init early_console_setup(struct earlycon_device *device,
 				      int type)
 {
@@ -3596,6 +3615,8 @@ static int __init early_console_setup(struct earlycon_device *device,
 		       SCSCR_RE | SCSCR_TE | port_cfg.scscr);
 
 	device->con->write = serial_console_write;
+	device->con->exit = early_console_exit;
+
 	return 0;
 }
 static int __init sci_early_console_setup(struct earlycon_device *device,
-- 
2.39.2


